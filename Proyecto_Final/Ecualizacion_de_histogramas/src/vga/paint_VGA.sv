module paint_VGA(
	input logic [9:0] X, Y,
	output logic [7:0] Red, Green, Blue);
	
	logic [7:0] w_red, w_green, w_blue;
	logic [2:0] pixel_old, pixel_new;
	reg  initX = 125, initY = 150;
	
	Memory_ROM Memory0(.yoff(X[7:0]), .xoff(Y[7:0]),.pixel(pixel_old), .memorySelect(0));
	Memory_ROM Memory1(.yoff(X[7:0]), .xoff(Y[7:0]),.pixel(pixel_new), .memorySelect(1));
	always@(*) begin
		if (initX+1 <= X && X < initX+255 && initY+1 <= Y && Y < initX+255 &&  pixel_old == 3'd0) begin
			w_red   <= 8'd0;
			w_green <= 8'd0;
			w_blue  <= 8'd0;
		end
		if (initX+1 <= X && X < initX+255 && initY+1 <= Y && Y < initX+255 &&  pixel_old == 3'd1) begin
			w_red   <= 8'd255;
			w_green <= 8'd255;
			w_blue  <= 8'd0;
		end
		if (initX+1 <= X && X < initX+255 && initY+1 <= Y && Y < initX+255 &&  pixel_old == 3'd2) begin
			w_red   <= 8'd0;
			w_green <= 8'd255;
			w_blue  <= 8'd0;
		end
		if (initX+1 <= X && X < initX+255 && initY+1 <= Y && Y < initX+255 &&  pixel_old == 3'd3) begin
			w_red   <= 8'd255;
			w_green <= 8'd255;
			w_blue  <= 8'd255;
		end
		if (initX+1 <= X && X < initX+255 && initY+1 <= Y && Y < initX+255 &&  pixel_old == 3'd4) begin
			w_red   <= 8'd0;
			w_green <= 8'd0;
			w_blue  <= 8'd80;
		end
		if (initX+1 <= X && X < initX+255 && initY+1 <= Y && Y < initX+255 &&  pixel_old == 3'd5) begin
			w_red   <= 8'd0;
			w_green <= 8'd80;
			w_blue  <= 8'd80;
		end
		if (initX+1 <= X && X < initX+255 && initY+1 <= Y && Y < initX+255 &&  pixel_old == 3'd6) begin
			w_red   <= 8'd80;
			w_green <= 8'd0;
			w_blue  <= 8'd80;
		end
		if (initX+1 <= X && X < initX+255 && initY+1 <= Y && Y < initX+255 &&  pixel_old == 3'd7) begin
			w_red   <= 8'd80;
			w_green <= 8'd80;
			w_blue  <= 8'd80;
		end
		if (initX+256 <= X && X < initX+511 && initX+1 <= Y && Y < initX+255 &&  pixel_new == 3'd0) begin
			w_red   <= 8'd0;
			w_green <= 8'd0;
			w_blue  <= 8'd0;
		end
		if (initX+256 <= X && X < initX+511 && initX+1 <= Y && Y < initX+255 &&  pixel_new == 3'd1) begin
			w_red   <= 8'd255;
			w_green <= 8'd255;
			w_blue  <= 8'd0;
		end
		if (initX+256 <= X && X < initX+511 && initX+1 <= Y && Y < initX+255 &&  pixel_new == 3'd2) begin
			w_red   <= 8'd0;
			w_green <= 8'd255;
			w_blue  <= 8'd0;
		end
		if (initX+256 <= X && X < initX+511 && initX+1 <= Y && Y < initX+255 &&  pixel_new == 3'd3) begin
			w_red   <= 8'd255;
			w_green <= 8'd255;
			w_blue  <= 8'd255;
		end
		if (initX+256 <= X && X < initX+511 && initX+1 <= Y && Y < initX+255 &&  pixel_new == 3'd4) begin
			w_red   <= 8'd0;
			w_green <= 8'd0;
			w_blue  <= 8'd80;
		end
		if (initX+256 <= X && X < initX+511 && initX+1 <= Y && Y < initX+255 &&  pixel_new == 3'd5) begin
			w_red   <= 8'd0;
			w_green <= 8'd80;
			w_blue  <= 8'd80;
		end
		if (initX+256 <= X && X < initX+511 && initX+1 <= Y && Y < initX+255 &&  pixel_new == 3'd6) begin
			w_red   <= 8'd80;
			w_green <= 8'd0;
			w_blue  <= 8'd80;
		end
		if (initX+256 <= X && X < initX+511 && initX+1 <= Y && Y < initX+255 &&  pixel_new == 3'd7) begin
			w_red   <= 8'd80;
			w_green <= 8'd80;
			w_blue  <= 8'd80;
		end
		else
		begin
			w_red   <= 8'd12;
			w_blue  <= 8'd144; 
			w_green <= 8'd25;
		end
	end
	assign Red = w_red;
	assign Blue = w_blue;
	assign Green = w_green;
	/*
	always_comb begin
		if (initX+1 <= X && X < initX+255 && initY+1 <= Y && Y < initX+255) begin
			case (pixel_old)
				0: begin
					w_red   <= 8'd00;
					w_green <= 8'd00;
					w_blue  <= 8'd00;
				end
				1: begin
					w_red   <= 8'd255;
					w_green <= 8'd255;
					w_blue  <= 8'd00;
				end
				2: begin
					w_red   <= 8'd00;
					w_green <= 8'd255;
					w_blue  <= 8'd00;
				end
				3: begin
					w_red   <= 8'd255;
					w_green <= 8'd255;
					w_blue  <= 8'd255;
				end
				4: begin
					w_red   <= 8'd00;
					w_green <= 8'd00;
					w_blue  <= 8'd80;
				end	
				5: begin
					w_red   <= 8'd00;
					w_green <= 8'd80;
					w_blue  <= 8'd80;
				end		
				6: begin
					w_red   <= 8'd80;
					w_green <= 8'd00;
					w_blue  <= 8'd80;
				end			 	
				7: begin
					w_red   <= 8'd80;
					w_green <= 8'd80;
					w_blue  <= 8'd80;
				end	
				default: begin
					w_red   <= 8'd00;
					w_green <= 8'd00;
					w_blue  <= 8'd00;
				end		
			endcase
		end else
		if (initX+256 <= X && X < initX+511 && initX+1 <= Y && Y < initX+255) begin
			case (pixel_new)
				0: begin
					w_red   <= 8'd00;
					w_green <= 8'd00;
					w_blue  <= 8'd00;
				end
				1: begin
					w_red   <= 8'd255;
					w_green <= 8'd255;
					w_blue  <= 8'd00;
				end
				2: begin
					w_red   <= 8'd00;
					w_green <= 8'd255;
					w_blue  <= 8'd00;
				end
				3: begin
					w_red   <= 8'd255;
					w_green <= 8'd255;
					w_blue  <= 8'd255;
				end
				4: begin
					w_red   <= 8'd00;
					w_green <= 8'd00;
					w_blue  <= 8'd80;
				end	
				5: begin
					w_red   <= 8'd00;
					w_green <= 8'd80;
					w_blue  <= 8'd80;
				end		
				6: begin
					w_red   <= 8'd80;
					w_green <= 8'd00;
					w_blue  <= 8'd80;
				end			 	
				7: begin
					w_red   <= 8'd80;
					w_green <= 8'd80;
					w_blue  <= 8'd80;
				end	
				default: begin
					w_red   <= 8'd00;
					w_green <= 8'd00;
					w_blue  <= 8'd00;
				end		
			endcase
		end else begin
			w_red   <= 8'd12;
			w_blue  <= 8'd144; 
			w_green <= 8'd25;
		end
	end	
	*/
	
endmodule