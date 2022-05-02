#!/bin/bash

#SBATCH -p tsl-short
#SBATCH --mem=1G
#SBATCH -c 1
#SBATCH -J sub_hmm
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

Usage='sub_hmm.sh <hmm profile><input faa> <output>'

source hmmer-3.2b2

q=$1
i=$2
o=$3

hmmsearch -E 0.001 -o $o --pfamtblout $o.tab $q $i


