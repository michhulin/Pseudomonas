#!/bin/bash

#SBATCH -p tsl-long
#SBATCH --mem 1g
#SBATCH -c 1
#SBATCH --time=10-00:00:00
#SBATCH -J sub_edit_info
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

source python-2.7.10

Usage='edit_info.sh <input f> <output file>'

i=$1
o=$2

python /tsl/scratch/hulin/scripts/edit_info_file_reverse2.py $i > $o
