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

Usage='hhcon.sh <input a3m> <output con a3m>'


source hhsuite-3.3.0

i=$1
o=$2

hhconsensus -i $i -oa3m $o
