# gromacs_ff
Trusted force field files for gromacs

## Links to original force fields, papers and notes
### AMBER
- http://ambermd.org/AmberModels.php
- http://ambermd.org/doc12/Amber18.pdf see section 3.
- As of 2018 -  ff14SB is the recommended protein force field in Amber.
- ff14SB paper https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4821407/pdf/nihms772276.pdf
- For DNA one should use currently  PARMBSC1 corrections with AMBER or OL15.
- Ion parameters are important see [section 3.6](http://ambermd.org/doc12/Amber18.pdf). Amber currently recommends Li & Merz parameters (2015).
- [CUFIX corrections](http://bionano.physics.illinois.edu/CUFIX) by Yoo & Aksimentiev, 2018, are important for charged systems.

#### List of FF
- https://github.com/intbio/gromacs_ff/tree/master/amber14sb_parmbsc1.ff from Gromacs web-site
-

## Added Force Fields explanation 
### AMBER14SB + parambsc1 + CUFIX
 - The original force field: [amber14sb_parmbsc1.ff.tar.gz](http://www.gromacs.org/Downloads/User_contributions/Force_fields) by mhviet, 2017
 - [CUFIX corrections](http://bionano.physics.illinois.edu/CUFIX) by Yoo & Aksimentiev, 2018
 
 All the manipulations were carried out according to Yoo & Aksimetiev group website. Here is what was done:
   - Downloaded package https://www.dropbox.com/sh/90quvm5sla7oqym/AAABoTI9-Z4aLnm-QxDVm_o5a?dl=0
   - Copied these files to the original .ff file: *cufix.itp, 
                                                    mg-sol6.itp,
                                                    mg-sol6.pdb,
                                                    ca-sol7.itp,
                                                    ca-sol7.pdb.*
   -  Replaced atom types of O1P and O2P atoms (O2) with ON2 for all nucleotides in *dna.rtp and rna.rtp*. ON2 atom type is defined in *cufix.itp*.
   Commands used:
   ``` 
    
   sed s/O1P/ON2/g dna.rtp > dna1.rtp
   
   sed s/O2P/ON2/g dna1.rtp > dna2.rtp
  
   sed s/O1P/ON2/g rna.rtp > rna1.rtp
   
   sed s/O2P/ON2/g rna1.rtp > rna2.rtp
   ```
   Then rename files dna.rtp and rna.rtp to dna_old.rtp and rna_old.rtp
   Rename dna2.rtp, rna2.rtp to dna.rtp, rna.rtp. Then delete old ones. 
   
   - It is not stated in the instructionb on the Aksiemetiev website. You should add atomtypes in cufix.itp:
   ```
   NH3          7      14.01    0.0000  A   3.25000e-01  7.11280e-01   ;jejoong spermine
   NP           7      14.01    0.0000  A   3.25000e-01  7.11280e-01   ;jejoong spermine
   ```
   
   - Added ``` #include "cufix.itp" ``` to *forcefield.itp* between ``` #include "ffnonbonded.itp" ``` and ``` #include "ffbonded.it" ```.
   - Deleted the following ions from *ffnonbonded.itp*: 
      Li, Na, K, Cl, MG, Rb, Cs, F, Br, I. 
      CUFIX uses new ion parameters by the Cheatham group.
   
