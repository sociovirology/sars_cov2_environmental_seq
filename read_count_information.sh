#!/bin/bash

# Script: read_count_information.sh
# This file re-runs certain commands in the ARTIC pipeline 'artic minion' to generate a low-coverage consensus (1X, 2X, 5X) sequence. The default pipeline adds N's to positions with less than 
# The script also exports coverage for each consensus sequence, and depth for each sample
# This script requires filter_pipeline.sh to be run before!!

#Script needs two command-line options to navigate to the correct directory and identify the run
# $1: full path to run folder where reads are demultiplexed by Guppy, so with sub-folders barcode01, barcode02, etc.
# $2: run number or id 

cd $1 #change to run folder where reads are demultiplexed by Guppy

echo "In the following directory":
pwd

#Total reads basecalled per run
wc -l barcoding_summary.txt | awk '{print $1-1}' >> reads.dat #Minus 1 for header

#Now determine reads assigned to each barcode
#Raw totals for all barcodes 
cat barcoding_summary.txt | awk '{print $2}' | grep "barcode*" -c >> reads.dat

#Reads that were unclasified (i.e. barcode did not pass classification criteria)
cat barcoding_summary.txt | awk '{print $2}' | grep "unclassified" -c >> reads.dat

#The files in the format 'ncov_ucdh_env_run*_barcode*.fastq' represent quality controlled, chimera-filtered reads (via 'artic guppyplex' command)
#Note this command for Run1
#This one-liner gets just the total in all successfully demultiplexed files
find . -name 'ncov_ucdh_env_run*_barcode*.fastq' -print0 | xargs -0 wc -l | awk '{print $1/4}' | tail -n 1 >> reads.dat

#Now
#Print header
echo "run, total_reads, barcoded_reads, unclassified_reads, qc_reads" >> ../reads_$2.csv

#Change the reads output file to line up to header
awk -v run="$2" '{NR==1?s=$0 : s=s","$0}END{print run "," s}' reads.dat  >> ../reads_$2.csv

echo "Script complete for $2 files"