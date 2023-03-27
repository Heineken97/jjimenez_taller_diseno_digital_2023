module Mult_tb;
	parameter N = 4;
	
	logic [N-1:0] a;
	logic [N-1:0] b;
	logic [N*2-1:0] out;
	
	Mult #(.N(N)) mult_inst (.a(a),.b(b),.out(out) );

	initial begin
		a = 4'b0000;
		b = 4'b0000;
		#5;
		a = 4'b1010;
		b = 4'b0101;
		#5;
		a = 4'b1111;
		b = 4'b0001;
		#5;
		$finish;
	end
	
endmodule
