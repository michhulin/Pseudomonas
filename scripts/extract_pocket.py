import sys 

inputfile = sys.argv[1]
outputfile = sys.argv[2]
f = open(inputfile)
o = open(outputfile, "w")
for line in f:
    cols = line.strip().split(",")
    o.write("center_x ="+cols[6]+"\n"+"center_y ="+cols[7]+"\n"+"center_z ="+cols[8]+"\n"+"size_x = 20"+"\n"+"size_y = 20"+"\n"+"size_z = 20")
exit

