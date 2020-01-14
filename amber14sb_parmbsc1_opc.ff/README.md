# AMBER14sb_parmbsc1_opc 
- The task of this folder is to provide a port of AMBER14sb_parmbsc1 ff with OPC water model for gromacs.

- The trick is to choose TIP4P water model in pdb2gmx, then manually change the include file from tip4p to opc inside the topology file generated.
```
# gmx pdb2gmx -f out.gro -o out_box.gro -water tip4p
# gmx solvate -cs tip4p.gro  -box 4
# change tip4p.itp to opc.itp in topol.top
```
- OPC.itp was obtained from here https://bioinformatics.cs.vt.edu/~izadi/OPC_Gromacs/opc.top
