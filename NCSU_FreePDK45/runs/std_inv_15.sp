* SPICE NETLIST
***************************************

.SUBCKT M1_N_CDNS_604616423542
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_CDNS_604616423544
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT std_inv_15 in gnd! vdd! out
** N=4 EP=4 IP=4 FDC=2
M0 out in gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.0125e-14 AS=1.0125e-14 PD=4.05e-07 PS=4.05e-07 $X=335 $Y=-490 $D=1
M1 out in vdd! vdd! PMOS_VTL L=5e-08 W=1.425e-07 AD=1.60312e-14 AS=1.60312e-14 PD=5.1e-07 PS=5.1e-07 $X=335 $Y=265 $D=0
.ENDS
***************************************
