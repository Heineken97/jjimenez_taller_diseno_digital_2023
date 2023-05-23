module imem(
	input 	logic [31:0] 	Address,
	output 	logic [31:0] 	ReadData
	);
	
	logic [31:0] RAM[63:0];
	
	//initial
		//$readmemh("memfile.dat", RAM);
		
	assign ReadData = RAM[Address[31:2]];
	
endmodule
