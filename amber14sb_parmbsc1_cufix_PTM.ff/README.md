## Added Force Fields explanation 
### AMBER14SB + parambsc1 + CUFIX + PTM

We create a small peptide model system with phosphoserine (PSER) blocked by alanine (ALA) to determine the atomic charges for the <a href="https://doi.org/10.1021/acs.jctc.5b00255">AMBER ff14SB</a> force field supplemented with <a href="https://doi.org/10.1038/nmeth.3658">parmbsc1</a> DNA and <a href="https://doi.org/10.1039/C7CP08185E">CUFIX</a> ion parameter corrections. Tripeptide model with phosphoserine was made using <a href="https://pymol.org/2/">PyMOL</a>, especially its plugin – <a href="https://doi.org/10.1186/s12859-014-0370-6">pytms</a>. <br>
<a href="https://doi.org/10.21105/joss.04100">PsiRESP</a> was used to calculate atomic charges of tripeptide. We made the following constraints:  an overall charge of -1, the charges of the backbone atoms were constrained to their values in the AMBER ff14SB parameter set and the charges of oxygens atoms in the phosphate group were made equivalent. The topology of tripeptide was generated using <a href="https://doi.org/10.1186/1756-0500-5-36">acpype</a>. The resulting PSER parameter set was integrated in AMBER ff14SB force field for further MD simulations.

 - The original force field: [amber14sb_parmbsc1.ff.tar.gz](http://www.gromacs.org/Downloads/User_contributions/Force_fields) by mhviet, 2017
 - [CUFIX corrections](http://bionano.physics.illinois.edu/CUFIX) by Yoo & Aksimentiev, 2018
 
 All the manipulations were carried out according to Yoo & Aksimetiev group website. Here is what was done:
   - Downloaded package https://www.dropbox.com/sh/90quvm5sla7oqym/AAABoTI9-Z4aLnm-QxDVm_o5a?dl=0
   - Copied these files to the original .ff file: *cufix.itp, 
                                                    mg-sol6.itp,
                                                    mg-sol6.pdb,
                                                    ca-sol7.itp,
                                                    ca-sol7.pdb.*
   -  Replaced atom types for O1P and O2P atoms (O2) with ON2 for all nucleotides in *dna.rtp and rna.rtp*. ON2 atom type is defined in *cufix.itp*.

    
   
   - It is not stated in the instructionb on the Aksiemetiev website. You should add atomtypes in cufix.itp:
   ```
   NH3          7      14.01    0.0000  A   3.25000e-01  7.11280e-01   ;jejoong spermine
   NP           7      14.01    0.0000  A   3.25000e-01  7.11280e-01   ;jejoong spermine
   ```
   
   - Added ``` #include "cufix.itp" ``` to *forcefield.itp* between ``` #include "ffnonbonded.itp" ``` and ``` #include "ffbonded.it" ```.
   - Deleted the following ions from *ffnonbonded.itp*: 
      Li, Na, K, Cl, MG, Rb, Cs, F, Br, I. 
      CUFIX uses new ion parameters by the Cheatham group.
  

- Before start you shoud copy file "residuetypes.dat" to "GMX_system" directory.
