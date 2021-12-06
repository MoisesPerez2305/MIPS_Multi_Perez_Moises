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

module Program_Memory_TB;

parameter MEMORY_DEPTH = 32;
parameter DATA_WIDTH = 32;
reg clk_tb = 0;
reg [(DATA_WIDTH-1):0] Address_i_tb;
wire [(DATA_WIDTH-1):0] Instruction_o_tb;

  
Program_Memory
#
(
	.MEMORY_DEPTH(MEMORY_DEPTH),
	.DATA_WIDTH(DATA_WIDTH)
)
DUV
(
	.Address_i(Address_i_tb),
	.Instruction_o(Instruction_o_tb)
);
/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end
/*********************************************************/


initial begin
	#0 Address_i_tb = 32'h400000;
	#50 Address_i_tb = 32'h400004;
	#50 Address_i_tb = 2;
	#50 Address_i_tb = 3;
	#50 Address_i_tb = 4;
	#50 Address_i_tb = 5;
	#50 Address_i_tb = 6;
	#50 Address_i_tb = 7;
	#50 Address_i_tb = 8;

end


/*********************************************************/

endmodule