module Alu_Control #(parameter NUMPAR=8)(
  input [4:0] codigoOP,
  input [NUMPAR-1:0] operandoA,
  input [NUMPAR-1:0] operandoB,
  output logic [NUMPAR-1:0] resultado,
  output logic N,
  output logic Z,
  output logic C,
  output logic V
);
logic [NUMPAR:0] tempResult; // variable temporal para almacenar el resultado
logic [NUMPAR:0] tempCarry; // variable temporal para almacenar el acarreo
logic [NUMPAR:0] tempOverflow; // variable temporal para almacenar el desbordamiento

always @(*) begin
  case (codigoOP)
	 5'b00000: begin // add
      {C, tempResult} = Adder(operandoA, operandoB);
      resultado = tempResult[NUMPAR-1:0]; 
      N = resultado[NUMPAR-1]; 
      Z = (resultado == 0);
      V = (operandoA[NUMPAR-1] == operandoB[NUMPAR-1] && operandoA[NUMPAR-1] != resultado[NUMPAR-1]); 
    end
	 5'b00001: begin //sub
      {C, tempResult} = Sub(operandoA, operandoB);
      resultado = tempResult[NUMPAR-1:0]; 
      N = resultado[NUMPAR-1]; 
      Z = (resultado == 0); 
      V = (operandoA[NUMPAR-1] != operandoB[NUMPAR-1] && operandoA[NUMPAR-1] != resultado[NUMPAR-1]); 
    end
    5'b00101: begin // and
      resultado = And(operandoA, operandoB); 
      N = resultado[NUMPAR-1]; 
      Z = (resultado == 0); 
      C = 0; 
      V = 0;
    end
    5'b00110: begin // or
      resultado = Or(operandoA, operandoB); 
      N = resultado[NUMPAR-1];
      Z = (resultado == 0); 
      C = 0; 
      V = 0; 
    end
    5'b01000: begin // xor
      resultado = Xor(operandoA, operandoB); 
      N = resultado[NUMPAR-1]; 
      Z = (resultado == 0); 
      C = 0; 
      V = 0; 
    end
    5'b00010: begin // mult
      resultado = Mult(operandoA, operandoB);
      N = resultado[NUMPAR-1]; 
      Z = (resultado == 0); 
      C = 0; 
      V = (resultado[NUMPAR*2-1:NUMPAR] != ((resultado[NUMPAR-1] == operandoA[NUMPAR-1]) ? {NUMPAR{1'b0}} : {NUMPAR{1'b1}})); // desbordamiento
    end
	 5'b00011: begin // div
      resultado = Div(operandoA, operandoB);
      N = resultado[NUMPAR-1]; 
      Z = (resultado == 0); 
      C = 0; 
      V = 0; 
    end
    5'b00100: begin // mod
      resultado = Mod(operandoA, operandoB);
      N = resultado[NUMPAR-1]; 
      Z = (resultado == 0); 
      C = 0; 
      V = 0; 
    end
    5'b10000: begin // shift left
      resultado = shiftL (operandoA, operandoB);
      N = resultado[NUMPAR-1]; 
      Z = (resultado == 0); 
      C = (operandoA[NUMPAR-operandoB-1] == 1'b1); 
      V = 0; 
    end
    //default: resultado = {NUMPAR{1'b0}}, N = {NUMPAR{1'b0}}, Z = {NUMPAR{1'b0}}, C = {NUMPAR{1'b0}}, V = {NUMPAR{1'b0}} ; // código de operación inválido
	endcase
end

endmodule
