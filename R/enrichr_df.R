#' Generate data frame from EnrichR output
#' This function generates a data frame with 9 features.  Make sure
#' implement_enrichr.R is implemented and outputs are in enrichr_results
#' directory.

#'@return A data frame

#'@example
#' enrichr_df <- enrichr_df()

#' @export
enrichr_df <- function (){
  all_files <- list.files("data/enrichr_results", pattern = "*.xlsx", full.name = TRUE)

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

  return(enrichr_data_frame)
}
