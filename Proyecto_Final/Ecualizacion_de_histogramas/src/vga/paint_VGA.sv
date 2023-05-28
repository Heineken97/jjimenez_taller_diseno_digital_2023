module paint_VGA(
	input logic [9:0] X, Y,
	//input logic matrix_table,
	output logic [7:0] Red, Green, Blue);
	
	logic [7:0] w_red, w_green, w_blue;
	logic [2:0] pixel_old, pixel_new;
	reg  initX = 125, initY = 150;
	
	Memory_ROM Memory0(.yoff(X[7:0]), .xoff(Y[7:0]),.pixel(pixel_old), .memorySelect(0));
	Memory_ROM Memory1(.yoff(X[7:0]), .xoff(Y[7:0]),.pixel(pixel_new), .memorySelect(1));
	always_comb begin
		if (initX+1 <= X && X < initX+255 && initY+1 <= Y && Y < initX+255) begin
			case ({pixel_old[2:0]})
				0: begin
				w_red   <= 8'h00;
				w_green <= 8'h00;
				w_blue  <= 8'h00;
				end
				1: begin
					w_red   <= 8'hFF;
					w_green <= 8'hFF;
					w_blue  <= 8'h00;
				end
				2: begin
					w_red   <= 8'h00;
					w_green <= 8'hFF;
					w_blue  <= 8'h00;
				end
				3: begin
					w_red   <= 8'hFF;
					w_green <= 8'hFF;
					w_blue  <= 8'hFF;
				end
				4: begin
					w_red   <= 8'h00;
					w_green <= 8'h00;
					w_blue  <= 8'h80;
				end	
				5: begin
					w_red   <= 8'h00;
					w_green <= 8'h80;
					w_blue  <= 8'h80;
				end		
				6: begin
					w_red   <= 8'h80;
					w_green <= 8'h00;
					w_blue  <= 8'h80;
				end			 	
				7: begin
					w_red   <= 8'h80;
					w_green <= 8'h80;
					w_blue  <= 8'h80;
				end	
				default: begin
					w_red   <= 8'h00;
					w_green <= 8'h00;
					w_blue  <= 8'h00;
				end		
			endcase
		end else
		if (initX+256 <= X && X < initX+511 && initX+1 <= Y && Y < initX+255) begin
			case ({pixel_new[2:0]})
				0: begin
				w_red   <= 8'h00;
				w_green <= 8'h00;
				w_blue  <= 8'h00;
				end
				1: begin
					w_red   <= 8'hFF;
					w_green <= 8'hFF;
					w_blue  <= 8'h00;
				end
				2: begin
					w_red   <= 8'h00;
					w_green <= 8'hFF;
					w_blue  <= 8'h00;
				end
				3: begin
					w_red   <= 8'hFF;
					w_green <= 8'hFF;
					w_blue  <= 8'hFF;
				end
				4: begin
					w_red   <= 8'h00;
					w_green <= 8'h00;
					w_blue  <= 8'h80;
				end	
				5: begin
					w_red   <= 8'h00;
					w_green <= 8'h80;
					w_blue  <= 8'h80;
				end		
				6: begin
					w_red   <= 8'h80;
					w_green <= 8'h00;
					w_blue  <= 8'h80;
				end			 	
				7: begin
					w_red   <= 8'h80;
					w_green <= 8'h80;
					w_blue  <= 8'h80;
				end	
				default: begin
					w_red   <= 8'h00;
					w_green <= 8'h00;
					w_blue  <= 8'h00;
				end	
			endcase
		end else begin
			w_red   <= 8'd12;
			w_blue  <= 8'd144; 
			w_green <= 8'd25;
		end
	end
	assign Red = w_red;
	assign Blue = w_blue;
	assign Green = w_green;
endmodule