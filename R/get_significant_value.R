#' @param enrichr_df A data frame generated  by implementing the function
#' enrichr_df.

#' @param value A integer value below which the combined score or p value is set to be insignificant.Default is 5.

#' @param value_type A character value specifying the type of value to be used for filtering the significant terms. Default is 'minimum_combined_score'.

#' @export
get_significant_terms <- function(enrichr_df, value, value_type) {
    print(paste("get_significant_terms =>", value_type, ":", value))
    significant_terms <- list()
    if (value_type == "minimum_combined_score") {
        significant_terms <- enrichr_df %>% filter(., Combined.Score > value)
    } else if (value_type == "p_value_cutoff") {
        significant_terms <- enrichr_df %>% filter(., P.value < value)
    } else {
        print(paste("Unknown value_type:", value_type))
        return(significant_terms)
    }

    return(significant_terms)
}
