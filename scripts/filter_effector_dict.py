#!/usr/bin/python


import sys


#read the input and output filename from the command line
effectorfile = sys.argv[1]
pseudogenefile = sys.argv[2]
contigbreakfile = sys.argv[3]
genomelist = sys.argv[4]

#store the names in a dictionary
effectors = {}
with open(effectorfile) as f1:
    for line in f1:
        effector = line.strip()
        effectors[effector] = True
        
pseudogenes = {}
with open(pseudogenefile) as f2:
    for line in f2:
        pseudogene = line.strip()
        pseudogenes[pseudogene] = True

contigbreaks = {}
with open(contigbreakfile) as f3:
    for line in f3:
        contigbreak = line.strip()
        contigbreaks[contigbreak] = True

#read in just the first line of the input file
with open(genomelist) as f4:
    for line in f4: 
        cols = line.strip().split("\t")
        name=cols[0]  
        if  name in effectors: 
            print name + "\t" + "3"
        elif name in pseudogenes and name not in contigbreaks: 
            print name + "\t" + "2"
        elif name in contigbreaks: 
            print name + "\t" + "1"
        else: 
            print name + "\t" + "0" 
        
