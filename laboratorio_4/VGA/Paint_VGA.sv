module Paint_VGA(
	input logic [9:0] y, x,
	output logic [7:0] Red, Green, Blue);
	
	logic pixel, paint;
	logic [9:0] board_limit = 10'd550;
	/*logic [6:0] FILA_INT = x[6:0]; 
	logic [6:0] COL_INT = y[6:0];
	logic [1:0] POS_FILA_CUAD  = 2'b11;
	logic [1:0] POS_COL_CUAD =  2'b11;
	logic [1:0] FILA_CUAD = x[8:7];
	logic [1:0] COL_CUAD = y[8:7];	
	logic [7:0] w_red, w_green, w_blue;*/
	logic [7:0] w_red, w_green, w_blue;
	
	Memory_VGA Memory(y[8:3], x[6:0], y[6:0], pixel);
	
	always_comb begin
		if (x[8:7] == 2'b10 && y[8:7] == 2'b01 && pixel== 1'b1)
			begin
				w_red <= 8'hFF;
				w_blue <= 8'hFF; 
				w_green <= 8'hFF;
			end
		else
			begin 
				w_red <= 8'h00;
				w_blue <= 8'h00; 
				w_green <= 8'h00;	
			end
	end
	
	assign Red = w_red;
	assign Blue = w_blue;
	assign Green = w_green;
	
	
	/*assign Red = paint ? w_red : 8'h00;
	assign Blue = paint ? w_blue: 8'h00;
	assign Green = paint ? w_green : 8'h00;*/
	
	//Memory_VGA Memory_2(y[9:4], x[7:0], y[7:0], pixel_2);
	
	//logic [5:0] img_selected;
	//logic [2:0] i_xoff, i_yoff;
	//Memory_VGA Memory(img_selected, i_xoff, i_yoff, pixel);

	
	/*always @(posedge CLK_VGA) begin
		if (y > 0 & x > 0)
			if (y <= 119 & x <= 119)
				begin
					img_selected <= y[8:3];
					i_xoff <= x[2:0];
					i_yoff <= y[2:0];
				end
	end*/
	
	//assign {Red, Blue} = (y[3]==0) ? {{4{pixel}},4'h00} : {4'h00,{4{pixel}}};
	
	/*
	//DIBUJA CUADRO NEGRO ESQUINA SUPERIOR IZQUIERDA DE LA PANTALLA EN VERDE
	logic [7:0] r_red, r_blue, r_green;
	
	always @(posedge CLK_VGA) begin
		if (y < 200)
			begin
				r_red <= 8'hFF;
				r_blue <= 8'hFF; 
				r_green <= 8'hFF;
			end
		else if (y >= 600)
			begin
			if (x < 200)
				begin 
					r_red <= 8'hFF;
					r_blue <= 8'hFF; 
					r_green <= 8'hFF;
				end
			if (x >= 600)
				begin 
					r_red <= 8'hFF;
					r_blue <= 8'hFF; 
					r_green <= 8'hFF;
				end	
			end
		
	end		

	assign Green = (x > 0 && x <= 119 && y > 0 && y <= 119) ? r_green : 8'h00;
	assign Red = (x > 0 && x <= 119 && y > 0 && y <= 119) ? r_red : 8'hFF;
	assign Blue = (x > 0 && x <= 199 && y > 0 && y <= 119) ? r_blue : 8'b01010101;*/
	
	//logic pixel, inrect;
	
	//Memory_VGA Memory(y[8:3] + 8'd65, x[2:0], y[2:0], pixel);
	//Memory_VGA Memory_1(y[7] + 8'd65, x[2:0], y[2:0], pixel_1);
	//RectangularGen_VGA RectangularGen(x, y, 10'd0, 10'd0, 10'd479, 10'd479, inrect);
	
	/*
	logic [7:0] w_red, w_blue;
	always_comb
		if(x[9:0] == 10'b0001110111) 
			{w_red, w_blue} = (y[4]==0) ? {{8{pixel}},8'h00} : {8'h00,{8{pixel}}}; 
			
	assign Red = w_red;
	assign Blue = w_blue;
	*/
		
	//assign {Red, Blue} = (y[3]==0) ? {{8{pixel}},8'h00} : {8'h00,{8{pixel}}};
	//assign Green = 8'h00;
	//assign Green = inrect ? 8'hFF : 8'h00;
	
	/*always_comb begin
		case(img_selected)
			0: yoff_Memory <= 7'd9;
			1: yoff_Memory <= 7'd9;
			2: yoff_Memory <= 7'd18;
			3: yoff_Memory <= 7'd27;
			4: yoff_Memory <= 7'd36;
			5: yoff_Memory <= 7'd45;
			6: yoff_Memory <= 7'd54;
			7: yoff_Memory <= 7'd63;
			8: yoff_Memory <= 7'd72;
			9: yoff_Memory <= 7'd81;
			10: yoff_Memory <= 7'd90;
			11: yoff_Memory <= 7'd99;
			default: yoff_Memory <= 7'd0;
		endcase
	end*/
	
endmodule