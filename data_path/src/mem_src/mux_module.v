module mux_module //Parameter MUX module
#(
   //
  parameter DATA_WIDTH = 32
)//Input and output variables for the module:
(
   input [(DATA_WIDTH-1):0] x,
   input [(DATA_WIDTH-1):0] y,
	input [1:0] Sel,
	output [(DATA_WIDTH-1):0] Data_out
);
//Ternary assigment condition for the MUX data 
assign Data_out = Sel ? x : y ; 
endmodule 