module wraper_MS	//Instance of description of input and output elements "Wrapper".
#(
parameter MEMORY_DEPTH = 32,
parameter DATA_WIDTH = 32
)
(//Module inputs and outputs.
	input clk_i,
	input write_enable_i,
	input [(DATA_WIDTH-1):0] Address_i,
	input [(DATA_WIDTH-1):0] write_data,
	output [(DATA_WIDTH-1):0] Read_Data
);
//Instance of reg file with Wrapper inputs and outputs
mux_memory_system mem_sys(
	.write_enable_i(write_enable_i),//Enable signal, differentiador.
	.write_data(write_data),//Write data, for writing
	.address_i(Address_i),	//adress
	.clk(clk_i),				// Clock signal
	.instruc(Read_Data)		//Output of module	
);
endmodule