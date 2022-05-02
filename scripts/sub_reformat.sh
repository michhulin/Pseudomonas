#!/bin/bash

#SBATCH -p tsl-long
#SBATCH --mem=1G
#SBATCH -c 1
#SBATCH -J sub_reformat
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

Usage='sub_refor.sh <infile>'
source hhsuite-3.3.0

i=$1
o=$2

reformat.pl $i $o


