open_dashboard <- function() {
#' Visualize the dataset in a dashboard
#' @description{
#' Opens the dashboard containing visualizations of the dataset. \cr
#'
#' The dashboard is hosted at \url{https://scs-fas-sjp.netlify.app/dsjobtrackervisualisation/dataviz}
#' }
#' @details The data wrangling dashboard was created by Jayani Lakshika
#' @examples
#' open_dashboard()
  utils::browseURL(
    "https://scs-fas-sjp.netlify.app/dsjobtrackervisualisation/dataviz"
  )
}
