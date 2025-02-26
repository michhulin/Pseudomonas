#!/bin/bash

#SBATCH --mem=1G
#SBATCH -c 1
#SBATCH --time=07-00:00:00
#SBATCH -J sub_clustal
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

module purge
module load Conda/3
conda activate clustalw

Usage='sub_clustal.sh <infile>'

i=$1


clustalw2  -infile=$i -OUTPUT=FASTA 
#-OUTORDER=INPUT
