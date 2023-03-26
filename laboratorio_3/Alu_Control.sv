module Alu_Control #(parameter N=8)(
  input [4:0] codigoOP,
  input [N-1:0] operandoA,
  input [N-1:0] operandoB,
  output reg [N-1:0] resultado
);
always @(*) begin
  case (codigoOP)
    5'b00000: resultado = Adder(operandoA, operandoB);
    5'b00001: resultado = Sub(operandoA, operandoB);
    5'b00101: resultado = And(operandoA, operandoB);
    5'b00110: resultado = Or(operandoA, operandoB);
    5'b01000: resultado = Xor(operandoA, operandoB);
    5'b00010: resultado = Mult(operandoA, operandoB);
    5'b00011: resultado = Div(operandoA, operandoB);
    5'b00100: resultado = Mod(operandoA, operandoB);
    5'b10000: resultado = shiftL (operandoA, operandoB);
    default: resultado = {N{1'b0}}; // código de operación inválido
  endcase
end
endmodule
