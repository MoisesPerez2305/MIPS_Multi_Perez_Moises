/******************************************************************
* Description
*	This is the verifaction envioroment ofr testeting the register file.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	12/06/2015
******************************************************************/

module Register_File_TB;

reg clk_tb = 0;
reg reset_tb;
reg RegWrite_tb;
reg [4:0] Write_Register_tb;
reg [4:0] Read_Register_1_tb;
reg [4:0] Read_Register_2_tb;
reg [31:0] Write_Data_tb;
wire [31:0] Read_Data_1_tb;
wire [31:0] Read_Data_2_tb;
  
  
register_file
#(
	.WIDTH(32),
	.SIZE(5)
)
DUV
(
	.clk(clk_tb),
	.reset(reset_tb),
	.reg_write_i(RegWrite_tb),
	.write_register_i(Write_Register_tb),
	.read_register_1_i(Read_Register_1_tb),
	.read_register_2_i(Read_Register_2_tb),
	.write_data_i(Write_Data_tb),
	.read_data_1_o(Read_Data_1_tb),
	.read_data_2_o(Read_Data_2_tb)

);

/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end
/*********************************************************/
initial begin // reset generator
	#0 reset_tb = 0;
	#5 reset_tb = 1;
end

initial begin
	#0 RegWrite_tb = 0;
	#5 RegWrite_tb = 1;
	#10 RegWrite_tb = 0;
end


initial begin
	#0 Read_Register_1_tb = 0;
	#4 Read_Register_1_tb = 0;
	#70 Read_Register_1_tb = 2;
	#10 Read_Register_1_tb = 4;
	#10 Read_Register_1_tb = 25;
	#10 Read_Register_1_tb = 31;

end


initial begin
	#0 Read_Register_2_tb = 0;
	#4 Read_Register_2_tb = 0;
	#70 Read_Register_2_tb = 2;
	#10 Read_Register_2_tb = 4;
	#10 Read_Register_2_tb = 25;
	#10 Read_Register_2_tb = 31;

end

initial begin
	#0 Write_Register_tb = 0;
	#4 Write_Register_tb = 0;
	#10 Write_Register_tb = 2;
	#10 Write_Register_tb = 4;
	#10 Write_Register_tb = 25;
	#10 Write_Register_tb = 31;

end


/*********************************************************/
initial begin // reset generator
	#0 Write_Data_tb = 3;
	#4 Write_Data_tb = 3;
	#10 Write_Data_tb = 7;
	#10 Write_Data_tb = 20;
	#10 Write_Data_tb = 6;
	#10 Write_Data_tb = 78;
end

/*********************************************************/

endmodule