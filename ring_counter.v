module ring_counter #(int C_NUM_CYCLES = 255) (
	input  CK,
	input  RST,
	output Q);

	wire [C_NUM_CYCLES:0] dffrs_out;

	DFFRS_X2(dffrs_out[C_NUM_CYCLES],
	         1'b1,
	         RST,
	         CK,
	         dffrs_out[0],);

	genvar i;
	for(i = 1; i < C_NUM_CYCLES; i += 1) begin : g_dffrs
		DFFRS_X2(dffrs_out[i],
  	         RST,
	           1'b1,
	           CK,
	           dffrs_out[i + 1],);
	end

	assign Q = dffrs_out[C_NUM_CYCLES];

endmodule
