import sys 

inputfile = sys.argv[1]
outputfile = sys.argv[2]
f = open(inputfile)
o = open(outputfile, "w")

for line in f:
    cols = line.strip().split("\t")
    if line.startswith("protein"): continue
    if cols[2] == "-" : continue
    else:
        if float(cols[2]) >= 0.95 :
            o.write(line)

exit

