module LineGen_VGA#(parameter
	tilerange 	= 10'd120)(
	input logic [9:0] x, y, initX, initY,
	input logic [9:0] n,
	output logic inLine
	); 
	logic range_line1_x,range_line2_x,range_line3_x,range_line1_y,range_line2_y,range_line3_y;
	logic w_inline;
	
	 always @(*) begin
        w_inline = ((initX <= x) && (x < (initX + n)) && 
            (((x - initX) % tilerange) < 10'd2) && (x < (initX + n)) && (y < (initY + n)) && (y < 10'd480) ||
           ((initY <= y) && (y < (initY + n)) && 
            (((y - initY) % tilerange) < 10'd2) && (y < (initY + n)) && (x < (initX + n)) && (x < 10'd480)));   // restricción para y
    end
	
	assign inLine = w_inline;

endmodule
