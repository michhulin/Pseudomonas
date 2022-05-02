


import sys


inputfile = sys.argv[1]
genomefile = sys.argv[2]

#open both files
f = open(inputfile)
g = open(genomefile)

# Define the contig and end of contig 
for line in f:
    cols = line.strip().split("\t")
    name=str(cols[0])
    new_start=int(cols[2])-501  
    new_start2=str(new_start)
    new_end=int(cols[3])+500   
    new_end2=str(new_end)
    hit_contig=(cols[1])
    for line in g:
        cols = line.strip().split("\t")
        contig=str(cols[0])
        end=int(cols[1])
        if contig == hit_contig: 
            if int(new_start2) < 0: 
                new_start2 = "0"
            if int(new_end2) > end:
                new_end2 = str(end)   
            print name  + "\t" + hit_contig + "\t" +  new_start2  + "\t" +  new_end2
exit
			





