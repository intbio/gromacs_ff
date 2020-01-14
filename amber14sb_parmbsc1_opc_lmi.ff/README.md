# AMBER14sb_parmbsc1_opc_lmi 
- The task of this folder is to provide a port of AMBER14sb_parmbsc1 ff with OPC water model and Li/Merz ions for gromacs.

- The trick is to choose TIP4P water model in pdb2gmx, then manually change the include file from tip4p to opc inside the topology file generated.
```
# gmx pdb2gmx -f out.gro -o out_box.gro -water tip4p
# gmx solvate -cs tip4p.gro  -box 4
# change tip4p.itp to opc.itp in topol.top
```
- opc.itp was obtained from here https://bioinformatics.cs.vt.edu/~izadi/OPC_Gromacs/opc.top

- FF generation protocol:
	- Took AMBER14sb_parmbsc1
	- Added opc.itp
	- atomtypes directive commented out
	- Default ff has the Joung and Cheatham 2008 ions, see [here](../amber14sb_parmbsc1.ff/README.md)
	- However, from Amber19 manual we see:
```
Ion parameters for OPC: Two sets of 12-6 LJ parameters for OPC water model (the 12-6 IOD set and the 12-6 HFE set) for 3 monovalent ions (Na+, K+, Cl-) have been developed by Li, Merz and co-workers; see Section 3.6 for the definition and important usage suggestions. Our tests show that the deviation of the Ion-Oxygen Distances (IODs) predicted using the 12-6 HFE set from the reference IOD values is within ±0.2Å. Comparing these deviations to those reported for other ion parameter sets available, it seems that the magnitude of the deviation is borderline acceptable, which means that the HFE set might also work in situations where IOD is formally recommended. For Na+ the transferability is not an issue as Hydration Free Energy (HFE) and IOD parameters are essentially the same. In situations where agreement of HFEs with one of the common experimental references is critical, the use of OPC-specific parameters (the 12-6 HFE set) for K+, Na+, and Cl- may be advisable. The IOD parameter set are recommended to be used in the structural refinement. Additional OPC-specific ion parameters have been reported recently.[102]
```
	- We need this file from AMBER frcmod.ions1lm_126_hfe_opc
```
NONBON
  Na+      1.432     0.02154025
  K+       1.646     0.10417397
  Cl-      2.298     0.63661449
```
	- For comparisson this are Joung&Cheatham
```
NONBON
  Na+      1.369     0.0874393
  K+       1.705     0.1936829
  Cl-      2.513     0.0355910
```
	- The conversion rules are as [here](../amber14sb_parmbsc1.ff/README.md)
	- ffnonbonded.itp was fixed. NOTE that the Li/Merz params are really very different from Young&Cheatham

