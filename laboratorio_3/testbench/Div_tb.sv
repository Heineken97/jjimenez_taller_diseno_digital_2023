module Div_tb;
	parameter N = 8;
	
	logic signed [N-1:0] dividendo;
   logic signed [N-1:0] divisor;
   logic signed [N-1:0] cociente;
   logic signed [N-1:0] residuo;
	
	Div #(.N(N)) div(.dividendo(dividendo),.divisor(divisor),.cociente(cociente),.residuo(residuo));
	initial begin
     dividendo = 8'h00;  // 0
     divisor   = 8'h01;  // 1
     #10;
     dividendo = 8'h0F;  // 15
     divisor   = 8'h02;  // 2
     #10;
     dividendo = -8'h0F; // -15
     divisor   = 8'h02;  // 2
     #10;
     dividendo = 8'h02;  // 2
     divisor   = -8'h01; // -1
     #10;
     dividendo = -8'h02; // -2
     divisor   = -8'h01; // -1
     #10;
     $finish;
	end
endmodule
