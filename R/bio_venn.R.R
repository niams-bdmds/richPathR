#' This function creates the venn diagram.
#' draw.venn(

draw_venn_diagram_terms <- function(enrichr_df, term_list) {
  if(length(term_list) > 5 || length(term_list) < 2){
    stop("term-list should have length between two and five")}
  for (i in 1:length(term_list)){
    gene_list <-  enrichr_df %>% filter(., Genes = term_list)
  }

  }









