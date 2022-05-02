import sys 

inputfile = sys.argv[1]
outputfile = sys.argv[2]
f = open(inputfile)
o = open(outputfile, "w")

for line in f:
    cols = line.strip().split(",")
    if line.startswith("protein"): continue
    else:
        if float(cols[2]) >= 0.9999 :
            o.write(line)

exit

