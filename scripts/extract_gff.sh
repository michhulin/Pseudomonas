#!/bin/bash

#SBATCH -p tsl-long
#SBATCH --mem 1g
#SBATCH -c 1
#SBATCH --time=10-00:00:00
#SBATCH -J sub_ext_seq
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

Usage='extract_gff.sh <input fasta> <output file>'

i=$1
o=$2
f=$3
r=$4

for pegfile in $(cat "$i"); do
GENOME=$(echo $pegfile | cut -f1 -d "|")
peg=$(echo $pegfile | cut -f2 -d "|" | sed s/"peg."/_/g) 
echo $GENOME
echo $peg    

printf $GENOME"\t" >> $o
grep ID=[A-Z][A-Z][A-Z][A-Z][A-Z][A-Z][A-Z][A-Z]"$peg" /tsl/scratch/hulin/pseudomonas/annotation/"$GENOME"/*gff  >> $o
done
awk '{print $1,$10,$2,$5,$6,$8}' $o | grep "+" | sed s/"\s"/"\t"/g > "$f" 
awk '{print $1,$10,$2,$5,$6,$8}' $o | grep -v "+" | sed s/"\s"/"\t"/g > "$r"

