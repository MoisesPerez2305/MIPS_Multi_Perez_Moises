/******************************************************************
* Description
*	This is  a ROM memory that represents the program memory. 
* 	Internally, the memory is read without a signal clock. The initial 
*	values (program) of this memory are written from a file named text.dat.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/
/******************
**	 MEMORIA ROM	*
**						*
**		M.Pérez		*
**	28/11/2021		*
*******************/

//Input and output variables for the module:
module Program_Memory
#
(
	parameter MEMORY_DEPTH = 64,
	parameter DATA_WIDTH = 32
)
(
	input [(DATA_WIDTH-1):0] Address_i,
	output reg [DATA_WIDTH-1:0] Instruction_o
);

	// Declare the ROM variable
	//64 positions of 32 bits
	reg [DATA_WIDTH-1:0] rom [MEMORY_DEPTH-1:0];
	// Initial reference for ROM Memory 
	reg [DATA_WIDTH-1:0] value = 32'h400_000;
	
	//Iformation from .dat file, each one are read it.
	initial
	begin
		$readmemh("C:/Projects/data_path/src/mem_src/src/text.dat", rom);
	end
	//Stage of send and save information by adrress value
	//The addres is adjusted inside the range and a
	//displacement is made in the address (2)
	always @ (Address_i)
	begin
		Instruction_o <= rom[(Address_i-value)>>2];
	end

endmodule
