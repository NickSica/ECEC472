* SPICE NETLIST
***************************************

.SUBCKT M1_N_CDNS_612906862773
** N=2 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_CDNS_612906862772
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT mixer VIF_p VLO_p VIF_n VLO_n gnd!
** N=5 EP=5 IP=18 FDC=4
M0 VIF_n VLO_p gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.1025e-14 AS=1.0125e-14 PD=4.25e-07 PS=4.05e-07 $X=335 $Y=-1350 $D=1
M1 VIF_p VLO_p gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.1025e-14 AS=1.0125e-14 PD=4.25e-07 PS=4.05e-07 $X=335 $Y=-690 $D=1
M2 gnd! VLO_n VIF_p gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.0125e-14 AS=1.1025e-14 PD=4.05e-07 PS=4.25e-07 $X=1085 $Y=-1350 $D=1
M3 gnd! VLO_n VIF_n gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.0125e-14 AS=1.1025e-14 PD=4.05e-07 PS=4.25e-07 $X=1085 $Y=-690 $D=1
*.CALIBRE WARNING SHORT Short circuit(s) detected by extraction in this cell. See extraction report for details.
.ENDS
***************************************
