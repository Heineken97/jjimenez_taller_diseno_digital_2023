module dmem(
	input 	logic 			clk ,
	input 	logic 			WriteEnable ,
	input 	logic [31:0] 	Address,
	input 	logic [31:0] 	WriteData,
	output 	logic [31:0] 	ReadData
	);
	
	logic [31:0] RAM[63:0];
	
	assign ReadData = RAM[Address[31:2]];
	
	always_ff@(posedge clk) begin
		if(WriteEnable) RAM[Address[31:2]] <= WriteData;
	end
	
endmodule
