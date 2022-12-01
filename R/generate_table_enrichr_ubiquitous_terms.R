#' Generate table of the most common terms or pathways
#' It generates the list  of terms (could be a single term) that has the  highest
#' count across gene lists and libraries.

#' @param enrichr_df A dataframe generated  by implementing the function
#'  enrichr_df

#'@param minimum_combined_score A integer value below which the combined score
#' is set to be insignificant. Default is 5.
#'@return An excel file in data dir.

#'@example
#' enrichr_ubiquitous_terms(enrichr_df = enrichr_df, minimum_combined_score )

enrichr_ubiquitous_terms <- function(enrichr_df, minimum_combined_score = 5){
  filter_significant_terms <- enrichr_df %>%
    filter(., Combined.Score > minimum_combined_score)

  ubiquitous_term_count <- filter_significant_terms %>%
    group_by(Term) %>% summarise(count=n())

  max_count <- (max(ubiquitous_term_count$count))

  ubiquitous_term <- ubiquitous_term_count %>% filter(count == max_count)

  ubiquitous_term_only <- ubiquitous_term$Term

  enrichr_ubiquitous_term <- as.data.frame(filter_significant_terms %>%
    filter(Term %in% ubiquitous_term_only))

  wb <- createWorkbook()
  sheet <-createSheet(wb, sheetName = "ubiquitous_term")
  TITLE_STYLE <- CellStyle(wb)+ Font(wb,  heightInPoints=16,
    color="blue", isBold=TRUE, underline=1)

  TABLE_ROWNAMES_STYLE <- CellStyle(wb) + Font(wb, isBold=TRUE)

  TABLE_COLNAMES_STYLE <- CellStyle(wb) + Font(wb, isBold=TRUE) +
    Alignment(wrapText=TRUE, horizontal="ALIGN_CENTER") +
    Border(color="black", position=c("TOP", "BOTTOM"),
           pen=c("BORDER_THIN", "BORDER_THICK"))

  addDataFrame(enrichr_ubiquitous_term, sheet, startRow=3, startColumn=1,
    colnamesStyle = TABLE_COLNAMES_STYLE, rownamesStyle = TABLE_ROWNAMES_STYLE)

  setColumnWidth(sheet, colIndex=c(1:ncol(state.x77)), colWidth=11)

  saveWorkbook(wb, "data/enrichr_ubiquitous_terms.xlsx")
}





