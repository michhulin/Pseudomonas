#!/bin/bash

#SBATCH -p tsl-short
#SBATCH --mem=1G
#SBATCH -c 1
#SBATCH --time=0-01:00:00
#SBATCH -J exthit
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

Usage='exthit.sh <input hhr>'

source blast+-2.9.0
source python-2.7.10

i=$1
file_name=$(basename $i | sed s/".hhr"//g)

sed s/"--"/"-"/g $i | grep -A1 ">" | tr -d '\n' | sed s/"--"/"\n"/g | sed s/"Probab="/"\t"Probab=/g > "$file_name"_o
cut -f1 "$file_name"_o > "$file_name"_o2
cut -f2,3,4,5,6,7,8 "$file_name"_o > "$file_name"_o3
sed s/"Probab"/"|Probab"/g "$file_name"_o3 | sed s/"  "/"|"/g > "$file_name"_o4
tail -n +10 $i | awk -v RS= 'NR==1' > "$file_name"_e
rev "$file_name"_e | sed s/")"/"\s"/g | sed 's/[[:blank:]]\+/|/g' | cut -f3 -d "|" | rev | sed s/"-"/"|"/g > "$file_name"_e2
awk '{print "|" $0}' "$file_name"_e2 > "$file_name"_e3
paste "$file_name"_o2 "$file_name"_o4 "$file_name"_e3 > "$file_name"_out
sed s/";"/" "/g "$file_name"_out | sed s/"|"/";"/g > "$file_name"_out2
sed s/"Probab="//g "$file_name"_out2 > "$file_name"_out3


