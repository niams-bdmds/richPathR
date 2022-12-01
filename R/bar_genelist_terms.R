#' Generate horizontal bar plot   of terms  count across gene list
#' This function generates a horizontal bar plot of term count across the gene
#' list for top 30 most significant terms based on combined score.
#' This bar plot visualizes how many terms (pathways) are distributed
#' in the gene lists.

#'@param enrichr_df A data frame generated  by implementing the function
#'  enrichr_df

#'@param minimum_combined_score A integer value below which the combined score
#' is set to be insignificant. Default is 5.

#'@return A bar plot.

#'@example
#' bar_genelist_terms(enrichr_df = enrichr_df, minimum_combined_score = 5)

#' @export
bar_genelist_terms <- function (enrichr_df, minimum_combined_score = 5){
  filter_significant_terms <- enrichr_df %>%
    filter(., Combined.Score > minimum_combined_score)

  filter_significant_terms_sorted <- filter_significant_terms %>%
    arrange(desc(Combined.Score))

  top_30_terms <- top_n(filter_significant_terms_sorted, 30, Combined.Score)

  plot <- ggplot(top_30_terms, aes(reorder(Term, table(Term)[Term]), fill = gene_list)) +
    geom_bar() +
    coord_flip() +
    labs(x = "", y = "Comparison Count") +
    scale_y_continuous(breaks = c(0,1,2,3)) +
    theme(axis.text.y = element_text(size = 6)) +
    theme_bw()
  return(plot)
}
