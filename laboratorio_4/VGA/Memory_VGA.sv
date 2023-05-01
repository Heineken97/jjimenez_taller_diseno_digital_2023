module Memory_VGA(
	input logic [7:0] img_selected,
	input logic [7:0] yoff, xoff,
	output logic pixel);
	
	logic [119:0] charrom[2047:0]; 
	logic [119:0] line;
	
	initial
	$readmemb("imagen.txt", charrom);
	
	assign line = charrom[yoff];
	assign pixel = line[7'd119-xoff];
	
	
	/*logic [5:0] charrom[2047:0]; 
	logic [7:0] line;
	
	initial
	$readmemb("img_VGA.txt", charrom);

	//assign line = charrom[yoff + {char-65, 3'b000 (desde la fila que comienza a pintar)}]; 
	
	assign line = charrom[yoff + {img_selected, 3'b000}];
	assign pixel = line[3'd7- xoff];
	
	always_comb
		if(xoff 
	end*/
	
endmodule 