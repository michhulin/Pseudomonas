#!/bin/bash

#SBATCH -p tsl-long
#SBATCH --mem 1g
#SBATCH -c 1
#SBATCH --time=10-00:00:00
#SBATCH -J sub_ext_seq
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

source python-2.7.10

Usage='extract_seq.sh <input fasta> <locations> <output file>'

i=$1
l=$2
o=$3
python /tsl/scratch/hulin/scripts/extract_seq3.py $i $l > $o 
