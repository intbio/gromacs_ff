# CHARMM force field from MacKerrel Lab

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

So the correspondence between ff versions in charmm format and in gromacs format is a bit unclear.

In [toppar_c36_jul18](toppar_c36_jul18) folder we put the core files of the jul18 version of ff in charmm format, there is a history file there [toppar_c36_jul18/toppar_all.history](toppar_c36_jul18/toppar_all.history).

## Important notes
- In CHARMM NBFIX facility allows for overwriting well-depths and vdW radii based on the standard combination rules with atom-pair specific Lennard-Jones parameters (e.g. atom-Ow) that are optimized to reproduce different paprameters.
These NBFIX directives are implemented in gromacs port with nbfix.itp.
- Let's see what are the ion parameters here ...

```
Summary of changes in version C38, 2015/8

 6) Sodium NBFIX parameters added to toppar_water_ions.str (Sep. 2013)
 
 
Summary of changes in version C43/44, 2018/8
4) Select ion NBFIX parameters from Savelyev and MacKerell, JPCB 2015 added to toppar_water_ions.str

! Chloride
CLA    LIT      -0.0187     3.6875 ! Savelyev and MacKerell, JPCB 2015
CLA    SOD      -0.0839     3.7310 ! Savelyev and MacKerell, JPCB 2015
CLA    POT      -0.1142     4.0810 ! Savelyev and MacKerell, JPCB 2015
! NA
LIT    ON3      -0.0167     3.1775 ! Savelyev and MacKerell, JPCB 2015
```

In JMB paper these params where used, that were around 2013 already in CHARMM36 see [here](https://github.com/molsim/MYSOFT/blob/6524a761462a948e70f392c4ab24dcda4cd4d508/MD_simulations_NAMD/nucleosome_CHARMM/prep/toppar_water_ions.str#L266): Y. Luo, B. Roux, Simulation of osmotic pressure in concentrated aqueous salt solutions, J. Phys. Chem. Lett. 1 (2010) 183–189.

In the current version they are superseeded by additional NBFIXes from Savelyev and MacKerell, JPCB 2015 (https://pubs.acs.org/doi/10.1021/acs.jpcb.5b00683) (actually for Na K and Cl they are the same).
From  Venable, R.M.; Luo, Y,; Gawrisch, K.; Roux, B.; Pastor, R.W. J. Phys. Chem. B 2013, 117 (35), pp 10183–10192.  DOI: 10.1021/jp401512z NBFIXes to the interaction of ions with different groups (carboxylate for protein and some groups for lipids) are added.

Here you can see params and comments in ff files citing publications https://github.com/intbio/gromacs_ff/blob/59ed25f0c97e0599fc653bf43c6651d05205dd8a/charmm36-mar2019.ff/toppar_c36_jul18/toppar_water_ions.str#L301

NOTE also that current NBFIXes reduced precision to 4 digits from 6.
