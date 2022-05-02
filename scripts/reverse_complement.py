import sys

inFile = open(sys.argv[1],'r')

nuc = {'A':'T','T':'A','G':'C','C':'G','K':'M','M':'K','R':'Y','Y':'R','S':'W','W':'W','B':'V','V':'B','H':'G','D':'C','X':'N','N':'N'}

def revComp(seq):
    rev = ''
    for i in range(len(seq) - 1,-1,-1):
        rev += nuc[seq[i]]

    return rev

header = ''
seq = ''
for line in inFile:
    if line[0] == ">":
        if header != '':
            print header
            print revComp(seq.upper())

        header = line.strip()
        seq = ''
    else:
        seq += line.strip()

print header
print revComp(seq.upper())

