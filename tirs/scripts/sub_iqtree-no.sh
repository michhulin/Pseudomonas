#!/usr/bin/env bash

#SBATCH --mem 10g
#SBATCH --time=07-00:00:00
#SBATCH -J sub_iqtree
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

module purge
module load Conda/3
conda activate iqtree

Usage='sub_iqtree.sh <phylip alignment file> <partition file> <outgroup name>'

i=$1

iqtree2 -s $i  -bb 1000 -m TEST  -wbtl -safe 
