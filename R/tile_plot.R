#' Generate tile map
#' It generates the tile of the most frequent gene found in the database. This
#' plot is helpful to assess which library has more  coverage of genes for each
#' gene list.

#' @param expanded_enrichr_df A data frame generated  by exploding  the
#' overlapping genes of query gene list and database gene list. This data frame
#' is created by implementing function expanded_enrichr_df.

#'@param minimum_combined_score An integer value below which the combined score
#' is set to be insignificant. Default is 5.

#'@return A tile plot.

#'@example
#' tile_plot(expanded_enrichr_df = expanded_enrichr_df, minimum_combined_score)

#' @export
tile_plot <- function(expanded_enrichr_df, minimum_combined_score = 5){
  expanded_enrichr_df_sig <- expanded_enrichr_df %>%
    filter(., Combined.Score == minimum_combined_score)

  count_gene_library <- expanded_enrichr_df %>% count(gene_list, library, gene) %>%
    filter(n > 1)

  tile_plot <- ggplot(count_gene_library, aes(x = gene_list, y = library, fill = n)) +
    ggtitle("Gene intersect of gene list and library") +
    geom_tile(aes(fill = n), color = 'black') +
    scale_fill_gradient(low = "white", high = "red") +
    theme(axis.text.x = element_text(angle = 90, size = 6),
    axis.text.y = element_text(size = 6),
    plot.title = element_text(lineheight = 0.9, face = "bold",  hjust = 0.5))

  return (tile_plot)
}
