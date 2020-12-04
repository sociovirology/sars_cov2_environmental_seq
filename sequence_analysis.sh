#!/bin/bash

# Script: sequence_analysis.sh
# This file is shell script that gathers run-level sequence information. Requires filter_pipeline.sh to be run before.
for dir in */; 
do 

echo "$dir"
echo "${dir%/}"

cd ${dir}/
pwd
echo "Moving to $dir folder"

artic guppyplex --min-length 400 --max-length 700 --directory ~/sars_cov2_environmental_seq/artic-ncov2019/ncov_ucdh_env_run1/fast_basecall_minknow/${dir%/} --prefix ncov_ucdh_env_run1

echo "Finished filtering $dir files"  

#Run pipeline for the current sample
artic minion --normalise 200 --threads 4 --scheme-directory ~/sars_cov2_environmental_seq/artic-ncov2019/primer_schemes --read-file ncov_ucdh_env_run1_${dir%/}.fastq --fast5-directory ~/data/ncov_ucdh_env/ncov_ucdh_env1_run1/20200523_0732_MN23913_FAN33832_25240491/fast5 --sequencing-summary /home/sldmunoz/data/ncov_ucdh_env/ncov_ucdh_env1_run1/20200523_0732_MN23913_FAN33832_25240491/sequencing_summary_FAN33832_1b1a423a.txt nCoV-2019/V3 sample_${dir%/}

echo "Finished running pipeline on sample with $dir files"

#Moving back up one level in directory
cd ..

done

