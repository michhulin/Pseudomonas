import sys
import re
import os

GENOME= sys.argv[1]
BED= sys.argv[2]

GE1=os.path.basename(GENOME)
GE2=os.path.splitext(GE1)[0]

with open(GENOME) as g:
    g_dict= {}
    for line in g:
        line= line.strip()
        if line == '':
            continue
        if line.startswith('>'):
            seqname= line.lstrip('>')
            seqname= re.sub('\..*', '', seqname)
            g_dict[seqname]= ''
        else:
            g_dict[seqname] += line
    
    with open(BED) as bed:
        for line in bed: 
            cols= line.strip().split('\t')
            gen=str(cols[0])
            outname= cols[0] + '_' + cols[1] + ':' + cols[2] + '-' + cols[3] + '\t' + cols[4]      
            s= int(cols[3])
            e= int(cols[4])
            if str(gen) == str(GE2):
                print '>' + outname + "\n" + g_dict[cols[2]][s:e] + "\n"
            else: continue 
    g.close()
