module TB_MemorySystem_ROM;
	parameter DATA_WIDTH=32; 
	parameter ADDR_WIDTH=64;
	reg TB_clk = 0;
	reg [(DATA_WIDTH-1):0] TB_addr;
	wire [(DATA_WIDTH-1):0] TB_q;
	
	Program_Memory
	#(.DATA_WIDTH(DATA_WIDTH), .MEMORY_DEPTH(ADDR_WIDTH))
	DUV(
		.Address_i(TB_addr),
		.Instruction_o(TB_q)
		);
	
	initial begin
	forever #1 TB_clk = !TB_clk;
	end
	initial begin
		//#0 TB_addr <= 0;
		//#0 TB_q <= 0;
		#10TB_addr <= 32'h400000;
		#10TB_addr <= 32'h400004; //address 01
		#10TB_addr <= 32'b0000_0000_0100_0000_0000_0000_0000_1000;
		#10TB_addr <= 32'h40000C;
		#10TB_addr <= 32'h400010;
		#10TB_addr <= 32'h400014;
		#10TB_addr <= 32'h400016;
		#10TB_addr <= 32'h400018;//32'h400001c;
		#10TB_addr <= 32'h40001C;
		#10TB_addr <= 32'h4000b0; //direccion sin datos escritos
		#10TB_addr <= 32'h40000c; 
		end
endmodule
