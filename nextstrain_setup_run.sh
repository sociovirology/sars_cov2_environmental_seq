#!/bin/bash

# Script: nextstrain_setup_run.sh
# This file is shell script that sets up the NextStrain environment, runs the test NextStrain build, and then copies files for a custom build used to generate images in the paper  

#Following the guidelines from the NextStrain site
# https://nextstrain.github.io/ncov/

#Clone the NextStrain ncov and setup environment 
git clone https://github.com/nextstrain/ncov.git

#Change into directory
cd ncov

#If NextStrain has not been installed, will need to follow these steps
#Download conda environment setup
curl http://data.nextstrain.org/nextstrain.yml --compressed -o nextstrain.yml
conda env create -f nextstrain.yml
conda activate nextstrain

#Install auspice (for visualization of results)
npm install --global auspice #npm is a JavaScript pacakage manager

#Unzip the sample data set
gzip -d -c data/example_sequences.fasta.gz > data/example_sequences.fasta

#Run the snakemake pipeline for the example
snakemake --cores 4 --profile ./my_profiles/getting_started

#Running the example serves as a check that all is installed and running properly
#Drag-and-drop the file from ./auspice/sarscov2_global.json onto the page at https://auspice.us.
#To visualize results, point web-browser to https://auspice.us/ and drag-and-drop ./auspice/sarscov2_global.json onto the page

#Now will copy the build an other the files to replicate the images included in the paper. Details on the code for generating these files is in the coding notebook (ncov_ucdh_env.Rmd, Line 1113).

#Copy profile for UCDMC-focused build used to generate images in the paper:
cd ..

cp -R data/nextstrain/ucdmc_ca  ncov/my_profiles/

#Copy (and replace) the default include file
cp data/nextstrain/include.txt ncov/defaults/include.txt

#Copy FASTA data and metadata
cp data/nextstrain/first_try_samples* ncov/data/ 

#Run pipeline with the build/profile "ucdmc_ca"
cd ncov
snakemake --cores 8 --profile my_profiles/ucdmc_ca -p

#Copy paste file ncov/auspice/ncov_north-america_usa_ca_sacramento.json into https://auspice.us/
