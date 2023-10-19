## Added Force Fields explanation 
### AMBER14SB + parambsc1 + CUFIX + PTM

We create a small peptide model system with phosphoserine (PSER) blocked by alanine (ALA) to determine the atomic charges for the AMBER ff14SB [Maier, J. A.; Martinez, C., at al., Ff14SB: Improving the Accuracy of Protein Side Chain and Backbone Parameters from Ff99SB // J. Chem. Theory Comput. 2015, 11 (8), 3696–3713] force field supplemented with parmbsc1 [Ivani, I., at al., Parmbsc1: A Refined Force Field for DNA Simulations // Nat. Methods 2016, 13 (1), 55–58] DNA and CUFIX [Yoo, J.; Aksimentiev, A., New Tricks for Old Dogs: Improving the Accuracy of Biomolecular Force Fields by Pair-Specific Corrections to Non-Bonded Interactions // Phys. Chem. Chem. Phys. 2018, 20 (13), 8432–8449] ion parameter corrections. Tripeptide model with phosphoserine was made using PyMOL [Schrodinger, The PyMOL Molecular Graphics System, Version 1.8, 2015], especially its plugin – pytms [Warnecke, A., at al., PyTMs: A Useful PyMOL Plugin for Modeling Common Post-Translational Modifications // BMC Bioinformatics 2014, 15 (1), 370]. 
PsiRESP [Wang, L.; O’Mara, M. L., PsiRESP: Calculating RESP Charges with Psi4 // J. Open Source Softw. 2022, 7 (73), 4100] was used to calculate atomic charges of tripeptide. We made the following constraints:  an overall charge of -1, the charges of the backbone atoms were constrained to their values in the AMBER ff14SB parameter set and the charges of oxygens atoms in the phosphate group were made equivalent. The topology of tripeptide was generated using acpype [Sousa da Silva, A. W.; Vranken, W. F., ACPYPE - AnteChamber PYthon Parser InterfacE // BMC Res. Notes 2012, 5 (1), 367]. The resulting PSER parameter set was integrated in AMBER ff14SB force field for further MD simulations.

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
