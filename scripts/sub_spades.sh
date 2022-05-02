#!/bin/bash

#SBATCH -p tsl-short
#SBATCH --mem=1G
#SBATCH -c 1
#SBATCH --mail-type=begin,end,fail
#SBATCH --mail-user=michelle.hulin@tsl.ac.uk
#SBATCH -J sub_spades
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

source python-2.7.10
source spades-3.7.1



i=$1
o=$2


#Filtering of adapters and bad quality reads with fastp program (Chen 2018)


spades.py --s1 $i    -o  $o

