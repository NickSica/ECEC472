module ring_counter #(int C_NUM_CYCLES) (
	input  CK;
	input  RST;
	output Q);

	wire [C_NUM_CYCLES:0] dffrs_out;

	DFFRS_X2(.D(dffrs_out[C_NUM_CYCLES]),
	         .RN(1'b1),
	         .SN(RST),
	         .CK(CK),
	         .Q(dffrs_out[0]),
	         .QN());

	genvar i;
	for(i = 1; i < C_NUM_CYCLES; ++i) begin : g_dffrs
		DFFRS_X2(.D(dffrs_out[i]),
  	         .RN(RST),
	           .SN(1'b1),
	           .CK(CK),
	           .Q(dffrs_out[i + 1]),
	           .QN());
	end

	Q <= dffrs_out[C_NUM_CYCLES];
endmodule ring_counter;
