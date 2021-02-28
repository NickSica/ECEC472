module s_p_converter #(int C_BITS_OUT) (
	input CK,
	input RST,
	input D,
	output [C_BITS_OUT - 1:0] Q);

	wire en;
	wire [C_BITS_OUT:0] dff_out;

	assign dff_out[0] = D;

	genvar i;
	for(i = 0; i < C_BITS_OUT; i++) begin : g_dff
		DFF_X2(.D(dff_out[i]),
		       .CK(CK),
		       .Q(dff_out[i + 1]),
		       .QN());

		DLH_X1(.D(dff_out[i + 1]),
		       .G(en),
		       .Q(Q[i]));
	end

	ring_counter #(250) (
	  .CK(CK)
	  .RST(RST)
	  .Q(en));

endmodule s_p_converter
