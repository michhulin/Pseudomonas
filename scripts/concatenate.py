
from Bio.Nexus import Nexus
import glob
import os
file_list=[os.path.basename(x) for x in glob.glob("/tsl/scratch/hulin/pseudomonas/mlst/align/*nxs")]


nexi =  [(fname, Nexus.Nexus(fname)) for fname in file_list]
combined = Nexus.combine(nexi)
combined.write_nexus_data(filename=open('combined.nex', 'w'))

