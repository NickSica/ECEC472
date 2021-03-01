module shift_reg
	#(parameter C_NUM_REGS = 10)
	(input  CK,
	 input  D,
	 output Q);

	wire [C_NUM_REGS:0] ff_out;

	genvar i;
	for(i = 0; i < C_NUM_REGS; i = i + 1) begin : g_regs
		DFF_X1 DFF
			(ff_out[i],
			 CK,
			 ff_out[i + 1],);
	end

	DFF_X1 DFF0
		(ff_out[C_NUM_REGS],
		 CK,
		 Q,);

	//assign Q = ff_out[C_NUM_REGS];

endmodule
