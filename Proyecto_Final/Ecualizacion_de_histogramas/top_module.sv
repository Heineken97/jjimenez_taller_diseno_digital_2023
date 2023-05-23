module top_module(
	input 	logic 			clk ,
	input 	logic 			rst ,
	output 	logic [31:0] 	WriteData,
	output 	logic [31:0] 	DataAddr,
	output 	logic 			MemWrite
	);

	logic [31:0] ReadData, PC, Instruction;
	
	armv4 arm_microprocessor(.clk(clk), .rst(rst), .Instruction(Instruction), .ReadData(ReadData), .PC(PC), .ALUResult(DataAddr),
									.WriteData(WriteData), .MemWrite(MemWrite));

	imem instruction_memory(.Address(PC), .ReadData(Instruction));

	dmem data_memory(.clk(clk),.WriteEnable(MemWrite),.Address(DataAddr),.WriteData(WriteData),.ReadData(ReadData));
							
endmodule