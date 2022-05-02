#!/bin/bash

#SBATCH -p tsl-short
#SBATCH --mem=1G
#SBATCH -c 1
#SBATCH --mail-type=begin,end,fail
#SBATCH --mail-user=michelle.hulin@tsl.ac.uk
#SBATCH -J date_job
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

source conda-3.7

srun date_job

i=$1
o=$2


#Filtering of adapters and bad quality reads with fastp program (Chen 2018)

fastp -i $i -o $o


