module datapath(
	input 	logic 			clk ,
	input 	logic 			rst ,
	output 	logic [1:0] 	RegSource,
	output 	logic 		 	RegWrite,
	output 	logic [1:0] 	ImmediateSource,
	output 	logic 			ALUSrc,
	output 	logic [1:0]		ALUControl, 
   output 	logic 			MemtoReg,
	output 	logic 			PCSource,
	output 	logic [3:0]		ALUFlags,
   output	logic [31:0] 	PC,
	output	logic [31:0] 	Instruction,
	output	logic [31:0] 	ALUResult,WriteData,
	output	logic [31:0] 	ReadData
	);

	logic [31:0] PCNext, PCPlus4, PCPlus8;
	logic [31:0] ExtImm, SrcA, SrcB, Result;
	
	logic [3:0] RA1, RA2;
	
	
	// next PC logic
	
	mux2 #(32) pcmux(.d0(PCPlus4), .d1(Result), .s(PCSrc), .y(PCNext));
	
	flopr #(32) pcreg(.clk(clk), .rst(rst), .d(PCNext), .q(PC));
	
	adder #(32) pcadd1(.a(PC), .b(32'b100), .y(PCPlus4));
	
	adder #(32) pcadd2(.a(PCPlus4), .b(32'b100), .y(PCPlus8));
	
	
	// register file logic
	
	mux2 #(4) ra1mux(.d0(Instruction[19:16]), .d1(4'b1111), .s(RegSource[0]), .y(RA1));
	
	mux2 #(4) ra2mux(.d0(Instruction[3:0]), .d1(Instruction[15:12]), .s(RegSource[1]), .y(RA2));

	regfile regfile(.clk(clk),.rst(rst),.i_Write_Enable(RegWrite),.i_Address_ToRead1(RA1),.i_Address_ToRead2(RA2),.i_Address_ToWrite(Instruction[15:12]),.i_Write_Data(Result),.i_R15(PCPlus8),.o_Read_Data1(SrcA), .o_Read_Data2(WriteData));
	
	mux2 #(32) resmux(.d0(ALUResult), .d1(ReadData), .s(MemtoReg), .y(Result));
	
	extend ext(.Instr(Instruction[23:0]), .ImmSrc(ImmediateSource), .ExtImm(ExtImm));
	
	
	// ALU logic
	
	mux2 #(32) srcbmux(.d0(WriteData), .d1(ExtImm), .s(ALUSrc), .y(SrcB));
	
	alu alu(.i_ALU_Src1(SrcA), .i_ALU_Src2(SrcB), .i_ALU_Control(ALUControl), .o_ALU_Result(ALUResult), .o_ALU_Flags(ALUFlags));
endmodule