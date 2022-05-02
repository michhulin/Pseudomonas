#!/bin/bash

#SBATCH -p tsl-short
#SBATCH --mem=1G
#SBATCH -c 1
#SBATCH --time=0-01:00:00
#SBATCH -J sub_tbla
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

Usage='sub_tblastn.sh <input fasta> <query> <outdir>'

source blast+-2.9.0
source python-2.7.10

i=$1
q=$2
d=$3
o=$4
name=$(basename $i | sed s/".fna"//g | cut -f1 -d ".")
query=$(basename $q | sed s/".fasta"//g)

makeblastdb  -in $i  -dbtype nucl -out /tmp/"$name".db

tblastn -db /tmp/"$name".db -query $q -out $d/"$name"_"$query".hits.txt -outfmt '6 qseqid sseqid qlen length sstart send evalue pident sseq sframe '
python  /tsl/scratch/hulin/scripts/edit_tblastn.py  $d/"$name"_"$query".hits.txt $d/"$name"_"$query".hits.txt2

cat $d/"$name"_"$query".hits.txt2 >> $o/"$name".hits.txt
