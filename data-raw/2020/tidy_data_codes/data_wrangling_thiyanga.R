#devtools::install_github("thiyangt/DSjobtracker")
library(tidyverse)
library(DSjobtracker)
library(stringr)
library(dslabs)
library(magrittr)

data("DSraw")
Cities_Table <- read.csv(here::here("data-raw", "tidy_data_codes", "Shashini_tidydata_codes", "worldcities.csv"), header = TRUE, sep = ",")

#Found 2 duplicate IDs with different entries
DSraw %>% filter(ID%in% c(263,300)) %>% select(ID,Consultant, Company, Job_title, URL)
DSraw$ID <- 1:nrow(DSraw)

head(DSraw)
str(DSraw)


DSraw %>% apply(2, function(x){ all(is.na(x))})


DSraw <-  DSraw[, -c(109:152)]
DSraw <- DSraw %>% filter(!is.na(Consultant))

# Processing variable names
names(DSraw) <- names(DSraw) %>% str_replace_all("\\\\|\\s+|/", "_" )

# Substituting 0's for NA values in softwares
DSraw %>% select(c(R:Bash_Linux_Scripting, Team_Handling:Bahasa_Malaysia)) %>% as.matrix() %>% apply(2, function(x){unique(x)})
DSraw %>% select(c(R:Bash_Linux_Scripting, Team_Handling:Bahasa_Malaysia)) %>% replace(is.na(.), 0) %>% as.matrix() %>% apply(2, function(x){unique(x)})
DSraw[,c(7:93, 100:105)] <- DSraw %>% select(c(R:Bash_Linux_Scripting, Team_Handling:Bahasa_Malaysia)) %>% replace(is.na(.), 0)

DSraw[,7:93] <- DSraw %>% select(R:Bash_Linux_Scripting) %>% replace(.==10, 0)


#Removing Duplicates
DSraw <- DSraw %>% distinct(across(c(Job_title, URL, Company)), .keep_all = TRUE)
unique(DSraw$ID) %>% length()


#Making necessary corrections to misspelled words identified
Job_Titles <- str_to_lower(DSraw$Job_title)
Job_Titles <- str_trim(Job_Titles)
Job_Titles <- str_replace_all(Job_Titles,",|-|/", " ")
Job_Titles %>% head() #Making sure the text are processed correctly

Job_Titles <-  Job_Titles %>% str_replace_all("analyzt", "analyst")
Job_Titles <-  Job_Titles %>% str_replace_all("acturial", "actuarial")


DS <- Job_Titles[str_detect(Job_Titles, "([data]{4}|machine)[&a-z\\s]*([scientist]{7,10})|\\s+ai")] %>% unique()

DE <- Job_Titles[str_detect(Job_Titles, "([data]{4}|machine|intelligence)[&a-z\\s]*([engineer]{8,9})")] %>% unique()

DA <- Job_Titles[str_detect(Job_Titles, "anal|statist|actuarial|research|statician")] %>% unique()
DA <- DA %>% append(Job_Titles[!(Job_Titles%in%c(DS,DE,DA))] %>% unique() %>% .[str_detect(.,"data\\s+")])
DS <- DS %>% append(Job_Titles[!(Job_Titles%in%c(DS,DE,DA))] %>% unique() %>% .[str_detect(.,"machine\\s+")])

DA <- DA[!DA%in%DS]
DA <- DA[!DA%in%DE]
DS<-DS[!DS%>%is.na()]
DE<-DE[!DE%>%is.na()]
Unimportant <- Job_Titles[!(Job_Titles%in%c(DS,DE,DA))] %>% unique()
Unimportant

DSraw <- DSraw %>% mutate(Job_Titles, Job_Category= ifelse(Job_Titles%in%DS & Job_Titles%in%DE, "Data Science and Data Engineering", ifelse(Job_Titles%in%DS, "Data Science", ifelse(Job_Titles%in%DE, "Data Engineering", ifelse(Job_Titles%in%DA,"Data Analyst", "Unimportant" ) ) )) )


