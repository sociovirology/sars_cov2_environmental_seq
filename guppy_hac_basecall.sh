#!/bin/bash

# Script: filter_pipeline.sh
# This file is shell script that takes the raw FAST5 files from the MinION sequencing run and conducts high accuracy basecalling with the Guppy application from Oxford Nanopore Technologies

#Output for FAST5 files was in 5 folders corresponding to 5 runs
#ncov_ucdh_env1_run1
#ncov_ucdh_env1_run2
#ncov_ucdh_env1_run3
#ncov_ucdh_env1_run4
#ncov_ucdh_env1_run5

#Will save HAC basecalled files in the same consistent location: RUN_FILES_LOCATION/fastq_hac

#Run 5

