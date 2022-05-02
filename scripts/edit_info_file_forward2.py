


import sys


inputfile = sys.argv[1]

#open both files
f = open(inputfile)

for line in f:
    cols = line.strip().split("\t")
    genome=str(cols[0])
    g = open("/tsl/data/sequences/bacteria/pseudomonas/ncbi-genomes-2020-11-18/"+genome+".info")
    name=str(cols[1])
    new_start=int(cols[3])-1001  
    new_start2=str(new_start)
    new_end=int(cols[4])   
    new_end2=str(new_end)
    hit_contig=(cols[2])
    for line in g:
        cols = line.strip().split("\t")
        contig=str(cols[0])
        end=int(cols[1])
        if contig == hit_contig: 
            if int(new_start2) < 0: 
                new_start2 = "0"
            if int(new_end2) > end:
                new_end2 = str(end)   
            print genome + "\t" + name  + "\t" + hit_contig + "\t" +  new_start2  + "\t" +  new_end2
exit
			





