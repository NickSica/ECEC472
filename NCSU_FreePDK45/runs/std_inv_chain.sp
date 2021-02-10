* SPICE NETLIST
***************************************

.SUBCKT M1_P_CDNS_604625030864
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_N_CDNS_604625030862
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_CDNS_604625030865
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_N_CDNS_604625030866
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_N_CDNS_604625030860
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_CDNS_604625030863
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_POLY_CDNS_604625030861
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT std_inv_chain gnd! vdd! in out
** N=6 EP=4 IP=31 FDC=16
M0 4 in gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.0125e-14 AS=1.0125e-14 PD=4.05e-07 PS=4.05e-07 $X=335 $Y=-490 $D=1
M1 5 4 gnd! gnd! NMOS_VTL L=5e-08 W=1.65e-07 AD=2.31e-14 AS=2.76e-14 PD=6.1e-07 PS=7.1e-07 $X=1160 $Y=-655 $D=1
M2 gnd! 4 5 gnd! NMOS_VTL L=5e-08 W=1.65e-07 AD=2.76e-14 AS=2.31e-14 PD=7.1e-07 PS=6.1e-07 $X=1540 $Y=-655 $D=1
M3 out 5 gnd! gnd! NMOS_VTL L=5e-08 W=2.45e-07 AD=3.43e-14 AS=3.0625e-14 PD=7.7e-07 PS=7.4e-07 $X=2390 $Y=-815 $D=1
M4 gnd! 5 out gnd! NMOS_VTL L=5e-08 W=2.45e-07 AD=3.43e-14 AS=3.43e-14 PD=7.7e-07 PS=7.7e-07 $X=2770 $Y=-815 $D=1
M5 out 5 gnd! gnd! NMOS_VTL L=5e-08 W=2.45e-07 AD=3.43e-14 AS=3.43e-14 PD=7.7e-07 PS=7.7e-07 $X=3150 $Y=-815 $D=1
M6 gnd! 5 out gnd! NMOS_VTL L=5e-08 W=2.45e-07 AD=3.43e-14 AS=3.43e-14 PD=7.7e-07 PS=7.7e-07 $X=3530 $Y=-815 $D=1
M7 out 5 gnd! gnd! NMOS_VTL L=5e-08 W=2.45e-07 AD=2.75625e-14 AS=3.43e-14 PD=7.15e-07 PS=7.7e-07 $X=3910 $Y=-815 $D=1
M8 4 in vdd! vdd! PMOS_VTL L=5e-08 W=1.425e-07 AD=1.60312e-14 AS=1.60312e-14 PD=5.1e-07 PS=5.1e-07 $X=335 $Y=265 $D=0
M9 5 4 vdd! vdd! PMOS_VTL L=5e-08 W=2.625e-07 AD=3.675e-14 AS=3.675e-14 PD=8.05e-07 PS=8.05e-07 $X=1160 $Y=255 $D=0
M10 vdd! 4 5 vdd! PMOS_VTL L=5e-08 W=2.625e-07 AD=2.95312e-14 AS=3.675e-14 PD=7.5e-07 PS=8.05e-07 $X=1540 $Y=255 $D=0
M11 out 5 vdd! vdd! PMOS_VTL L=5e-08 W=3.875e-07 AD=5.425e-14 AS=4.84375e-14 PD=1.055e-06 PS=1.025e-06 $X=2390 $Y=255 $D=0
M12 vdd! 5 out vdd! PMOS_VTL L=5e-08 W=3.875e-07 AD=5.425e-14 AS=5.425e-14 PD=1.055e-06 PS=1.055e-06 $X=2770 $Y=255 $D=0
M13 out 5 vdd! vdd! PMOS_VTL L=5e-08 W=3.875e-07 AD=5.425e-14 AS=5.425e-14 PD=1.055e-06 PS=1.055e-06 $X=3150 $Y=255 $D=0
M14 vdd! 5 out vdd! PMOS_VTL L=5e-08 W=3.875e-07 AD=5.425e-14 AS=5.425e-14 PD=1.055e-06 PS=1.055e-06 $X=3530 $Y=255 $D=0
M15 out 5 vdd! vdd! PMOS_VTL L=5e-08 W=3.875e-07 AD=4.35937e-14 AS=5.425e-14 PD=1e-06 PS=1.055e-06 $X=3910 $Y=255 $D=0
.ENDS
***************************************
