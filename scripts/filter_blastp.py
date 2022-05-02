import sys 

inputfile = sys.argv[1]
outputfile = sys.argv[2]
f = open(inputfile)
o = open(outputfile, "w")
for line in f:
    cols = line.strip().split("\t")
    cols6 = float(cols[6])
    if cols[7] == "100.000" and cols6 <= 0.0000000001: 
        o.write(cols[0] + "\t" + cols[1] + "\n")

