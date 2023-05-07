module Controller_VGA(
    input logic clk,
    output logic CLK_VGA, 
    output logic SYNC_H, SYNC_V, SYNC_B, SYNC_BLANK, 
    output logic [7:0] Red, Green, Blue);

    logic[9:0] x,y;
    logic rst,locked;
	 logic [11:0] matrix_FSM [3:0][3:0] = '{ 	'{12'd0	,12'd2	,12'd4	,12'd8},
															'{12'd16	,12'd32	,12'd64	,12'd128},
															'{12'd256,12'd512	,12'd1024	,12'd2048},
															'{12'd4	,12'd2	,12'd128	,12'd256} };
													
    pll vgapll(.refclk(clk), .rst(rst), .locked(locked), .outclk_0(CLK_VGA));
    Synchronizer_VGA#(.HACTIVE(640), .HFP(16), .HSYN(96), .HBP(48), .VACTIVE(480), .VFP(11), .VSYN(2), .VBP(32))
        Synchronizer_VGA(CLK_VGA, SYNC_H, SYNC_V, SYNC_B, SYNC_BLANK, x, y); 
    Paint_VGA Paint_VGA(.matrix_table(matrix_FSM),.x(x), .y(y), .Red(Red), .Green(Green), .Blue(Blue));
endmodule