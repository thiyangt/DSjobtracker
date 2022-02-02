#' Get data from DSjobtracker for specific years or all the years combined into one dataset
#'
#' The DSjobtracker dataset is updated each year through the Statistical Consultancy Service of University of Sri Jayewardenepura. In order to accommodate the structural changes of data this function provides the capability to get the dataset required either combined through out the years or data specific to each year.
#'
#' @param year can be either "all" or an year after 2020 (2020,2021,...,etc.) as a numeric value
#'
#' @export
get_data <- function(year){
  if(year == "all"){
    load(file=here("data","DStidy.rda"))
    return(DStidy)
  }else if(as.numeric(year) == 2020){
    load(file=here("data","DStidy_2020.rda"))
    return(DStidy_2020)
  }else if(as.numeric(year) == 2021){
    load(file=here("data","DStidy_2021.rda"))
    return(DStidy_2021)
  }else{
    stop("Year variable of get_data function should be either 'all' or an year after 2020")
  }
}
