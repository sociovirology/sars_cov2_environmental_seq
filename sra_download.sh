#!/bin/bash

# Script: sra_download.sh
# This file is shell script to download both raw FAST5 files and high accuracy basecalled FASTQ files from the MinION (Oxford Nanopore Technologies) sequencing runs

#This script is part of the following manuscript:
"SARS-CoV-2 detection and genomic sequencing from hospital surface samples collected at UC Davis"
#David A. Coil | Timothy Albertson | Shefali Banerjee | Greg Brennan  | A.J. Campbell | Stuart H. Cohen | Satya Dandekar  | Samuel L Díaz-Muñoz  | Jonathan A. Eisen | Tracey Goldstein  | Ivy R. Jose  | Maya Juarez  | Brandt A Robinson | Stefan Rothenburg | Christian Sandrock |Ana M. M. Stoian  | Daniel G Tompkins  | Alexandre Tremeau-Bravard  | Angela Haczku

#WAITING FOR SRA ENTRY TO UPDATE LINKS

#These commands will download the FAST5 and FASTQ files and output them to data/ncov_ucdh_env1_run*, where * corresponds to one of the 5 sequencing runs

#Download FAST5 raw sequencing files from SRA via EBI
#wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR103/013/SRR10302213/SRR10302213_1.fastq.gz -O data/aiv_env_all.fastq.gz

#Download FASTQ sequencing files from SRA via EBI (Guppy HAC basecalling)
#wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR103/013/SRR10302213/SRR10302213_1.fastq.gz -O data/aiv_env_all.fastq.gz
