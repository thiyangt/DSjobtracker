
# Load libraries ----------------------------------------------------------

library(magrittr)
library(stringr)
library(dplyr)
library(here)
library(purrr)

# Loading data ------------------------------------------------------------

data("DSraw")
Cities_Table <- read.csv(here("data-raw", "preprocessing", "worldcities.csv"), header = TRUE)
US_state_codes <- read.csv(here("data-raw", "preprocessing", "US_state_codes.csv"), header = TRUE)

# Fixing typos ------------------------------------------------------------

# ID number 263 and 300 duplicated for different observations
# setting IDs to sequence of numbers from 1 to number_of_rows
DSraw$ID <- 1:nrow(DSraw)

# Replaces \,/ and white spaces in column names with _
# Replaces C# with C_Sharp and C++ with Cpp
names(DSraw) <- names(DSraw) %>%
  str_replace_all("\\\\|\\s+|/", "_") %>%
  str_replace_all(c("C#" = "C_Sharp", "C\\+\\+" = "Cpp"), )

DSraw[DSraw$Linux_Unix == 10 & !is.na(DSraw$Linux_Unix), "Linux_Unix"] <- 1

# Treating NAs ------------------------------------------------------------

DSraw %>%
  apply(2, function(x) {
    all(is.na(x))
  }) %>%
  .[. == TRUE]
# Columns 109 to 152 have NAs for all observations,
DSraw <- DSraw[, -c(109:152)]

# DSraw %>%
#   select(c(R:Bash_Linux_Scripting, Team_Handling:Bahasa_Malaysia)) %>%
#   as.matrix() %>%
#   apply(2, function(x) {
#     unique(x)
#   })

# Indicator variables have NA's and are replaced with 0
# TODO: see if replacing with mode is more effective
DSraw[, c(7:93, 100:105)] <- DSraw %>%
  select(c(R:Bash_Linux_Scripting, Team_Handling:Bahasa_Malaysia)) %>%
  replace(is.na(.), 0) %>%
  mutate_all(factor)

# rearranging order of columns to have indicator variables together
DSraw <- DSraw[, c(1:93, 100:105, 94:99, 106:ncol(DSraw))]

# Filter duplicates -------------------------------------------------------

# Keep only the distinct Job titles URL and company
DSraw <- DSraw %>% distinct(across(c(Job_title, URL, Company)), .keep_all = TRUE)

# Fixing date columns -----------------------------------------------------

date_regex_type_1 <- "(\\d{4}-\\d{2}-\\d{2})" # YYYY-MM-DD
date_regex_type_2 <- "(\\d{1,2}\\/\\d{1,2}\\/\\d{2,4})" # DD/MM/YYYY
date_regex_type_3 <- "(\\D+-\\d+)" # Month-YY

dategets <- DSraw$DateRetrieved

# replace NAs in Date Published column
DSraw[is.na(DSraw$DatePublished), "DatePublished"] <- "Not_mentioned"
# replace typo in Date Published
DSraw[DSraw$DatePublished == "0308/2020", "DatePublished"] <- "03/08/2020"
DSraw[DSraw$DatePublished == "0220-06-15", "DatePublished"] <- "2020-06-15"

datepubs <- DSraw$DatePublished
# ignore the warnings of XXX failed to parse as thats a side effect of case_when
DSraw <- DSraw %>%
  mutate(
    DatePublished = case_when(
      str_detect(datepubs, date_regex_type_1) ~ lubridate::parse_date_time(
        datepubs,
        orders = "%Y-%m-%d"
      ) %>% lubridate::as_date(),
      str_detect(datepubs, date_regex_type_2) ~ lubridate::parse_date_time(
        datepubs,
        orders = c("%d/%m/%Y", "%d/%m/%y")
      ) %>% lubridate::as_date(),
      str_detect(datepubs, date_regex_type_3) ~ lubridate::parse_date_time(
        datepubs,
        orders = "%b-$y"
      ) %>% lubridate::as_date(),
      TRUE ~ lubridate::as_date(NA),
    ),
    DateRetrieved = case_when(
      str_detect(dategets, date_regex_type_1) ~ lubridate::parse_date_time(
        dategets,
        orders = "%Y-%m-%d"
      ) %>% lubridate::as_date(),
      str_detect(dategets, date_regex_type_2) ~ lubridate::parse_date_time(
        dategets,
        orders = c("%d/%m/%Y", "%d/%m/%y")
      ) %>% lubridate::as_date(),
      TRUE ~ lubridate::as_date(NA)
    )
  )

