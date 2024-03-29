library(tidyverse)
theme_set(theme_minimal())
library(here)

drop_duplicates <- function(data_raw){
  data_raw %>%
    filter(`Duplicate/Unique` == "Unique") %>%
    select(-`Duplicate/Unique`) %>%
    distinct()
}

remove_constant_fields <- function(data_raw){
  const_numer_cols <- data_raw %>%
    select_if(is.numeric) %>%
    select_if(~ max(.x) == min(.x)) %>%
    colnames()

  data_raw %>%
    select(-const_numer_cols)
}

salary_range_to_avg <- function(data_raw){
  data_raw <- data_raw %>%
    mutate(Salary = str_replace_all(Salary,c("," = "",
                                             "\\s*" = "",
                                             "SGD" = "",
                                             "\\$" = "",
                                             "₹" = "")))
  interim <- data_raw %>%
    drop_na(Salary)

  k_issue <- interim %>%
    filter(str_detect(Salary,"k"))
  k_issue <- k_issue %>%
    mutate(Salary = (k_issue$Salary %>%
                       str_replace("k","") %>%
                       str_split("-") %>%
                       map_dbl(~ mean(as.numeric(.x)*1000))))

  range_issue <- interim %>%
    filter(str_detect(Salary,"-"),!str_detect(Salary,"k"))
  range_issue <- range_issue %>%
    mutate(Salary = (range_issue$Salary %>%
                       str_split("-") %>%
                       map_dbl(~ mean(as.numeric(.x)))))

  issues_fixed <- range_issue %>%
    mutate(Salary = as.character(Salary)) %>%
    rbind(k_issue %>% mutate(Salary = as.character(Salary)))

  data_raw[data_raw$ID %in% issues_fixed$ID,"Salary"] <- issues_fixed$Salary

  data_raw %>%
    mutate(Salary = as.numeric(Salary))
}

common_sentence_case <- function(data_raw){
  data_raw %>%
    mutate(Job_Field = str_to_sentence(Job_Field),
           Job_title = str_to_sentence(Job_title))
}

merge_job_fields <- function(data_raw){
  data_raw %>%
    mutate(Job_Field = str_replace_all(Job_Field,"E commerce \\(online sales\\)","E commerce"))
}

gen_edu_qual_feats <- function(data_raw){
  data_raw %>%
    mutate(BSc_needed = ifelse(str_detect(str_to_lower(Educational_qualifications),
                                          "bachelor|bsc|bs|b\\.sc|undergraduate"),"Yes","No"),
           MSc_needed = ifelse(str_detect(str_to_lower(Educational_qualifications),
                                          "masters|msc|graduate"),"Yes","No"),
           PhD_needed = ifelse(str_detect(str_to_lower(Educational_qualifications),
                                          "phd|graduate"),"Yes","No"))
}

make_common_salary <- function(data_raw){
  aud_ex <- 148.19
  gbp_ex <- 1.35
  inr_ex <- 0.013
  sgd_ex <- 0.74
  slr_ex <- 0.0049
  cad_ex <- 0.79

  data_raw[data_raw$ID == 270,"Currency"] <- "CAD"


  data_raw %>%
    mutate(Salary = as.numeric((data_raw$Salary %>%
                                  str_split("-") %>%
                                  map_chr(~ .x[1])))) %>%
    mutate(`Payment Frequency` = str_to_lower(`Payment Frequency`),
           `Payment Frequency` = str_replace_all(`Payment Frequency`,
                                                 c("day rate" = "daily",
                                                   "^hour$" = "hourly",
                                                   "^month$" = "monthly",
                                                   "per hour" = "hourly")),
           Currency = str_replace_all(Currency,
                                      c("Dollars" = "USD",
                                        "Pound" = "GBP",
                                        "\\$" = "USD")),
           Salary = case_when(
             Currency == "AUD" ~ Salary * aud_ex,
             Currency == "GBP" ~ Salary * gbp_ex,
             Currency == "INR" ~ Salary * inr_ex,
             Currency == "SGD" ~ Salary * sgd_ex,
             Currency == "SLR" ~ Salary * slr_ex,
             Currency == "CAD" ~ Salary * cad_ex,
             TRUE ~ Salary
           ),
           Salary = case_when(
             `Payment Frequency` == "hourly" ~ Salary * 40 * 52,
             `Payment Frequency` == "daily" ~ Salary * 5 * 52,
             `Payment Frequency` == "monthly" ~ Salary *  12,
             TRUE ~ Salary,
           ))
}

