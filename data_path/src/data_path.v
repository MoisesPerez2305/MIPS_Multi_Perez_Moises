module data_path
#(
parameter WIDTH = 32
)(

	input clk,
	input reset,
	input [1:0] ALUSrcB, ALUSrcA,
	output zero,
	
	output [5:0] op,
	output [5:0] Funct,
	output [7:0] GPIO,
	input [2:0] ALUControl,
	
	input MemWrite,
	input IorD,
	input IRWrite,
	input RegWrite,
	input MemtoReg, 
	input RegDst,
	input PCSrc1, 
	//input ALUControl, 
	input PCWrite 
	//input Branch
);
	//Wires for conexion in differents elements of the description:
	wire [WIDTH-1:0] in_PC;
	wire [WIDTH-1:0] MUX2_to_1_o;
	wire [WIDTH-1:0] Adr;
	wire [WIDTH-1:0] RD;
	wire [WIDTH-1:0] ffpc_o;
	wire [WIDTH-1:0] ffrd_o;
	wire [WIDTH-1:0] ffwd_o;
	
	wire [WIDTH-1:0] WD3_i;
	wire [WIDTH-1:0] ReadData_o;
	wire [4:0] A3_o;
	wire zero_1;
	wire [4:0] WD3;
	wire [WIDTH-1:0] ALUResult;
	wire [WIDTH-1:0] ALU_o;
	
	wire [WIDTH-1:0] RD1_i;
	wire [WIDTH-1:0] RD2_i;

	wire [WIDTH-1:0] RD1_o;
	wire [WIDTH-1:0] RD2_o;
	
	wire [WIDTH-1:0] SrcA;
	wire [WIDTH-1:0] SrcB;
	
	wire zero_o;
	wire PCEn;
	wire Out_A;
	//Inputs registers of Register File
	wire [4:0] rs_A1;
	wire [4:0] rt_A2;
	wire [4:0] rd_A3;
	
	wire [15:0] sign_extended_i;
	wire [WIDTH-1:0] sign_extended_o;
	//Assigments to register inputs (Register File):
	assign rs_A1 = ffrd_o[25:21];
	assign rt_A2 = ffrd_o[20:16];
	assign rd_A3 = ffrd_o[15:11];
	//Assignments for output:
	assign op [5:0] = ffrd_o[31:26];
	assign Funct[5:0] = ffrd_o[15:11];
	
	//Asigments for the extended sign 
	assign sign_extended_i = ffrd_o[15:0];
	assign zero = zero_1;
	assign GPIO [7:0] = ALUResult [7:0];
	
	//assign Out_A = Branch & zero_o; 
	 
	//Program Counter instanciation
FFD_PC PC(
	.d(in_PC),
	.clk(clk),
	.reset(reset),
	.enable(PCWrite),//.enable(PC_enable),
	.q(ffpc_o)
);
mux_module M1_ADD(
   .x(ffpc_o),
   .y(ALU_o),
	.Sel(IorD), //Salida de MUX de ALU
	.Data_out(Adr)
);
	
mux_module #(.DATA_WIDTH(5)) M2_A3			//used to realize the structure of the internal registers.
(
   .x(rt_A2),
   .y(rd_A3),
	.Sel(RegDst), //Salida de MUX de ALU
	.Data_out(A3_o)
);

mux_module M3_WD3(
   .x(ffwd_o),
   .y(ALU_o),
	.Sel(MemtoReg), //Salida de MUX de ALU
	.Data_out(WD3)
);

wraper_MS MEM	//Instance of description of input and output elements "Wrapper".
/*#(
parameter MEMORY_DEPTH = 32,
parameter DATA_WIDTH = 32
)*/
(//Module inputs and outputs.
	.clk_i(clk),
	.write_enable_i(MemWrite),
	.Address_i(Adr),
	.write_data(RD2_o),
	.Read_Data(RD)
);

FFD Instr 	//Hardware description for a parameterized flip flop, 
(				////Module inputs and outputs.
.d(RD), 
.clk(clk), 
.reset(reset), 
.enable(IRWrite), 
.q(ffrd_o)
);

FFD Data	//Hardware description for a parameterized flip flop, 
(				////Module inputs and outputs.
.d(RD), 
.clk(clk), 
.reset(reset), 
.enable(1), 
.q(ffwd_o)
);

wraper_RF #(.WIDTH(32), .SIZE(5))RF	//Instance of description of input and output elements "Wrapper".
(//Module inputs and outputs.
	.clk(clk),
	.reset(reset),
	.reg_write_i(RegWrite), 
	.read_register_1_i(rs_A1),
	.read_register_2_i(rt_A2),
	.write_register_i(A3_o),
	
	.write_data_i(WD3),
	.read_data_1_o(RD1),
	.read_data_2_o(RD2)
);

FFD A_rout 	//Hardware description for a parameterized flip flop, 
(				////Module inputs and outputs.
.d(RD1), 
.clk(clk), 
.reset(reset),
.enable(1),  
.q(RD1_o)
);

FFD B_rout 	//Hardware description for a parameterized flip flop, 
(				////Module inputs and outputs.
.d(RD2), 
.clk(clk), 
.reset(reset),
.enable(1),  
.q(RD2_o)
);

mux_module M4(
   .x(RD1_o),
   .y(ffpc_o),
	.Sel(ALUSrcA), //Salida de MUX de ALU
	.Data_out(SrcA)
);


sign_extended_part sep(
	.sign_ext_input(sign_extended_i),
	.sign_ext_output(sign_extended_o)
);
//Mux 4 1, as select between Reg.File and ALU 
MUX4_1 MUX4
(
.a(RD2_o),
.b(32'h4),
.c(sign_extended_o),
.d(sign_extended_o<<2),
.select(ALUSrcB),
.srcb(SrcB)
);
//ALU module:
ALU ALU_M
(
.a(SrcA),
.b(SrcB),
.select(ALUControl),
.zero(zero_o),
.y(ALUResult)
);

FFD ALUResult_o	//Hardware description for a parameterized flip flop, 
(				////Module inputs and outputs.
.d(ALUResult), 
.clk(clk), 
.reset(reset),
.enable(1),   
.q(ALU_o)
);
//Last MUX as feedback for the Program Counter. 
mux_module M5(
   .x(ALUResult),
   .y(ALU_o),
	.Sel(PCSrc1), //Salida de MUX de ALU
	.Data_out(in_PC)
);

endmodule
	
	