with open('toppar_water_ions_cufix_simpl.str','r') as f:
	for l in f.readlines():
		if(l[0]=='!'):
			continue
		else:
			a=l.split()
			if(len(a)>3):
				print('%s %s 1 %f %f'%(a[0],a[1],0.1*float(a[3])/(2**(1/6)),-float(a[2])*4.184))