module armv4(
	input 	logic 			clk ,
	input 	logic 			rst ,
	input 	logic 			Instruction ,
	input 	logic [31:0] 	ReadData,
	output 	logic [31:0] 	PC,
	output 	logic [31:0] 	ALUResult,
	output 	logic [31:0] 	WriteData,
	output 	logic 			MemWrite
	);
	
	logic [3:0] ALUFlags;
	logic [1:0] RegSource,ImmediateSource,ALUControl;
	logic RegWrite, ALUSource, MemToReg, PCSource;
	
	controller controller(.clk(clk), .rst(rst), .Instruction(Instruction), .ALUFlags(ALUFlags), .RegSource(RegSource), .RegWrite(RegWrite),
									.ImmediateSource(ImmediateSource), .ALUSource(ALUSource), .ALUControl(ALUControl), .MemWrite(MemWrite), .MemToReg(MemToReg), .PCSource(PCSource));
	
endmodule