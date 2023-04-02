module register #(parameter WIDTH = 4) (
    input logic clk,
    input logic reset,
    input logic [WIDTH-1:0] d,
    output logic [WIDTH-1:0] q
);

    always_ff @(posedge clk, posedge reset) begin
        if (reset == 1) begin
            q <= {WIDTH{1'b0}};
        end
        else begin
            q <= d;
        end
    end

endmodule
