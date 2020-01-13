# CHARMM force filed from MacKerrel Lab

This is CHARMM 36 ff port for Gromacs from march 2019  from MacKerrel Lab web site http://mackerell.umaryland.edu/charmm_ff.shtml

Strictly speaking the charmm ff is updated with each new release of charmm (currently 44). However, since CHARMM36 the changes have been small, so on MacKerell's web-page they are reffered as updates to the CHARMM36 ff.
However, it looks like Gromacs ports have there own dates.

```
CHARMM36 force field in GROMACS format, including CGenFF version 4.0 and the CHARMM36m protein force field revision. Updated July 2017. Changes since November 2016 include addition of more lipid residues and parameters, NAD and polyphosphates, metals, silicates, and the ability of the user to choose between C36 and C36m for protein simulations via the GROMACS "define" mechanism:

define = -DUSE_OLD_C36
The C36m parameter set is recommended for all protein simulations, but the ability to toggle between old and new parameter sets may be useful in the case of force field comparisons.

The current C36 port for GROMACS is dated March 28, 2019. Changes since July 2017 include addition of PNA and LNA parameters, as well as CGenFF version 4.1. The only change since the November 2018 version is removal of a rarely used improper that conflicts with the Gly-Pro dihedral that uses a wildcard.

charmm36-mar2019.ff.tgz

Old force field releases:

charmm36-jul2017.ff.tgz

A Python program to convert ParamChem CGenFF toppar stream file from CHARMM to GROMACS format. The comments section in the beginning of the program provides usage information. PLEASE NOTE that all scripts support lone pairs on halogens, however the current topology construction (type 2fd) is only compatible with GROMACS 2020 and newer.
```

So the correspndence between ff versions in charmm format and in gromacs format is a bit unclear.

In [toppar_c36_jul18](toppar_c36_jul18) folder we put the core files of the jul18 version of ff in charmm format, there is a history file there [toppar_c36_jul18/toppar_all.history](toppar_c36_jul18/toppar_all.history).

## Important notes
- In CHARMM NBFIX facility allows for overwriting well-depths and vdW radii based on the standard combination rules with atom-pair specific Lennard-Jones parameters (e.g. atom-Ow) that are optimized to reproduce different paprameters.
These NBFIX directives are implemented in gromacs port with nbfix.itp.

