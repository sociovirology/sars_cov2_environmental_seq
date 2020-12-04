#Run information

library(plyr)
library(readr)
library(ggplot2)
library(gridExtra)
library(grid)

setwd("/Users/sociovirology/Dropbox/mixtup/Documentos/ucdavis/papers/covid19_environmental/run_pipeline_outputs")

file_list <- list.files(path=".", pattern="*.csv", full.names=TRUE)
file_list

reads_run <- ldply(file_list, read_csv)

#Print out a table with summary information: https://cran.r-project.org/web/packages/gridExtra/vignettes/tableGrob.html
grid.table(reads_run)

#Total reads
sum(reads_run$total_reads)
#[1] 17123849
#~17.1M reads

#Total QC'd reads
sum(reads_run$qc_reads)
#[1] 6582104
#~6.6M reads
  
#Percent QC'd reads of total
(reads_run$qc_reads / reads_run$total_reads) * 100
#[1] 15.530288 43.263495  3.199072  1.553557 18.940476

#Make Data Frame for Table
reads_run_table <- data.frame(
  "Run Number" = c("Run 1", "Run 2", "Run 3", "Run 4", "Run 5"),
  "Total Reads" = prettyNum(reads_run$total_reads, big.mark=","),
  "Barcoded Reads" = prettyNum(reads_run$barcoded_reads, big.mark=","),
  "Unclassified Reads" = prettyNum(reads_run$unclassified_reads, big.mark=","),  
  "Quality Controlled Reads" = prettyNum(reads_run$qc_reads, big.mark=","),
  "Percent Reads Passing QC" = round((reads_run$qc_reads / reads_run$total_reads) * 100, digits = 2)
  )

#Print out a table with summary information: https://cran.r-project.org/web/packages/gridExtra/vignettes/tableGrob.html
#Output table
grid.table(reads_run_table)
#Saved manually as reads_run.png in figures/ 