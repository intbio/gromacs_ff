Downloaded from http://www.gromacs.org/Downloads/User_contributions/Force_fields

## Validation
Let's check if the new deafult ion params are there.
By default in Amber18 leaprc.water.tip3p loads for monovalent Joung and Cheatham 2008 ions.
[frcmod.ionsjc_tip3p](../misc/frcmod.ionsjc_tip3p)

```
Gromacs
K           19      39.10    0.0000  A   3.03797e-01  8.10369e-01
Amber
K+       1.705     0.1936829
```
0.1936829 kcal/mol = 4.184*0.1936829 = 0.8103692536 kJ/mol
vdw radius of 1.705 A => 1.705/(2)^(1/6)=1.5189823144292784*2=3.037964628858557


