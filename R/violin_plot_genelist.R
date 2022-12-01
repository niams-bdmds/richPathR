#' Violin plot of gene list and library
#' Generates violin  plot for each gene list for each library. Maximum number
#' of gene list and library recommended for this visualization is 10 each.

#' @param enrichr_df
#'  A data frame generated  by implementing the function enrichr_df

#'@param minimum_combined_score A integer value below which the combined score
#' is set to be insignificant

#'@return A violin plot

#'@example
#' violin_plot_genelist(enrichr_df = enrichr_df, minimum_combined_score)

#' @export
violin_plot_genelist <- function (enrichr_df, minimum_combined_score = 5){
  filter_significant_terms <- enrichr_df %>%
    filter(., Combined.Score > minimum_combined_score)

  plot <- ggplot(filter_significant_terms, aes(gene_list, log2(Combined.Score),
    fill = gene_list)) +
    geom_violin() + geom_jitter(width = 0.1, size = 0.8) +
    theme(axis.title.x = element_blank(), axis.text.x = element_blank(),
    axis.ticks.x = element_blank())

  return(plot)
}
