module controller(
	input 	logic 			clk,
	input 	logic 			rst,
	input 	logic [31:12]	Instruction,
	input 	logic [3:0] 	ALUFlags,
	output 	logic [1:0] 	RegSource,
	output 	logic 		 	RegWrite,
	output 	logic [1:0] 	ImmediateSource,
	output 	logic 		 	ALUSource,
	output 	logic [1:0] 	ALUControl,
	output 	logic 			MemWrite,
	output 	logic 			MemToReg,
	output 	logic 			PCSource
	);
	logic [1:0] flagW;
	logic	regW, memW, PCS;
	
	decoder decoder(.Operation(Instruction[27:26]), .Function(Instruction[25:20]), .Rd(Instruction[15:12]), .FlagW(flagW),
						.PCS(PCS), .RegW(regW), .MemW(memW), .MemToReg(MemToReg), .ALUSource(ALUSource), 
						.ImmediateSource(ImmediateSource), .RegSource(RegSource), .ALUControl(ALUControl));
	conditionalLogic conditionalLogic(.clk(clk), .rst(rst), .Conditional(Instruction[31:28]), .ALUFlags(ALUFlags), .FlagW(flagW),
												.PCS(PCS), .RegW(regW), .MemW(memW), .PCSource(PCSource),.RegWrite(RegWrite),.MemWrite(MemWrite));

endmodule
	