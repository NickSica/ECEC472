* SPICE NETLIST
***************************************

.SUBCKT M1_P_CDNS_605992244312
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_N_CDNS_605992244313
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_CDNS_605992244315
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_POLY_CDNS_605992244319
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_N_CDNS_605992244314
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_CDNS_605992244318
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_N_CDNS_605992244317
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT std_nand_15 1 2 3 4 5
** N=6 EP=5 IP=9 FDC=4
M0 6 4 1 1 NMOS_VTL L=5e-08 W=2e-07 AD=3.3e-14 AS=2.985e-14 PD=7.3e-07 PS=7.15e-07 $X=405 $Y=-845 $D=1
M1 2 5 6 1 NMOS_VTL L=5e-08 W=2e-07 AD=2.85e-14 AS=3.3e-14 PD=6.85e-07 PS=7.3e-07 $X=835 $Y=-845 $D=1
M2 2 4 3 3 PMOS_VTL L=5e-08 W=9e-08 AD=1.485e-14 AS=2.4525e-14 PD=5.1e-07 PS=7.25e-07 $X=405 $Y=325 $D=0
M3 3 5 2 3 PMOS_VTL L=5e-08 W=9e-08 AD=2.4075e-14 AS=1.485e-14 PD=7.15e-07 PS=5.1e-07 $X=835 $Y=325 $D=0
.ENDS
***************************************
.SUBCKT std_d_flip_flop clk gnd! D vdd! Q Q'
** N=12 EP=6 IP=35 FDC=26
M0 11 1 gnd! gnd! NMOS_VTL L=5e-08 W=4.4e-07 AD=6.6e-14 AS=6.27e-14 PD=1.18e-06 PS=1.165e-06 $X=1735 $Y=-1245 $D=1
M1 12 clk 11 gnd! NMOS_VTL L=5e-08 W=4.4e-07 AD=8.58e-14 AS=6.6e-14 PD=1.27e-06 PS=1.18e-06 $X=2135 $Y=-1245 $D=1
M2 3 4 12 gnd! NMOS_VTL L=5e-08 W=4.4e-07 AD=6.27e-14 AS=8.58e-14 PD=1.165e-06 PS=1.27e-06 $X=2625 $Y=-1245 $D=1
M3 3 1 vdd! vdd! PMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=2.4525e-14 PD=4.8e-07 PS=7.25e-07 $X=1735 $Y=325 $D=0
M4 vdd! clk 3 vdd! PMOS_VTL L=5e-08 W=9e-08 AD=2.88e-14 AS=1.35e-14 PD=8.2e-07 PS=4.8e-07 $X=2135 $Y=325 $D=0
M5 3 4 vdd! vdd! PMOS_VTL L=5e-08 W=9e-08 AD=1.2825e-14 AS=2.88e-14 PD=4.65e-07 PS=8.2e-07 $X=2625 $Y=325 $D=0
X16 gnd! 1 vdd! D 3 std_nand_15 $T=0 0 0 0 $X=0 $Y=-1795
X17 gnd! 4 vdd! clk 8 std_nand_15 $T=3120 0 0 0 $X=3120 $Y=-1795
X18 gnd! 8 vdd! 1 4 std_nand_15 $T=4450 0 0 0 $X=4450 $Y=-1795
X19 gnd! Q vdd! 4 Q' std_nand_15 $T=5780 0 0 0 $X=5780 $Y=-1795
X20 gnd! Q' vdd! Q 3 std_nand_15 $T=7110 0 0 0 $X=7110 $Y=-1795
.ENDS
***************************************
