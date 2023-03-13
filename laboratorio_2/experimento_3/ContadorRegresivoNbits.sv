module ContadorRegresivoNbits #(parameter N = 8)
(
	input clk,
	input rst,
	output reg [N-1:0] count
	);
	
always @(posedge clk or negedge rst) begin
	if (!rst) begin
		count <= {N{1'b0}};
	end else begin
		count <= count - 1;
	end
	end
endmodule