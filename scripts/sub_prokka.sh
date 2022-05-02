#!/bin/bash

#SBATCH -p tsl-short
#SBATCH --mem=1G
#SBATCH -c 1
#SBATCH -J sub_prok
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

Usage='sub_prokka.sh <input fasta>'

source conda-3.7

i=$1
o=$2

prokka  $i --outdir $o



