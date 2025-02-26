#!/bin/bash

# Parse command line arguments
if [ $# -ne 1 ]; then
    echo "Usage: $0 input_file"
    exit 1
fi

input_file=$1

# Check if file has more than one line
num_lines=$(wc -l < $input_file)
if [ $num_lines -gt 1 ]; then

    # Split file into separate files
    split -l 1 $input_file temp_file_

    # Rename files with appended number
    i=1
    for file in temp_file_*; do
        mv $file $(basename $input_file).$i
        let i++
    done

    # Remove temporary files
    rm temp_file_*
fi
