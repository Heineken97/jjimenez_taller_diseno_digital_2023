module top_module(
	input 	logic 			clk ,
	input 	logic 			rst ,
	output 	logic [31:0] 	WriteData,
	output 	logic [31:0] 	DataAddr,
	output 	logic 			MemWrite,output logic CLK_VGA, 
   output 	logic 			SYNC_H, SYNC_V, SYNC_B, SYNC_BLANK, 
   output	logic [7:0] 	Red, Green, Blue
	);

	logic [31:0] ReadData, PC, Instruction;
	logic [255:0] Old_image, New_image;
	
	armv4 arm_microprocessor(.clk(clk), .rst(rst), .Instruction(Instruction), .ReadData(ReadData), .PC(PC), .ALUResult(DataAddr),
									.WriteData(WriteData), .MemWrite(MemWrite));

	imem instruction_memory(.Address(PC), .ReadData(Instruction));

	dmem data_memory(.clk(clk),.WriteEnable(MemWrite),.Address(DataAddr),.WriteData(WriteData),.ReadData(ReadData));
	
	logic [255:0][255:0] pixel_oldImage,pixel_newImage;
	
	genvar x_o, y_o;
	generate
	  for (x_o = 0; x_o < 256; x_o = x_o + 1) begin : COLUMN_GEN_O
		 for (y_o = 0; y_o < 256; y_o = y_o + 1) begin : ROW_GEN_O
			Memory_ROM old_Image(.pixel(pixel_oldImage[x_o][y_o]), .memorySelect(0));
		 end
	  end
	endgenerate
	
	genvar x_n, y_n;
	generate
	  for (x_n = 0; x_n < 256; x_n = x_n + 1) begin : COLUMN_GEN_N
		 for (y_n = 0; y_n < 256; y_n = y_n + 1) begin : ROW_GEN_N
			Memory_ROM new_Image(.pixel(pixel_newImage[x_n][y_n]), .memorySelect(1));
		 end
	  end
	endgenerate


	
	controller_VGA controllerVGA(.clk(clk),.Old_image(Old_image),.New_image(New_image),.CLK_VGA(CLK_VGA),.SYNC_H(SYNC_H), .SYNC_V(SYNC_V), .SYNC_B(SYNC_B), .SYNC_BLANK(SYNC_BLANK),.Red(Red), .Green(Green), .Blue(Blue));
							
endmodule