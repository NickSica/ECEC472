module shift_reg #(int C_NUM_REGS) (
	input  CK,
	input  D,
	output Q);

	wire [C_NUM_REGS:0] ff_out;

	genvar i;
	for(i = 0; i < C_NUM_REGS; i++) begin : g_regs
		DFF_X1(.D(ff_out[i]),
		       .CK(CK),
		       .Q(ff_out[i + 1]),
		       .QN());
	end

	assign Q = ff_out[C_NUM_REGS];

endmodule shift_reg
