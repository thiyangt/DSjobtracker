library(readr)
library(here)
DStidy_2022 <- read_csv("data-raw/2022/DStidy_2022.csv")
#View(DStidy_2022)
save(DStidy_2022, file=here("data", "DStidy_2022.RData"))
dim(DStidy_2022)

# Merge - todo
DStidy_combined <- read_csv("data-raw/2021/DStidy_combined.csv")
DStidy <- dplyr::bind_rows(DStidy_combined, DStidy_2022)
