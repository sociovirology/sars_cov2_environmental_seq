#!/bin/bash

# Script: low_coverage_read_information.sh
# This is a "driver" script that runs scripts low_coverage_consensus.sh and read_count_information.sh for each run sub-directory in run_pipeline_outputs/ncov_ucdh_env1_run*/
#I know this is not the most elegant coding... :/

#Make files executable
chmod +x low_coverage_consensus.sh
chmod +x read_count_information.sh

#First we run low_coverage_consensus.sh for each subdirectory. Note that low_coverage_consensus.sh needs two command line arguments, but can be run from the main directory (sars_cov2_environmental_seq)

#Run sequentially through the command for each run

echo "About to start generating low coverage consensus for each run:"
#Run 1
./low_coverage_consensus.sh run_pipeline_outputs/ncov_ucdh_env1_run1 run1
echo "Generated low coverage consensus sequences for Run 1"
#Run 2
./low_coverage_consensus.sh run_pipeline_outputs/ncov_ucdh_env1_run2 run2
echo "Generated low coverage consensus sequences for Run 2"
#Run 3
./low_coverage_consensus.sh run_pipeline_outputs/ncov_ucdh_env1_run3 run3
echo "Generated low coverage consensus sequences for Run 3"
#Run 4
./low_coverage_consensus.sh run_pipeline_outputs/ncov_ucdh_env1_run4 run4
echo "Generated low coverage consensus sequences for Run 4"
#Run 5
./low_coverage_consensus.sh run_pipeline_outputs/ncov_ucdh_env1_run5 run5
echo "Generated low coverage consensus sequences for Run 4"


#First we run read_count_information.sh for each subdirectory. Note that read_count_information.sh (like low_coverage_consensus.sh) needs two command line arguments, but can be run from the main directory (sars_cov2_environmental_seq)
echo "Now moving to generating read count information for each run, for downstream analyses in R:"

#Run 1
./read_count_information.sh run_pipeline_outputs/ncov_ucdh_env1_run1 run1
echo "Generated read count information for Run 1"
#Run 2
./read_count_information.sh run_pipeline_outputs/ncov_ucdh_env1_run2 run2
echo "Generated read count information for Run 2"
#Run 3
./read_count_information.sh run_pipeline_outputs/ncov_ucdh_env1_run3 run3
echo "Generated read count information for Run 3"
#Run 4
./read_count_information.sh run_pipeline_outputs/ncov_ucdh_env1_run4 run4
echo "Generated read count information for Run 4"
#Run 5
./read_count_information.sh run_pipeline_outputs/ncov_ucdh_env1_run5 run5
echo "Generated read count information for Run 5"

echo "All done :)"
