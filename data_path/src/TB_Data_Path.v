module TB_Data_Path;
	parameter WIDTH=32; 
	reg TB_clk=0;
	reg TB_reset;
	reg [1:0] TB_ALUSrcB, TB_ALUSrcA;
	wire TB_zero;
	wire [5:0] TB_op;
	wire [5:0] TB_Funct;
	wire [7:0] TB_GPIO;
	reg [2:0] TB_ALUControl;
	reg TB_MemWrite,
		 TB_IorD,
		 TB_IRWrite,
		 TB_RegWrite,
		 TB_MemtoReg,
		 TB_RegDst,
		 TB_PCSrc1,
		 TB_PCWrite; //PC_Enable by the same assagment
data_path
#(
.WIDTH(WIDTH)
)
DUV
(
	.clk(TB_clk),
	.reset(TB_reset),
	.ALUSrcB(TB_ALUSrcB), 
	.ALUSrcA(TB_ALUSrcA),
	.zero(TB_zero),
	
	.op(TB_op),
	.Funct(TB_Funct),
	.GPIO(TB_GPIO),
	
	.MemWrite(TB_MemWrite),
	.IorD(TB_IorD),
	.IRWrite(TB_IRWrite),
	.RegWrite(TB_RegWrite),
	.MemtoReg(TB_MemtoReg), 
	.RegDst(TB_RegDst),
	.PCSrc1(PTB_CSrc1), 
	.ALUControl(TB_ALUControl), 
	.PCWrite(TB_PCWrite) 
	//input Branch
);

//Clock cycle forever	
initial begin
	forever #1 TB_clk = !TB_clk;
	end	
initial begin
	#1 TB_reset = 1'b1;
	#5 TB_reset = 1'b0;
	#5 TB_reset = 1'b1;
end
initial begin
	#1 TB_PCWrite = 1'b1;
	   TB_IorD = 1'b0;
	   TB_MemWrite = 1'b0;
	   TB_RegDst = 1'b0;
	   TB_IRWrite = 1'b1;	   
	#5 TB_PCWrite = 1'b0;
end

initial begin

	#10 TB_IRWrite = 1'b0;
		 TB_ALUSrcA = 1'b1;
	    TB_ALUSrcB = 2'b10;
	#5  TB_ALUControl = 3'b000;
	#5  TB_RegDst = 1'b1;
	    TB_RegWrite = 1'b1;
	    TB_MemtoReg = 1'b1;	
	#5 TB_RegDst = 1'b0;
	#5 TB_ALUSrcA= 1'b0;
	   TB_ALUSrcB = 2'b01;
	   TB_ALUControl = 3'b000;
	   TB_IorD = 1'b0;
	   TB_RegWrite = 1'bx;
	   TB_MemtoReg = 1'bx;
end

initial begin
	#35 TB_PCWrite = 1'b1;
	   TB_IorD = 1'b0;
	   TB_MemWrite = 1'b0;
	   TB_RegDst = 1'b0;
	   TB_IRWrite = 1'b1;	   
	#5 TB_PCWrite  = 1'b0;
	#5 TB_IRWrite = 1'b0;
	#5 TB_ALUSrcA = 1'b1;
	   TB_ALUSrcB = 2'b10;
	#5 TB_ALUControl = 3'b000;
	#5 TB_RegDst = 1'b1;
	   TB_RegWrite = 1'b0;
	   TB_MemtoReg = 1'b0;	
	#1 TB_RegDst = 1'b0;
	#1 TB_ALUSrcA = 1'b0;
	   TB_ALUSrcB = 2'b01;
	   TB_ALUControl = 3'b000;
	   TB_IorD = 1'b0;
	   TB_RegWrite = 1'bx;
	   TB_MemtoReg = 1'bx;
end

initial begin
	#80 TB_PCWrite = 1'b1;
	   TB_IorD = 1'b0;
	   TB_MemWrite = 1'b0;
	   TB_RegDst = 1'b0;
	   TB_IRWrite = 1'b1;	   
	#5 TB_PCWrite  = 1'b0;
	#5 TB_IRWrite = 1'b0;
	#5 TB_ALUSrcA = 1'b1;
	   TB_ALUSrcB = 2'b10;
	#5 TB_ALUControl = 3'b000;
	#2 TB_RegDst = 1'b1;
	   TB_RegWrite = 1'b0;
	   TB_MemtoReg = 1'b0;
	#2 TB_RegDst = 1'b0;
	#4 TB_ALUSrcA = 1'b0;
	   TB_ALUSrcB = 2'b01;
	   TB_ALUControl = 3'b000;
	   TB_IorD = 1'b0;
	   TB_RegWrite = 1'bx;
	   TB_MemtoReg = 1'bx;
end

initial begin
	#102 TB_PCWrite = 1'b1;
	   TB_IorD = 1'b0;
	   TB_MemWrite = 1'b0;
	   TB_RegDst = 1'b0;
	   TB_IRWrite = 1'b1;	   
	#4 TB_PCWrite = 1'b0;
	#6 TB_IRWrite = 1'b0;
	#7 TB_ALUSrcA = 1'b1;
	   TB_ALUSrcB = 2'b00;
	#5 TB_ALUControl = 3'b000;
	#2 TB_RegDst = 1'b1;
	   TB_RegWrite = 1'b1;
	   TB_MemtoReg = 1'b0;
	#5 TB_RegDst = 1'b0;
	#5 TB_ALUSrcA = 1'b0;
	   TB_ALUSrcB = 2'b01;
	   TB_ALUControl = 3'b000;
	   TB_IorD = 1'b0;
	   TB_RegWrite = 1'bx;
	   TB_MemtoReg = 1'bx;
end
//end
endmodule
