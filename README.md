# Analysis of MinION SARS-CoV-2 sequence data from environmental samples collected at the University of California Davis Medical Center

This github repository includes code (and links to data) from the manuscript:
"Environmental Surveillance for SARS-CoV-2 at the UC Davis Medical Center"
David A. Coil | Timothy Albertson | Stuart H. Cohen | Satya Dandekar | Sam Diaz-Munoz | Jonathan A. Eisen | Tracey Goldstein | Maya Juarez | Brandt A Robinson | Christian Sandrock | Daniel G Tompkins | Alexandre Tremeau-Bravard | Angela Haczku

If you are reading or using this, let us know how these data were useful for you. If you use these data and code, please cite the repository or the paper. Always open to collaborate! Please contact us!

### Quick Start
1. Make sure packages are installed (see #2 below)
2. git clone https://github.com/sociovirology/sars_cov2_environmental_seq.git
3. [Download data, basecall, demultiplex script] 
4. chmod +x low_coverage_consensus.sh ; ./env_samples_qPCR_primer_analysis.sh (depends on 4)
(note steps 3 and 4 can takes a long time, alternatively download processed files here: )
5. Rscript aiv_detection_environment_analysis.R (or load interactively in R)
6. chmod +x env_samples_qPCR_primer_analysis.sh ; ./env_samples_qPCR_primer_analysis.sh (depends on 4)
7. chmod +x AIV_qPCR_primer_analysis.sh ; ./AIV_qPCR_primer_analysis.sh (can be run independently of above)
8. chmod +x positive_control_analysis.sh; ./positive_control_analysis.sh (depends on 4)
9. chmod +x checking_similar_sequences.sh; ./checking_similar_sequences.sh (depends on 4)

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

* ONT Guppy basecalling software version 3.2.2+9fe0a787
* cutadapt (2.4)


### 3. Data
Data consists of sequencing output from the Oxford Nanopore Technologies MinION sequencer platform (FASTQ files), sample information including  and sample barcode and metadata files

1) Sequencing files are (FAST5 raw signal and HAC basecalled FASTQ) are available from the Sequence Read Archive (Accession SRX-NNNNN)

2) Sample information is in data/AIV_filtration_sample_key_9_26_18.csv 

3) Data file with temperature, pH, and salinity data is in data/Temp_pH_Salinitt_for_B&C.csv

4) Primer and barcode information is in data/illumina_fwd.fasta and data/illumina_rev.fasta

5) Database file of all avian influenza sequences in FluDB in data/all_avian_flu.fasta.gz (used in minion_demultiplexing_flu_assignment.sh)

6) Database file of all avian influenza sequences in FluDB updated on August 12, 2019 data/avian_complete_genomes_aug12_2019.fasta.gz (used in AIV_qPCR_primer_analysis.sh)

7) Reference sequence for the positive control sample (A/Puerto Rico/8/1934 H1N1) is in data/PR8_Mt_Sinai_NYC.fasta

### 4. Code
Below are descriptions of the code files used to generate the tables, figures, and statistics in the paper.

1) minion_demultiplexing_flu_assignment.sh: This file is shell script that downloads and processes raw sequencing reads 

2) aiv_detection_environment_analysis.R: This file is an R script that couples sequencing information with sample information to arive at the main conclusions in the manuscript

3) env_samples_qPCR_primer_analysis.sh: This file is a shell script that evaluates whether the sequences derived from samples will yield positives using the Spackman et al 2003 M-segment qPCR primers 

4) AIV_qPCR_primer_analysis.sh: This shell script uses published sequences in the Influenza Research Database (http://fludb.org) to verify if Spackman et al 2003 primers (for M-segment qPCR) are expected to work on M segments of avian influenza virus

5) positive_control_analysis.sh: This shell script analyzes positive control sample against the reference sequence. Note that this file depends on minion_demultiplexing_flu_assignment.sh

6) checking_similar_sequences.sh: This shell script checks if there are identical/very similar reads in the sequencing dataset