#!/usr/bin/env bash

#SBATCH -p tsl-long
#SBATCH --mem 10g
#SBATCH --time=10-00:00:00
#SBATCH --mail-type=begin,end,fail
#SBATCH --mail-user=michelle.hulin@tsl.ac.uk
#SBATCH -J sub_iqtree
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

source conda-3.7

Usage='sub_iqtree.sh <phylip alignment file> <partition file> <outgroup name>'

i=$1
o=$2

iqtree2 -s $i  -bb 1000 -m JTT+I+G -o $o -wbtl -safe 


