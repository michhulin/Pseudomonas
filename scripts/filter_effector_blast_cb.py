#!/usr/bin/python


import sys



blast = sys.argv[1]
contig_info = sys.argv[2]


f = open(blast, 'r')

from collections import defaultdict
contigs=defaultdict(list)
ident_ranges = defaultdict(list)

contigs = {}
with open(contig_info, 'r') as o:
    for line in o: 
        line_split = line.strip().split("\t")
        contig = line_split[0]
        contigs[contig] = True
        end=line_split[1]
        end_reg=(float(end)-10) 
     	end, end_reg = int(end), int(end_reg)
     	ident_ranges[contig].append((end_reg, end))
for line in f:
    cols = line.strip().split("\t")
    contig1 = cols[1]
    end1 = int(cols[5])
   # check if it is at the start of a contig 
    if float(cols[4]) >= 1  and float(cols[4]) <= 10:
        print line
    for contig in ident_ranges: 
    # check if it is at the end of a contig 
        if contig1 == contig and any(end_reg <= end1 <= end for end_reg, end in ident_ranges[contig1]): 
            print line
exit


