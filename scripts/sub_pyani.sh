#!/bin/bash

#SBATCH -p tsl-long
#SBATCH --mem=30G
#SBATCH -c 4
#SBATCH --time=14-0:00:00
#SBATCH -J sub_pyani
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

source conda-3.7

Usage='sub_pyani.sh <input fasta> <outdir>'

i=$1
o=$2

average_nucleotide_identity.py -i $i -o $o -m ANIm -g 


