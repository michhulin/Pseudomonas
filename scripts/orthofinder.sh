#!/bin/bash

#SBATCH -p tsl-long
#SBATCH --mem 80g
#SBATCH --time=10-00:00:00
#SBATCH --mail-type=begin,end,fail
#SBATCH --mail-user=michelle.hulin@tsl.ac.uk
#SBATCH -J sub_ortho
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

source orthofinder-2.3.7 
source conda-3.7

dir=$1

orthofinder -f $dir -t 64  -S diamond

