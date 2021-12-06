module mux_memory_system	//Parameter MUX and memory system module
#(
	parameter MEMORY_DEPTH = 32,
	parameter DATA_WIDTH = 32
)(//Module inputs and outputs for the module:
	input write_enable_i,					//write enable signal
	input [(DATA_WIDTH-1):0] write_data,//write data 
	input [(DATA_WIDTH-1):0] address_i,	//adress 
	input clk,									// clock signal 
	output [(DATA_WIDTH-1):0] instruc	//instruction output	//	
);
	//Constant of range difference by the ROM and RAM memory 
	reg [(DATA_WIDTH-1):0] value = 32'h1000_0000 ;
	wire [1:0] addrs;					//adress bit_selector
	wire [(DATA_WIDTH-1):0] out_rom;	//output for module rom
	wire [(DATA_WIDTH-1):0] out_ram;	//output for module ram
	
	//Conditions 
	assign addrs = (address_i < value) ? 1 : 0;
	//Instances for each memory: ROM & RAM
	//ROM
	Program_Memory rom(
	.Address_i(address_i), 
	.Instruction_o(out_rom)
	);
	//RAM
	single_port_sync_ram ram(
	.write_enable(write_enable_i),
	.clk(clk),
	.write_data(write_data),
	.addr(address_i),
	.read_Data(out_ram)
	);
	//Instance of MUX module taken outputs from 
	//ROM and RAM:
	mux_module mux(
	.x(out_rom), 
	.y(out_ram), 
	.Sel(addrs), 
	.Data_out(instruction_o)
	);
endmodule
