module Program_Memory_TB_RAM;
parameter MEMORY_DEPTH = 32;
parameter DATA_WIDTH = 32;
reg clk_tb = 0;
reg write_enable;
reg [DATA_WIDTH-1:0] Addres_i_tb;
reg [DATA_WIDTH-1:0] Intruccion_o_tb;
wire [DATA_WIDTH-1:0] read_data;

single_port_sync_ram
#(
    .MEMORY_DEPTH(MEMORY_DEPTH),
    .DATA_WIDTH(DATA_WIDTH)
)
DUV(
    .write_enable(write_enable),
	 .clk(clk_tb),
    .write_data(Intruccion_o_tb),
    .addr(Addres_i_tb),
    .read_Data(read_data)
); 
//Clock cycle
initial begin
	forever #2 clk_tb = !clk_tb;
	end
//Send address and information HEX	
initial begin
	#0 Addres_i_tb = 32'h10010000;
	#1 write_enable = 1;
	#1 Intruccion_o_tb <= 32'hFFFFFFFF;
	
	#50 Intruccion_o_tb <= 32'h00000000;
	#1 Addres_i_tb = 32'h10010000;
	
	#50 Intruccion_o_tb <= 32'h10010000;
	#1 Addres_i_tb = 32'h12345678;
	
	#50 Intruccion_o_tb <= 32'h1001000C;
	#1 Addres_i_tb = 32'h98761234;
	
	#50 Intruccion_o_tb <= 32'h10010010;
	#1 Addres_i_tb = 32'hA0A0A0A0;
	
	#50 Intruccion_o_tb <= 32'h10010014;
	#1 Addres_i_tb = 32'hABCDEF12;
end 
endmodule
	
	