# Tidying Job Title -------------------------------------------------------

# Making necessary corrections to misspelled words identified
Job_Titles <- str_to_lower(DSraw$Job_title)
Job_Titles <- str_trim(Job_Titles)
# replace ',' '-' '/' with 1 whitespace
Job_Titles <- str_replace_all(Job_Titles, ",|-|/", " ")
# replace 2 or more whitespaces made by above with 1 whitespace
Job_Titles <- str_replace_all(Job_Titles, "\\s{2,}", " ")
# Making sure the text are processed correctly
Job_Titles %>% head()
# fix typos
Job_Titles <- Job_Titles %>% str_replace_all(c(
  "acturial" = "actuarial",
  "statician" = "statistician",
  "artificial intelligence" = "ai"
))

detect_DS_regex <- "([data]{4}|machine)[&a-z\\s]*([scientist]{7,10})|\\s+ai"
DS <- Job_Titles[str_detect(Job_Titles, detect_DS_regex)] %>% unique()

detect_DE_regex <- "([data]{4}|machine|intelligence)[&a-z\\s]*([engineer]{8,9})"
DE <- Job_Titles[str_detect(Job_Titles, detect_DE_regex)] %>% unique()

detect_DA_regex <- "anal|statist|actuarial|research"
DA <- Job_Titles[str_detect(Job_Titles, detect_DA_regex)] %>% unique()

# add rows with word data to DA
DA <- DA %>% append(Job_Titles[!(Job_Titles %in% c(DS, DE, DA))] %>%
  unique() %>%
  .[str_detect(., "data\\s+")])
# add rows with word machine to DS
DS <- DS %>% append(Job_Titles[!(Job_Titles %in% c(DS, DE, DA))] %>%
  unique() %>%
  .[str_detect(., "machine\\s+")])

# remove intersections
DA <- DA[!DA %in% DS]
DA <- DA[!DA %in% DE]
# remove nas
DS <- DS[!DS %>% is.na()]
DE <- DE[!DE %>% is.na()]

DSraw <- DSraw %>%
  mutate(Job_Category = factor(case_when(
    Job_Titles %in% DS & Job_Titles %in% DE ~ "Data Science and Data Engineering",
    Job_Titles %in% DS ~ "Data Science",
    Job_Titles %in% DE ~ "Data Analyst",
    TRUE ~ "Unimportant"
  )))


# Tidying Experience ------------------------------------------------------

# Experience
DSraw %>%
  count(Experience, sort = TRUE)

# typo with or written as 0r
# replace 18 months with 18/12 roughly 2 years
# replace not needed and variants with 0 years
DSraw$Experience_ <- DSraw$Experience %>%
  str_replace_all(c(
    "0r" = "or",
    "18 months" = "2 years",
    "not|Not" = "0 years"
  ))

DSraw <- DSraw %>%
  mutate(
    Minimum_Years_of_experience_ =
      str_extract_all(DSraw$Experience_, "(\\d+)") %>%
        map(~ ifelse(length(as.numeric(.x)) == 0,
          as.numeric(NA), as.numeric(.x)
        ) %>%
          min()) %>%
        unlist()
  )

DSraw <- DSraw %>%
  mutate(Minimum_Years_of_experience = str_extract(.$Experience, "(\\d+)")
  %>% as.numeric())
DSraw$Minimum_Years_of_experience[DSraw$Experience > 30] <- NA
DSraw %>%
  select(Minimum_Years_of_experience) %>%
  count(Minimum_Years_of_experience)
DSraw %>%
  select(Minimum_Years_of_experience_) %>%
  count(Minimum_Years_of_experience_)

# the improved version is better
# the following code should be improved
DSraw <- DSraw %>%
  select(-Minimum_Years_of_experience) %>%
  mutate(Minimum_Years_of_experience = Minimum_Years_of_experience_) %>%
  select(-Minimum_Years_of_experience_) %>%
  select(-Experience) %>%
  mutate(Experience = Experience_) %>%
  select(-Experience_)

