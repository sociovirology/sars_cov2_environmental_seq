# Analysis of MinION SARS-CoV-2 sequence data from environmental samples collected at the University of California Davis Medical Center

This github repository includes code (and links to data) from the manuscript:
"Environmental Surveillance for SARS-CoV-2 at the UC Davis Medical Center"
David A. Coil | Timothy Albertson | Stuart H. Cohen | Satya Dandekar | Sam Diaz-Munoz | Jonathan A. Eisen | Tracey Goldstein | Maya Juarez | Brandt A Robinson | Christian Sandrock | Daniel G Tompkins | Alexandre Tremeau-Bravard | Angela Haczku

If you are reading or using this, let us know how these data were useful for you. If you use these data and code, please cite the repository or the paper. Always open to collaborate! Please contact us!

### Quick Start
1. Make sure packages are installed (see #2 below)
2. git clone https://github.com/sociovirology/sars_cov2_environmental_seq.git
3. chmod +x sra_download.sh, ./sra_download.sh
4. (Optional: Basecall script to replicate FASTQ files, run only with GPU) chmod +x basecall_guppy_hac.sh ; basecall_guppy_hac.sh
5. chmod +x demultiplexing_script.sh ; ./demultiplexing_script.sh (depends on 3) [need to adjust so that it does each run automatically, or can just be string of commands]
(note steps 4 and 5 can takes a long time, alternatively download processed files here: )
6. chmod +x filter_pipeline.sh ; ./filter_pipeline.sh (depends on 5) [need to make Run agnostic, can always string together commands]
7. chmod +x low_coverage_consensus.sh ; ./low_coverage_consensus.sh (depends on 6)
8. read_count_informartion.sh (depends on 5) [need to adjust so that it does each run automatically]
9. Rscript analysis_figures.R (depends on 8) (or load interactively in R)
10. chmod +x control_analysis.sh; ./control_analysis.sh (depends on X) [may fold into]

### CONTENTS
1. Project Description
2. Packages and software used to test code
3. Data
4. Code

### 1. Project Description
Environmental Surveillance for SARS-CoV-2 at the UC Davis Medical Center

Abstract:


### 2. Packages and software used to test code
This code was tested using the following software packages:

* ONT Guppy barcoding software version 3.6.1+249406c
* ARTIC ncov2019 Environment
* R version 3.4.1 (2017-06-30, Single Candle), with packages:
+ plyr,readr, ggplot2, gridExtra, grid

### 3. Data
Data consists of sequencing output from the Oxford Nanopore Technologies MinION sequencer platform (FASTQ files), sample information including  and sample barcode and metadata files

1) Sequencing files are (FAST5 raw signal and HAC basecalled FASTQ) are available from the Sequence Read Archive (Accession SRX-NNNNN)

2) Sample metadata and qPCR results are in: 
data/Pilot Goldsteinresults.csv
data/169 swabs.csv

3) Sample and barcode information for each run is in the following files:
data/run4_barcodes.csv
data/run5_barcodes.csv
data/run3_barcodes.csv
data/run_1_run2_barcodes.csv

### 4. Code
Below are descriptions of the code files used to generate the tables, figures, and statistics in the paper.

1) sra_download.sh: This file is a shell script that downloads raw signal files and sequencing reads 

2) basecall_guppy_hac.sh: This file is a shell script that conducts basecalling (i.e. processess raw signal files to generate FASTQ sequence files). Only necessary to run if one wishes to replicate generation of FASTQ files, as those are already available via SRA with sra_download.sh

3) demultiplexing_script.sh: This file is a shell script that demultiplexes reads, i.e. assigns sequencing reads to each sample based on the barcode.

4) filter_pipeline.sh: This shell script runs the ARTIC ncov-2019 bioinformatics protocol

5) low_coverage_consensus.sh: This shell script re-runs some of the ARTIC commands to create consensus sequences that allow bases with 1X, 2X, and 5X coverage as the minimum (compared to the 20X default)

6) read_count_information.sh: This shell script summarizes information on the number of reads for each sequecning runs

7) analysis_figures.R: This shell script conducts most of the analysis of data, generating tables, figures, and statistics