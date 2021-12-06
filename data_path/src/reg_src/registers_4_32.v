module registers_4_32 	//Parameterizable hardware description of each of the 32 
#(								//registers as a means of relating inputs and outputs. 
	parameter WIDTH = 32
)
(//Module inputs and outputs.
	input [WIDTH-1:0] Rd,
	input clk, reset,
	input reg_write_i,
	input [WIDTH-1:0] CP_o,
	output [WIDTH-1:0] Q, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8,
	output [WIDTH-1:0] Q9, Q10, Q11, Q12, Q13, Q14, Q15,
	output [WIDTH-1:0] Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, 
	output [WIDTH-1:0] Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31	
);
wire [WIDTH-1:0] Enable_dec;
//AND gates, for interconnection between the registers next to be instantiated. 
generate
	genvar i;
		for (i = 0; i < WIDTH; i = i+1)
		begin: Reg
			and dec (Enable_dec[i], reg_write_i, CP_o[i]);
		end
endgenerate
//Instance of each register as a relation element with clock, 
//enable and reset, as its corresponding output. 
FFD Reg1 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[0]), .q(Q));
FFD Reg2 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[1]), .q(Q1));
FFD Reg3 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[2]), .q(Q2));
FFD Reg4 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[3]), .q(Q3));
FFD Reg5 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[4]), .q(Q4));
FFD Reg6 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[5]), .q(Q5));
FFD Reg7 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[6]), .q(Q6));
FFD Reg8 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[7]), .q(Q7));
FFD Reg9 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[8]), .q(Q8));
FFD Reg10 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[9]), .q(Q9));
FFD Reg11 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[10]), .q(Q10));
FFD Reg12 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[11]), .q(Q11));
FFD Reg13 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[12]), .q(Q12));
FFD Reg14 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[13]), .q(Q13));
FFD Reg15 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[14]), .q(Q14));
FFD Reg16 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[15]), .q(Q15));
FFD Reg17 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[16]), .q(Q16));
FFD Reg18 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[17]), .q(Q17));
FFD Reg19 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[18]), .q(Q18));
FFD Reg20 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[19]), .q(Q19));
FFD Reg21 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[20]), .q(Q20));
FFD Reg22 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[21]), .q(Q21));
FFD Reg23 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[22]), .q(Q22));
FFD Reg24 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[23]), .q(Q23));
FFD Reg25 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[24]), .q(Q24));
FFD Reg26 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[25]), .q(Q25));
FFD Reg27 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[26]), .q(Q26));
FFD Reg28 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[27]), .q(Q27));
FFD Reg29 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[28]), .q(Q28));
FFD Reg30 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[29]), .q(Q29));
FFD Reg31 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[30]), .q(Q30));
FFD Reg32 (.d(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[31]), .q(Q31));
endmodule 