#!/bin/bash

#SBATCH -p tsl-long
#SBATCH --mem 1g
#SBATCH --time=10-00:00:00
#SBATCH -J sub_checkM
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

source conda-3.7

infile=$1
outdir=$2
$outfile=$3

checkm qa $infile $outdir > $outfile 
