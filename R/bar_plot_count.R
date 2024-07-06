#' Bar plot of overall term count
#' Generates bar plot of term count across the gene lists.
#' This bar plot visualizes how many terms (pathways) are distributed
#' in the gene lists.

#' @param enrichr_df A data frame generated  by implementing the function
#' enrichr_df.

#' @param value A integer value below which the combined score or p value is set to be insignificant.Default is 5.

#' @param value_type A character value specifying the type of value to be used for filtering the significant terms. Default is 'minimum_combined_score'.

#' @return A bar plot.

#' @example
#' bar_plot_count(enrichr_df = enrichr_df, minimum_combined_score)

#' @export
bar_plot_count <- function(enrichr_df, value = 5, value_type = "minimum_combined_score") {
  filter_significant_terms <- list()
  if (value_type == "minimum_combined_score") {
    filter_significant_terms <- enrichr_df %>% filter(Combined.Score > value)
  } else if (value_type == "minimum_p_value") {
    filter_significant_terms <- enrichr_df %>% filter(P.value > value)
  } else {
    print("Unknown value type")
    return
  }


  plot <- ggplot(filter_significant_terms, aes(gene_list)) +
    geom_bar(fill = "blue") +
    theme(axis.text.x = element_text(angle = 90)) +
    theme()
  return(plot)
}
