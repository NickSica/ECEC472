module ring_counter
	#(parameter C_NUM_CYCLES = 255)
	(input  CK,
	 input  RST,
	 output Q);

	wire [C_NUM_CYCLES:0] dffrs_out;

	DFFRS_X2 DFFRS0
		(dffrs_out[C_NUM_CYCLES],
		 1'b1,
		 RST,
		 CK,
		 dffrs_out[0],);

	genvar i;
	for(i = 1; i < C_NUM_CYCLES; i = i + 1) begin : g_dffrs
		DFFRS_X2 DFFRS
			(dffrs_out[i],
			 RST,
			 1'b1,
			 CK,
			 dffrs_out[i + 1],);
	end

	DFFRS_X2 DFFRS1
		(dffrs_out[C_NUM_CYCLES],
  	 RST,
		 1'b1,
		 CK,
		 Q,);

	//assign Q = dffrs_out[C_NUM_CYCLES];

endmodule
