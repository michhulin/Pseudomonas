#!/usr/bin/env bash

#SBATCH --mem 100g
#SBATCH -J sub_frm
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err




Usage='sub_frtmalign.sh <input pdb> <ref pdb> <outdir>'


i=$1
ref=$2
d=$3

# Define variables
fs=$(basename $i | sed s/".pdb"//g)
echo $fs
rs=$(basename $ref | sed s/".pdb"//g)
echo $rs



# Run program 
/mnt/home/hulinmic/prog/frtmalign/frtmalign.exe $i $ref -o "$fs"_"$rs"_aligned



# Processing to get TM-score and aligned residues into files 
grep "TM-score"  "$fs"_"$rs"_aligned > $d/"$fs"_"$rs"_TMscore
csplit -z "$fs"_"$rs"_aligned /TER/ '{*}' -f "$fs"_"$rs"
grep ATOM "$fs"_"$rs"00 > "$fs"_"$rs"00-1
sed -i s/"CA"/"1CA"/g "$fs"_"$rs"00-1
grep ATOM "$fs"_"$rs"01 > "$fs"_"$rs"01-1
paste "$fs"_"$rs"00-1 "$fs"_"$rs"01-1 > $d/"$fs"_"$rs"_aligned_residues
