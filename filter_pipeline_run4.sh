#!/bin/bash

# Script: filter_pipeline.sh
# This file is shell script that takes demultiplexed reads in folders, filters and runs the ARTIC ncov pipeline on the samples

#Notes:
# 1. This script is individualized for each run 
# 2. This script assumes that e 

for dir in */; 
do 

echo "$dir"
echo "${dir%/}"

cd ${dir}/
pwd
echo "Moving to $dir folder"

artic guppyplex --min-length 400 --max-length 700 --directory /Users/mixtup/Dropbox/mixtup/Documentos/ucdavis/papers/covid19_environmental/run_pipeline_outputs/ncov_ucdh_env1_run4/${dir%/} --prefix ncov_ucdh_env_run4

echo "Finished filtering $dir files"

#Can use wildcard to count, but unclear how to assign to each coverage
#awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' sample_barcode05*consensus.fasta | tail -n +2 | grep "^>" -v |  awk -F 'N' '{print NF-1}'

#Run pipeline for the current sample
artic minion --normalise 200 --threads 4 --scheme-directory ~/artic-ncov2019/primer_schemes --read-file ncov_ucdh_env_run4_${dir%/}.fastq --fast5-directory  /Users/mixtup/MinION_reads/ncov_ucdh_env1_run4/ncov_ucdh_env1_run4/20201007_2255_MN23913_ABE356_3ac92cc2/fast5 --sequencing-summary /Users/mixtup/MinION_reads/ncov_ucdh_env1_run4/ncov_ucdh_env1_run4/20201007_2255_MN23913_ABE356_3ac92cc2/sequencing_summary_ABE356_44ee7ffc.txt nCoV-2019/V3 sample_${dir%/}

echo "Finished running pipeline on sample with $dir files"

#Moving back up one level in directory
cd ..

done
