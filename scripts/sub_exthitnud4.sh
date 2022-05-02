#!/bin/bash

#SBATCH -p tsl-long
#SBATCH --mem=1G
#SBATCH -c 1
#SBATCH --time=0-10:00:00
#SBATCH -J exthit
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

Usage='exthit.sh <input hhr>'

source blast+-2.9.0
source python-2.7.10

i=$1
file_name=$(basename $i | sed s/".hhr"//g)
sed s/"1("/"1 ("/g $i | sed s/"2("/"2 ("/g | sed s/"3("/"3 ("/g | sed s/"4("/"4 ("/g | sed s/"5("/"5 ("/g | sed s/"6("/"6 ("/g | sed s/"7("/"7 ("/g | sed s/"8("/"8 ("/g | sed s/"9("/"9 ("/g | sed s/"0("/"0 ("/g > "$file_name"_o1
sed s/"-----"/"-"/g  "$file_name"_o1   | sed s/"----"/"-"/g | sed s/"---"/"-"/g | sed s/"--"/"-"/g | grep -A1 ">" | tr -d '\n' | sed s/"--"/"\n"/g | sed s/"Probab="/"\t"Probab=/g > "$file_name"_o

#sed s/"--"/"-"/g "$file_name"_o1 | grep -A1 ">" | tr -d '\n' | sed s/"--"/"\n"/g | sed s/"Probab="/"\t"Probab=/g > "$file_name"_o
cut -f1 "$file_name"_o > "$file_name"_o2
cut -f2,3,4,5,6,7,8 "$file_name"_o > "$file_name"_o3
sed s/"Probab"/"|Probab"/g "$file_name"_o3 | sed s/"  "/"|"/g > "$file_name"_o4

sed  '/^$/d' "$file_name"_o1 | tail -n +9 | awk -v RS= 'NR==1' > "$file_name"_e
rev "$file_name"_e | sed s/")"/"\s"/g | sed 's/[[:blank:]]\+/|/g' | cut -f3 -d "|" | rev | sed s/"-"/"|"/g > "$file_name"_e2
sed 's/^/ /' "$file_name"_e | sed s/")"/"\s"/g | sed 's/[[:blank:]]\+/|/g' | cut -f2 -d "|" | sed s/"-"/"|"/g > "$file_name"_e4
awk '{print "|" $0}' "$file_name"_e2 > "$file_name"_e3
awk '{print "|" $0}' "$file_name"_e4 > "$file_name"_e5
paste "$file_name"_o2 "$file_name"_o4 "$file_name"_e3 "$file_name"_e5 > "$file_name"_out
sed s/";"/" "/g "$file_name"_out | sed s/"|"/";"/g > "$file_name"_out2
sed s/"Probab="//g "$file_name"_out2 > "$file_name"_out3

rm "$file_name"_o
rm "$file_name"_o2
rm "$file_name"_o3
rm "$file_name"_o4
rm "$file_name"_e
rm "$file_name"_e2
rm "$file_name"_e3
rm "$file_name"_e4
rm "$file_name"_e5
rm "$file_name"_out

rm "$file_name"_out2
grep -iF " Toll" "$file_name"_out3 >> "$file_name"_a

grep -F  " TIR" "$file_name"_out3 >> "$file_name"_a
grep -F TIR-like "$file_name"_out3 >> "$file_name"_a
grep -iF " Sirtuin"  "$file_name"_out3 >> "$file_name"_a
grep -iF " Sefir"  "$file_name"_out3 >> "$file_name"_a
grep -iF sir2  "$file_name"_out3 >> "$file_name"_a
grep -F "NAD+" "$file_name"_out3 >> "$file_name"_a
grep -iF Interleukin  "$file_name"_out3 >> "$file_name"_a
grep -iF Nucleosidase  "$file_name"_out3 >> "$file_name"_a
grep -iF ribohydrolase "$file_name"_out3 >> "$file_name"_a
grep -iF Phosphohydrolase  "$file_name"_out3 >> "$file_name"_a
grep -iF phosphodiesterase  "$file_name"_out3 >> "$file_name"_a
grep -iF Glycohydrolase  "$file_name"_out3 >> "$file_name"_a
grep -iF glycosylase  "$file_name"_out3 >> "$file_name"_a
grep -iF NUDIX "$file_name"_out3 >> "$file_name"_a
grep -iF pyrophosphatase "$file_name"_out3 >> "$file_name"_a
grep -iF " PDEase"  "$file_name"_out3 >> "$file_name"_a
grep -iF ADP-ribo "$file_name"_out3 >> "$file_name"_a
grep -iF "ADP ribo" "$file_name"_out3 >> "$file_name"_a
grep -iF  ribosyltransferase "$file_name"_out3 >> "$file_name"_a
grep -iF "ADP-ribosyl transferase" "$file_name"_out3 >> "$file_name"_a
grep -iF "ADP-ribosyl cyclase" "$file_name"_out3 >> "$file_name"_a
grep -iF "NAD+ glycohydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF " MutT" "$file_name"_out3 >> "$file_name"_a
grep -iF "Nucleotide hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "Nucleoside hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "Pyrimidine hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "Purine hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "CMP hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "AMP hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "GMP hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "TMP hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "UMP hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "CDP hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "ADP hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "GDP hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "TDP hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "UDP hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "CTP hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "ATP hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "GTP hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "TTP hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "UTP hydrolase" "$file_name"_out3 >> "$file_name"_a
grep -iF "cyclase" "$file_name"_out3 >> "$file_name"_a
grep -F " NLR"  "$file_name"_out3 >> "$file_name"_a
grep -iF "N-glycosidase" "$file_name"_out3 >> "$file_name"_a
grep -iF "deoxyribosylase" "$file_name"_out3 >> "$file_name"_a
grep -iF "N-hydrolase"  "$file_name"_out3 >> "$file_name"_a

 
#python /tsl/scratch/hulin/scripts/extract_hits80.py "$file_name"_a "$file_name"_out4

sort -nk12 -t ";" "$file_name"_a > "$file_name"_out41
first_hit=$(head -1 "$file_name"_out41 )
start1=$(echo $first_hit | cut -f10 -d ";" )
end1=$(echo $first_hit | cut -f11 -d ";" )
echo $first_hit >  "$file_name"_out5

while read line; do
start2=$(echo $line |  cut -f10 -d ";" )
end2=$(echo $line |  cut -f11 -d ";" )
if [ "$start2"  -ge "$start1" -a "$start2" -le "$end1" ] ; then
echo $line
elif [ "$start2"  -le "$start1" -a "$end2" -ge "$start1" ] ; then
echo $line
elif [ "$start2"  -le "$start1" -a "$end2" -ge "$end1" ] ; then
echo $line
else
echo $line OTHER
fi
done < "$file_name"_out41 >>  "$file_name"_out5

grep -v OTHER  "$file_name"_out5 > "$file_name"_out5_hit1
grep OTHER  "$file_name"_out5 | sed s/"OTHER"//g > "$file_name"_out6

first_hit=$(head -1 "$file_name"_out6 )
start1=$(echo $first_hit | cut -f10 -d ";" )
end1=$(echo $first_hit | cut -f11 -d ";" )

echo $first_hit >  "$file_name"_out7

while read line; do
start2=$(echo $line |  cut -f10 -d ";" )
end2=$(echo $line |  cut -f11 -d ";" )
if [ "$start2"  -ge "$start1" -a "$start2" -le "$end1" ] ; then
echo $line
elif [ "$start2"  -le "$start1" -a "$end2" -ge "$start1" ] ; then
echo $line
elif [ "$start2"  -le "$start1" -a "$end2" -ge "$end1" ] ; then
echo $line
else
echo $line OTHER
fi
done < "$file_name"_out6 >>  "$file_name"_out7

grep -v OTHER "$file_name"_out7 > "$file_name"_out7_hit2
grep OTHER "$file_name"_out7 | sed s/"OTHER"//g > "$file_name"_out8


first_hit=$(head -1 "$file_name"_out8 )
start1=$(echo $first_hit | cut -f10 -d ";" )
end1=$(echo $first_hit | cut -f11 -d ";" )
echo $first_hit >  "$file_name"_out9

while read line; do
start2=$(echo $line |  cut -f10 -d ";" )
end2=$(echo $line |  cut -f11 -d ";" )
if [ "$start2"  -ge "$start1" -a "$start2" -le "$end1" ] ; then
echo $line
elif [ "$start2"  -le "$start1" -a "$end2" -ge "$start1" ] ; then
echo $line
elif [ "$start2"  -le "$start1" -a "$end2" -ge "$end1" ] ; then
echo $line
else
echo $line OTHER
fi
done < "$file_name"_out8 >>  "$file_name"_out9

grep -v OTHER "$file_name"_out9 > "$file_name"_out9_hit3
grep OTHER "$file_name"_out9 | sed s/"OTHER"//g > "$file_name"_out10


# Sort and extract best hit
sort -nk12  -t ";" "$file_name"_out5_hit1 | head -n +1 > "$file_name"_a0
sort -nk12  -t ";" "$file_name"_out7_hit2 | head -n +1 > "$file_name"_a1
sort -nk12  -t ";" "$file_name"_out9_hit3 | head -n +1 > "$file_name"_a2
cat "$file_name"_a0 "$file_name"_a1 "$file_name"_a2 > ./hits3/"$file_name"_hits

rm "$file_name"_out*
rm "$file_name"_a*
