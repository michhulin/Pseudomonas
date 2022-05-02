#!/bin/bash

#SBATCH -p tsl-long
#SBATCH --mem 1g
#SBATCH -c 1
#SBATCH --time=10-00:00:00
#SBATCH -J ext_prom
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

Usage='ext_prom.sh <input GFF> <promoters fasta> <output fasta>'

i=$1
f=$2
o=$3
for file in $(cat $i) ; do
grep -A1 $file $f >> $o
done
