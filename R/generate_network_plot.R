#' Visualize simplied network of gene term or pathway interaction
#' This function generates a simplified network for the enriched gene as revealed from heat map of
#' this package

#'@param extended_enrichr_df A data frame generated  by implementing the function
#'  enrichr_df

#'@param gene_name The name of the gene we want to visualize

#'@return A netwoork plot.

#'@example
#'

#' @export
term_vector <- c("Wnt signaling pathway", "FoxO signaling pathway", "Toll-like receptor signaling pathway")
#network_plot <- function(expanded_enrichr_d=expanded_enrichr_df, term_vector = term_vector)
#filtered_df <- filter(expanded_enrichr_df$Term %in% term_vector)
network_plot <- function(expanded_enrichr_df = expanded_enrichr_df, term_vector = term_vector)
  filtered_df <- filter(expanded_enrichr_df, Term %in% term_vector) %>% select(Term, gene)
  A <- get.adjacency(graph.edgelist(as.matrix(filtered_df), directed = FALSE))
  net2 <- graph_from_adjacency_matrix(A, mode = "undirected")
  plot(net2)
