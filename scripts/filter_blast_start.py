#!/usr/bin/python


import sys

inputfile = sys.argv[1]
outfile = sys.argv[2]

#open both files
f = open(inputfile)
o = open(outfile, "w")
for line in f:
    cols = line.strip().split("\t")
    seq = str(cols[9])
    start = seq[:1]
    if start not in ("M", "V", "L", "I"): 
        o.write(line)
    else: continue 
f.close()
exit



