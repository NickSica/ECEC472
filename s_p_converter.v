module s_p_converter
	#(parameter C_BITS_OUT=255)
	(input CK,
	 input RST,
	 input D,
	 output [C_BITS_OUT - 1:0] Q);

	wire en;
	wire [C_BITS_OUT:0] dff_out;

	//assign dff_out[0] = D;

	DFF_X2 DFF0
		(D,
		 CK,
		 dff_out[1],);

	DLH_X1 DLH0
		(dff_out[1],
		 en,
		 Q[0]);

	genvar i;
	for(i = 1; i < C_BITS_OUT; i = i + 1) begin : g_dff
		DFF_X2 DFF
			(dff_out[i],
			 CK,
			 dff_out[i + 1],);

		DLH_X1 DLH
			(dff_out[i + 1],
			 en,
			 Q[i]);
	end

	ring_counter
		#(C_NUM_CYCLES = C_BITS_OUT)
		RC (CK,
	  	  RST,
	  	  en);

endmodule
