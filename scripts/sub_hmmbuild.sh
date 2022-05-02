#!/bin/bash

#SBATCH -p tsl-short
#SBATCH --mem=1G
#SBATCH -c 1
#SBATCH --mail-type=begin,end,fail
#SBATCH --mail-user=michelle.hulin@tsl.ac.uk
#SBATCH -J sub_hmm
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

Usage='sub_hmm.sh <infile>'
source hmmer-3.2b2

i=$1

hmmbuild $i.hmm $i 


