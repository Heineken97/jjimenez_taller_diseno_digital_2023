module imem(
	input 	logic [31:0] 	Address,
	output 	logic [31:0] 	ReadData
	);
	
	logic [31:0] RAM[63:0];
	
	initial
		$readmemh("C:/Users/Odin/Desktop/Proyecto_Final/Ecualizacion_de_histogramas/src/arm_processor/memfile.dat", RAM);
		
	assign ReadData = RAM[Address[31:2]];
	
endmodule
