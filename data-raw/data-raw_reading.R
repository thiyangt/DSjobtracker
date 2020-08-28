library(readr)
DataScientistQualificationSkills <- read_csv("C://DSjobtracker/data-raw/DataScientistQualificationSkills.csv")
head(DataScientistQualificationSkills)


DSraw <- DataScientistQualificationSkills
save(DSraw, file="data/DSraw.rda")
