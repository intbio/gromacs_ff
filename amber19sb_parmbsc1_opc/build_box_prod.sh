#!/bin/bash -l
module load amber22

######################################################################################################################################################################################
#                                                   2. solvate system
######################################################################################################################################################################################

$AMBERHOME/bin/tleap -s -f tleap_draft_box.rc


######################################################################################################################################################################################
#                                                   3. calculate number of Na+ and Cl- ions needed to neutralize system and to match the target salt concentration 
######################################################################################################################################################################################

# target KCl concentration
target_Kcl_concentration=0.15  # mol/l

# avogadro_constant
avogadro_constant=6.022140857e+23 # mol-1

# number of KCl molecules in the 1 L KCl solution
n_kcl_in_one_liter=$(awk "BEGIN {print $target_Kcl_concentration * $avogadro_constant; exit}")

# The density of water is ~0.997 g/mL at the room temperature, and thus, the weight of 1 L water is ~997 g.
# Since the weight of 1 mol H2O is ~18.02 g
# e.g. 1 L water is composed of ~3.33 × 10^25 H2O molecules (55.3 mol).
n_h20_in_one_liter=3.33E+25

# extract number of added water molecules by tleap
n_n20=$(grep "^  Added" leap.log | grep "residues" |  awk '{print $2}')

# calcucate the number of KCl molecules to match the target concentration
n0_kcl=$(awk "BEGIN {printf $n_kcl_in_one_liter / $n_h20_in_one_liter * $n_n20; exit}") 
n0_kcl=${n0_kcl%.*}

# extract charge of system
q=$(grep -i "Total solute charge" leap.log | awk '{print $4}')

# final number of K+ and Cl- to neutralize system and to match the target salt concentration 
n_k=$(echo "scale=10; $n0_kcl * sqrt(1 + 1 / (2 * $n0_kcl)^2) - $q / 2" | bc)
n_cl=$(echo "scale=10; $n0_kcl * sqrt(1 + 1 / (2 * $n0_kcl)^2) + $q / 2" | bc -l)
# rounding Numbers
n_k=$(printf %1.0f $n_k)
n_cl=$(printf %1.0f $n_cl)

######################################################################################################################################################################################
#                                                       4. resolvate system to match experimental KCl concentration
######################################################################################################################################################################################

# save input file for tleap
cp tleap_draft_box.rc tleap_box.rc
sed -i s/draft_//g tleap_box.rc
sed -i "s/addions mol K+ 0/addions mol K+ ${n_k}/g" tleap_box.rc
sed -i "s/addions mol Cl- 0/addions mol Cl- ${n_cl}/g" tleap_box.rc

$AMBERHOME/bin/tleap -s -f tleap_box.rc

#####################################################################################################################################################################################
#                                                      5. strip solvent from box.prmtop --> nucleosome.prmtop
#####################################################################################################################################################################################

$AMBERHOME/bin/cpptraj -i cpptraj_strip_solvent.in
