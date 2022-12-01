#' Calling required libraries
#' This function calls all required libraries. The version of these libraries
#' have been mentioned in NAMESPACE. Some libraries could mask the base
#' functions. This function does not have parameters.

#' @example
#' call_required_packages()

#' @export
call_required_packages <- function(){
  library(enrichR)
  library(xlsx)
  library(dplyr)
  library(ggplot2)
  library(tidyr)
  library(readxl)
  library(purrr)
  library(stringr)
  library(plotly)
  library(pheatmap)
  library(filesstrings)
  library(VennDiagram)
}
