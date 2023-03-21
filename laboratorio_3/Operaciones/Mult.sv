module Mult #(parameter N=8)(
	input logic[N-1:0] a,
	input logic[N-1:0] b,
	output logic [N*2-1:0] out
);
always_comb begin
	out = a*b;
end

endmodule