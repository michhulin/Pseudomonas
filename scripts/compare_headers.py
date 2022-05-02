import sys 
import os

inputfile = sys.argv[1]
f = open(inputfile)
f2=os.path.basename(inputfile)
for line in f:
    cols = line.strip().split("\t")
    if (cols[1]) == (cols[2]) : 
        print cols[0] + "\t" + "1"
    else: 
        print cols[0] + "\t" + "0"
exit

