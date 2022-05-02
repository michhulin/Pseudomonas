import sys 

inputfile = sys.argv[1]
outputfile = sys.argv[2]
f = open(inputfile)
o = open(outputfile, "w")
for line in f:
    cols = line.strip().split(" ")
    newnum=float(cols[1]) * 2.9
    o.write(cols[0] + " " + str(newnum) + "\n")
exit

