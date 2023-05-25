//
module flopenr #(parameter WIDTH = 2)(
	input 	logic 				clk,
	input 	logic 				rst,
	input 	logic  				data,
	input 	logic [WIDTH-1:0] enable,
	output 	logic [WIDTH-1:0] q
	);
	logic [WIDTH-1:0] q_reg;
	always_ff @(posedge clk or negedge rst) begin

		if (!rst) begin
			q_reg <= '0;
		end else if (enable) begin
			q_reg <= data;
		end
	end
	assign q = q_reg;

endmodule