#!/bin/bash

#SBATCH -p tsl-short
#SBATCH --constraint="intel"
#SBATCH --mem=10G
#SBATCH -c 1
#SBATCH --requeue
#SBATCH --time=0-01:00:00
#SBATCH -J addss
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

Usage='addss.sh <input a2m> <output a3m>'


source hhsuite-3.3.0

i=$1
o=$2

perl /tsl/software/testing/hhsuite/3.3.0/x86_64/bin/scripts/addss4.pl $i $o
