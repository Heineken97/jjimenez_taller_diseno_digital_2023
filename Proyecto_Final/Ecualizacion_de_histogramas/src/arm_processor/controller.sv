module controller(
	input 	logic 			clk ,
	input 	logic 			rst ,
	input 	logic [31:12] 	Instruction ,
	input 	logic [3:0] 	ALUFlags,
	output 	logic [1:0] 	RegSource,
	output 	logic 		 	RegWrite,
	output 	logic [1:0]	 	ImmediateSource,
	output 	logic 			ALUSource,
	output 	logic [1:0]		ALUControl,
	output 	logic 			MemWrite,
	output 	logic				MemtoReg,
	output 	logic 			PCSource
	);
	
	logic [1:0] FlagW;
	logic PCS, RegW, MemW;
	
	decoder dec(Instruction[27:26],Instruction[25:20],Instruction[15:12],FlagW,PCS,RegW,MemW,MemtoReg, ALUSource,ImmediateSource,RegSource,ALUControl);
	conditionalLogic cl(clk,rst,Instruction[31:28], ALUFlags,FlagW,PCS,RegW,MemW,PCSource,RegWrite,MemWrite);
	
endmodule