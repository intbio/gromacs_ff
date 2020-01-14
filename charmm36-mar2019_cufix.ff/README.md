# CHARMM force field from MacKerrel Lab
This directory contains the same ff as charmm36-mar2019.ff but with CUFIX for ions from Aksimentiev lab.
http://bionano.physics.illinois.edu/CUFIX

- The Aksimentiev NBFIXes CUFIX are available in charmm format (https://www.dropbox.com/s/3v1ng0nwm74qciv/toppar_water_ions_cufix.str?dl=0). They would replace both Na Cl and Na - carboxylate and a lot more with repect to standard (which is without NBFIX - i.e. pre Luo and Roux corrections).

- We ported them to GROMACS format, to that end we modified nbfix.itp.
Currently this work is in porgress:
	- We downoladed the CHARMM CUFIX as [toppar_water_ions_cufix.str](toppar_water_ions_cufix.str)
	- We simplyfied it by comparing to [toppar_c36_jul18/toppar_water_ions.str](toppar_c36_jul18/toppar_water_ions.str)
	- Only NBFIXes were left and NBFIXes for atomtypes introduced in CUFIX were deleted (e.g. Mg-hexahydrate) [toppar_water_ions_cufix_simpl.str](toppar_water_ions_cufix_simpl.str)
	- nbfix.itp from charmm gromacs port was examined: 1) NBFIXes that corresponded to changing ion-ion and ion-atom paramters that were present in original [toppar_c36_jul18/toppar_water_ions.str](toppar_c36_jul18/toppar_water_ions.str) were commented out (since they would be replaced from new CUFIX str-file as it does not inherit any of the NBFIXes), 2) NBFIXes that we found to be redefined in [toppar_water_ions_cufix_simpl.str](toppar_water_ions_cufix_simpl.str) were also commented out, since they would be replaced, 3) other NBFIxes where checked to confirm that they come from other prm files and need to be retained, respective notes were added.
	- Next we used convert_cufix.py >> nbfix.itp to add the converted CUFIX parameters from [toppar_water_ions_cufix.str](toppar_water_ions_cufix.str) to nbfix.itp
