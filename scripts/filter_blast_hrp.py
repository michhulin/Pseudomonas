
# Filter BLAST results based on a cut off of 80% QL and 80% ID for 'full' length genes  
import sys


inputfile = sys.argv[1]
outfile = sys.argv[2]

#open both files
o = open(outfile, "w")
with open(inputfile , 'r') as f:
    for line in f:
        cols = line.strip().split("\t")
        if len(cols) < 7: 
            o.write(cols[0] + "\t" + "0" + "\n")
        elif (float(cols[7]) >= 0.5 ) and (float(cols[8]) >=  0.5 ):
            o.write(cols[0] + "\t" + "2" + "\n")
        elif (float(cols[7]) < 0.5 ) and (float(cols[8]) >=  0.5 ):
            o.write(cols[0] + "\t" + "1" + "\n")
        elif (float(cols[7]) >= 0.5 ) and (float(cols[8]) <  0.5 ):
            o.write(cols[0] + "\t" + "1" + "\n")
        elif (float(cols[7]) < 0.5 ) and (float(cols[8]) <  0.5 ):
            o.write(cols[0] + "\t" + "1" + "\n")
f.close()
o.close()
exit



