# TODO Load the DStidy_2020 and DStidy_2021 dataset
library(here)
library(tidyverse)
currency_ex_rates <- c(202.02,4.23,1.27,1.37,74.51,0.75,1.39,1.0,1.46,74.61,115.35,6.39,
                       0.89,0.89,0.89,0.89,0.89,
                       3.67,50.36,0.89,0.89,112.40,5.61)
names(currency_ex_rates) <- c("Sri Lanka","Malaysia","Canada","Singapore","India","United Kingdom","Australia","United States","New Zealand","Russia","Japan","China","Germany","Spain","Ireland","Hungary","Romania","United Arab Emirates" ,"Philippines","New Caledonia","Italy","Kenya","Brazil")

load(file=here("data","DStidy_2020.rda"))

prev <- DStidy_2020 %>%
  select(-Location) %>%
  rename(c("C++" = "Cpp","C#" = "C_Sharp",
           "MS Word" = "MS_Word", "Ms Excel" = "Ms_Excel",
           "Ms Access" = "Ms_Access","Ms PowerPoint" = "Ms_PowerPoint",
           "Microsoft Power BI" = "Microsoft_Power_BI",
           "Linux/Unix" = "Linux_Unix","OLE/DB" = "OLE_DB",
           "agile execution"="agile_execution",
           "Deep Learning" = "Deep_Learning",
           "Map/Reduce" = "Map_Reduce",
           "Minimum Experience in Years"="Minimum_Years_of_experience",
           "Payment Frequency" = "Salary_Basis",
           "Location" = "Job_Country"
  )) %>%
  mutate(Location = case_when(
    str_detect(Location,"United States") ~ "USA",
    str_detect(Location,"United Kingdom") ~ "UK",
    TRUE ~ Location
  )) %>%
  select(-Korean_language,-Bahasa_Malaysia,
         -Flash_Actionscript,-Wordpress,-Bash_Linux_Scripting,
         -`Minimum Experience in Years`,-Experience,-Minimum_Salary) %>%
  mutate(Edu_Category = replace_na(Edu_Category,"Other"),
         Edu_cat_needed = 1,.after = Edu_Category) %>%
  pivot_wider(names_from = Edu_Category,values_from = Edu_cat_needed,
              values_fn= length) %>%
  mutate(across(Other:Phd,replace_na,0)) %>%
  select(-Other,-`Some Degree`) %>%
  rename(c("BSc_needed" = "Min_Bsc","MSc_needed" = "Min_Master",
           "PhD_needed" = "Phd")) %>%
  mutate(`English Needed` = ifelse(replace_na(English_proficiency,0) == 0,0,1)) %>%
  select(-English_proficiency) %>%
  mutate(across(R:Optimization,~ as.numeric(.x)-1)) %>%
  mutate(Salary = str_replace_all(Salary,c("[Nn]ot\\s?_?mentioned" = NA_character_)),
         Salary = str_extract_all(Salary,"\\d+\\.?\\d*") %>%
           map_dbl(~ mean(
             ifelse(is.na(.x) | length(.x) == 0,NA,as.numeric(.x)))))

prev <- prev %>%
  mutate(Salary = case_when(
    `Payment Frequency` == "daily" ~ Salary * 5*52,
    `Payment Frequency` == "monthly" ~ Salary * 12,
    `Payment Frequency` == "hourly" ~ Salary * 40*5*52,
    TRUE ~ Salary
  ),
  Salary = Salary * replace_na(currency_ex_rates[prev$Location],1))

load(file=here("data","DStidy_2021.rda"))
new <- DStidy_2021 %>%
  mutate(Experience_Category = case_when(
    `Minimum Experience in Years` < 2 ~ "Two or less years",
    `Minimum Experience in Years` < 5 ~ "More than 2 and less than 5 years",
    `Minimum Experience in Years` < 10 ~ "More than 5 and less than 10 years",
    `Minimum Experience in Years` > 10 ~ "More than 10 years",
    TRUE ~ "Unknown or Not needed"
  )) %>%
  select(-`Minimum Experience in Years`,
         -`English proficiency description`) %>%
  mutate(DateRetrieved = lubridate::parse_date_time(DateRetrieved,
                                                    orders = c("%m/%d/%Y","%d/%m/%Y")),
         DatePublished = lubridate::parse_date_time(DatePublished,
                                                    orders = c("%m/%d/%Y","%d/%m/%Y"))) %>%
  mutate(across(BSc_needed:PhD_needed,~ ifelse(.x == "Yes",1,0))) %>%
  select(-Currency) %>%
  mutate(Location = stringi::stri_trans_general(Location,"latin-ascii")) %>%
  mutate(Location = case_when(
    str_detect(Location,"CA|IN|NewYork|Pennsylvania") ~ "USA",
    str_detect(Location,"canada|canda") ~ "Canada",
    str_detect(Location,"India") ~ "India",
    str_detect(Location,"London|United Kingdom") ~ "UK",
    str_detect(Location,"Melbone") ~ "Australia",
    str_detect(Location,"SL|Sri Lnaka|Sri Lanka") ~ "Sri Lanka",
    str_detect(Location,"UAE") ~ "United Arab Emirates",
    str_detect(Location,"^\\s*$|Remote") ~ NA_character_,
    TRUE ~ Location))

DStidy <- prev %>%
  # select(-all_of(colnames(prev)[!colnames(prev) %in% colnames(new)])) %>%
  mutate(version = "v1") %>%
  bind_rows(
    new %>% select(-all_of(colnames(new)[!colnames(new) %in% colnames(prev)])) %>%
      mutate(version = "v2")
  )

DStidy %>% write_csv(here("data-raw","2021","DStidy_combined.csv"))
save(DStidy,file=here("data","DStidy.rda"))
