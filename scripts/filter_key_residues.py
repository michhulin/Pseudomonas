import sys 

inputfile = sys.argv[1]
f = open(inputfile)
for line in f:
    cols = line.strip().split("\t")
    if len(cols) < 12 :
        print cols[0] + "," + "1"
    elif cols[12] == "GLU":
        print cols[0] + "," + "2"
    else: 
        print cols[0] +	"," + "1" 

