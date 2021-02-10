* SPICE NETLIST
***************************************

.SUBCKT M1_P_CDNS_612924060624
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_N_CDNS_612924060623
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT gil_cell_mixer VIF_n gnd! VRF_p VLO_p vdd! VRF_n VLO_n VIF_p
** N=10 EP=8 IP=16 FDC=8
M0 2 VRF_p gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.1025e-14 AS=1.0125e-14 PD=4.25e-07 PS=4.05e-07 $X=335 $Y=-1955 $D=1
M1 2 VLO_p VIF_n gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.1025e-14 AS=1.0125e-14 PD=4.25e-07 PS=4.05e-07 $X=335 $Y=-1080 $D=1
M2 7 VLO_p VIF_p gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.1025e-14 AS=1.0125e-14 PD=4.25e-07 PS=4.05e-07 $X=335 $Y=-420 $D=1
M3 gnd! VRF_n 7 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.0125e-14 AS=1.1025e-14 PD=4.05e-07 PS=4.25e-07 $X=1085 $Y=-1955 $D=1
M4 VIF_n VLO_n 7 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.0125e-14 AS=1.1025e-14 PD=4.05e-07 PS=4.25e-07 $X=1085 $Y=-1080 $D=1
M5 VIF_p VLO_n 2 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.0125e-14 AS=1.1025e-14 PD=4.05e-07 PS=4.25e-07 $X=1085 $Y=-420 $D=1
M6 vdd! gnd! VIF_p vdd! PMOS_VTL L=5e-08 W=9e-08 AD=1.0125e-14 AS=1.1025e-14 PD=4.05e-07 PS=4.25e-07 $X=355 $Y=500 $D=0
M7 VIF_n gnd! vdd! vdd! PMOS_VTL L=5e-08 W=9e-08 AD=1.1025e-14 AS=1.0125e-14 PD=4.25e-07 PS=4.05e-07 $X=1065 $Y=500 $D=0
.ENDS
***************************************
