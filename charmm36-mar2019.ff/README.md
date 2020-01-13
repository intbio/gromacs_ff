# CHARMM force filed from MacKerrel Lab

This is CHARMM 36 ff port for Gromacs from march 2019  from MacKerrel Lab web site http://mackerell.umaryland.edu/charmm_ff.shtml

Strictly speaking the charmm ff is updated with each new release of charmm (currently 44). However, since CHARMM36 the changes have been small, so on MacKerell's web-page they are reffered as updates to the CHARMM36 ff.

## Important notes
- In CHARMM NBFIX facility allows for overwriting well-depths and vdW radii based on the standard combination rules with atom-pair specific Lennard-Jones parameters (e.g. atom-Ow) that are optimized to reproduce different paprameters.
These NBFIX directives are implemented in gromacs port with nbfix.itp.

