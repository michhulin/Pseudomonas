#!/bin/bash

#SBATCH -p tsl-long
#SBATCH --mem=1G
#SBATCH -c 1
#SBATCH --time=0-01:00:00
#SBATCH -J sub_ext
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

Usage='sub_tblastn.sh <input genome fasta> <query bed> <output>'

source python-2.7.10

g=$1
b=$2
o=$3

python /tsl/scratch/hulin/scripts/extract_seq_from_gen.py $g $b >> $o
