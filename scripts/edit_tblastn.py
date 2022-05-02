import sys 

inputfile = sys.argv[1]
outputfile = sys.argv[2]
f = open(inputfile)
o = open(outputfile, "w")
for line in f:
    cols = line.strip().split("\t")
    plength = (float(cols[3])/float(cols[2])) * 100
    plen = round(plength,2)
    o.write(cols[0] + "\t" + cols[1] + "\t" + cols[2] + "\t" + cols[3] + "\t" + cols[4] + "\t" + cols[5] + "\t" + cols[6] + "\t" + cols[7] + "\t"  +  str(plen) + "\t" + cols[8] + "\t" +  cols[9] + "\n" )
exit

