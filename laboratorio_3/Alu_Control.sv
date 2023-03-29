module Alu_Control #(parameter NUMPAR=8)(
	input [4:0] codigoOP,
   input [NUMPAR-1:0] operandoA,
   input [NUMPAR-1:0] operandoB,
   output logic [NUMPAR-1:0] resultado,
   output logic N,
   output logic Z,
   output logic C,
   output logic V);
	
	
Adder add_inst(.a(operandoA), .b(operandoB), .c_in(1'b0), .sum(tempResult), .c_out(C));
Sub sub_inst(.a(operandoA), .b(operandoB), .c_in(1'b1), .diff(tempResult), .c_out(C));
And and_inst(.a(operandoA), .b(operandoB), .out(resultado));
Or or_inst(.a(operandoA), .b(operandoB), .out(resultado));
Xor xor_inst(.a(operandoA), .b(operandoB), .out(resultado));
Mult mult_inst(.a(operandoA), .b(operandoB), .out(resultado));
Div div_inst(.a(operandoA), .b(operandoB), .out(resultado));
Mod mod_inst(.a(operandoA), .b(operandoB), .out(resultado));
shiftL shift_inst(.a(operandoA), .b(operandoB), .out(resultado));

logic [NUMPAR:0] tempResult; // variable temporal para almacenar el resultado
logic [NUMPAR:0] tempCarry; // variable temporal para almacenar el acarreo
logic [NUMPAR:0] tempOverflow; // variable temporal para almacenar el desbordamiento

always @(*) begin
  case (codigoOP)
    5'b00000: begin // add
      resultado = tempResult[NUMPAR-1:0]; 
      N = resultado[NUMPAR-1]; 
      Z = (resultado == 0);
      V = (operandoA[NUMPAR-1] == operandoB[NUMPAR-1] && operandoA[NUMPAR-1] != resultado[NUMPAR-1]); 
    end
    5'b00001: begin //sub
      resultado = tempResult[NUMPAR-1:0]; 
      N = resultado[NUMPAR-1]; 
      Z = (resultado == 0); 
      V = (operandoA[NUMPAR-1] != operandoB[NUMPAR-1] && operandoA[NUMPAR-1] != resultado[NUMPAR-1]); 
    end
    5'b00101: begin // and
      N = resultado[NUMPAR-1]; 
      Z = (resultado == 0); 
      C = 0; 
      V = 0;
    end
    5'b00110: begin // or
      N = resultado[NUMPAR-1];
      Z = (resultado == 0); 
      C = 0; 
      V = 0; 
    end
    5'b01000: begin // xor
      N = resultado[NUMPAR-1]; 
      Z = (resultado == 0); 
      C = 0; 
      V = 0; 
    end
    5'b00010: begin // mult
      N = resultado[NUMPAR-1]; 
      Z = (resultado == 0); 
      C = 0; 
      V = (resultado[NUMPAR*2-1:NUMPAR] != ((resultado[NUMPAR-1] == operandoA[NUMPAR-1]) ? {NUMPAR{1'b0}} : {NUMPAR{1'b1}})); 
    end
    5'b01010: begin // div
      N = resultado[NUMPAR-1]; 
      Z = (resultado == 0); 
      C = 0; 
      V = 0; 
    end
    default: begin // invalid operation
      N = 0; 
      Z = 0; 
      C = 0; 
      V = 0; 
    end
  endcase
end

endmodule