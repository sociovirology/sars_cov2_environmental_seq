#!/bin/bash -l
# NOTE the -l flag!

# If you need any help, please email help@cse.ucdavis.edu

# This line tells the shell how to execute this script, and is unrelated
# to SLURM.

# at the beginning of the script, lines beginning with "#SBATCH" are read by
# SLURM and used to set queueing options. You can comment out a SBATCH
# directive with a second leading #, eg:
##SBATCH --nodes=1

# we need 1 node, will launch a maximum of one task. The task uses 2 CPU cores
##SBATCH --nodes=1
##SBATCH --ntasks-per-node=1
##SBATCH --cpus-per-task=8

# we expect the job to finish within 1 hours. If it takes longer than 1
# hours, SLURM can kill it:
##SBATCH --time=24:00:00

# we expect the job to use no more than 4GB of memory:
##SBATCH --mem=60GB

# we want the job to be named "myMatlabTest" rather than something generated
# from the script name. This will affect the name of the job as reported
# by squeue:
#SBATCH --job-name=ucdmc_ca

# both standard output and standard error are directed to the same file.
# It will be placed in the directory I submitted the job from and will
# have a name like slurm_12345.out
#SBATCH --output=slurm_%j.out

# when the job ends, send me an email at this email address.
# replace with your email address, and uncomment that line if you really need to receive an email.
##SBATCH --mail-type=END
##SBATCH --mail-user=samdiazmunoz@ucdavis.edu

# once the first non-comment, non-SBATCH-directive line is encountered, SLURM
# stops looking for SBATCH directives. The remainder of the script is  executed
# as a normal Unix shell script

# first we ensure a clean running environment:
module purge
# and load the module for the software we are using:
#module load

#Load conda environment
conda activate nextstrain

# the script will have started running in $HOME, so we need to move into the
# directory we just created earlier
cd ~/sars_cov2_environmental_seq/ncov
pwd

# now start the job: this makes the build we specified
snakemake --cores 8 --profile my_profiles/ucdmc_ca -p

# Leave a few empty lines in the end to avoid occasional EOF trouble.
