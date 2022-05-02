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

#read in just the first line of the input file
with open(genomelist) as f1:
    for line in f1: 
        cols = line.strip().split(",")
        name=cols[0]  
        names[name] = True

with open(subset) as f2:
    for line in f2:
        col = line.strip().split("\t")
        name = col[0]
        if  name not in names:
            print line


