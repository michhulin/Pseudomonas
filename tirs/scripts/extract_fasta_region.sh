#!/bin/bash

# Parse command line arguments
if [ $# -ne 5 ]; then
    echo "Usage: $0 input_file output_file region_start region_end"
    exit 1
fi

input_file=$1
output_file=$2
region_start=$3
region_end=$4
name_file=$5

name=$(basename $name_file)

# Extract region of interest
region=$(awk '/^>/ {if (seq != "") {print seq}; print; seq=""; next} {seq = seq $0} END {print seq}' $input_file | tail -n +2 | tr -d '\n' | cut -c${region_start}-${region_end})

# Write result to output file
echo ">$name" > $output_file
echo $region >> $output_file
