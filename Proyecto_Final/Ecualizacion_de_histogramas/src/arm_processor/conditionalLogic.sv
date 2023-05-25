module conditionalLogic(
	input 	logic 			clk,
	input 	logic 			rst,
	input 	logic [3:0]		Conditional,
	input 	logic [3:0] 	ALUFlags,
	input 	logic [1:0]	 	FlagW,
	input 	logic 		 	PCS,
	input 	logic 		 	RegW,
	input 	logic 		 	MemW,
	output 	logic 			PCSource,
	output 	logic 			RegWrite,
	output 	logic 			MemWrite
	);
	logic [1:0] flagWrite;
	logic [3:0] flags;
	logic condEx;
	
	flopenr #(2)flagreg1(clk, rst, flagWrite[1], ALUFlags[3:2], flags[3:2]);
	flopenr #(2)flagreg0(clk, rst, flagWrite[0], ALUFlags[1:0], flags[1:0]);
	condcheck cc(.Conditional(Conditional), .Flags(flags), .CondEx(condEx));
	
	assign flagWrite = FlagW & {2{condEx}};
	assign RegWrite = RegW & condEx;
	assign MemWrite = MemW & condEx;
	assign PCSource = PCS & condEx;
	
endmodule