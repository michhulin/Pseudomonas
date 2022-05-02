#!/bin/bash

#SBATCH -p tsl-long
#SBATCH --mem 10g
#SBATCH -c 1
#SBATCH --time=10-00:00:00
#SBATCH -J vina
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

Usage='vina.sh <input pdbqt> <config> <output dir> <ligand directory>'

f=$1
c=$2
d=$3
ligd=$4

singularity exec --overlay /tsl/scratch/hulin/pseudomonas/analysis/autodock/ad_overlay.img /tsl/scratch/hulin/pseudomonas/analysis/autodock/autodock.img vina --receptor $f --batch $ligd/23camp.pdbqt  $ligd/ADPR.pdbqt  $ligd/camp.pdbqt  $ligd/coA.pdbqt $ligd/GDP.pdbqt  $ligd/NADH.pdbqt  $ligd/NADPH.pdbqt $ligd/23cgmp.pdbqt $ligd/Ap4A.pdbqt  $ligd/cgmp.pdbqt  $ligd/FAD.pdbqt  $ligd/GTP.pdbqt $ligd/NAD.pdbqt   $ligd/NADP.pdbqt $ligd/atp.pdbqt   --config $c  --exhaustiveness=32 --dir $d

