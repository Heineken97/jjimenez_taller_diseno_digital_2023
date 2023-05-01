module Synchronizer_VGA#(parameter
	HACTIVE 	= 10'd640,
	HFP 		= 10'd16,
	HSYN 		= 10'd96,
	HBP 		= 10'd48,
	HMAX 		= HACTIVE + HFP + HSYN + HBP,
	VBP 		= 10'd32,
	VACTIVE	= 10'd480,
	VFP 		= 10'd11,
	VSYN 		= 10'd2,
	VMAX 		= VACTIVE + VFP + VSYN + VBP)(
	input logic CLK_VGA,
	output logic SYNC_H, SYNC_V, SYNC_B, SYNC_BLANK,
	output logic [9:0] x, y);
		
	always @(posedge CLK_VGA) begin
		if(x >= HMAX)begin
			x <= 0;
			if(y >= VMAX)begin
				y <= 0;
			end else begin
				y <= y + 1;
			end
		end else begin
			x <= x + 1;
		end
	end
	
	assign SYNC_H = ~(x >= HACTIVE + HFP & x < HACTIVE + HFP + HSYN);
	assign SYNC_V = ~(y >= VACTIVE + VFP & y < VACTIVE + VFP + VSYN);
	assign SYNC_B = SYNC_H & SYNC_V;
	assign SYNC_BLANK = (x < HACTIVE) & (y < VACTIVE);
	
endmodule