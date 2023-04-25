module Memory_VGA(
	input logic [7:0] char,
	input logic [2:0] xoff, yoff,
	output logic pixel);
	
	logic [5:0] charrom[2047:0]; 
	logic [7:0] line;
	
	initial
	$readmemb("img_VGA.txt", charrom);

	assign line = charrom[yoff + {char-65, 3'b000}]; 

	assign pixel = line[3'd7-xoff];
endmodule