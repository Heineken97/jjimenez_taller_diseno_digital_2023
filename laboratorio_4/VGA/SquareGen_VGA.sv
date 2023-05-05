module SquareGen_VGA(
    input logic [9:0] x, y, initX, initY,
    input logic [10:0] n,
    output logic inSquare);
	 
    assign inSquare = (x >= initX && x < (initX+n) && y >= initY && y < (initY+n));
	 
endmodule

