#!/usr/bin/python

'''
read in data from a tab-separated-value file
only output those line where the marker name is in a list
'''

import sys

#read the input and output filename from the command line
subset = sys.argv[1]
genomelist = sys.argv[2]

#store the names in a dictionary
names = {}
with open(subset) as f1:
    for line in f1:
        col = line.strip().split("\t")
        name = col[0]
        names[name] = True

#read in just the first line of the input file
with open(genomelist) as f2:
    for line in f2: 
        cols = line.strip().split("\t")
        name=cols[0]  
        if  name in names: 
            print name + "\t" + "1"
        else: 
            print name + "\t" +	"0"
             
