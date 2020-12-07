#!/bin/bash

# Script: basecall_guppy_hac.sh
# This file is shell script to downaload both raw FAST5 files and high accuracy basecalled FASTQ files from the MinION (Oxford Nanopore Technologies) sequencing runs

#This script is part of the following manuscript:
#"Environmental Surveillance for SARS-CoV-2 at the UC Davis Medical Center"
#David A. Coil | Timothy Albertson | Stuart H. Cohen | Satya Dandekar | Sam Diaz-Munoz | Jonathan A. Eisen | Tracey Goldstein | Maya Juarez | Brandt A Robinson | Christian Sandrock | Daniel G Tompkins | Alexandre Tremeau-Bravard | Angela Haczku

#Download FAST5 raw sequencing files from SRA via EBI
#wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR103/013/SRR10302213/SRR10302213_1.fastq.gz -O data/aiv_env_all.fastq.gz

#Download FASTQ sequencing files from SRA via EBI (Guppy HAC basecalling)
#wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR103/013/SRR10302213/SRR10302213_1.fastq.gz -O data/aiv_env_all.fastq.gz
