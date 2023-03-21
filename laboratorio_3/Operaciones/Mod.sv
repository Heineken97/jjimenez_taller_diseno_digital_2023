module Mod#(parameter N=8)(
	input logic [N-1:0] dividendo,
	input logic [N-1:0] divisor,
	output logic [N-1:0] residuo
);
always_comb begin 
	residuo = dividendo % divisor;
end

endmodule