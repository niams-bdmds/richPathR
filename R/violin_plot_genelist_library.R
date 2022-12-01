#' Violin plot of gene list and library
#' Generates violin  plot for each gene list and library. Maximum number
#' of gene list and library recommended for this visualization is 10 each.

#' @param enrichr_df
#'  A data frame generated  by implementing the function enrichr_df

#'@param minimum_combined_score
#'A integer value below which the combined score is set to be insignificant.
#' Default is 5.

#'@return
#' A violin plot

#'@example
#' violin_plot_genelist_library(enrichr_df = enrichr_df, minimum_combined_score )

violin_plot_genelist_library <- function (enrichr_df, minimum_combined_score = 5){
  filter_significant_terms <- enrichr_df %>%
  filter(., Combined.Score > minimum_combined_score)

  plot <- filter_significant_terms %>%
  ggplot(aes(x = library_abbrev, y = log2(Combined.Score), fill = gene_list)) +
  theme(axis.text.x = element_text(angle = 90)) +
  geom_violin()

  return(plot)
}
