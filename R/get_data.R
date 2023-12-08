#' Get data from DSjobtracker for specific years or all the years combined into one dataset
#'
#' The DSjobtracker dataset is updated each year through the Statistical Consultancy Service of University of Sri Jayewardenepura. In order to accommodate the structural changes of data this function provides the capability to get the dataset required either combined through out the years or data specific to each year.
#'
#' @param year can be either "all" or an year after 2020 (2020,2021,...,etc.) as a numeric value
#'
#' @export
get_data <- function(year){
  if(year == "all"){
    return(get(load(file="data/DStidy.rda")))
  }else if(as.numeric(year) == 2020){
    return(get(load(file="data/DStidy_2020.rda")))
  }else if(as.numeric(year) == 2021){
    return(get(load(file="data/DStidy_2021.rda")))
  }else if(as.numeric(year) == 2022 | as.numeric(year) == 2023){
    return(get(load(file="data/DStidy_2022_2023.rda")))
  }else{
    stop("Year variable of get_data function should be either 'all' or an year after 2020")
  }
}
