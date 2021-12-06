module MUX4_1 #(
parameter WIDTH = 32
)
(
input [WIDTH-1:0] a,
input [WIDTH-1:0] b,
input [WIDTH-1:0] c,
input [WIDTH-1:0] d,
input [1:0] select,
output reg [WIDTH-1:0] srcb
);
always @(*)

begin
case (select)
	0:begin 
	 srcb = a;
	end
	1:begin 
	 srcb = a;
	end
	2:begin 
	 srcb = a;
	end
	3:begin 
	 srcb = a;
	end
endcase
end
endmodule
