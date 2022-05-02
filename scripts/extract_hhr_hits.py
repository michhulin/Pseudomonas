import sys 

inputfile = sys.argv[1]
outputfile = sys.argv[2]
f = open(inputfile)
o = open(outputfile, "w")
for line in f:
    cols = line.strip().split(";")
    if len(cols) < 9 : continue
    if float(cols[11]) < 16 :
        o.write(line)
    else: continue
      
exit

