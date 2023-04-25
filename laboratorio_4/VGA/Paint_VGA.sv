module Paint_VGA(
	input logic [9:0] x, y,
	output logic [7:0] Red, Green, Blue);
	
	logic pixel, inrect;
	Memory_VGA Memory(y[8:3] + 8'd65, x[2:0], y[2:0], pixel);
	RectangularGen_VGA RectangularGen(x, y, 10'd120, 10'd150, 10'd200, 10'd230, inrect);
	
	assign {Red, Blue} = (y[3]==0) ? {{8{pixel}},8'h00} : {8'h00,{8{pixel}}};
	assign Green = inrect ? 8'hFF : 8'h00;
endmodule