# richPathR
## BACKGROUND

Gene set enrichment analysis (GSEA) is an important step for disease and drug
discovery. Omics profiling of tissue or cells of patients and healthy
individuals generated gene lists that need to be further investigated in the
known biological context. Multiple public data sources with annotated gene sets
are available for GSEA and enrichR is the most popular web application still
requiring custom tool for large-scale mining. richPathR package is a collection
of the R functions that helps researchers with enrichment analysis using EnrichR.

## DEPENDENCIES

This package has been developed using following version of R and R packages,
therefore we recommend using these or later versions:

1. dplyr(1.0.8)
2. enrichR(3.0)
3. filestrings(3.2.2)
4. ggplot2(3.3.5)
5. pheatmap(1.0.12)
6. plotly(4.10.0)
7. purrr(0.3.4)
5. readxl(1.4.0)
6. tidyr(1.2.0)
7. xlsx(0.6.5)  
8. R(4.1.3)
9. devtools(2.4.3) only developer needs this package
10. roxygen2(7.2.0)	only developer needs this package

### INSTALLATION

Package can be installed directly from The R Archive (CRAN) or the source code
can be downloaed from github (https://github.com/niams-bdmds/richPathR). 

### TEST DATA

Test data are available in /Data.

### CALL ALL REQUIRED PACKAGE

Make sure the above packes are available in your computer. For calling all these
packages, the following function can be used:

call_required_packages() 

NOTE: check vignette for detail explanation. 