DSraw <- DSraw %>% mutate(
  Experience_Category = factor(case_when(
    is.na(Minimum_Years_of_experience) ~ "Unknown or Not needed",
    Minimum_Years_of_experience <= 2 ~ "Two or less years",
    Minimum_Years_of_experience <= 5 ~ "More than 2 and less than 5 years",
    Minimum_Years_of_experience <= 10 ~ "More than 5 and less than 10 years",
    TRUE ~ "More than 10 years"
  ), levels = c(
    "Unknown or Not needed",
    "Two or less years",
    "More than 2 and less than 5 years",
    "More than 5 and less than 10 years",
    "More than 10 years"
  ))
)


# Tidying Country ---------------------------------------------------------

DSraw$City %in% Cities_Table$city %>% sum()
DSraw$City %>%
  is.na() %>%
  sum()

DSraw$Location %in% Cities_Table$country %>% sum()
DSraw$Location[DSraw$Location == "SL"] <- "LK"
DSraw$Location[DSraw$Location == "UK"] <- "GB"
DSraw$Location[DSraw$Location == "Singaore"] <- "Singapore"
DSraw$Location[DSraw$Location == "Carfiff"] <- "Cardiff"
DSraw$Location[DSraw$Location == "New zealand"] <- "New Zealand"
DSraw$Location[DSraw$Location == "San Fransico"] <- "San Francisco"



Job_loc <- function(x, y) {
  locs <- c()
  for (i in 1:length(x)) {
    if (x[i] %in% (y$country)) {
      locs[i] <- x[i]
    }
    else {
      if (x[i] %in% (y$city)) {
        locs[i] <- y %>%
          filter(city == x[i]) %>%
          select(country) %>%
          .[1, ] %>%
          as.character()
      }
      else {
        locs[i] <- NA
      }
    }
  }
  return(locs)
}


Job_country <- Job_loc(DSraw$Location, Cities_Table)
Job_country %>%
  unique() %>%
  length()


Job_country %>% unique()
for (i in 1:length(Job_country)) {
  if (DSraw$Location[i] %in% (Cities_Table$iso2)) {
    Job_country[i] <- Cities_Table %>%
      filter(iso2 == DSraw$Location[i]) %>%
      select(country) %>%
      .[1, ] %>%
      as.character()
  }

  if (DSraw$Location[i] %in% (Cities_Table$iso3)) {
    Job_country[i] <- Cities_Table %>%
      filter(iso3 == DSraw$Location[i]) %>%
      select(country) %>%
      .[1, ] %>%
      as.character()
  }
}

Job_country[is.na(Job_country) & DSraw$Location %in% US_state_codes] <- "United States"

Job_country %>% unique()
Job_country %>%
  is.na() %>%
  sum()
DSraw$Location[is.na(Job_country)]


# identified countries
DSraw[is.na(Job_country), "Location"] %>% unique()
DSraw <- DSraw %>% mutate(Job_Country = Job_country)


# DSraw[DSraw == "Not_define" | DSraw == "Not_mentioned" | DSraw == "NA" | DSraw == "not mention" | DSraw == "not mentioned"] <- NA
# DSraw[DSraw == "Not mention" | DSraw == "not_mentioned" | DSraw == "not define"] <- NA
DSraw <- DSraw %>% mutate_if(is.character, ~ na_if(.x, "Not_define") %>%
  na_if("Not_mentioned") %>%
  na_if("NA") %>%
  na_if("not mention") %>%
  na_if("not mentioned") %>%
  na_if("Not mention") %>%
  na_if("not_mention") %>%
  na_if("not define"))

# Tidying Education Qualifications ----------------------------------------

DSraw %>%
  count(Educational_qualifications, sort = TRUE)

# Education Qualification
Adjusted_Education <- DSraw$Educational_qualifications

# TODO: This code can be optimized by a simple case_when with str_detect
# Removing the symbols
# Adjusted_Education <- str_replace_all("\\\\", " ")
Adjusted_Education <- str_replace_all(Adjusted_Education, "\\\\x92", "")
Adjusted_Education <- gsub("[[:punct:]]", " ", Adjusted_Education)
Adjusted_Education <- str_to_lower(Adjusted_Education)

# Job is not metioned in the column
Not_defined <- Adjusted_Education[str_detect(Adjusted_Education, "(NA)|(not mentioned)")]
length(Not_defined)

Defined_jobs <- Adjusted_Education[!Adjusted_Education %in% Not_defined]
length(Defined_jobs)

