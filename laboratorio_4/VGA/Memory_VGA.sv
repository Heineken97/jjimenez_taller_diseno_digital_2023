module Memory_VGA(
	input logic [7:0] img_selected,
	input logic [7:0] yoff, xoff,
	output logic pixel);
	
	logic [119:0] charrom[2047:0]; 
	logic [119:0] line;
	
	initial
	$readmemb("img_VGA.txt", charrom);
	
	assign line = charrom[yoff];
	assign pixel = line[7'd119-xoff];

endmodule