#Experience
DSraw %>% select(Experience) %>% unique()
DSraw <- DSraw %>% mutate(Minimum_Years_of_experience= str_extract(.$Experience,"(\\d+)") %>% as.numeric())
DSraw$Minimum_Years_of_experience[DSraw$Experience>30] <- NA
DSraw %>% select(Minimum_Years_of_experience) %>% unique()
DSraw <- DSraw %>% mutate(Experience_Category= ifelse(Minimum_Years_of_experience<=2|is.na(Minimum_Years_of_experience), "Two or less years", ifelse(Minimum_Years_of_experience<=5, "More than 2 and less than 5 years", ifelse(Minimum_Years_of_experience<=10, "More than 5 and less than 10 years", "More than 10 years" ))))



#Country identification
DSraw$City%in%Cities_Table$city %>% sum()
DSraw$City %>% is.na() %>% sum()

DSraw$Location%in%Cities_Table$country %>% sum()
DSraw$Location[DSraw$Location=="SL"] <- "LK"
DSraw$Location[DSraw$Location=="UK"] <- "GB"
DSraw$Location[DSraw$Location=="Singaore"] <- "Singapore"
DSraw$Location[DSraw$Location=="Carfiff"] <- "Cardiff"
DSraw$Location[DSraw$Location=="New zealand"] <- "New Zealand"
DSraw$Location[DSraw$Location=="San Fransico"] <- "San Francisco"




US_state_codes <- c("AK",
                    "AL",
                    "AR",
                    "AZ",
                    "CA",
                    "CO",
                    "CT",
                    "DC",
                    "DE",
                    "FL",
                    "GA",
                    "HI",
                    "IA",
                    "ID",
                    "IL",
                    "IN",
                    "KS",
                    "KY",
                    "LA",
                    "MA",
                    "MD",
                    "ME",
                    "MI",
                    "MN",
                    "MO",
                    "MS",
                    "MT",
                    "NC",
                    "ND",
                    "NE",
                    "NH",
                    "NJ",
                    "NM",
                    "NV",
                    "NY",
                    "OH",
                    "OK",
                    "OR",
                    "PA",
                    "PR",
                    "RI",
                    "SC",
                    "SD",
                    "TN",
                    "TX",
                    "UT",
                    "VA",
                    "VT",
                    "WA",
                    "WI",
                    "WV",
                    "WY")



US_state_codes%in%Cities_Table$iso2 %>% sum()

Job_loc <- function(x, y){
  locs <- c()
  for(i in 1:length(x)){
    if(x[i]%in%(y$country)){
      locs[i] <-  x[i]
    }
    else{
      if(x[i]%in%(y$city)){
        locs[i] <- y %>% filter(city==x[i]) %>% select(country) %>% .[1,] %>% as.character()
      }
      else{
        locs[i] <- NA
      }
    }
  }
  return(locs)

}

Job_country <-  Job_loc(DSraw$Location, Cities_Table)
Job_country %>% unique() %>% length()


Job_country %>% unique()
for(i in 1:length(Job_country)){
  if(DSraw$Location[i]%in%(Cities_Table$iso2)){
    Job_country[i] <- Cities_Table %>% filter(iso2==DSraw$Location[i]) %>% select(country) %>% .[1,] %>% as.character()
  }

  if(DSraw$Location[i]%in%(Cities_Table$iso3)){
    Job_country[i] <- Cities_Table %>% filter(iso3==DSraw$Location[i]) %>% select(country) %>% .[1,] %>% as.character()
  }

}

Job_country[is.na(Job_country) & DSraw$Location%in%US_state_codes] <- "United States"

Job_country %>% unique()
Job_country %>% is.na() %>% sum()
DSraw$Location[is.na(Job_country)]


#identified countries
DSraw[is.na(Job_country), "Location"] %>% unique()
DSraw <- DSraw %>% mutate(Job_Country= Job_country)


DSraw[DSraw=="Not_define" | DSraw=="Not_mentioned"| DSraw=="NA"| DSraw=="not mention"| DSraw=="not mentioned"]<-NA
DSraw[DSraw=="Not mention" | DSraw=="not_mentioned"| DSraw=="not define"]<-NA