# Jobs with minimum education qualification is Bachelor degree Vacancies
Bachelor_Jobs <- Defined_jobs[str_detect(Defined_jobs, "(b\\s*s\\s*c\\s*|b\\s*s\\s*)|(bachelo\\s*|bachelors\\s*)")]
length(Bachelor_Jobs)

non_bach <- Defined_jobs[!str_detect(Defined_jobs, "(b\\s*s\\s*c\\s*|b\\s*s\\s*)|(bachelo\\s*|bachelors\\s*)")]
length(non_bach)

# Finding jobs with minimum educational qualification is a MSc
Master_Jobs <- non_bach[str_detect(non_bach, "(master)|(m\\s*s)|(masters)|(post\\s*graduate)") & !str_detect(non_bach, "(system)|(stem)")]
length(Master_Jobs)

# finding other category
non_msc <- non_bach[!(str_detect(non_bach, "(master)|(m\\s*s)|(masters)|(post\\s*graduate)") & !str_detect(non_bach, "(system)|(stem)"))]
length(non_msc)

phd_jobs <- non_msc[str_detect(non_msc, "(p\\s*h\\s*d)")]
length(phd_jobs)

non_phd <- non_msc[!str_detect(non_msc, "(p\\s*h\\s*d)")]
length(non_phd)

some_degree <- non_phd[str_detect(non_phd, "(dgree)|(degree)|(b\\s*e)|(b\\s*tech)")]
length(some_degree)
other <- non_phd[!str_detect(non_phd, "(dgree)|(degree)|(b\\s*e)|(b\\s*tech)")]
length(other)


# Now I am going to make a new grouping variable for Education
edu <- tibble(DSraw, Adjusted_Education)
length(edu$Adjusted_Education)


B1 <- edu[edu$Adjusted_Education %in% Not_defined, ] %>%
  mutate(Edu_Category = rep("NA", nrow(.)))
dim(B1)

B2 <- edu[edu$Adjusted_Education %in% Bachelor_Jobs, ] %>%
  mutate(Edu_Category = rep("Min_Bsc", nrow(.)))
dim(B2)

B3 <- edu[edu$Adjusted_Education %in% Master_Jobs, ] %>%
  mutate(Edu_Category = rep("Min_Master", nrow(.)))
dim(B3)

B4 <- edu[edu$Adjusted_Education %in% phd_jobs, ] %>%
  mutate(Edu_Category = rep("Phd", nrow(.)))
dim(B4)

B5 <- edu[edu$Adjusted_Education %in% some_degree, ] %>%
  mutate(Edu_Category = rep("Some Degree", nrow(.)))
dim(B5)

B6 <- edu[edu$Adjusted_Education %in% other, ] %>%
  mutate(Edu_Category = rep("Other", nrow(.)))
dim(B6)

new_edu <- rbind(B1, B2, B3, B4, B5, B6)
dim(new_edu)
new_edu <- new_edu[with(new_edu, order(new_edu$ID)), ]

drop <- c("Adjusted_Education")
DSraw <- new_edu[, !(names(new_edu) %in% drop)]
DSraw <- DSraw %>%
  mutate_if(is.character, ~ na_if(.x, "NA")) %>%
  mutate(Edu_Category = factor(Edu_Category,
    levels = c(
      "Other", "Some Degree",
      "Min_Bsc", "Min_Master", "Phd"
    )
  ))


# Tidying Salary column ---------------------------------------------------

# TODO: add currency of salary as well?
DSraw <- DSraw %>% mutate(
  Salary = str_replace_all(DSraw$Salary, c(
    "\\xa" = "",
    "k|K" = "000",
    "," = ""
  )),
  Minimum_Salary = str_extract_all(DSraw$Salary, "\\d+(?:\\.)?\\d+") %>%
    map(~ ifelse(length(as.numeric(.x)) == 0,
      as.numeric(NA), min(as.numeric(.x))
    )) %>%
    unlist(),
  Salary_Basis = factor(case_when(
    str_detect(DSraw$Salary, "year|annum|P\\.A\\.") ~ "yearly",
    str_detect(DSraw$Salary, "hour") ~ "hourly",
    str_detect(DSraw$Salary, "daily|day") ~ "daily",
    TRUE ~ "unspecified"
  ))
)

# Exporting tidy dataset --------------------------------------------------

DStidy <- DSraw
save(DStidy, file = "data/DStidy.rda")
