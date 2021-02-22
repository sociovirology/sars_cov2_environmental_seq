#!/bin/bash

# Script: filter_pipeline.sh
# This file is shell script that takes scripts that are specific to each run, and puts them in the right location in each of the directories with demultiplexed files 
#I know this is not the most elegant coding... :/

#Make files executable
chmod +x filter_pipeline_run*.sh

mv filter_pipeline_run1.sh run_pipeline_outputs/ncov_ucdh_env1_run1/
mv filter_pipeline_run2.sh run_pipeline_outputs/ncov_ucdh_env1_run2/
mv filter_pipeline_run3.sh run_pipeline_outputs/ncov_ucdh_env1_run3/
mv filter_pipeline_run4.sh run_pipeline_outputs/ncov_ucdh_env1_run4/
mv filter_pipeline_run5.sh run_pipeline_outputs/ncov_ucdh_env1_run5/

#Now run each command for each respective directory, using the run-specific script
#Important to move into each run directory, because the script takes the user's current directory location 

#Move into the directory containing the runs
cd run_pipeline_outputs/

#Start looping through run directories, i.e. ncov_ucdh_env1_run*/
for dir in */; 
do 

echo "$dir"
echo "${dir%/}"

cd ${dir}/
pwd
echo "Moving to $dir folder"

echo "Starting ARTIC Filter and Minion Pipeline:"
./filter_pipeline_run*.sh

echo "Finished running pipeline on sample with $dir files"

#Moving back up one level in directory
cd ..

done

