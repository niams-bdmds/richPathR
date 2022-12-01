#' Generate of table of the unique terms or pathways
#' It generates the list  of terms that  occur only one time across gene list
#' and libraries.

#' @param enrichr_df
#'  A data frame generated  by implementing the function enrichr_df

#'@param minimum_combined_score
#' A integer value below which the combined score is set to be insignificant

#'@return
#' A table in data directory.

#'@example
#' enrichr_unique_terms(enrichr_df = x, minimum_combined_score = 5)

#' @export
enrichr_unique_terms <- function (enrichr_df, minimum_combined_score = 5){
  filter_significant_terms <- enrichr_df %>%
    filter(., Combined.Score > minimum_combined_score)

  terms_unique <- filter_significant_terms %>%
    group_by(Term) %>% summarise(count=n()) %>% filter(count == 1)

  unique_terms <- terms_unique$Term
  enrichr_unique_terms <- filter_significant_terms %>% filter(Term %in% unique_terms)

  wb <- createWorkbook()
  sheet <-createSheet(wb, sheetName = "unique_terms")
  TITLE_STYLE <- CellStyle(wb)+ Font(wb,  heightInPoints=16,
                                     color="blue", isBold=TRUE, underline=1)

  TABLE_ROWNAMES_STYLE <- CellStyle(wb) + Font(wb, isBold=TRUE)

  TABLE_COLNAMES_STYLE <- CellStyle(wb) + Font(wb, isBold=TRUE) +
    Alignment(wrapText=TRUE, horizontal="ALIGN_CENTER") +
    Border(color="black", position=c("TOP", "BOTTOM"),
           pen=c("BORDER_THIN", "BORDER_THICK"))

  addDataFrame(enrichr_unique_terms, sheet, startRow=3, startColumn=1,
               colnamesStyle = TABLE_COLNAMES_STYLE, rownamesStyle = TABLE_ROWNAMES_STYLE)

  setColumnWidth(sheet, colIndex=c(1:ncol(state.x77)), colWidth=11)

  saveWorkbook(wb, "data/enrichr_unique_terms.xlsx")
}