DSraw$Educational_qualifications %>% unique() %>% view()

#Education Qualification
Adjusted_Education<-DSraw$Educational_qualifications

#Removing the symbols
# Adjusted_Education <- str_replace_all("\\\\", " ")
Adjusted_Education<-str_replace_all(Adjusted_Education,"\\\\x92", "")
Adjusted_Education<-gsub("[[:punct:]]", " ",Adjusted_Education)
Adjusted_Education<-str_to_lower(Adjusted_Education)




#Job is not metioned in the column
Not_defined<-Adjusted_Education[str_detect(Adjusted_Education,"(NA)|(not mentioned)")]
length(Not_defined)

Defined_jobs<-Adjusted_Education[!Adjusted_Education%in%Not_defined]
length(Defined_jobs)

#Jobs with minimum education qualification is Bachelor degree Vacancies


Bachelor_Jobs<-Defined_jobs[str_detect(Defined_jobs,"(b\\s*s\\s*c\\s*|b\\s*s\\s*)|(bachelo\\s*|bachelors\\s*)")]
length(Bachelor_Jobs)

non_bach<-Defined_jobs[!str_detect(Defined_jobs,"(b\\s*s\\s*c\\s*|b\\s*s\\s*)|(bachelo\\s*|bachelors\\s*)")]
length(non_bach)
#Finding jobs with minimum educational qualification is a MSc
Master_Jobs<-non_bach[str_detect(non_bach,"(master)|(m\\s*s)|(masters)|(post\\s*graduate)")&!str_detect(non_bach,"(system)|(stem)")]
length(Master_Jobs)

#finding other category

non_msc<-non_bach[!(str_detect(non_bach,"(master)|(m\\s*s)|(masters)|(post\\s*graduate)")&!str_detect(non_bach,"(system)|(stem)"))]
length(non_msc)

phd_jobs<-non_msc[str_detect(non_msc,"(p\\s*h\\s*d)")]
length(phd_jobs)



non_phd<-non_msc[!str_detect(non_msc,"(p\\s*h\\s*d)")]
length(non_phd)

some_degree <- non_phd[str_detect(non_phd,"(dgree)|(degree)|(b\\s*e)|(b\\s*tech)")]
length(some_degree)
other <- non_phd[!str_detect(non_phd,"(dgree)|(degree)|(b\\s*e)|(b\\s*tech)")]
length(other)


#Now I am going to make a new grouping variable for Education

edu<-data.frame(DSraw,Adjusted_Education)
length(edu$Adjusted_Education)


B1 <- edu[edu$Adjusted_Education%in% Not_defined,] %>% mutate(Edu_Category= rep("NA", nrow(.)))
dim(B1)

B2 <- edu[edu$Adjusted_Education%in% Bachelor_Jobs,] %>% mutate(Edu_Category= rep("Min_Bsc", nrow(.)))
dim(B2)

B3 <- edu[edu$Adjusted_Education%in% Master_Jobs,] %>% mutate(Edu_Category= rep("Min_Master", nrow(.)))
dim(B3)

B4 <- edu[edu$Adjusted_Education%in% phd_jobs,] %>% mutate(Edu_Category= rep("Phd", nrow(.)))
dim(B4)

B5 <- edu[edu$Adjusted_Education%in% some_degree,] %>% mutate(Edu_Category= rep("Some Degree", nrow(.)))
dim(B5)

B6 <- edu[edu$Adjusted_Education%in% other,] %>% mutate(Edu_Category= rep("Other", nrow(.)))
dim(B6)

new_edu<-rbind(B1,B2,B3,B4,B5, B6)
dim(new_edu)
new_edu<-new_edu[with(new_edu,order(new_edu$ID)),]


drop<-c("Adjusted_Education")
DSraw<-new_edu[,!(names(new_edu) %in% drop)]
DSraw[DSraw=="NA"]<-NA
head(DSraw)
dim(DSraw)

DStidy <- DSraw
head(DStidy)
dim(DStidy)
save(DStidy, file="data/DStidy.rda")
#write_csv(DSraw, "Wrangled_data_1.csv")
