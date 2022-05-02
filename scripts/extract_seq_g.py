import sys
import re


BED= sys.argv[1]

with open(BED) as bed:
    for line in bed:
        cols= line.strip().split('\t')
        genome=str(cols[0])
        g = open("/tsl/data/sequences/bacteria/pseudomonas/ncbi-genomes-2020-11-18/"+genome+".fna", 'U')
        outname= cols[0] + '_' + cols[1] + ':' + cols[2] + '-' + cols[3] + '\t' + cols[4]      
        s= int(cols[3])
        e= int(cols[4])
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
        g.close()
        print '>' + outname + "\n" + g_dict[cols[2]][s:e] + "\n"

