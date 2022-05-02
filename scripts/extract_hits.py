import sys 

inputfile = sys.argv[1]
outputfile = sys.argv[2]
f = open(inputfile)
o = open(outputfile, "w")
for line in f:
    cols = line.strip().split("\t")
    if len(cols) < 9 : continue
    if float(cols[7]) < 50 or float(cols[8]) < 50 : continue
    else:
        o.write(line)
exit

