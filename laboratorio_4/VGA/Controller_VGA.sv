module Controller_VGA(
		input logic clk,
		output logic CLK_VGA, 
		output logic SYNC_H, SYNC_V, SYNC_B, SYNC_BLANK, 
		output logic [7:0] Red, Green, Blue);

		logic[9:0] x,y;
		logic rst,locked;
		
		logic [11:0] matrix_FSM [3:0][3:0] = '{ '{12'h000,12'h002,12'h004,12'h008},
																'{12'h800,12'h400,12'h200,12'h100},
																'{12'h010,12'h020,12'h040,12'h080},
																'{12'h100,12'h200,12'h400,12'h800} };


		//Funcion PLL que transforma el clock
		pll vgapll(.refclk(clk), .rst(rst), .locked(locked), .outclk_0(CLK_VGA));

		//Modulo del sincronizador señales
		Synchronizer_VGA#(.HACTIVE(640), .HFP(16), .HSYN(96), .HBP(48), .VACTIVE(480), .VFP(11), .VSYN(2), .VBP(32))
			Synchronizer_VGA(CLK_VGA, SYNC_H, SYNC_V, SYNC_B, SYNC_BLANK, x, y); 
    
		//Modulo que pinta pixeles en la pantalla
		Paint_VGA#(.PIN_RED(8'hFF), .PIN_BLUE(8'hFF), .PIN_GREEN(8'hFF),	.PIN_OFF(8'h00))
			Paint_VGA(.matrix_table(matrix_FSM), .x(x), .y(y), .Red(Red), .Green(Green), .Blue(Blue));
	 
endmodule