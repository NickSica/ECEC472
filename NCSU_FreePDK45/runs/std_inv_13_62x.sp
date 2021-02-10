* SPICE NETLIST
***************************************

.SUBCKT M1_N_CDNS_604615522953
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_CDNS_604615522952
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_N_CDNS_604615522954
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_CDNS_604615522955
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT std_inv_13_62x in gnd! vdd! out
** N=4 EP=4 IP=12 FDC=10
M0 out in gnd! gnd! NMOS_VTL L=5e-08 W=2.45e-07 AD=3.43e-14 AS=3.0625e-14 PD=7.7e-07 PS=7.4e-07 $X=360 $Y=-815 $D=1
M1 gnd! in out gnd! NMOS_VTL L=5e-08 W=2.45e-07 AD=3.43e-14 AS=3.43e-14 PD=7.7e-07 PS=7.7e-07 $X=740 $Y=-815 $D=1
M2 out in gnd! gnd! NMOS_VTL L=5e-08 W=2.45e-07 AD=3.43e-14 AS=3.43e-14 PD=7.7e-07 PS=7.7e-07 $X=1120 $Y=-815 $D=1
M3 gnd! in out gnd! NMOS_VTL L=5e-08 W=2.45e-07 AD=3.43e-14 AS=3.43e-14 PD=7.7e-07 PS=7.7e-07 $X=1500 $Y=-815 $D=1
M4 out in gnd! gnd! NMOS_VTL L=5e-08 W=2.45e-07 AD=2.75625e-14 AS=3.43e-14 PD=7.15e-07 PS=7.7e-07 $X=1880 $Y=-815 $D=1
M5 out in vdd! vdd! PMOS_VTL L=5e-08 W=3.875e-07 AD=5.425e-14 AS=4.84375e-14 PD=1.055e-06 PS=1.025e-06 $X=360 $Y=255 $D=0
M6 vdd! in out vdd! PMOS_VTL L=5e-08 W=3.875e-07 AD=5.425e-14 AS=5.425e-14 PD=1.055e-06 PS=1.055e-06 $X=740 $Y=255 $D=0
M7 out in vdd! vdd! PMOS_VTL L=5e-08 W=3.875e-07 AD=5.425e-14 AS=5.425e-14 PD=1.055e-06 PS=1.055e-06 $X=1120 $Y=255 $D=0
M8 vdd! in out vdd! PMOS_VTL L=5e-08 W=3.875e-07 AD=5.425e-14 AS=5.425e-14 PD=1.055e-06 PS=1.055e-06 $X=1500 $Y=255 $D=0
M9 out in vdd! vdd! PMOS_VTL L=5e-08 W=3.875e-07 AD=4.35937e-14 AS=5.425e-14 PD=1e-06 PS=1.055e-06 $X=1880 $Y=255 $D=0
.ENDS
***************************************