fix_experience_typo <- function(data_raw){
  data_raw %>%
    mutate(`Minimum Experience in Years` = as.numeric(
      str_replace_all(`Minimum Experience in Years`, "[^0-9]","")))
}

clean_locations <- function(data_raw){
  data_raw %>%
    mutate(Country = case_when(Location == "Australia" ~ "Australia",
                               Location %in% c("Canada", "canda", "canada") ~ "Canada",
                               Location == "France" ~ "France",
                               Location == "New Zealand" ~ "New Zealand",
                               Location == "Spain" ~ "Spain",
                               Location == "Sweden" ~ "Sweden",
                               Location %in% c("Pennsylvania","110 Healthy Way, Folosm, CA",
                                               "santa monica,CA","Anaheim, CA",
                                               "Bloomington, IN","NewYork",
                                               "USA") ~ "United States",
                               Location %in% c("Bengaluru, Karnataka, India",
                                               "Noida,Uttar Pradesh, India",
                                               "India") ~ "India",
                               Location == "Russia" ~ "Russia",
                               Location %in% c("Sri Lnaka","Sri Lanka","SL") ~ "Sri Lanka",
                               Location == "UAE" ~ "United Arab Emirates",
                               Location == "China" ~ "China",
                               Location == "Ireland" ~ "Ireland",
                               Location == "Philippines" ~ "Philippines",
                               Location == "Singapore" ~ "Singapore",
                               Location %in% c("UK","Edinburgh,London,Manchester") ~ "United Kingdom",
                               Location == "Melbone" ~ "Australia",
                               TRUE ~ "Sri Lanka"),
           country_code = countrycode::countryname(Country, destination = 'iso3c'))
}

fix_job_titles <- function(data_raw){
  # TODO need to clean this code
  Job_title_new <- str_to_lower(data_raw$Job_title)
  Job_title_new <- str_trim(Job_title_new)
  # Rename misspelled names

  Job_title_new[Job_title_new == "data engineera"] <- "data engineers"
  Job_title_new[Job_title_new %in% c("senior data enginner", "senior data engineeer")] <- "senior data engineers"
  # Categorize jobs as data science, data analyst, data engineer

  DS <- Job_title_new[grepl(c("data sci| machine| scientist"), Job_title_new)]
  DE <- Job_title_new[grepl(c("data engineer | engin| intelligence"), Job_title_new)]
  DA <- Job_title_new[grepl(c("analy|statist|actuarial| research"), Job_title_new)]

  DA <- DA %>% append(Job_title_new[!(Job_title_new%in%c(DS,DE,DA))] %>% unique() %>% .[str_detect(.,"data\\s+")])
  DS <- DS %>% append(Job_title_new[!(Job_title_new%in%c(DS,DE,DA))] %>% unique() %>% .[str_detect(.,"machine\\s+")])

  DA <- DA[!DA%in%DS] #DA Job titles not include in the Ds
  DA <- DA[!DA%in%DE] #DA Job titles not include in the DE
  DS <-DS[!DS%>%is.na()]
  DE <-DE[!DE%>%is.na()]
  Others <- Job_title_new[!(Job_title_new%in%c(DS,DE,DA))] %>% unique()

  data_raw %>% mutate(Job_Category = ifelse(Job_title_new%in%DS & Job_title_new%in%DE,
                                                       "Data Science & Data Engineering", ifelse(Job_title_new%in%DS, "Data Science", ifelse(Job_title_new%in%DE, "Data Engineering", ifelse(Job_title_new%in%DA,"Data Analyst", "Others")))))
}

preprocess_data <- function(data_raw){
  data <- data_raw %>%
    drop_duplicates() %>%
    remove_constant_fields() %>%
    salary_range_to_avg() %>%
    common_sentence_case() %>%
    merge_job_fields() %>%
    gen_edu_qual_feats() %>%
    make_common_salary() %>%
    fix_experience_typo() %>%
    clean_locations()

  return(data)
}

data_raw <- read_csv(here("data-raw","2021",
                          "DSjobtracker - Entry sheet Transposed.csv"),
                     na = c("NA","na"))
DStidy_2021 <- preprocess_data(data_raw)
DStidy_2021 %>% write_csv(here("data-raw","2021","DStidy_2021.csv"))
save(DStidy_2021,file=here("data","DStidy_2021.rda"))
