library(readr)
DStidy_combined_2022 <- read_csv("data-raw/2023/DStidy_combined_2022.csv")
View(DStidy_combined_2022)
## all years contribution
DStidy <- DStidy_combined_2022
save(DStidy, file = "data/DStidy.rda")

## 2023
DStidy_2022_2023 <- read_csv("data-raw/2023/DStidy_2022.csv")
#save to rda file
save(DStidy_2022_2023, file = "data/DStidy_2022_2023.rda")
