/*
 * S0 S1 Op
 * 0  0  No Change
 * 0  1  Shift left
 * 1  0  Shift Right
 * 1  1  Parallel Load
 */

module univ_shift_reg
	#(parameter C_NUM_BITS = 24)
	(input CK,
	 input RN,
	 input S0,
	 input S1,
	 input SRI,
	 input SLI,
	 input [C_NUM_BITS - 1:0] D,
	 output [C_NUM_BITS - 1:0] Q);

	wire [C_NUM_BITS - 1:0] dff_in;

	MUX4 MUX0
		(.D0(Q[0]),
		 .D1(SLI),
		 .D2(Q[2]),
		 .D3(D[0]),
		 .S0(S0),
		 .S1(S1),
		 .Z(dff_in[0]));

	DFFR_X1 DFFR0
		(.CK(CK),
		 .RN(RN),
		 .D(dff_in[0]),
		 .Q(Q[0]),
		 .QN());

	genvar i;
	generate
		for(i = 1; i < C_NUM_BITS - 1; i++) begin : g_regs
			MUX4 MUX
				(.D0(Q[i]),
				 .D1(Q[i - 1]),
				 .D2(Q[i + 1]),
				 .D3(D[i]),
				 .S0(S0),
				 .S1(S1),
				 .Z(dff_in[i]));

			DFFR_X1 DFFR
				(.CK(CK),
				 .RN(RN),
				 .D(dff_in[i]),
				 .Q(Q[i]),
				 .QN());
		end
	endgenerate

	MUX4 MUX1
		(.D0(Q[C_NUM_BITS - 1]),
		 .D1(Q[C_NUM_BITS - 2]),
		 .D2(SRI),
		 .D3(D[C_NUM_BITS - 1]),
		 .S0(S0),
		 .S1(S1),
		 .Z(dff_in[C_NUM_BITS - 1]));

	DFFR_X1 DFFR1
		(.CK(CK),
		 .RN(RN),
		 .D(dff_in[C_NUM_BITS - 1]),
		 .Q(Q[C_NUM_BITS - 1]),
		 .QN());

endmodule
