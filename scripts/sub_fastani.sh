#!/bin/bash

#SBATCH -p tsl-long
#SBATCH --mem=10G
#SBATCH -c 10
#SBATCH --time=14-0:00:00
#SBATCH -J sub_FASTANI
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

source conda-3.7

Usage='sub_fastani.sh <input fasta> <outdir>'

i=$1
r=$2
o=$3

fastANI --ql $i --rl $r -o $o 
