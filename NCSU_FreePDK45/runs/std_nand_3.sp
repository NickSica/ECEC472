* SPICE NETLIST
***************************************

.SUBCKT M1_P_CDNS_605917297330
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_CDNS_605917297336
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT std_nand_3 a gnd! b c vdd! out
** N=8 EP=6 IP=4 FDC=6
M0 7 a gnd! gnd! NMOS_VTL L=5e-08 W=4.4e-07 AD=6.6e-14 AS=6.27e-14 PD=1.18e-06 PS=1.165e-06 $X=405 $Y=-1245 $D=1
M1 8 b 7 gnd! NMOS_VTL L=5e-08 W=4.4e-07 AD=8.58e-14 AS=6.6e-14 PD=1.27e-06 PS=1.18e-06 $X=805 $Y=-1245 $D=1
M2 out c 8 gnd! NMOS_VTL L=5e-08 W=4.4e-07 AD=6.095e-14 AS=8.58e-14 PD=1.165e-06 PS=1.27e-06 $X=1295 $Y=-1245 $D=1
M3 out a vdd! vdd! PMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=2.4525e-14 PD=4.8e-07 PS=7.25e-07 $X=405 $Y=325 $D=0
M4 vdd! b out vdd! PMOS_VTL L=5e-08 W=9e-08 AD=2.88e-14 AS=1.35e-14 PD=8.2e-07 PS=4.8e-07 $X=805 $Y=325 $D=0
M5 out c vdd! vdd! PMOS_VTL L=5e-08 W=9e-08 AD=1.2825e-14 AS=2.88e-14 PD=4.65e-07 PS=8.2e-07 $X=1295 $Y=325 $D=0
.ENDS
***************************************
