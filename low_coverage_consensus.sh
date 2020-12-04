#!/bin/bash

# Script: low_coverage_consensus.sh
# This file re-runs certain commands in the ARTIC pipeline 'artic minion' to generate a low-coverage consensus (1X, 2X, 5X) sequence. The default pipeline adds N's to positions with less than 
# The script also exports coverage for each consensus sequence, and depth for each sample
# This script requires filter_pipeline.sh to be run before!!

#Script needs two command-line options to navigate to the correct directory and identify the run
# $1: full path to run folder where reads are demultiplexed by Guppy, so with sub-folders barcode01, barcode02, etc.
# $2: run number or id 

cd $1 #change to run folder where reads are demultiplexed by Guppy

for dir in */; 
do 

echo "$dir"
echo "${dir%/}"

cd ${dir}/
pwd
echo "Moving to $dir folder"

if [ -e sample_${dir%/}.consensus.fasta ] #This if statement will check if there is a consensus file
  then

#First let's remake the depth mask, with the depth option. Three commands, for three depths
artic_make_depth_mask --depth 1 --store-rg-depths ~/artic-ncov2019/primer_schemes/nCoV-2019/V3/nCoV-2019.reference.fasta sample_${dir%/}.primertrimmed.rg.sorted.bam sample_${dir%/}.coverage_mask_1X.txt
artic_make_depth_mask --depth 2 --store-rg-depths ~/artic-ncov2019/primer_schemes/nCoV-2019/V3/nCoV-2019.reference.fasta sample_${dir%/}.primertrimmed.rg.sorted.bam sample_${dir%/}.coverage_mask_2X.txt
artic_make_depth_mask --depth 5 --store-rg-depths ~/artic-ncov2019/primer_schemes/nCoV-2019/V3/nCoV-2019.reference.fasta sample_${dir%/}.primertrimmed.rg.sorted.bam sample_${dir%/}.coverage_mask_5X.txt

echo "Finished making depth mask" 

#skipping the 'artic_plot_amplicon_depth' command and the 'bgzip' and 'tabix' commands of the 'artic minion' pipeline as they have no bearing here

#Make the mask, i.e. preconsensus.fasta for each coverage
artic_mask ~/artic-ncov2019/primer_schemes/nCoV-2019/V3/nCoV-2019.reference.fasta sample_${dir%/}.coverage_mask_1X.txt sample_${dir%/}.fail.vcf sample_${dir%/}.preconsensus_1X.fasta
artic_mask ~/artic-ncov2019/primer_schemes/nCoV-2019/V3/nCoV-2019.reference.fasta sample_${dir%/}.coverage_mask_1X.txt sample_${dir%/}.fail.vcf sample_${dir%/}.preconsensus_2X.fasta
artic_mask ~/artic-ncov2019/primer_schemes/nCoV-2019/V3/nCoV-2019.reference.fasta sample_${dir%/}.coverage_mask_5X.txt sample_${dir%/}.fail.vcf sample_${dir%/}.preconsensus_5X.fasta

echo "Finished making preconsensus"

#Make the consensus FASTA
bcftools consensus -f sample_${dir%/}.preconsensus_1X.fasta sample_${dir%/}.pass.vcf.gz -m sample_${dir%/}.coverage_mask_1X.txt -o sample_${dir%/}.consensus_1X.fasta
bcftools consensus -f sample_${dir%/}.preconsensus_2X.fasta sample_${dir%/}.pass.vcf.gz -m sample_${dir%/}.coverage_mask_2X.txt -o sample_${dir%/}.consensus_2X.fasta
bcftools consensus -f sample_${dir%/}.preconsensus_2X.fasta sample_${dir%/}.pass.vcf.gz -m sample_${dir%/}.coverage_mask_5X.txt -o sample_${dir%/}.consensus_5X.fasta

echo "Finished generating consensus files"

#Relabel FASTA headers
artic_fasta_header sample_${dir%/}.consensus_1X.fasta "sample_${dir%/}/ARTIC/nanopolish_1X"
artic_fasta_header sample_${dir%/}.consensus_2X.fasta "sample_${dir%/}/ARTIC/nanopolish_2X"
artic_fasta_header sample_${dir%/}.consensus_5X.fasta "sample_${dir%/}/ARTIC/nanopolish_5X"

echo "Consensus files for minimum 1X, 2X, and 5X coverage done for $dir files"

#Now need to get stats from each of those files and the original 20X file:
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' sample_${dir%/}.consensus_1X.fasta | tail -n +2 | grep "^>" -v |  awk -F 'N' '{print NF-1"," "1X"}' >> $1/n_bases.dat
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' sample_${dir%/}.consensus_2X.fasta | tail -n +2 | grep "^>" -v |  awk -F 'N' '{print NF-1"," "2X"}' >> $1/n_bases.dat
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' sample_${dir%/}.consensus_5X.fasta | tail -n +2 | grep "^>" -v |  awk -F 'N' '{print NF-1"," "5X"}' >> $1/n_bases.dat
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' sample_${dir%/}.consensus.fasta | tail -n +2 | grep "^>" -v |  awk -F 'N' '{print NF-1"," "20X"}' >> $1/n_bases.dat

echo "Output number of N bases for different coverages to file"

#Output the run_sample labels
    for consensus_coverage in *.consensus*.fasta
    do
      echo $2"_"${dir%/} >> $1/run_sample.dat
    done

fi

echo "Finished running pipeline on sample with $dir files"

#Moving back up one level in directory
cd ..

done

cd $1
paste -d "," run_sample.dat n_bases.dat >> uncalled_bases_$2.csv

echo "Script complete for $2 files"
