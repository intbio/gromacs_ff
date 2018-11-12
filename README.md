# gromacs_ff
Trusted force field files for gromacs

## Links to original force fields, papers and notes
### AMBER
- http://ambermd.org/AmberModels.php
- http://ambermd.org/doc12/Amber18.pdf see section 3.
- As of 2018 -  ff14SB is the recommended protein force field in Amber.
- ff14SB paper https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4821407/pdf/nihms772276.pdf

## Added Force Fields explanation 
### AMBER14SB + parambsc1 + CUFIX
 - The original force field: [amber14sb_parmbsc1.ff.tar.gz](http://www.gromacs.org/Downloads/User_contributions/Force_fields) by mhviet, 2017
 - [CUFIX corrections](http://bionano.physics.illinois.edu/CUFIX) by Yoo & Aksimentiev, 2018
 
 All the manipulations were carried out according to Yoo & Aksimetiev group website. Here is what was done:
   - Downloaded package
   - Copied these files to the original .ff file: *cufix.itp, 
                                                    mg-sol6.itp,
                                                    mg-sol6.pdb,
                                                    ca-sol7.itp,
                                                    ca-sol7.pdb.*
   -  Replaced atom types of O1P and O2P atoms (O2) with ON2 for all nucleotides in *dna.rtp and rna.rtp*. ON2 atom type is defined in *cufix.itp*.
   - Added ``` #include "cufix.itp" ``` to *forcefield.itp* between ``` #include "ffnonbonded.itp" ``` and ``` #include "ffbonded.it" ```.
   - Deleted the following ions from *ffnonbonded.itp*: 
      Li, Na, K, Cl, MG, Rb, Cs, F, Br, I. 
      CUFIX uses new ion parameters by the Cheatham group.
   
