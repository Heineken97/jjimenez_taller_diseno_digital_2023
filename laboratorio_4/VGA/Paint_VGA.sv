module Paint_VGA(
	input logic [9:0] x, y,
	input logic [11:0] matrix_table [3:0][3:0],
	output logic [7:0] Red, Green, Blue);
	logic [9:0] initXMatrix = 10'd0;
   logic [9:0] initYMatrix = 10'd0;
   logic [9:0] N_side = 10'd480;
	
	reg  initX = 0, initY = 0;
	logic [7:0] w_red, w_green, w_blue;
	logic square_0,paint,inLine, pixel_0,pixel_1,pixel_2,pixel_3,pixel_4,pixel_5,
			pixel_6,pixel_7,pixel_8,pixel_9,pixel_10,pixel_11,pixel_13,pixel_14,pixel_15,finish = 1'b1,winner = 1'b1;

	Memory_VGA Memory_0(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_0), .memorySelect(matrix_table[3][3]));
	Memory_VGA Memory_1(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_1), .memorySelect(matrix_table[3][2]));
	Memory_VGA Memory_2(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_2), .memorySelect(matrix_table[3][1]));
	Memory_VGA Memory_3(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_3), .memorySelect(matrix_table[3][0]));
	Memory_VGA Memory_4(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_4), .memorySelect(matrix_table[2][3]));
	Memory_VGA Memory_5(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_5), .memorySelect(matrix_table[2][2]));
	Memory_VGA Memory_6(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_6), .memorySelect(matrix_table[2][1]));
	Memory_VGA Memory_7(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_7), .memorySelect(matrix_table[2][0]));
	Memory_VGA Memory_8(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_8), .memorySelect(matrix_table[1][3]));
	Memory_VGA Memory_9(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_9), .memorySelect(matrix_table[1][2]));
	Memory_VGA Memory_10(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_10), .memorySelect(matrix_table[1][1]));
	Memory_VGA Memory_11(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_11), .memorySelect(matrix_table[1][0]));
	Memory_VGA Memory_12(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_12), .memorySelect(matrix_table[0][3]));
	Memory_VGA Memory_13(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_13), .memorySelect(matrix_table[0][2]));
	Memory_VGA Memory_14(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_14), .memorySelect(matrix_table[0][1]));
	Memory_VGA Memory_15(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_15), .memorySelect(matrix_table[0][0]));
	LineGen_VGA MatrixLines(.x(x), .y(y), .initX(initXMatrix), .initY(initYMatrix), .n(N_side), .inLine(inLine));
	
	Memory_VGA Memory_16(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_continue), .memorySelect(2));
	
	always_comb begin
	
		if ((initX+1 <= x && x < initX+119 && initY+1 <= y && y < initX+119) && pixel_0== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+1 <= x && x < initX+119 && initY+1 <= y && y < initY+119) && pixel_0== 1'b0) begin 
			w_red   <= 8'd144;
			w_green <= 8'd12;
			w_blue  <= 8'd63;	
			
		end else if ((initX+121 <= x && x < initX+239 && initY+1 <= y && y < initY+119) && pixel_1== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+121 <= x && x < initX+239 && initY+1 <= y && y < initY+119) && pixel_1== 1'b0) begin 
			w_red   <= 8'd144;
			w_green <= 8'd12;
			w_blue  <= 8'd63;	
			
		end else if ((initX+241 <= x && x < initX+359 && initY+1 <= y && y < initY+119) && pixel_2== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+241 <= x && x < initX+359 && initY+1 <= y && y < initY+119) && pixel_2== 1'b0) begin 
			w_red   <= 8'd144;
			w_green <= 8'd12;
			w_blue  <= 8'd63;	
			
		end else if ((initX+361 <= x && x < initX+479 && initY+1 <= y && y < initY+119) && pixel_3== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+361 <= x && x < initX+479 && initY+1 <= y && y < initY+119) && pixel_3== 1'b0) begin 
			w_red   <= 8'd144;
			w_green <= 8'd12;
			w_blue  <= 8'd63;	
			
		end else if ((initX+1 <= x && x < initX+119 && initY+121 <= y && y < initY+239)  && pixel_4== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+1 <= x && x < initX+119  && initY+121 <= y && y < initY+239) && pixel_4== 1'b0) begin 
			w_red   <= 8'd144;
			w_green <= 8'd12;
			w_blue  <= 8'd63;	
			
		end else if ((initX+121 <= x && x < initX+239 && initY+121 <= y && y < initY+239)  && pixel_5== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+121 <= x && x < initX+239 && initY+121 <= y && y < initY+239) && pixel_5== 1'b0) begin 
			w_red   <= 8'd144;
			w_green <= 8'd12;
			w_blue  <= 8'd63;	
			
		end else if ((initX+241 <= x && x < initX+359 &&  initY+121 <= y && y < initY+239) && pixel_6== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+241 <= x && x < initX+359 &&  initY+121 <= y && y < initY+239) && pixel_6== 1'b0) begin 
			w_red   <= 8'd144;
			w_green <= 8'd12;
			w_blue  <= 8'd63;	
			
		end else if ((initX+361 <= x && x < initX+479 &&  initY+121 <= y && y < initY+239) && pixel_7== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+361 <= x && x < initX+479 &&  initY+121 <= y && y < initY+239) && pixel_7== 1'b0) begin 
			w_red   <= 8'd144;
			w_green <= 8'd12;
			w_blue  <= 8'd63;	
			
		end else if ((initX+1 <= x && x < initX+119 &&  initY+241 <= y && y < initY+359) && pixel_8== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+1 <= x && x < initX+119 &&  initY+241 <= y && y < initY+359) && pixel_8== 1'b0) begin 
			w_red   <= 8'd144;
			w_green <= 8'd12;
			w_blue  <= 8'd63;	
			
			
		end else if ((initX+121 <= x && x < initX+239 && initY+241 <= y && y < initY+359) && pixel_9== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+121 <= x && x < initX+239 && initY+241 <= y && y < initY+359) && pixel_9== 1'b0) begin 
			w_red   <= 8'd144;
			w_green <= 8'd12;
			w_blue  <= 8'd63;	
			
		end else if ((initX+241 <= x && x < initX+359 && initY+241 <= y && y < initY+359)  && pixel_10== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+241 <= x && x < initX+359 && initY+241 <= y && y < initY+359)  && pixel_10== 1'b0) begin 
			w_red   <= 8'd144;
			w_green <= 8'd12;
			w_blue  <= 8'd63;	
			
		end else if ((initX+361 <= x && x < initX+479 && initY+241 <= y && y < initY+359)  && pixel_11== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+361 <= x && x < initX+479 && initY+241 <= y && y < initY+359) && pixel_11== 1'b0) begin 
			w_red   <= 8'd144;
			w_green <= 8'd12;
			w_blue  <= 8'd63;	

			
		end else if ((initX+1 <= x && x < initX+119 && initY+361 <= y && y < initY+479) && pixel_12== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+1 <= x && x < initX+119 && initY+361 <= y && y < initY+479)  && pixel_12== 1'b0) begin 
			w_red   <= 8'd144;
			w_green <= 8'd12;
			w_blue  <= 8'd63;	
			
		end else if ((initX+121 <= x && x < initX+239 && initY+361 <= y && y < initY+479) && pixel_13== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+121 <= x && x < initX+239 && initY+361 <= y && y < initY+479)  && pixel_13== 1'b0) begin 
			w_red   <= 8'd144;
			w_green <= 8'd12;
			w_blue  <= 8'd63;	
			
		end else if ((initX+241 <= x && x < initX+359 && initY+361 <= y && y < initY+479) && pixel_14== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+241 <= x && x < initX+359 && initY+361 <= y && y < initY+479)  && pixel_14== 1'b0) begin 
			w_red   <= 8'd144;
			w_green <= 8'd12;
			w_blue  <= 8'd63;	
			
		end else if ((initX+361 <= x && x < initX+479 && initY+361 <= y && y < initY+479) && pixel_15== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+361 <= x && x < initX+479 && initY+361 <= y && y < initY+479)  && pixel_15== 1'b0) begin 
			w_red   <= 8'd144;
			w_green <= 8'd12;
			w_blue  <= 8'd63;	
					
		end else if ((initX+500 <= x && x < initX+600 && initY+180 <= y && y < initY+300)  && pixel_continue== 1'b1) begin 
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+500 <= x && x < initX+600 && initY+180 <= y && y < initY+300)  && pixel_continue== 1'b0) begin 
			w_red   <= 8'd250;
			w_blue  <= 8'd250; 
			w_green <= 8'd0;
			
		end else if (finish== 1'b1 && winner== 1'b1 && (initX+500 <= x && x < initX+600 && initY+180 <= y && y < initY+300)  && pixel_continue== 1'b0) begin 
			w_red   <= 8'd0;
			w_blue  <= 8'd30; 
			w_green <= 8'h250;
		end else if (finish== 1'b1 && winner== 1'b0 && (initX+500 <= x && x < initX+600 && initY+180 <= y && y < initY+300)  && pixel_continue== 1'b0) begin 
			w_red   <= 8'd250;
			w_blue  <= 8'd30; 
			w_green <= 8'd0;
		
		end else if (inLine) begin			
			w_red   <= 8'd12;
			w_blue  <= 8'd21; 
			w_green <= 8'd144;
			
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
