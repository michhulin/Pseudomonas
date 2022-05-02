
import sys
infile = open(sys.argv[1])
outfile = []

for line in infile:
    if line.startswith(">"):
        if (outfile != []): outfile.close()
        genename = line.strip().split('>')[1]
        filename = genename+".fasta"
        outfile = open(filename,'w')
        outfile.write(line)
    else:
        outfile.write(line)
outfile.close()

