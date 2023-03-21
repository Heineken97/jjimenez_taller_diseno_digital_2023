module Div #(parameter N=8)(
	input logic signed [N-1:0] dividendo,
	input logic signed [N-1:0] divisor,
	output logic signed [N-1:0] cociente,
	output logic signed [N-1:0] residuo
);
always_comb begin
	cociente = dividendo/ divisor;
	residuo = dividendo % divisor;
end

endmodule