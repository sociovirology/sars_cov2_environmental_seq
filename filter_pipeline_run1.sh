#!/bin/bash

# Script: filter_pipeline.sh
# This file is shell script that takes demultiplexed reads in folders, filters and runs the ARTIC ncov pipeline on the samples
for dir in */; 
do 

echo "$dir"
echo "${dir%/}"

cd ${dir}/
pwd
echo "Moving to $dir folder"

artic guppyplex --min-length 400 --max-length 700 --directory /Users/mixtup/Dropbox/mixtup/Documentos/ucdavis/papers/covid19_environmental/run_pipeline_outputs/ncov_ucdh_env1_run1/${dir%/} --prefix ncov_ucdh_env_run1

echo "Finished filtering $dir files"

#Can use wildcard to count, but unclear how to assign to each coverage
#awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' sample_barcode05*consensus.fasta | tail -n +2 | grep "^>" -v |  awk -F 'N' '{print NF-1}'

#Run pipeline for the current sample
artic minion --normalise 200 --threads 4 --scheme-directory ~/artic-ncov2019/primer_schemes --read-file ncov_ucdh_env_run1_${dir%/}.fastq --fast5-directory /Users/mixtup/MinION_reads/ncov_ucdh_env1_run1/ncov_ucdh_env1_run1/20200523_0732_MN23913_FAN33832_25240491/fast5 --sequencing-summary /Users/mixtup/MinION_reads/ncov_ucdh_env1_run1/ncov_ucdh_env1_run1/20200523_0732_MN23913_FAN33832_25240491/sequencing_summary_FAN33832_1b1a423a.txt nCoV-2019/V3 sample_${dir%/}

echo "Finished running pipeline on sample with $dir files"

#Moving back up one level in directory
cd ..

done

