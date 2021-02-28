module shift_reg #(int C_NUM_REGS = 255) (
	input  CK,
	input  D,
	output Q);

	wire [C_NUM_REGS:0] ff_out;

	genvar i;
	for(i = 0; i < C_NUM_REGS; i += 1) begin : g_regs
		DFF_X1(ff_out[i],
		       CK,
		       ff_out[i + 1],);
	end

	assign Q = ff_out[C_NUM_REGS];

endmodule
