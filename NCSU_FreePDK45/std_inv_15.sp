* SPICE NETLIST
***************************************

.SUBCKT std_inv_15 in gnd! vdd! out
** N=4 EP=4 IP=0 FDC=2
M0 out in gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=9.45e-15 AS=9.45e-15 PD=3.9e-07 PS=3.9e-07 $X=565 $Y=-790 $D=1
M1 out in vdd! vdd! PMOS_VTL L=5e-08 W=1.425e-07 AD=1.49625e-14 AS=1.49625e-14 PD=4.95e-07 PS=4.95e-07 $X=565 $Y=140 $D=0
.ENDS
***************************************
