import sys 

inputfile = sys.argv[1]
outputfile = sys.argv[2]
f = open(inputfile)
o = open(outputfile, "w")
for line in f:
    cols = line.strip().split("\t")
    if len(cols) > 7 : continue
    if float(cols[1]) < 15 : continue
    else:
        o.write(line)
exit

