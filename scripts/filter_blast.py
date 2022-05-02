#!/usr/bin/python


import sys




# Filter BLAST results based on a cut off of 80% QL and 80% ID for 'full' length genes  
import sys


inputfile = sys.argv[1]
fullfile = sys.argv[2]
pseudofile = sys.argv[3]

#open both files
f = open(inputfile)
o = open(fullfile, "w")
p = open(pseudofile, "w")
for line in f:
    cols = line.strip().split("\t")
    if (float(cols[7]) >= 80 ) and (float(cols[8]) >=  80 ):
        o.write(line)
    if (50 <= float(cols[7]) < 80 ) and  (float(cols[8]) >=  40 ):
        p.write(line)
    if (float(cols[7]) > 80) and  (80 > float(cols[8]) >=  35 ):
        p.write(line)

f.close()
o.close()
p.close()
exit

