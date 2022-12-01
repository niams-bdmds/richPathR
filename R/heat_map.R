#' Generate heat map
#' It generates the heat map of the most frequent gene found in the database.

#' @param expanded_enrichr_df
#' A data frame generated  by exploding  the overlapping genes of query gene
#' list and database gene list. This data frame is created by implementing
#' function expanded_enrichr_df.

#'@param minimum_combined_score
#' A integer value below which the combined score is set to be insignificant.
#' Default is 5.

#'@return
#' A heat map

#'@example
#' enrichr_heat_map(expanded_enrichr_df = expanded_enrichr_df, minimum_combined_score)

enrichr_heat_map <- function(expanded_enrichr_df, minimum_combined_score = 5){
  expanded_enrichr_df_sig <- expanded_enrichr_df %>%
  filter(., Combined.Score == minimum_combined_score)
  count_gene_library <- expanded_enrichr_df %>% count(gene_list, library_abbrev, gene)

  gene_sorted <- count_gene_library %>% arrange(desc(n))

  top_30_terms <- top_n(gene_sorted, 30, n)

  matrix_for_heatmap <<- top_30_terms %>% spread(., gene, n)

  anno <- data.frame(Gene_list = factor(matrix_for_heatmap$gene_list),
    library = factor(matrix_for_heatmap$library_abbrev))

  matrix_for_heatmap_deselect <- matrix_for_heatmap[, -c(1:2)]

  rownames(matrix_for_heatmap_deselect) <- paste0(seq(nrow(matrix_for_heatmap_deselect)))

  pheatmap(matrix_for_heatmap_deselect, scale = "none", color = c('#4444FF', '#F4FF4F', '#FF4444'),
    cluster_cols = F, cluster_rows = F, col.names = F, fontsize = 6,
    row.names = F, show_rownames = F, cellwidth = 8,
    cellheight = 4, fontsize_row = 6, fontsize_col = 6,
    annotation_row = anno, na_col = "white",
    main = "The top enriched genes")
}






