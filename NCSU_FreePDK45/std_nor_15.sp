* SPICE NETLIST
***************************************

.SUBCKT M1_N_CDNS_603930805000
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_CDNS_603930805004
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT std_nor_15 a vdd! b out gnd!
** N=6 EP=5 IP=4 FDC=4
M0 out a gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=2.385e-14 PD=4.8e-07 PS=7.1e-07 $X=405 $Y=-570 $D=1
M1 gnd! b out gnd! NMOS_VTL L=5e-08 W=9e-08 AD=2.385e-14 AS=1.35e-14 PD=7.1e-07 PS=4.8e-07 $X=805 $Y=-570 $D=1
M2 6 a vdd! vdd! PMOS_VTL L=5e-08 W=5.475e-07 AD=8.2125e-14 AS=6.15937e-14 PD=1.395e-06 PS=1.32e-06 $X=405 $Y=370 $D=0
M3 out b 6 vdd! PMOS_VTL L=5e-08 W=5.475e-07 AD=6.15937e-14 AS=8.2125e-14 PD=1.32e-06 PS=1.395e-06 $X=805 $Y=370 $D=0
.ENDS
***************************************
