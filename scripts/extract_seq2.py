import sys
import re

FASTA= sys.argv[1]
BED= sys.argv[2]

fasta= open(FASTA, 'U')
fasta_dict= {}
for line in fasta:
    line= line.strip()
    if line == '':
        continue
    if line.startswith('>'):
        seqname= line.lstrip('>')
        seqname= re.sub('\..*', '', seqname)
        fasta_dict[seqname]= ''
    else:
        fasta_dict[seqname] += line
fasta.close()
with open(BED) as bed:
    for line in bed:
        line= line.strip().split('\t')
        outname= line[0] + ':' + line[1] + '-' + line[2] + '\t' +  line[3]      
        s= int(line[2])
        e= int(line[3])
        print '>' + outname + "\n" + fasta_dict[line[1]][s:e] + "\n" 

