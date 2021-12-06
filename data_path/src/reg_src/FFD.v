module FFD 	//Hardware description for a parameterized flip flop, 
#(				//used to realize the structure of the internal registers.
parameter WIDTH = 32
)
(				////Module inputs and outputs.
input [WIDTH-1:0]d, 
input clk, reset, 
input enable, 
output [WIDTH-1:0]q
);
reg [WIDTH-1:0] data; 
always@(posedge clk, negedge reset)
	begin
		if(!reset)data <= 0;
				
		else if(enable) data <= d;
		
	end
	assign q = data;
endmodule