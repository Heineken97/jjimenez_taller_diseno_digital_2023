`timescale 1ps / 1ps

module input_synchronizer (input logic clk,
				input logic [3:0] d,
				output logic [3:0] q
);
	logic [3:0] n1;
	always_ff @(posedge clk)
	begin
		n1 <= d; // nonblocking
		q <= n1; // nonblocking
	end
endmodule
