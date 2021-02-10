* SPICE NETLIST
***************************************

.SUBCKT M1_N_CDNS_604437425683
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_CDNS_604437425682
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_N_CDNS_604437425684
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_CDNS_604437425685
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT std_inv_chain in gnd! vdd! out
** N=6 EP=4 IP=12 FDC=6
M0 2 in gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.0125e-14 AS=2.385e-14 PD=4.05e-07 PS=7.1e-07 $X=510 $Y=-505 $D=1
M1 3 2 gnd! gnd! NMOS_VTL L=5e-08 W=3.325e-07 AD=4.15625e-14 AS=3.74062e-14 PD=9.15e-07 PS=8.9e-07 $X=1220 $Y=-990 $D=1
M2 out 3 gnd! gnd! NMOS_VTL L=5e-08 W=1.225e-06 AD=1.37812e-13 AS=1.37812e-13 PD=2.675e-06 PS=2.675e-06 $X=1955 $Y=-2775 $D=1
M3 2 in vdd! vdd! PMOS_VTL L=5e-08 W=1.425e-07 AD=1.60312e-14 AS=2.9625e-14 PD=5.1e-07 PS=7.8e-07 $X=510 $Y=255 $D=0
M4 3 2 vdd! vdd! PMOS_VTL L=5e-08 W=5.25e-07 AD=6.5625e-14 AS=5.90625e-14 PD=1.3e-06 PS=1.275e-06 $X=1220 $Y=255 $D=0
M5 out 3 vdd! vdd! PMOS_VTL L=5e-08 W=1.94e-06 AD=2.1825e-13 AS=2.1825e-13 PD=4.105e-06 PS=4.105e-06 $X=1955 $Y=255 $D=0
.ENDS
***************************************
