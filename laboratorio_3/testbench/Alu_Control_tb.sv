module Alu_Control_tb;
	parameter NUMPAR = 4;
	logic [4:0] codigoOP;
	logic [NUMPAR-1:0] operandoA;
   logic [NUMPAR-1:0] operandoB;
   logic [NUMPAR-1:0] resultado;
   logic N;
   logic Z;
   logic C;
   logic V;
   Alu_Control #(.NUMPAR(NUMPAR)) alu_control (
     .codigoOP(codigoOP),
     .operandoA(operandoA),
     .operandoB(operandoB),
     .resultado(resultado),
     .N(N),
     .Z(Z),
     .C(C),
     .V(V)
   );
  
   integer i;
  
   initial begin
     codigoOP = 5'b00000; // add
     operandoA = 4'b0001;
     operandoB = 4'b0001;
     #10;
     if (resultado != 8'b0010) $display("Error en Add: %b", resultado);
     codigoOP = 5'b00001; // sub
     operandoA = 4'b0110;
     operandoB = 4'b0100;
     #10;
     if (resultado != 8'b0010) $display("Error en Sub: %b", resultado);
     codigoOP = 5'b00101; // and
     operandoA = 4'b1010;
     operandoB = 4'b1100;
     #10;
     if (resultado != 8'b1000) $display("Error en And: %b", resultado);
	  codigoOP = 5'b00110; // or
     operandoA = 4'b0010;
     operandoB = 4'b1100;
     #10;
     if (resultado != 8'b1110) $display("Error en Or: %b", resultado);
	  codigoOP = 5'b01000; // xor
     operandoA = 4'b1010;
     operandoB = 4'b1100;
	  #10;
	  if (resultado != 8'b0110) $display("Error en Xor: %b", resultado);
     codigoOP = 5'b00010; // mult
     operandoA = 4'b1010;
     operandoB = 4'b0011;
     #10;
	  if (resultado != 8'b1101) $display("Error en Mult: %b", resultado);
	  codigoOP = 5'b00011; // div
     operandoA = 4'b1100;
     operandoB = 4'b0011;
     #10;
	  if (resultado != 4'b0010) $display("Error en Div: %b", resultado);
	  codigoOP = 5'b00100; // mod
     operandoA = 4'b1100;
     operandoB = 4'b0011;
     #10;
     if (resultado != 4'b0000) $display("Error en Mod: %b", resultado);
	  codigoOP = 5'b10000; // shift left
     operandoA = 4'b1010;
     operandoB = 3'b010;
     #10;
     if (resultado != 8'b10000000) $display("Error en Shift Left: %b", resultado);
	 $display("Autocheckeo completado");
	 #10;
	 $finish;
	end

endmodule
