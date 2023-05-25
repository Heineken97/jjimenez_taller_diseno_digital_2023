module controller_VGA( 
    input logic clk,
	 input logic [255:0] Old_image,
	 input logic [255:0] New_image,
    output logic CLK_VGA, 
    output logic SYNC_H, SYNC_V, SYNC_B, SYNC_BLANK, 
    output logic [7:0] Red, Green, Blue);

    logic[9:0] x,y;
    logic rst,locked;
    
    pll vgapll(.refclk(clk), .rst(rst), .locked(locked), .outclk_0(CLK_VGA));
	 
    synchronizer_VGA#(.HACTIVE(640), .HFP(16), .HSYN(96), .HBP(48), .VACTIVE(480), .VFP(11), .VSYN(2), .VBP(32))
        Synchronizer_VGA(.CLK_VGA(CLK_VGA), .SYNC_H(SYNC_H), .SYNC_V(SYNC_V), .SYNC_B(SYNC_B), .SYNC_BLANK(SYNC_BLANK), .X(x), .Y(y)); 
		  
    paint_VGA Paint_VGA(.Old_image(Old_image),.New_image(New_image),.X(x), .Y(y), .Red(Red), .Green(Green), .Blue(Blue));
	 
endmodule