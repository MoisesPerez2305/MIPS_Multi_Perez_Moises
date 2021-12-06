//MemorySystem	TB

module TB_MemorySystem;
	parameter DATA_WIDTH=32; 
	parameter ADDR_WIDTH=32;
	reg TB_clk;
	reg TB_Write_enable;
	reg [(DATA_WIDTH-1):0] TB_addr;
	wire [(DATA_WIDTH-1):0] TB_Write_Data;
	reg [(DATA_WIDTH-1):0] TB_q;
	

	
	
	wraper_MS
	#(.MEMORY_DEPTH(DATA_WIDTH), .DATA_WIDTH(ADDR_WIDTH))
	DUV(
		.clk_i(TB_clk),
		.write_enable_i(TB_Write_enable),
		.write_data(TB_Write_Data),
		.Address_i(TB_addr),
		.Read_Data(TB_q)
		);

		
	initial begin
	forever #1 TB_clk = ~TB_clk;
	end	
		
initial begin

	//ESCRIBIENDO DATOS EN RAM
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
	
	//DESACTIVANDO ESCRITURA RAM 
	#50 TB_Write_enable = 0;
	
	//CONSULTANDO ROM
	#50 TB_addr <= 32'h400000;
	#50 TB_addr <= 32'h400004; //address 01
	#50 TB_addr <= 32'b0000_0000_0100_0000_0000_0000_0000_1000;
	#50 TB_addr <= 32'h40000c;
	#50 TB_addr <= 32'h400010;
	#50 TB_addr <= 32'h400014;
	#50 TB_addr <= 32'h400018;
	#50 TB_addr <= 32'h40001c;
	#50 TB_addr <= 32'h400020; //direccion sin datos escritos
	#50 TB_addr <= 32'h400024; 
	
end		
		
		
	endmodule
	