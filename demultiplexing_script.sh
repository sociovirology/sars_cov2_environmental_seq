#!/bin/bash

# Script: demultiplexing_script.sh
# Just strings together all the demultiplexing commands
# Reads will be exported to a folder for each run: run_pipeline_outputs/ncov_ucdh_env1_run*

echo "Starting demultiplexing script"

#Make a directories to hold the outputs
mkdir -p run_pipeline_outputs/ncov_ucdh_env1_run{1..5}

#Demultiplex Run 1
guppy_barcoder --require_barcodes_both_ends -i data/ncov_ucdh_env1_run1/ncov_ucdh_env1_run1/20200523_0732_MN23913_FAN33832_25240491/fastq_hac -s run_pipeline_outputs/ncov_ucdh_env1_run1 "barcode_arrs_nb12.cfg barcode_arrs_nb24.cfg"

echo "Done with Demultiplexing Run 1"

guppy_barcoder --require_barcodes_both_ends -i data/ncov_ucdh_env1_run2/ncov_ucdh_env1_run2/20200703_0834_MN23913_FAN33832_a6c81382/fastq_hac -s run_pipeline_outputs/ncov_ucdh_env1_run2 "barcode_arrs_nb12.cfg barcode_arrs_nb24.cfg"

echo "Done with Demultiplexing Run 2"

guppy_barcoder --require_barcodes_both_ends -i data/ncov_ucdh_env1_run3/ncov_ucdh_env1_run3/20200921_2146_MN23913_FAN19575_5aa17f3a/fastq_hac -s run_pipeline_outputs/ncov_ucdh_env1_run3 "barcode_arrs_nb12.cfg barcode_arrs_nb24.cfg"

echo "Done with Demultiplexing Run 3"

guppy_barcoder --require_barcodes_both_ends -i data/ncov_ucdh_env1_run4/ncov_ucdh_env1_run4/20201007_2255_MN23913_ABE356_3ac92cc2/fastq_hac -s run_pipeline_outputs/ncov_ucdh_env1_run4 "barcode_arrs_nb12.cfg barcode_arrs_nb24.cfg"

echo "Done with Demultiplexing Run 4"

guppy_barcoder --require_barcodes_both_ends -i data/ncov_ucdh_env1_run5/ncov_ucdh_env1_run5/20201023_2228_MN23913_FAL36961_2bb8ba89/fastq_hac -s run_pipeline_outputs/ncov_ucdh_env1_run5 "barcode_arrs_nb12.cfg barcode_arrs_nb24.cfg"

echo "Done with Demultiplexing Run 5"

echo "Done with Demultiplexing!"

done
