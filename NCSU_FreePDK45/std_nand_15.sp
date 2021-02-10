* SPICE NETLIST
***************************************

.SUBCKT M1_P_CDNS_603921946580
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT std_nand_15 a gnd! b out vdd!
** N=6 EP=5 IP=2 FDC=4
M0 6 a gnd! gnd! NMOS_VTL L=5e-08 W=2e-07 AD=3.3e-14 AS=2.985e-14 PD=7.3e-07 PS=7.15e-07 $X=935 $Y=-780 $D=1
M1 out b 6 gnd! NMOS_VTL L=5e-08 W=2e-07 AD=3.05e-14 AS=3.3e-14 PD=7.05e-07 PS=7.3e-07 $X=1365 $Y=-780 $D=1
M2 out a vdd! vdd! PMOS_VTL L=5e-08 W=9e-08 AD=1.485e-14 AS=2.4525e-14 PD=5.1e-07 PS=7.25e-07 $X=935 $Y=380 $D=0
M3 vdd! b out vdd! PMOS_VTL L=5e-08 W=9e-08 AD=2.4075e-14 AS=1.485e-14 PD=7.15e-07 PS=5.1e-07 $X=1365 $Y=380 $D=0
.ENDS
***************************************
