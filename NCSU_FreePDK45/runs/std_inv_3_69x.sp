* SPICE NETLIST
***************************************

.SUBCKT M1_N_CDNS_604613721453
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_CDNS_604613721452
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT std_inv_3_69x in out vdd! gnd!
** N=4 EP=4 IP=4 FDC=4
M0 out in gnd! gnd! NMOS_VTL L=5e-08 W=1.65e-07 AD=2.31e-14 AS=2.76e-14 PD=6.1e-07 PS=7.1e-07 $X=390 $Y=-655 $D=1
M1 gnd! in out gnd! NMOS_VTL L=5e-08 W=1.65e-07 AD=2.76e-14 AS=2.31e-14 PD=7.1e-07 PS=6.1e-07 $X=770 $Y=-655 $D=1
M2 out in vdd! vdd! PMOS_VTL L=5e-08 W=2.625e-07 AD=3.675e-14 AS=3.675e-14 PD=8.05e-07 PS=8.05e-07 $X=390 $Y=255 $D=0
M3 vdd! in out vdd! PMOS_VTL L=5e-08 W=2.625e-07 AD=2.95312e-14 AS=3.675e-14 PD=7.5e-07 PS=8.05e-07 $X=770 $Y=255 $D=0
.ENDS
***************************************
