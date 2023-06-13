module top_module(
	input 	logic 			clk ,
	input 	logic 			rst ,
	output 	logic [31:0] 	WriteData,
	output 	logic [31:0] 	DataAddr,
	output 	logic 			MemWrite,
	output 	logic				CLK_VGA, 
   output 	logic 			SYNC_H, SYNC_V, SYNC_B, SYNC_BLANK, 
   output	logic [7:0] 	Red, Green, Blue
	);

	logic [31:0] ReadData, PC, Instruction;
	
	armv4 arm_microprocessor(.clk(clk), .rst(rst), .Instruction(Instruction), .ReadData(ReadData), .PC(PC), .ALUResult(DataAddr),
									.WriteData(WriteData), .MemWrite(MemWrite));

	imem instruction_memory(.Address(PC), .ReadData(Instruction));

	dmem data_memory(.clk(clk),.WriteEnable(MemWrite),.Address(DataAddr),.WriteData(WriteData),.ReadData(ReadData));
	
	controller_VGA controllerVGA(.clk(clk),.rst(rst), .CLK_VGA(CLK_VGA),.SYNC_H(SYNC_H), .SYNC_V(SYNC_V), .SYNC_B(SYNC_B), .SYNC_BLANK(SYNC_BLANK),.Red(Red), .Green(Green), .Blue(Blue));
							
endmodule