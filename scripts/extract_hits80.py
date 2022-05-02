import sys 

inputfile = sys.argv[1]
outputfile = sys.argv[2]
f = open(inputfile)
o = open(outputfile, "w")
for line in f:
    cols = line.strip().split(";")
    if float(cols[1]) < 80 : continue
    else:
        o.write(line)
exit

