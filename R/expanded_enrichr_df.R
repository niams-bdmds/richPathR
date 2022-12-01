#' Generate dataframe from EnrichR output
#' This function generates a dataframe with 9 features. It requires the
#' .xlsx output of implement_enrichr.R implementation.

#' @return A data frame

#' @example
#' expanded_enrichr_df <- expanded_enrichr_df()

#' @export
expanded_enrichr_df <- function (){
  all_files <- list.files("data/enrichr_results", pattern = "*.xlsx",
   full.name = TRUE)

  enrichr_data_frame <- map_df(all_files, function(x){
    all_sheets <- excel_sheets(x)
    map_df(all_sheets, ~read_xlsx(x, sheet = .x, col_types = c("text", "text",
    "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "text")) %>%
    dplyr::mutate(filename = basename(x), sheetname = .x))}) %>%
    rename(., library = sheetname) %>%
    mutate(gene_list  = gsub('.xlsx', '', filename)) %>%
    select("Term", "Overlap", "P.value", "Adjusted.P.value", "Odds.Ratio",
           "Combined.Score", "Genes", "library", "gene_list") %>%
    mutate(term_abbrev = abbreviate(Term, 5)) %>%
    mutate(library_abbrev = abbreviate(library, 4))

  expanded_data_frame <- enrichr_data_frame %>%
    mutate(gene = strsplit(Genes, ";")) %>%
    unnest(gene)

  return(expanded_data_frame)
}
