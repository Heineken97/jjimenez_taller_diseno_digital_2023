
module Paint_VGA(
	input logic [9:0] x, y,
	output logic [7:0] Red, Green, Blue);
	logic [9:0] initXMatrix = 10'd0;
   logic [9:0] initYMatrix = 10'd0;
   logic [9:0] N_side = 10'd480;
	logic [9:0] board_limit = 10'd550;
	//logic [7:0] img_selected = y[8:3]; 
	
	reg  initX = 0, initY = 0;
	logic [7:0] w_red, w_green, w_blue;
	logic square_0,paint,inLine,inSquare, pixel_0,pixel_1,pixel_2,pixel_3,pixel_4,pixel_5,pixel_6,pixel_7,pixel_8,pixel_9,pixel_10,pixel_11,pixel_13,pixel_14,pixel_15;
	
	Memory_VGA Memory_0(.img_selected(y[8:3]), .yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_0), .memorySelect(2));
	Memory_VGA Memory_1(.img_selected(y[8:3]), .yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_1), .memorySelect(4));
	Memory_VGA Memory_2(.img_selected(y[8:3]),.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_2), .memorySelect(2048));
	Memory_VGA Memory_3(.img_selected(y[8:3]),.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_3), .memorySelect(8));
	Memory_VGA Memory_4(.img_selected(y[8:3]),.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_4), .memorySelect(16));
	Memory_VGA Memory_5(.img_selected(y[8:3]),.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_5), .memorySelect(32));
	Memory_VGA Memory_6(.img_selected(y[8:3]),.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_6), .memorySelect(64));
	Memory_VGA Memory_7(.img_selected(y[8:3]),.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_7), .memorySelect(128));
	Memory_VGA Memory_8(.img_selected(y[8:3]),.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_8), .memorySelect(256));
	Memory_VGA Memory_9(.img_selected(y[8:3]),.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_9), .memorySelect(512));
	Memory_VGA Memory_10(.img_selected(y[8:3]),.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_10), .memorySelect(1024));
	Memory_VGA Memory_11(.img_selected(y[8:3]),.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_11), .memorySelect(2048));
	Memory_VGA Memory_12(.img_selected(y[8:3]),.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_12), .memorySelect(8));
	Memory_VGA Memory_13(.img_selected(y[8:3]),.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_13), .memorySelect(16));
	Memory_VGA Memory_14(.img_selected(y[8:3]),.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_14), .memorySelect(8));
	Memory_VGA Memory_15(.img_selected(y[8:3]),.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_15), .memorySelect(4));
	
	SquareGen_VGA MatrixBackground(.x(x),.y(y),.initX(initXMatrix),.initY(initYMatrix),.n(N_side),.inSquare(inSquare));
	
	LineGen_VGA MatrixLines(.x(x), .y(y), .initX(initXMatrix), .initY(initYMatrix), .n(N_side), .inLine(inLine));
	
	always_comb begin
	
		if ((initX+1 <= x && x < initX+119 && initY+1 <= y && y < initX+119) && pixel_0== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+1 <= x && x < initX+119 && initY+1 <= y && y < initY+119) && pixel_0== 1'b0) begin 
			w_red   <= 8'd148;
			w_blue  <= 8'd26; 
			w_green <= 8'd28;
			
		end else if ((initX+121 <= x && x < initX+239 && initY+1 <= y && y < initY+119) && pixel_1== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+121 <= x && x < initX+239 && initY+1 <= y && y < initY+119) && pixel_1== 1'b0) begin 
			w_red   <= 8'd148;
			w_blue  <= 8'd26; 
			w_green <= 8'd28;
			
		end else if ((initX+241 <= x && x < initX+359 && initY+1 <= y && y < initY+119) && pixel_2== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+241 <= x && x < initX+359 && initY+1 <= y && y < initY+119) && pixel_2== 1'b0) begin 
			w_red   <= 8'd148;
			w_blue  <= 8'd26; 
			w_green <= 8'd28;
			
		end else if ((initX+361 <= x && x < initX+479 && initY+1 <= y && y < initY+119) && pixel_3== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+361 <= x && x < initX+479 && initY+1 <= y && y < initY+119) && pixel_3== 1'b0) begin 
			w_red   <= 8'd148;
			w_blue  <= 8'd26; 
			w_green <= 8'd28;
			
		end else if ((initX+1 <= x && x < initX+119 && initY+121 <= y && y < initY+239)  && pixel_4== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+1 <= x && x < initX+119  && initY+121 <= y && y < initY+239) && pixel_4== 1'b0) begin 
			w_red   <= 8'd148;
			w_blue  <= 8'd26; 
			w_green <= 8'd28;
			
		end else if ((initX+121 <= x && x < initX+239 && initY+121 <= y && y < initY+239)  && pixel_5== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+121 <= x && x < initX+239 && initY+121 <= y && y < initY+239) && pixel_5== 1'b0) begin 
			w_red   <= 8'd148;
			w_blue  <= 8'd26; 
			w_green <= 8'd28;
			
		end else if ((initX+241 <= x && x < initX+359 &&  initY+121 <= y && y < initY+239) && pixel_6== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+241 <= x && x < initX+359 &&  initY+121 <= y && y < initY+239) && pixel_6== 1'b0) begin 
			w_red   <= 8'd148;
			w_blue  <= 8'd26; 
			w_green <= 8'd28;
			
		end else if ((initX+361 <= x && x < initX+479 &&  initY+121 <= y && y < initY+239) && pixel_7== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+361 <= x && x < initX+479 &&  initY+121 <= y && y < initY+239) && pixel_7== 1'b0) begin 
			w_red   <= 8'd148;
			w_blue  <= 8'd26; 
			w_green <= 8'd28;
			
		end else if ((initX+1 <= x && x < initX+119 &&  initY+241 <= y && y < initY+359) && pixel_8== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+1 <= x && x < initX+119 &&  initY+241 <= y && y < initY+359) && pixel_8== 1'b0) begin 
			w_red   <= 8'd148;
			w_blue  <= 8'd26; 
			w_green <= 8'd28;
			
			
		end else if ((initX+121 <= x && x < initX+239 && initY+241 <= y && y < initY+359) && pixel_9== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+121 <= x && x < initX+239 && initY+241 <= y && y < initY+359) && pixel_9== 1'b0) begin 
			w_red   <= 8'd148;
			w_blue  <= 8'd26; 
			w_green <= 8'd28;
			
		end else if ((initX+241 <= x && x < initX+359 && initY+241 <= y && y < initY+359)  && pixel_10== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+241 <= x && x < initX+359 && initY+241 <= y && y < initY+359)  && pixel_10== 1'b0) begin 
			w_red   <= 8'd148;
			w_blue  <= 8'd26; 
			w_green <= 8'd28;
			
		end else if ((initX+361 <= x && x < initX+479 && initY+241 <= y && y < initY+359)  && pixel_11== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+361 <= x && x < initX+479 && initY+241 <= y && y < initY+359) && pixel_11== 1'b0) begin 
			w_red   <= 8'd148;
			w_blue  <= 8'd26; 
			w_green <= 8'd28;

			
		end else if ((initX+1 <= x && x < initX+119 && initY+361 <= y && y < initY+479) && pixel_12== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+1 <= x && x < initX+119 && initY+361 <= y && y < initY+479)  && pixel_12== 1'b0) begin 
			w_red   <= 8'd148;
			w_blue  <= 8'd26; 
			w_green <= 8'd28;
			
		end else if ((initX+121 <= x && x < initX+239 && initY+361 <= y && y < initY+479) && pixel_13== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+121 <= x && x < initX+239 && initY+361 <= y && y < initY+479)  && pixel_13== 1'b0) begin 
			w_red   <= 8'd148;
			w_blue  <= 8'd26; 
			w_green <= 8'd28;
			
		end else if ((initX+241 <= x && x < initX+359 && initY+361 <= y && y < initY+479) && pixel_14== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+241 <= x && x < initX+359 && initY+361 <= y && y < initY+479)  && pixel_14== 1'b0) begin 
			w_red   <= 8'd148;
			w_blue  <= 8'd26; 
			w_green <= 8'd28;
			
		end else if ((initX+361 <= x && x < initX+479 && initY+361 <= y && y < initY+479) && pixel_15== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if ((initX+361 <= x && x < initX+479 && initY+361 <= y && y < initY+479)  && pixel_15== 1'b0) begin 
			w_red   <= 8'd148;
			w_blue  <= 8'd26; 
			w_green <= 8'd28;

		end else if (inSquare && inLine) begin			
			w_red   <= 8'd243;
			w_green <= 8'd114;
			w_blue  <= 8'd32;
		end else begin
			w_red   <= 8'h00;
			w_green <= 8'h00;
			w_blue  <= 8'h00;	
		end
	end
	
	assign Red = w_red;
	assign Blue = w_blue;
	assign Green = w_green;
	
endmodule
