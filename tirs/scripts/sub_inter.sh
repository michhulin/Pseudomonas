#!/bin/bash --login

#SBATCH --mem 50g
#SBATCH --time=01-00:00:00
#SBATCH -J sub_inter
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err
#SBATCH -c 32

module purge
module load InterProScan

i=$1

Usage='srun  interproscan.sh -i <fasta> -f tsv -dp'

srun  interproscan.sh -i $i -f tsv -dp
