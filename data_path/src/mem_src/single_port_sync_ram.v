/******************************************************************
*******************
**	 MEMORIA RAM	*
**						*
**		M.Pérez		*
**	28/11/2021		*
*******************
Single Port RAM varaint.
*/
//Input and output variables for the parametrizable module:
module single_port_sync_ram
#(
    parameter MEMORY_DEPTH = 64,
    parameter DATA_WIDTH = 32
)
(
    input write_enable,
	 input clk,
    input [(DATA_WIDTH-1):0] write_data,
    input [(DATA_WIDTH-1):0] addr,

    output[(DATA_WIDTH-1):0] read_Data
);

   // Declaration of RAM variable
	//64 positions of 32 bits
    reg [DATA_WIDTH-1:0] RAM [MEMORY_DEPTH-1:0];
	 wire [DATA_WIDTH-1:0] value = 32'h1001_0000;
	////Stage of send and save information by adrress value
	//The addres is adjusted inside the range and a
	//displacement is made in the address (2), the value to write
	//is previously loaded in write_data
    always @ (posedge clk)
    begin
        if (write_enable)
            RAM[(addr - value) >> 2] <= write_data;
    end
	 //Finally, the write value is assigned as output of module 
	assign read_Data = RAM[(addr - value) >> 2];

endmodule