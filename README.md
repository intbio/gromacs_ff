# gromacs_ff
Trusted force field files for gromacs in this repo:

- https://github.com/intbio/gromacs_ff/tree/master/amber14sb_parmbsc1.ff AMBER ff from Gromacs web-site
- https://github.com/intbio/gromacs_ff/tree/master/amber14sb_parmbsc1_cufix.ff same ff but with CUFIX corrections
- https://github.com/intbio/gromacs_ff/tree/master/charmm36-mar2019.ff CHARMM force field from [MacKerrel Lab](http://mackerell.umaryland.edu/charmm_ff.shtml)
- https://github.com/intbio/gromacs_ff/tree/master/charmm36-mar2019_cufix.ff CHARMM ff with CUFIX corrections implemented by @molsim - testing is needed.

## General notes on available force fields
### Simulating DNA
- The best source of information is usually the Amber manual. Currently, [Amber 19 manual](http://ambermd.org/doc12/Amber19.pdf) on page 38 discusses two options parmbsc1 from Orozco group and OL15 from Sponer group. The do not make a choice as to which is better, howerver, on the front page the OL15 is recommended.
- As for ions, by default the Young Cheatham 2008 ions are selected in Amber ff. Looks like it may be a good idea to replace them with CUFIX from Aksimentiev group.
- The amber14sb_parmbsc1_cufix is available in this repo.
- The amber OL15 can be downloaded from the gromacs web-site.

### Simulating disordered proteins
- There is CHARMM36m (2016) ff, it is now recommended for all protein simulations, can be found at MacKerells web-page (see below). Also ports for Gromacs are there.
- In AMBER another way is to use OPC water model (see this paper https://pubs.acs.org/doi/10.1021/acs.jctc.8b01123) with 12-6 HFE Li and Merz ion parameters. We need to add a gromacs prot here ...

### Simulations of proteins and protein folding
- Generally there are two options standard latest AMBER or CHARMM force fields.
- See AMBER manual for AMBER, currently the ff14SB is recommended.
- See MacKerell web-site for CHARMM http://mackerell.umaryland.edu/charmm_ff.shtml . Strictly speaking the charmm ff is updated with each new release of charmm (currently 44). However, since CHARMM36 the changes have been small, so on MacKerell's web-page they are reffered as updates to the CHARMM36 ff.

## Links to external ff resources
### AMBER
- http://ambermd.org/AmberModels.php
- http://ambermd.org/doc12/Amber18.pdf see section 3.
- As of 2018 -  ff14SB is the recommended protein force field in Amber.
- ff14SB paper https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4821407/pdf/nihms772276.pdf
- For DNA one should use currently  PARMBSC1 corrections with AMBER or OL15.
- Ion parameters are important see [section 3.6](http://ambermd.org/doc12/Amber18.pdf). Amber currently recommends Li & Merz parameters (2015).
- [CUFIX corrections](http://bionano.physics.illinois.edu/CUFIX) by Yoo & Aksimentiev, 2018, are important for charged systems
- [OL ff refinements for DNA and RNA](https://fch.upol.cz/ff_ol/index.php)
- [OPC water model](https://bioinformatics.cs.vt.edu/~izadi/)



 
