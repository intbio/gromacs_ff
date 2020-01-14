# AMBER14sb_parmbsc1_opc 
- The task of this folder is to provide a port of AMBER14sb_parmbsc1 ff with OPC water model for gromacs.

- The trick is to choose TIP4P water model in pdb2gmx, then manually change the include file from tip4p to opc inside the topology file generated.
- OPC.itp was obtained from here https://bioinformatics.cs.vt.edu/~izadi/OPC_Gromacs/opc.top