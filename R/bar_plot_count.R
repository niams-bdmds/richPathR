#' Bar plot of overall term count
#' Generates bar plot of term count across the gene lists.
#' This bar plot visualizes how many terms (pathways) are distributed
#' in the gene lists.

#'@param enrichr_df A data frame generated  by implementing the function
#' enrichr_df.

#'@param minimum_combined_score A integer value below which the combined score
#' is set to be insignificant.Default is 5.

#'@return A bar plot.

#'@example
#' bar_plot_count(enrichr_df = enrichr_df, minimum_combined_score)

#'@export
bar_plot_count <- function (enrichr_df, minimum_combined_score = 5){
  filter_significant_terms <- enrichr_df %>%
    filter(., Combined.Score > minimum_combined_score)

  plot <- ggplot(filter_significant_terms, aes(gene_list)) +
    geom_bar(fill = "blue") +
    theme(axis.text.x = element_text(angle = 90)) +
    theme()
  return(plot)}
