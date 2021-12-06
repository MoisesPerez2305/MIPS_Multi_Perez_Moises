module sign_extended_part(
	input[15:0] sign_ext_input,
	output wire [31:0] sign_ext_output
);
assign sign_ext_output = {{16{sign_ext_input[15]}}, sign_ext_input};
endmodule
