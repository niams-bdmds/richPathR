#' Composite Bar plot of overall term count
#' Generates a mixed bar plot of term count across the gene list and libraries.
#' This bar plot visualizes how many terms (pathways) are distributed.
#' in the gene lists.

#'@param enrichr_df
#' A data frame generated  by implementing the function enrichr_df.

#'@param minimum_combined_score
#' A integer value below which the combined score is set to be insignificant. Default is 5.

#'@return
#' A bar plot.

#'@example
#' bar_plot_genelist_library(enrichr_df = enrichr_df, minimum_combined_score)

#'@export
bar_plot_genelist_library <- function (enrichr_df, minimum_combined_score = 5){
  filter_significant_terms <- enrichr_df %>%
    filter(., Combined.Score > minimum_combined_score)
  plot <- ggplot(filter_significant_terms) + geom_jitter(width = 0.1, size = 0.8) +
    geom_bar(aes(y = library, fill = gene_list )) ++lado++
  return(plot)}
