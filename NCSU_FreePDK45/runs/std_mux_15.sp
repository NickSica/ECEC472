* SPICE NETLIST
***************************************

.SUBCKT M2_M1_via
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_CDNS_604456173591
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_N_CDNS_604456173592
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_CDNS_604456173594
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_N_CDNS_604456173593
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT std_mux_15 SEL IN0 Q IN1 gnd! vdd!
** N=12 EP=6 IP=21 FDC=14
M0 2 SEL gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.0125e-14 AS=2.385e-14 PD=4.05e-07 PS=7.1e-07 $X=440 $Y=-505 $D=1
M1 10 2 gnd! gnd! NMOS_VTL L=5e-08 W=2e-07 AD=2.8e-14 AS=2.935e-14 PD=6.8e-07 PS=7.1e-07 $X=1205 $Y=-725 $D=1
M2 4 IN0 10 gnd! NMOS_VTL L=5e-08 W=2e-07 AD=2.25e-14 AS=2.8e-14 PD=6.25e-07 PS=6.8e-07 $X=1585 $Y=-725 $D=1
M3 11 4 gnd! gnd! NMOS_VTL L=5e-08 W=2e-07 AD=2.8e-14 AS=2.935e-14 PD=6.8e-07 PS=7.1e-07 $X=2405 $Y=-725 $D=1
M4 Q 6 11 gnd! NMOS_VTL L=5e-08 W=2e-07 AD=2.25e-14 AS=2.8e-14 PD=6.25e-07 PS=6.8e-07 $X=2785 $Y=-725 $D=1
M5 12 IN1 6 gnd! NMOS_VTL L=5e-08 W=2e-07 AD=2.8e-14 AS=2.8e-14 PD=6.8e-07 PS=6.8e-07 $X=3605 $Y=-725 $D=1
M6 gnd! SEL 12 gnd! NMOS_VTL L=5e-08 W=2e-07 AD=2.935e-14 AS=2.8e-14 PD=7.1e-07 PS=6.8e-07 $X=3985 $Y=-725 $D=1
M7 2 SEL vdd! vdd! PMOS_VTL L=5e-08 W=1.425e-07 AD=1.60312e-14 AS=2.6475e-14 PD=5.1e-07 PS=7.1e-07 $X=440 $Y=325 $D=0
M8 4 2 vdd! vdd! PMOS_VTL L=5e-08 W=9e-08 AD=1.26e-14 AS=2.385e-14 PD=4.6e-07 PS=7.1e-07 $X=1205 $Y=325 $D=0
M9 vdd! IN0 4 vdd! PMOS_VTL L=5e-08 W=9e-08 AD=2.88e-14 AS=1.26e-14 PD=8.2e-07 PS=4.6e-07 $X=1585 $Y=325 $D=0
M10 Q 4 vdd! vdd! PMOS_VTL L=5e-08 W=9e-08 AD=1.26e-14 AS=2.385e-14 PD=4.6e-07 PS=7.1e-07 $X=2405 $Y=325 $D=0
M11 vdd! 6 Q vdd! PMOS_VTL L=5e-08 W=9e-08 AD=2.88e-14 AS=1.26e-14 PD=8.2e-07 PS=4.6e-07 $X=2785 $Y=325 $D=0
M12 6 IN1 vdd! vdd! PMOS_VTL L=5e-08 W=9e-08 AD=1.26e-14 AS=2.88e-14 PD=4.6e-07 PS=8.2e-07 $X=3605 $Y=325 $D=0
M13 vdd! SEL 6 vdd! PMOS_VTL L=5e-08 W=9e-08 AD=2.385e-14 AS=1.26e-14 PD=7.1e-07 PS=4.6e-07 $X=3985 $Y=325 $D=0
.ENDS
***************************************
