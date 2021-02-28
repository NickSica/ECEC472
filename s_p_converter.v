module s_p_converter #(parameter C_BITS_OUT=255) (
	input CK,
	input RST,
	input D,
	output [C_BITS_OUT - 1:0] Q);

	wire en;
	wire [C_BITS_OUT:0] dff_out;

	assign dff_out[0] = D;

	genvar i;
	for(i = 0; i < C_BITS_OUT; i = i + 1) begin : g_dff
		DFF_X2(dff_out[i],
		       CK,
		       dff_out[i + 1],);

		DLH_X1(dff_out[i + 1],
		       en,
		       Q[i]);
	end

	ring_counter #(C_NUM_CYCLES = C_BITS_OUT) (
	  CK,
	  RST,
	  en);

endmodule
