#!/bin/bash

#SBATCH -p tsl-short
#SBATCH -c 1
#SBATCH --requeue
#SBATCH --time=0-01:00:00
#SBATCH -J sub_sortfa

Usage='sub_sortfa.sh <input fasta> <sorted fasta>'

source seqkit-0.15.0

i=$1
o=$2

seqkit sort --by-length --reverse $i > $o
