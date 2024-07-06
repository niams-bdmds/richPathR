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
  library(igraph)
}


# install required packages
install_required_packages <- function(){
  install.packages("enrichR")
  install.packages("xlsx")
  install.packages("dplyr")
  install.packages("ggplot2")
  install.packages("tidyr")
  install.packages("readxl")
  install.packages("purrr")
  install.packages("stringr")
  install.packages("plotly")
  install.packages("pheatmap")
  install.packages("filesstrings")
  install.packages("igraph")
}