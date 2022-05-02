#!/bin/bash

#SBATCH -p tsl-long
#SBATCH --mem=1G
#SBATCH -c 1
#SBATCH --time=1-00:00:00
#SBATCH -J sub_bla
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

Usage='sub_blasp.sh <input fasta> <query> <outdir>'

source blast+-2.9.0
source python-2.7.10

i=$1
q=$2

name=$(basename $i | sed s/".fas"//g | cut -f1 -d ".")
query=$(basename $q | sed s/".fasta"//g)

makeblastdb  -in $i  -dbtype prot -out "$name".db

blastp -db "$name".db -query $q -out "$name"_"$query".hits.txt -outfmt '6 qseqid sseqid qlen length sstart send evalue pident sseq sframe '
