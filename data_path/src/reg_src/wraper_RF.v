module wraper_RF	//Instance of description of input and output elements "Wrapper".
#(
parameter WIDTH = 32,
parameter SIZE =5
)
(//Module inputs and outputs.
	input clk,
	input reset,
	input reg_write_i, 
	input [SIZE-1:0] read_register_1_i,
	input [SIZE-1:0] read_register_2_i,
	input [SIZE-1:0] write_register_i,
	input [WIDTH-1:0] write_data_i,
	output [WIDTH-1:0] read_data_1_o,
	output [WIDTH-1:0] read_data_2_o
);
//Instance of reg file with Wrapper inputs and outputs
register_file reg_file(
.clk(clk), .reset(reset),
.reg_write_i(reg_write_i),  
.read_register_1_i(read_register_1_i),
.read_register_2_i(read_register_2_i), 
.write_register_i(write_register_i),
.write_data_i(write_data_i),
.read_data_1_o(read_data_1_o),
.read_data_2_o(read_data_2_o)
);
endmodule

