module divider_4bit
	#(parameter C_NUM_BITS = 4)
	(input  CK,
	 input  RN,
	 input  E,
	 input  [C_NUM_BITS - 1:0] A,
	 input  [C_NUM_BITS - 1:0] B,
	 output [C_NUM_BITS - 1:0] Q);

	wire [C_NUM_BITS - 1:0] sub;
	wire [C_NUM_BITS - 1:0] add;
	wire [C_NUM_BITS - 1:0] alu;
	wire [C_NUM_BITS - 1:0] rem_in;
	wire [C_NUM_BITS - 1:0] rem;
	wire [C_NUM_BITS - 1:0] quo;
	wire [7:0] count;
	wire GCK;
	wire R;
	wire sri;
	wire is_sub;
	wire shift_quo;
	wire shift_rem;
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
		 .a4 (1'b0),
		 .a5 (1'b0),
		 .a6 (1'b0),
		 .a7 (1'b0),
		 .a8 (1'b0),
		 .a9 (1'b0),
		 .a10(1'b0),
		 .a11(1'b0),
		 .a12(1'b0),
		 .a13(1'b0),
		 .a14(1'b0),
		 .a15(1'b0),
		 .a16(1'b0),
		 .a17(1'b0),
		 .a18(1'b0),
		 .a19(1'b0),
		 .a20(1'b0),
		 .a21(1'b0),
		 .a22(1'b0),
		 .a23(1'b0),
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
		 .s0 (sub[0]),
		 .s1 (sub[1]),
		 .s2 (sub[2]),
		 .s3 (sub[3]),
		 .s4 (),
		 .s5 (),
		 .s6 (),
		 .s7 (),
		 .s8 (),
		 .s9 (),
		 .s10(),
		 .s11(),
		 .s12(),
		 .s13(),
		 .s14(),
		 .s15(),
		 .s16(),
		 .s17(),
		 .s18(),
		 .s19(),
		 .s20(),
		 .s21(),
		 .s22(),
		 .s23(),
		 .cout());

	full_adder_24bit A0
		(.a0 (rem[0]),
		 .a1 (rem[1]),
		 .a2 (rem[2]),
		 .a3 (rem[3]),
		 .a4 (1'b0),
		 .a5 (1'b0),
		 .a6 (1'b0),
		 .a7 (1'b0),
		 .a8 (1'b0),
		 .a9 (1'b0),
		 .a10(1'b0),
		 .a11(1'b0),
		 .a12(1'b0),
		 .a13(1'b0),
		 .a14(1'b0),
		 .a15(1'b0),
		 .a16(1'b0),
		 .a17(1'b0),
		 .a18(1'b0),
		 .a19(1'b0),
		 .a20(1'b0),
		 .a21(1'b0),
		 .a22(1'b0),
		 .a23(1'b0),
		 .b0 (B[0]),
		 .b1 (B[1]),
		 .b2 (B[2]),
		 .b3 (B[3]),
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
		 .s0 (add[0]),
		 .s1 (add[1]),
		 .s2 (add[2]),
		 .s3 (add[3]),
		 .s4 (),
		 .s5 (),
		 .s6 (),
		 .s7 (),
		 .s8 (),
		 .s9 (),
		 .s10(),
		 .s11(),
		 .s12(),
		 .s13(),
		 .s14(),
		 .s15(),
		 .s16(),
		 .s17(),
		 .s18(),
		 .s19(),
		 .s20(),
		 .s21(),
		 .s22(),
		 .s23(),
		 .cin(1'b0),
		 .cout());

	genvar i;
	generate
		for(i = 0; i < C_NUM_BITS; i++) begin : g_alu
			MUX2_X1 MUX
				(.A(sub[i]),
				 .B(add[i]),
				 .S(count[0]),
				 .Z(alu[i]));
		end
	endgenerate

	// Control logic
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
		(.A1(count[1]),
		 .A2(count[3]),
		 .ZN(valid));

	// Shift register logic
	MUX2_X1 MUX
		(.A(1'b1),
		 .B(1'b0),
		 .S(rem[C_NUM_BITS - 1]),
		 .Z(sri));

	INV_X1 INV0
		(.A(count[0]),
		 .ZN(is_sub));

	OR2_X1 O20
		(.A1(rem[C_NUM_BITS - 1]),
		 .A2(is_sub),
		 .ZN(shift_rem));

	OR2_X1 O30
		(.A1(count[0]),
		 .A2(R),
		 .ZN(shift_quo));

	genvar i;
	generate
		for(i = 1; i < C_NUM_BITS; i++) begin : g_rem_in
			MUX2_X1 MUX
				(.A(alu[i]),
				 .B(alu[i - 1]),
				 .S(count[0]),
				 .Z(rem_in[i]));
		end
	endgenerate

	MUX2_X1 MUX1
		(.A(alu[0]),
		 .B(quo[C_NUM_BITS - 1]),
		 .S(count[0]),
		 .Z(rem_in[0]));

	INV_X1 INV1
		(.A(RN),
		 .ZN(R));

	univ_shift_reg
		#(.C_NUM_BITS(C_NUM_BITS))
		remainder (.CK(GCK),
							 .RN(RN),
							 .S0(shift_rem),
							 .S1(1'b1),
							 .SRI(quo[C_NUM_BITS - 1]),
							 .SLI(),
							 .D(rem_in),
							 .Q(rem));

	univ_shift_reg
		#(.C_NUM_BITS(C_NUM_BITS))
		quotient (.CK(GCK),
							.RN(1'b1),
							.S0(R),
							.S1(shift_quo),
							.SRI(sri),
							.SLI(rem[C_NUM_BITS - 1]),
							.D(A),
							.Q(quo));

endmodule
