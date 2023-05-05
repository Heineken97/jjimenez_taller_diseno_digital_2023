
module Paint_VGA#(parameter
	PIN_RED = 8'hFF,
	PIN_BLUE = 8'hFF,
	PIN_GREEN = 8'hFF,
	PIN_OFF = 8'h00)
	(input logic [9:0] x, y,
	input logic [11:0] matrix_table [3:0][3:0],
	output logic [7:0] Red, Green, Blue);
	
	logic [9:0] initXMatrix = 10'd0;
   logic [9:0] initYMatrix = 10'd0;
   logic [9:0] N_side = 10'd480;
	
	logic [9:0] limit_x1 = 'd1;
	logic [9:0] limit_x2 = 'd122;
	logic [9:0] limit_x3 = 'd127;
	logic [9:0] limit_x4 = 'd248;
	logic [9:0] limit_x5 = 'd253;
	logic [9:0] limit_x6 = 'd374;
	logic [9:0] limit_x7 = 'd379;
	logic [9:0] limit_x8 = 'd500;
	//limit_y1 = limit_x1
	logic [9:0] limit_y2 = 'd119;
	logic [9:0] limit_y3 = 'd121;
	logic [9:0] limit_y4 = 'd241;
	logic [9:0] limit_y5 = 'd244;
	logic [9:0] limit_y6 = 'd364;
	logic [9:0] limit_y7 = 'd367;
	logic [9:0] limit_y8 = 'd487;
	
	reg  initX = 0, initY = 0;
	logic [7:0] w_red, w_green, w_blue;
	logic inLine,inSquare, pixel_0,pixel_1,pixel_2,pixel_3,pixel_4,pixel_5,pixel_6,pixel_7,pixel_8,pixel_9,pixel_10,pixel_11,pixel_13,pixel_14,pixel_15;
	
	Memory_VGA Memory_0(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_0), .memorySelect(matrix_table[0][0]));
	Memory_VGA Memory_1(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_1), .memorySelect(matrix_table[0][1]));
	Memory_VGA Memory_2(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_2), .memorySelect(matrix_table[0][2]));
	Memory_VGA Memory_3(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_3), .memorySelect(matrix_table[0][3]));
	Memory_VGA Memory_4(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_4), .memorySelect(matrix_table[1][0]));
	Memory_VGA Memory_5(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_5), .memorySelect(matrix_table[1][1]));
	Memory_VGA Memory_6(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_6), .memorySelect(matrix_table[1][2]));
	Memory_VGA Memory_7(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_7), .memorySelect(matrix_table[1][3]));
	Memory_VGA Memory_8(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_8), .memorySelect(matrix_table[2][0]));
	Memory_VGA Memory_9(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_9), .memorySelect(matrix_table[2][1]));
	Memory_VGA Memory_10(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_10), .memorySelect(matrix_table[2][2]));
	Memory_VGA Memory_11(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_11), .memorySelect(matrix_table[2][3]));
	Memory_VGA Memory_12(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_12), .memorySelect(matrix_table[3][0]));
	Memory_VGA Memory_13(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_13), .memorySelect(matrix_table[3][1]));
	Memory_VGA Memory_14(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_14), .memorySelect(matrix_table[3][2]));
	Memory_VGA Memory_15(.yoff(x[6:0]), .xoff(y[6:0]),.pixel(pixel_15), .memorySelect(matrix_table[3][3]));
	
	//SquareGen_VGA MatrixBackground(.x(x),.y(y),.initX(initXMatrix),.initY(initYMatrix),.n(N_side),.inSquare(inSquare));
	
	//LineGen_VGA MatrixLines(.x(x), .y(y), .initX(initXMatrix), .initY(initYMatrix), .n(N_side), .inLine(inLine));
	
	always_comb begin
	
		//Pintar Imagen Casilla 00-00
		if ((initX+limit_x1 <= x && x < initX+limit_x2 && initY+limit_x1 <= y && y < initX+limit_y2) && pixel_0== 1'b1) begin
			//BLANCO
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_GREEN;
		end else if ((initX+limit_x1 <= x && x < initX+limit_x2 && initY+limit_x1 <= y && y < initY+limit_y2) && pixel_0== 1'b0) begin 
			//MAGENTA
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_OFF;
			
		//Pintar Imagen Casilla 00-01
		end else if ((initX+limit_x3 <= x && x < initX+limit_x4 && initY+limit_x1 <= y && y < initY+limit_y2) && pixel_1== 1'b1) begin
			//BLANCO
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_GREEN;
		end else if ((initX+limit_x3 <= x && x < initX+limit_x4 && initY+limit_x1 <= y && y < initY+limit_y2) && pixel_1== 1'b0) begin 
			//MAGENTA
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_OFF;
			
		//Pintar Imagen Casilla 00-02
		end else if ((initX+limit_x5 <= x && x < initX+limit_x6 && initY+limit_x1 <= y && y < initY+limit_y2) && pixel_2== 1'b1) begin
			//BLANCO
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_GREEN;
		end else if ((initX+limit_x5 <= x && x < initX+limit_x6 && initY+limit_x1 <= y && y < initY+limit_y2) && pixel_2== 1'b0) begin 
			//MAGENTA
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_OFF;
			
		//Pintar Imagen Casilla 00-03
		end else if ((initX+limit_x7 <= x && x < initX+limit_x8 && initY+limit_x1 <= y && y < initY+limit_y2) && pixel_3== 1'b1) begin
			//BLANCO
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_GREEN;
		end else if ((initX+limit_x7 <= x && x < initX+limit_x8 && initY+limit_x1 <= y && y < initY+limit_y2) && pixel_3== 1'b0) begin 
			//MAGENTA
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_OFF;
			
		//Pintar Imagen Casilla 01-00
		end else if ((initX+limit_x1 <= x && x < initX+limit_x2 && initY+limit_y3 <= y && y < initY+limit_y4)  && pixel_4== 1'b1) begin
			//BLANCO
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_GREEN;
		end else if ((initX+limit_x1 <= x && x < initX+limit_x2  && initY+limit_y3 <= y && y < initY+limit_y4) && pixel_4== 1'b0) begin 
			//MAGENTA
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_OFF;
			
		//Pintar Imagen Casilla 01-01
		end else if ((initX+limit_x3 <= x && x < initX+limit_x4 && initY+limit_y3 <= y && y < initY+limit_y4)  && pixel_5== 1'b1) begin
			//BLANCO
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_GREEN;
		end else if ((initX+limit_x3 <= x && x < initX+limit_x4 && initY+limit_y3 <= y && y < initY+limit_y4) && pixel_5== 1'b0) begin 
			//MAGENTA
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_OFF;
			
		//Pintar Imagen Casilla 01-02
		end else if ((initX+limit_x5 <= x && x < initX+limit_x6 &&  initY+limit_y3 <= y && y < initY+limit_y4) && pixel_6== 1'b1) begin
			//BLANCO
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_GREEN;
		end else if ((initX+limit_x5 <= x && x < initX+limit_x6 &&  initY+limit_y3 <= y && y < initY+limit_y4) && pixel_6== 1'b0) begin 
			//MAGENTA
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_OFF;
		
		//Pintar Imagen Casilla 01-03
		end else if ((initX+limit_x7 <= x && x < initX+limit_x8 &&  initY+limit_y3 <= y && y < initY+limit_y4) && pixel_7== 1'b1) begin
			//BLANCO
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_GREEN;
		end else if ((initX+limit_x7 <= x && x < initX+limit_x8 &&  initY+limit_y3 <= y && y < initY+limit_y4) && pixel_7== 1'b0) begin 
			//MAGENTA
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_OFF;
			
		//Pintar Imagen Casilla 02-00
		end else if ((initX+limit_x1 <= x && x < initX+limit_x2 &&  initY+limit_y5 <= y && y < initY+limit_y6) && pixel_8== 1'b1) begin
			//BLANCO
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_GREEN;
		end else if ((initX+limit_x1 <= x && x < initX+limit_x2 &&  initY+limit_y5 <= y && y < initY+limit_y6) && pixel_8== 1'b0) begin 
			//MAGENTA
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_OFF;
			
		//Pintar Imagen Casilla 02-01
		end else if ((initX+limit_x3 <= x && x < initX+limit_x4 && initY+limit_y5 <= y && y < initY+limit_y6) && pixel_9== 1'b1) begin
			//BLANCO
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_GREEN;
		end else if ((initX+limit_x3 <= x && x < initX+limit_x4 && initY+limit_y5 <= y && y < initY+limit_y6) && pixel_9== 1'b0) begin 
			//MAGENTA
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_OFF;
			
		//Pintar Imagen Casilla 02-02
		end else if ((initX+limit_x5 <= x && x < initX+limit_x6 && initY+limit_y5 <= y && y < initY+limit_y6)  && pixel_10== 1'b1) begin
			//BLANCO
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_GREEN;
		end else if ((initX+limit_x5 <= x && x < initX+limit_x6 && initY+limit_y5 <= y && y < initY+limit_y6)  && pixel_10== 1'b0) begin 
			//MAGENTA
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_OFF;
			
		//Pintar Imagen Casilla 02-03
		end else if ((initX+limit_x7 <= x && x < initX+limit_x8 && initY+limit_y5 <= y && y < initY+limit_y6)  && pixel_11== 1'b1) begin
			//BLANCO
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_GREEN;
		end else if ((initX+limit_x7 <= x && x < initX+limit_x8 && initY+limit_y5 <= y && y < initY+limit_y6) && pixel_11== 1'b0) begin 
			//MAGENTA
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_OFF;
			
		//Pintar Imagen Casilla 03-00
		end else if ((initX+limit_x1 <= x && x < initX+limit_x2 && initY+limit_y7 <= y && y < initY+limit_y8) && pixel_12== 1'b1) begin
			//BLANCO
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_GREEN;
		end else if ((initX+limit_x1 <= x && x < initX+limit_x2 && initY+limit_y7 <= y && y < initY+limit_y8)  && pixel_12== 1'b0) begin 
			//MAGENTA
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_OFF;
			
		//Pintar Imagen Casilla 03-01
		end else if ((initX+limit_x3 <= x && x < initX+limit_x4 && initY+limit_y7 <= y && y < initY+limit_y8) && pixel_13== 1'b1) begin
			//BLANCO
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_GREEN;
		end else if ((initX+limit_x3 <= x && x < initX+limit_x4 && initY+limit_y7 <= y && y < initY+limit_y8)  && pixel_13== 1'b0) begin 
			//MAGENTA
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_OFF;
			
		//Pintar Imagen Casilla 03-02
		end else if ((initX+limit_x5 <= x && x < initX+limit_x6 && initY+limit_y7 <= y && y < initY+limit_y8) && pixel_14== 1'b1) begin
			//BLANCO
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_GREEN;
		end else if ((initX+limit_x5 <= x && x < initX+limit_x6 && initY+limit_y7 <= y && y < initY+limit_y8)  && pixel_14== 1'b0) begin 
			//MAGENTA
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_OFF;
			
		//Pintar Imagen Casilla 03-03
		end else if ((initX+limit_x7 <= x && x < initX+limit_x8 && initY+limit_y7 <= y && y < initY+limit_y8) && pixel_15== 1'b1) begin
			//BLANCO
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_GREEN;
		end else if ((initX+limit_x7 <= x && x < initX+limit_x8 && initY+limit_y7 <= y && y < initY+limit_y8)  && pixel_15== 1'b0) begin 
			//MAGENTA
			w_red   <= PIN_RED;
			w_blue  <= PIN_BLUE; 
			w_green <= PIN_OFF;
			
		//Pintar Tablero y Lineas
		/*end else if (inSquare && inLine) begin	
			//CIAN
			w_red   <= PIN_OFF;
			w_green <= PIN_GREEN;
			w_blue  <= PIN_BLUE;*/
		end else begin
			//NEGRO
			w_red   <= PIN_OFF;
			w_green <= PIN_OFF;
			w_blue  <= PIN_OFF;	
		end
	end
	
	assign Red = w_red;
	assign Blue = w_blue;
	assign Green = w_green;
	
endmodule
