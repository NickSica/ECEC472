module divider
	#(parameter C_NUM_BITS = 24)
	(input  CK,
	 input  RN,
	 input  E,
	 input  [C_NUM_BITS - 1:0] A,
	 input  [C_NUM_BITS - 1:0] B,
	 output [C_NUM_BITS - 1:0] Q);

	wire [C_NUM_BITS - 1:0] sub;
	wire [C_NUM_BITS - 1:0] add;
	wire [C_NUM_BITS - 1:0] alu;
	wire [C_NUM_BITS - 1:0] rem;
	wire [C_NUM_BITS - 1:0] quo;
	wire [7:0] count;
	wire GCK;
	wire R;
	wire sri;
	wire gt;
	wire eq;
	wire lt;
	wire shift;
	wire valid;

	CLKGATE_X1 CG0
		(.CK(CK),
		 .E(E),
		 .GCK(GCK));

	genvar i;
	generate
		for(i = 0; i < C_NUM_BITS; i++) begin : g_latch
			DLH_X1 L0
				(.D(quo[i]),
				 .G(valid),
				 .Q(Q[i]));
		end
	endgenerate

	// ALU logic
	full_subtractor_24bit S0
		(.a0 (rem[0]),
		 .a1 (rem[1]),
		 .a2 (rem[2]),
		 .a3 (rem[3]),
		 .a4 (rem[4]),
		 .a5 (rem[5]),
		 .a6 (rem[6]),
		 .a7 (rem[7]),
		 .a8 (rem[8]),
		 .a9 (rem[9]),
		 .a10(rem[10]),
		 .a11(rem[11]),
		 .a12(rem[12]),
		 .a13(rem[13]),
		 .a14(rem[14]),
		 .a15(rem[15]),
		 .a16(rem[16]),
		 .a17(rem[17]),
		 .a18(rem[18]),
		 .a19(rem[19]),
		 .a20(rem[20]),
		 .a21(rem[21]),
		 .a22(rem[22]),
		 .a23(rem[23]),
		 .b0 (B[0]),
		 .b1 (B[1]),
		 .b2 (B[2]),
		 .b3 (B[3]),
		 .b4 (B[4]),
		 .b5 (B[5]),
		 .b6 (B[6]),
		 .b7 (B[7]),
		 .b8 (B[8]),
		 .b9 (B[9]),
		 .b10(B[10]),
		 .b11(B[11]),
		 .b12(B[12]),
		 .b13(B[13]),
		 .b14(B[14]),
		 .b15(B[15]),
		 .b16(B[16]),
		 .b17(B[17]),
		 .b18(B[18]),
		 .b19(B[19]),
		 .b20(B[20]),
		 .b21(B[21]),
		 .b22(B[22]),
		 .b23(B[23]),
		 .s0 (sub[0]),
		 .s1 (sub[1]),
		 .s2 (sub[2]),
		 .s3 (sub[3]),
		 .s4 (sub[4]),
		 .s5 (sub[5]),
		 .s6 (sub[6]),
		 .s7 (sub[7]),
		 .s8 (sub[8]),
		 .s9 (sub[9]),
		 .s10(sub[10]),
		 .s11(sub[11]),
		 .s12(sub[12]),
		 .s13(sub[13]),
		 .s14(sub[14]),
		 .s15(sub[15]),
		 .s16(sub[16]),
		 .s17(sub[17]),
		 .s18(sub[18]),
		 .s19(sub[19]),
		 .s20(sub[20]),
		 .s21(sub[21]),
		 .s22(sub[22]),
		 .s23(sub[23]),
		 .cout());

	full_adder_24bit A0
		(.a0 (rem[0]),
		 .a1 (rem[1]),
		 .a2 (rem[2]),
		 .a3 (rem[3]),
		 .a4 (rem[4]),
		 .a5 (rem[5]),
		 .a6 (rem[6]),
		 .a7 (rem[7]),
		 .a8 (rem[8]),
		 .a9 (rem[9]),
		 .a10(rem[10]),
		 .a11(rem[11]),
		 .a12(rem[12]),
		 .a13(rem[13]),
		 .a14(rem[14]),
		 .a15(rem[15]),
		 .a16(rem[16]),
		 .a17(rem[17]),
		 .a18(rem[18]),
		 .a19(rem[19]),
		 .a20(rem[20]),
		 .a21(rem[21]),
		 .a22(rem[22]),
		 .a23(rem[23]),
		 .b0 (B[0]),
		 .b1 (B[1]),
		 .b2 (B[2]),
		 .b3 (B[3]),
		 .b4 (B[4]),
		 .b5 (B[5]),
		 .b6 (B[6]),
		 .b7 (B[7]),
		 .b8 (B[8]),
		 .b9 (B[9]),
		 .b10(B[10]),
		 .b11(B[11]),
		 .b12(B[12]),
		 .b13(B[13]),
		 .b14(B[14]),
		 .b15(B[15]),
		 .b16(B[16]),
		 .b17(B[17]),
		 .b18(B[18]),
		 .b19(B[19]),
		 .b20(B[20]),
		 .b21(B[21]),
		 .b22(B[22]),
		 .b23(B[23]),
		 .s0 (add[0]),
		 .s1 (add[1]),
		 .s2 (add[2]),
		 .s3 (add[3]),
		 .s4 (add[4]),
		 .s5 (add[5]),
		 .s6 (add[6]),
		 .s7 (add[7]),
		 .s8 (add[8]),
		 .s9 (add[9]),
		 .s10(add[10]),
		 .s11(add[11]),
		 .s12(add[12]),
		 .s13(add[13]),
		 .s14(add[14]),
		 .s15(add[15]),
		 .s16(add[16]),
		 .s17(add[17]),
		 .s18(add[18]),
		 .s19(add[19]),
		 .s20(add[20]),
		 .s21(add[21]),
		 .s22(add[22]),
		 .s23(add[23]),
		 .cout());

	genvar i;
	generate
		for(i = 0; i < C_NUM_BITS; i++) begin : g_alu
			MUX2_X1 MUX
				(.A(sub[i]),
				 .B(add[i]),
				 .S(lt),
				 .Z(alu[i]));
		end
	endgenerate

	// Control logic
	comparator_24bit COMP0
		(.a0 (rem[0]),
		 .a1 (rem[1]),
		 .a2 (rem[2]),
		 .a3 (rem[3]),
		 .a4 (rem[4]),
		 .a5 (rem[5]),
		 .a6 (rem[6]),
		 .a7 (rem[7]),
		 .a8 (rem[8]),
		 .a9 (rem[9]),
		 .a10(rem[10]),
		 .a11(rem[11]),
		 .a12(rem[12]),
		 .a13(rem[13]),
		 .a14(rem[14]),
		 .a15(rem[15]),
		 .a16(rem[16]),
		 .a17(rem[17]),
		 .a18(rem[18]),
		 .a19(rem[19]),
		 .a20(rem[20]),
		 .a21(rem[21]),
		 .a22(rem[22]),
		 .a23(rem[23]),
		 .b0 (1'b0),
		 .b1 (1'b0),
		 .b2 (1'b0),
		 .b3 (1'b0),
		 .b4 (1'b0),
		 .b5 (1'b0),
		 .b6 (1'b0),
		 .b7 (1'b0),
		 .b8 (1'b0),
		 .b9 (1'b0),
		 .b10(1'b0),
		 .b11(1'b0),
		 .b12(1'b0),
		 .b13(1'b0),
		 .b14(1'b0),
		 .b15(1'b0),
		 .b16(1'b0),
		 .b17(1'b0),
		 .b18(1'b0),
		 .b19(1'b0),
		 .b20(1'b0),
		 .b21(1'b0),
		 .b22(1'b0),
		 .b23(1'b0),
		 .gt(gt),
		 .eq(eq),
		 .lt(lt));

	counter C0
		(.CK(GCK),
		 .RN(RN),
		 .Q0(count[0]),
		 .Q1(count[1]),
		 .Q2(count[2]),
		 .Q3(count[3]),
		 .Q4(count[4]),
		 .Q5(count[5]),
		 .Q6(count[6]),
		 .Q7(count[7]));

	AND2_X1 AND0
		(.A1(count[3]),
		 .A2(count[4]),
		 .ZN(valid));

	// Shift register logic
	MUX2_X1 MUX
		(.A(1'b1),
		 .B(1'b0),
		 .S(lt),
		 .Z(sri));

	OR4_X1 O30
		(.A1(gt),
		 .A2(eq),
		 .A3(lt),
		 .A4(R),
		 .ZN(shift));

	INV_X1 I0
		(.A(RN),
		 .ZN(R));

	univ_shift_reg
		#(.C_NUM_BITS(C_NUM_BITS))
		remainder (.CK(GCK),
							 .RN(RN),
							 .S0(1'b1),
							 .S1(1'b1),
							 .SRI(Q[C_NUM_BITS - 1]),
							 .SLI(),
							 .D({ alu[C_NUM_BITS - 2:0], Q[C_NUM_BITS - 1] }),
							 .Q(rem));

	univ_shift_reg
		#(.C_NUM_BITS(C_NUM_BITS))
		quotient (.CK(GCK),
							.RN(1'b1),
							.S0(R),
							.S1(shift),
							.SRI(sri),
							.SLI(rem[C_NUM_BITS - 1]),
							.D(A),
							.Q(quo));

endmodule
