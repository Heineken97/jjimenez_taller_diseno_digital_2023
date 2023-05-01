module Paint_VGA(
	input logic [9:0] x, y,
	output logic [7:0] Red, Green, Blue);
	
	logic [9:0] initXMatrix = 10'd0;
   logic [9:0] initYMatrix = 10'd0;
   logic [9:0] N_side = 10'd480;
	logic [9:0] board_limit = 10'd550;
	//logic [7:0] img_selected = y[8:3]; 
	
	logic [7:0] w_red, w_green, w_blue;
	logic paint,pixel,inLine,inSquare;
	
	Memory_VGA Memory(y[8:3] - 10'b11000, x[6:0] - 10'b1100000000, y[6:0], pixel);
	
	SquareGen_VGA MatrixBackground(.x(x),.y(y),.initX(initXMatrix),.initY(initYMatrix),.n(N_side),.inSquare(inSquare));
	
	LineGen_VGA MatrixLines(.x(x), .y(y), .initX(initXMatrix), .initY(initYMatrix), .n(N_side), .inLine(inLine));
	
	always_comb begin
		if (x[8:7] == 2'b10 && y[8:7] == 2'b01 && pixel== 1'b1) begin
			w_red   <= 8'hFF;
			w_blue  <= 8'hFF; 
			w_green <= 8'hFF;
		end else if (x[8:7] == 2'b10 && y[8:7] == 2'b01 && pixel== 1'b0) begin 
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