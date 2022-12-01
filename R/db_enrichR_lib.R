#' Extract list of currently available db in EnrichR
#' This function extracts the list  of database currently available in EnrichR.
#' It does not have parameter. It implements listEnrichrDbs functionality
#' hosted in enrichr package. NOTE: enrichr package must  be installed  to
#' implement this function.

#'@example
#' db_EnrichR_lib()

#'@return An .xlsx file in data dir. Creates data dir if does not exist.

#'@export
db_EnrichR_lib <- function (){
  if (file.exists("data")){

  } else {
    dir.create(file.path("data"))
  }
  dbs = listEnrichrDbs()
  write.xlsx(dbs, file="data/Enrichr_db_names.xlsx", sheetName="enrichrdb",
    row.names = F, append = T)}
