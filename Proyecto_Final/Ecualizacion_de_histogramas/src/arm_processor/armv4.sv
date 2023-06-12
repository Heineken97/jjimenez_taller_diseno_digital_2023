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
									.ImmediateSource(ImmediateSource), .ALUSource(ALUSource), .ALUControl(ALUControl), .MemWrite(MemWrite), .MemtoReg(MemToReg), .PCSource(PCSource));
	datapath dp(.clk(clk),.rst(rst),.RegSource(RegSource), .RegWrite(RegWrite), .ImmediateSource(ImmediateSource),.ALUSrc(ALUSrc), .ALUControl(ALUControl),.MemtoReg(MemToReg), .PCSource(PCSource),.ALUFlags(ALUFlags), .PC(PC), .Instruction(Instruction),.ALUResult(ALUResult),
				.WriteData(WriteData), .ReadData(ReadData));
endmodule