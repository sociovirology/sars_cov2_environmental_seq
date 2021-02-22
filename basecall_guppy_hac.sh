#!/bin/bash

# Script: basecall_guppy_hac.sh
# This file is shell script that takes the raw FAST5 files from the MinION sequencing run and conducts high accuracy basecalling with the Guppy application from Oxford Nanopore Technologies

#Output for FAST5 files was in 5 folders corresponding to 5 MinION runs
#ncov_ucdh_env1_run1
#ncov_ucdh_env1_run2
#ncov_ucdh_env1_run3
#ncov_ucdh_env1_run4
#ncov_ucdh_env1_run5

#Will save HAC basecalled files in the same consistent location: RUN_FILES_LOCATION/fastq_hac

##Run 1 files are located locally here:
cd data/ncov_ucdh_env1_run1/ncov_ucdh_env1_run1/20200523_0732_MN23913_FAN33832_25240491
mkdir fastq_hac
#Command for HAC basecalling with Guppy
#Using all available GPUs and 8 callers, NOTE: May need to adjust depending on your configuration
guppy_basecaller --input_path data/ncov_ucdh_env1_run1/ncov_ucdh_env1_run1/20200523_0732_MN23913_FAN33832_25240491/ --save_path data/ncov_ucdh_env1_run1/ncov_ucdh_env1_run1/20200523_0732_MN23913_FAN33832_25240491/fastq_hac --config dna_r9.4.1_450bps_hac.cfg -r -x cuda:all:100% --num_callers 8

/share/munozlab/ont-guppy/bin/guppy_basecaller --input_path /share/munozlab/data/sars_cov2_hdt/fast5_pass --save_path /share/munozlab/sars_cov2_hdt/ncov_ucdh_env1_run6 --config dna_r9.4.1_450bps_hac.cfg -x cuda:all:100% --num_callers 8 

##Run 2 files are located locally here:
cd data/ncov_ucdh_env1_run2/ncov_ucdh_env1_run2/20200703_0834_MN23913_FAN33832_a6c81382
mkdir fastq_hac
#Command for HAC basecalling with Guppy
#Using all available GPUs and 8 callers, NOTE: May need to adjust depending on your configuration
guppy_basecaller --input_path data/ncov_ucdh_env1_run2/ncov_ucdh_env1_run2/20200703_0834_MN23913_FAN33832_a6c81382/ --save_path data/ncov_ucdh_env1_run2/ncov_ucdh_env1_run2/20200703_0834_MN23913_FAN33832_a6c81382/fastq_hac --config dna_r9.4.1_450bps_hac.cfg -r -x cuda:all:100% --num_callers 8

##Run 3 files are located locally here:
cd data/ncov_ucdh_env1_run3/ncov_ucdh_env1_run3/20200921_2146_MN23913_FAN19575_5aa17f3a
mkdir fastq_hac
#Command for HAC basecalling with Guppy
#Using all available GPUs and 8 callers, NOTE: May need to adjust depending on your configuration
guppy_basecaller --input_path data/ncov_ucdh_env1_run3/ncov_ucdh_env1_run3/20200921_2146_MN23913_FAN19575_5aa17f3a/ --save_path data/ncov_ucdh_env1_run3/ncov_ucdh_env1_run3/20200921_2146_MN23913_FAN19575_5aa17f3a/fastq_hac/ --config dna_r9.4.1_450bps_hac.cfg -r -x cuda:all:100% --num_callers 8

##Run 4 files are located locally here:
cd data/ncov_ucdh_env1_run4/ncov_ucdh_env1_run4/20201007_2255_MN23913_ABE356_3ac92cc2
mkdir fastq_hac
#Command for HAC basecalling with Guppy
#Using all available GPUs and 8 callers, NOTE: May need to adjust depending on your configuration
guppy_basecaller --input_path data/ncov_ucdh_env1_run4/ncov_ucdh_env1_run4/20201007_2255_MN23913_ABE356_3ac92cc2/ --save_path data/ncov_ucdh_env1_run4/ncov_ucdh_env1_run4/20201007_2255_MN23913_ABE356_3ac92cc2/fastq_hac/ --config dna_r9.4.1_450bps_hac.cfg -r -x cuda:all:100% --num_callers 8

##Run 5 files are located locally here:
cd data/ncov_ucdh_env1_run5/ncov_ucdh_env1_run5/20201023_2228_MN23913_FAL36961_2bb8ba89
mkdir fastq_hac
#Command for HAC basecalling with Guppy
#Using all available GPUs and 8 callers, NOTE: May need to adjust depending on your configuration
#Note Run 5 was run on a R10 flow cell, so the config file changes
guppy_basecaller --input_path data/ncov_ucdh_env1_run5/ncov_ucdh_env1_run5/20201023_2228_MN23913_FAL36961_2bb8ba89/ --save_path data/ncov_ucdh_env1_run5/ncov_ucdh_env1_run5/20201023_2228_MN23913_FAL36961_2bb8ba89/fastq_hac/ --config dna_r10_450bps_hac.cfg -r -x cuda:all:100% --num_callers 8
