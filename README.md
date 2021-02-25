# Analysis of MinION SARS-CoV-2 sequence data from environmental samples collected at the University of California Davis Medical Center

This github repository includes code (and links to data) from the manuscript:
"SARS-CoV-2 detection and genomic sequencing from hospital surface samples collected at UC Davis"

David A. Coil | Timothy Albertson | Shefali Banerjee | Greg Brennan  | A.J. Campbell | Stuart H. Cohen | Satya Dandekar  | Samuel L Díaz-Muñoz  | Jonathan A. Eisen | Tracey Goldstein  | Ivy R. Jose  | Maya Juarez  | Brandt A Robinson | Stefan Rothenburg | Christian Sandrock |Ana M. M. Stoian  | Daniel G Tompkins  | Alexandre Tremeau-Bravard  | Angela Haczku

If you are reading or using this, let us know how these data were useful for you. If you use these data and code, please cite the repository or the paper. Always open to collaborate! Please contact us!

### Quick Start
1. Make sure packages are installed (see #2 below)
2. git clone https://github.com/sociovirology/sars_cov2_environmental_seq.git
3. chmod +x sra_download.sh, ./sra_download.sh
4. OPTIONAL: Basecall script to replicate FASTQ files, run only with GPU: chmod +x basecall_guppy_hac.sh ; basecall_guppy_hac.sh
5. chmod +x demultiplexing_script.sh ; ./demultiplexing_script.sh (depends on 3)
6. chmod +x filter_pipeline.sh ; ./filter_pipeline.sh (depends on 5)
7. chmod +x low_coverage_read_information.sh ; ./low_coverage_read_information.sh (depends on 6)
8. Rscript analysis_figures.R (depends on 7) (or load interactively in R)
9. chmod +x nextstrain_setup_run.sh; ./nextstrain_setup_run.sh (independent of all above, alternatively see data/nextstrain/README.md for web-based analysis)

### CONTENTS
1. Project Description
2. Packages and software used to test code
3. Data
4. Code

### 1. Project Description
SARS-CoV-2 detection and genomic sequencing from hospital surface samples collected at UC Davis

#### Abstract:  
**Rationale**: There is little doubt that aerosols play a major role in the transmission of SARS-CoV-2. The significance of the presence and infectivity of this virus on environmental surfaces, especially in a hospital setting, remains less clear.  
**Objectives**:  We aimed to analyze surface swabs for SARS-CoV-2 RNA and infectivity, and to determine their suitability for sequence analysis.  
**Methods**: Samples were collected during two waves of COVID-19 at the University of California, Davis Medical Center, in COVID-19 patient serving and staff congregation areas. qRT-PCR positive samples were investigated in Vero cell cultures for cytopathic effects  and phylogenetically assessed by whole genome sequencing.  
**Measurements and Main Results**: Improved cleaning and patient management practices between April and August 2020 were associated with a substantial reduction of SARS-CoV-2 qRT-PCR positivity (from 11% to 2%) in hospital surface samples. Even though we recovered near-complete genome sequences in some, none of the positive samples (11 of 224 total) caused cytopathic effects in cultured cells suggesting this nucleic acid was either not associated with intact virions, or they were present in insufficient numbers for infectivity. Phylogenetic analysis suggested that the SARS-CoV-2 genomes of the positive samples were derived from hospitalized patients. Genomic sequences isolated from qRT-PCR negative samples indicate a superior sensitivity of viral detection by sequencing.  
**Conclusions**: This study confirms the low likelihood that SARS-CoV-2 contamination on hospital surfaces contains infectious virus, disputing the importance of fomites in COVID-19 transmission. Ours is the first report on recovering near-complete SARS-CoV-2 genome sequences directly from environmental surface swabs. 

### 2. Packages and software used to test code
This code was tested using the following software packages:

* ONT Guppy barcoding software version 3.6.1+249406c
* ARTIC ncov2019 Environment (https://github.com/artic-network/artic-ncov2019), setup instructions here:https://artic.network/ncov-2019/ncov2019-bioinformatics-sop.html 
* R version 3.4.1 (2017-06-30, Single Candle), with packages:
+ plyr,readr, ggplot2, gridExtra, grid

### 3. Data
Data consists of sequencing output from the Oxford Nanopore Technologies MinION sequencer platform (FASTQ files), sample information, barcodes, and metadata files

1) Sequencing files are (FAST5 raw signal and HAC basecalled FASTQ) are available from the Sequence Read Archive (Accession SRX-NNNNN)

2) Sample metadata and qPCR results are in: 
data/Pilot Goldsteinresults.csv
data/169 swabs.csv

3) Sample and barcode information for each run is in the following files:
data/run4_barcodes.csv
data/run5_barcodes.csv
data/run3_barcodes.csv
data/run_1_run2_barcodes.csv

4) Data and supporting files to run phylogenetic analyses are in:
data/nextstrain/ (see data/nextstrain/README.md for details)

### 4. Code
Below are descriptions of the code files used to generate the tables, figures, and statistics in the paper.

1) sra_download.sh: This file is a shell script that downloads raw signal files and sequencing reads 

2) basecall_guppy_hac.sh: This file is a shell script that conducts basecalling (i.e. processess raw signal files to generate FASTQ sequence files). Only necessary to run if one wishes to replicate generation of FASTQ files, as those are already available via SRA with sra_download.sh

3) demultiplexing_script.sh: This file is a shell script that demultiplexes reads, i.e. assigns sequencing reads to each sample based on the barcode.

4) filter_pipeline.sh: This shell script runs the ARTIC ncov-2019 bioinformatics protocol for each run

5) low_coverage_consensus.sh: This shell script re-runs some of the ARTIC commands to create consensus sequences that allow bases with 1X, 2X, and 5X coverage as the minimum (compared to the 20X default)

6) read_count_information.sh: This shell script summarizes information on the number of reads for each sequencing runs

7) low_coverage_read_information.sh: This is a "driver" script that runs scripts 5) and 6) for each run sub-directory

8) analysis_figures.R: This shell script conducts most of the analysis of data, generating tables, figures, and statistics

9) nextstrain_setup_run.sh: This file is shell script that sets up the NextStrain environment, runs the test NextStrain build, and then copies files for a custom build used to generate images in the paper. This script is independent from other scripts. Alternate way to run analyses presented in data/nextstrain/README.md