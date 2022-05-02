#!/bin/bash

#SBATCH -p tsl-short
#SBATCH --mem=1G
#SBATCH -c 1
#SBATCH -J sub_sam
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

Usage='sub_hmm.sh <input faa> <ID> <out>'

fa=$1
i=$2
o=$3

source samtools-1.9

for file in $(cat $i) ; do 

samtools faidx $fa $file >> $o

done




