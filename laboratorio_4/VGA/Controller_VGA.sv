module Controller_VGA(
	input logic clk,
	output logic CLK_VGA, 
	output logic SYNC_H, SYNC_V, SYNC_B, SYNC_BLANK, 
	output logic [7:0] Red, Green, Blue);

	logic[9:0] x,y;
	logic rst,locked;
	
	pll vgapll(.refclk(clk),.rst(rst),.locked(locked), .outclk_0(CLK_VGA));
	
	Synchronizer_VGA#(.HACTIVE(640),.HFP(16),.HSYN(96),.HBP(48),.VACTIVE(480),.VFP(11),.VSYN(2),.VBP(32))
						Synchronizer_VGA(CLK_VGA, SYNC_H, SYNC_V, SYNC_B, SYNC_BLANK, x, y);
						
	Paint_VGA Paint_VGA(x, y, Red, Green, Blue);

endmodule