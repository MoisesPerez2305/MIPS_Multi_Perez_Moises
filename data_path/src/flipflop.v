module flipflop#(
	parameter WIDTH = 32
)
(
	input [WIDTH-1:0] d,
	input clk,
	input reset,
	input enable,
	output [WIDTH-1:0] q
);
	reg [WIDTH-1:0] q6;
always @(posedge clk or negedge reset) begin
	if (!reset)
		q6 <= 0;
	else if(enable)
		q6 <= d;
	end
	assign q = q6;
endmodule 	
