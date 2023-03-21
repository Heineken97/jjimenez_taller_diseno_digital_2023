module shiftL #(parameter N=8)(
	input logic [N-1:0] in,
	input logic [N-1:0] shift,
	input logic [N-1:0] out
);
always_comb begin 
	out = in << shift;
end
	
endmodule