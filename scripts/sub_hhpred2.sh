#!/bin/bash

#SBATCH -p tsl-long
#SBATCH --constraint="intel"
#SBATCH --mem=20G
#SBATCH -c 1
#SBATCH --requeue
#SBATCH --time=0-01:00:00
#SBATCH -J sub_hhpred
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

Usage='sub_hhpred.sh <input fasta> <output>'


source hhsuite-3.3.0

i=$1
o=$2

/tsl/software/testing/hhsuite/3.3.0/x86_64/bin/bin/hhsearch  -d /tsl/data/externalData/maw/MH/pdb/pdb70 -i $i -cpu 64 -cons > $o

