library(readr)
library(tidyverse)
DStidy_2022 <- read_csv("DStidy_2022.csv")


# fix data type
DStidy_2022$DateRetrieved <- as.POSIXct(DStidy_2022$DateRetrieved,format = "%d-%m-%y")
DStidy_2022$DatePublished <- as.POSIXct(DStidy_2022$DatePublished,format = "%d-%m-%y")
DStidy_2022$Salary <- as.double(DStidy_2022$Salary)
DStidy_2022$BSc_needed <- as.double(DStidy_2022$BSc_needed)
DStidy_2022$MSc_needed <- as.double(DStidy_2022$MSc_needed)
DStidy_2022$PhD_needed <- as.double(DStidy_2022$PhD_needed)

# Merge
DStidy_combined <- read_csv("DStidy_combined.csv")
dim(DStidy_combined)

DStidy <- dplyr::bind_rows(DStidy_combined, DStidy_2022)
dim(DStidy)

# Final combined data set
write_csv(DStidy,"DStidy_combined_2022.csv")
