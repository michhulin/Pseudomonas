import sys 

inputfile = sys.argv[1]
outputfile = sys.argv[2]
f = open(inputfile)
o = open(outputfile, "w")
for line in f:
    cols = line.strip().split("\t")
    cols6 = float(cols[6])
    cols7 = float(cols[7])
    if cols7 >= 50 and cols6 <= 0.01: 
        o.write(line)

