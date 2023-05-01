module Controller_VGA(
	input logic clk,
	output logic CLK_VGA, 
	output logic SYNC_H, SYNC_V, SYNC_B, SYNC_BLANK, 
	output logic [7:0] Red, Green, Blue);

	logic [9:0] x,y; //numero de fila_x, columna_y en binario
	logic rst,locked;
	
	//logic [15:0] data = 16'h0008; //0000 0000 0000 1000
	
	pll vgapll(.refclk(clk),.rst(rst),.locked(locked), .outclk_0(CLK_VGA));
	
	Synchronizer_VGA#(.HACTIVE(640),.HFP(16),.HSYN(96),.HBP(48),.VACTIVE(480),.VFP(11),.VSYN(2),.VBP(32))
						Synchronizer_VGA(CLK_VGA, SYNC_H, SYNC_V, SYNC_B, SYNC_BLANK, y, x);
	
	Paint_VGA myPaint_VGA(y, x, Red, Green, Blue);
	//Paint_VGA myPaint_VGA(x, y, Red, Green, Blue);
	
	/*genvar i;
	generate
		if(Red != 8'h00 & Blue != 8'h00 & Green != 8'h00)
			for (i = 1; i < 5; i++) begin : paint_loop
				Paint_VGA myPaint_VGA(x, y, Red, Green, Blue);
			end
	endgenerate*/
	
endmodule