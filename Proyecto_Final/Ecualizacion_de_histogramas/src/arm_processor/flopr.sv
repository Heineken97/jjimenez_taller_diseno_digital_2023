module flopr #(parameter WIDTH = 8)(
	input logic clk, rst,
	input logic [WIDTH-1:0] d,
	output logic [WIDTH-1:0] q);
	always_ff @(posedge clk, posedge rst) begin
		if (rst) begin
			q <= 0;
		end
		else begin
			q <= d;
		end
	end
endmodule