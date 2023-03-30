module Registro #(parameter N = 4) (
    input logic clk,
    input logic reset,
    input logic enable,
    input logic [N-1:0] entrada,
    output logic [N-1:0] salida
);

    logic [N-1:0] reg;

    always_ff @(posedge clk, negedge reset) begin
        if (reset) begin
            reg <= '0;
        end
        else if (enable) begin
            reg <= entrada;
        end
    end

    assign salida = reg;

endmodule
