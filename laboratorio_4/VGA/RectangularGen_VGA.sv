module RectangularGen_VGA(
	input logic [9:0] x, y, left, top, right, bot, 
	output logic inrect);
	assign inrect = (x >= left & x < right & y >= top & y < bot);
endmodule