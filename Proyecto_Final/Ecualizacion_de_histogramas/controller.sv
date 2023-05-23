module controller(input 	logic 			clk ,
	input 	logic 			rst ,
	input 	logic [31:12]		Instruction ,
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

endmodule
	