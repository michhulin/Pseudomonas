#!/bin/bash

#SBATCH -p tsl-long
#SBATCH --mem=30G
#SBATCH -c 1
#SBATCH -J sub_clustal
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

Usage='sub_clustal.sh <infile>'
source clustalw-2.1

i=$1


clustalw2  -infile=$i 



