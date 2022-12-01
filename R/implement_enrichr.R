#' Implement EnrichR
#' This function implements listEnrichrDBS and enrichr functions of EnrichR. It
#' requires the list of database to be explored and the csv file with gene_list.

#' @param dbs A list of database

#' @param gene_list a csv file of the gene set

#' @return An directory named enrichR results in data directory.

#' @example
#' dbs <- c("Cancer_Cell_Line_Encyclopedia", "NCI-60_Cancer_Cell_Lines",
#' "NCI-Nature_2016", "UK_Biobank_GWAS_v1", "KEGG_2021_Human")
#' implement_enrichr(dbs = dbs, gene_list = "data/prc_gene_set.csv")

#' @export
implement_enrichr <- function(dbs, gene_list){
  library_db <- listEnrichrDbs()
  stopifnot("Library name currently not available in the database" = dbs %in% library_db$libraryName)
  dir.create("data/enrichr_results", showWarnings = FALSE)

  gene_list <- read.csv(gene_list, header = TRUE, colClasses = 'character')

  list_names <- colnames(gene_list)

  for (i in 1:length(list_names)){
    genes <- gene_list[, i]
    enrichred=enrichr(genes, dbs)
    enrichred %>% writexl::write_xlsx(paste0(list_names[i],".xlsx"))

    move_files(paste0(list_names[i],".xlsx"), "data/enrichr_results",
    overwrite=TRUE)}}
