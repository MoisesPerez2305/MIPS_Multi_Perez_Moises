//MemorySystem	Testbench Implementation

module TB_Memory_System;
	parameter DATA_WIDTH=32; 
	parameter ADDR_WIDTH=32;
	reg TB_clk=0;
	reg TB_Write_enable;
	reg [(DATA_WIDTH-1):0] TB_addr;
	reg [(DATA_WIDTH-1):0] TB_Write_Data;
	wire [(DATA_WIDTH-1):0] TB_q;

	
//Wraper
	wraper_MS
	#(.MEMORY_DEPTH(DATA_WIDTH), .DATA_WIDTH(ADDR_WIDTH))
	DUV(
		.clk_i(TB_clk),
		.write_enable_i(TB_Write_enable),
		.write_data(TB_Write_Data),
		.Address_i(TB_addr),
		.Read_Data(TB_q)
		);

//Clock cycle		
	initial begin
	forever #1 TB_clk = !TB_clk;
	end	
		
initial begin

//Information for RAM Memory Conditions
	#1 TB_Write_enable = 1;
	#1 TB_addr =  32'h10010000;
	#0 TB_Write_Data <= 32'hFFFF_FFFF;
	
	#50 TB_Write_Data <= 32'h0000_0000;
	#1 TB_addr = 32'h10010004;
	
	#50 TB_addr = 32'h10010008;
	#1 TB_Write_Data <= 32'h2;
	
	#50 TB_addr = 32'h1001000c;
	#1 TB_Write_Data <= 32'h3;

	#50 TB_addr = 32'h10010010;
	#1 TB_Write_Data <= 32'h4;

	#50 TB_addr = 32'h10010014;
	#1 TB_Write_Data <= 32'h5;
	
	#50 TB_addr = 32'h10010018;
	#1 TB_Write_Data <= 32'h6;
	
	#50 TB_addr = 32'h1001001C;
	#1 TB_Write_Data <= 32'h7;
	
//Information for ROM Memory Conditions
	#1 TB_Write_enable = 0;
	#50 TB_addr <= 32'h400000;
	#50 TB_addr <= 32'h400004;
	#50 TB_addr <= 32'b400008;
	#50 TB_addr <= 32'h40000c;
	#50 TB_addr <= 32'h400010;
	#50 TB_addr <= 32'h400014;
	#50 TB_addr <= 32'h400018;
	#50 TB_addr <= 32'h40001c;
	#50 TB_addr <= 32'h400024; 
end		
		
		
	endmodule
	