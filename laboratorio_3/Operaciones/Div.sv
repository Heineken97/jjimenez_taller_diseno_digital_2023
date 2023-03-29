module Div #(parameter N=8)(
	input logic signed [N-1:0] dividendo,
	input logic signed [N-1:0] divisor,
	output logic signed [N-1:0] cociente
);
always_comb begin
	cociente = dividendo/ divisor;
end

endmodule