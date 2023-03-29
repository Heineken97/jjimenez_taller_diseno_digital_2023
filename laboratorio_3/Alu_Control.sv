module Alu_Control #(parameter NUMPAR=8)(
	input [4:0] codigoOP,
   input [NUMPAR-1:0] operandoA,
   input [NUMPAR-1:0] operandoB,
   output logic [NUMPAR-1:0] resultado,
   output logic N,
   output logic Z,
   output logic C,
   output logic V,
   output logic [6:0] seven_segment_output,
   output logic [6:0] indicator_leds
);
Adder add_inst(.a(operandoA), .b(operandoB), .c_in(1'b0), .sum(resultado), .c_out(C));
Sub sub_inst(.a(operandoA), .b(operandoB), .c_in(1'b1), .diff(resultado), .c_out(C));
Xor xor_inst(.a(operandoA), .b(operandoB), .out(resultado));
Mult mult_inst(.a(operandoA), .b(operandoB), .out(resultado));
Div div_inst(.dividendo(operandoA), .divisor(operandoB), .cociente(resultado));
Mod mod_inst(.dividendo(operandoA), .divisor(operandoB), .residuo(resultado));
shiftL shift_inst(.in(operandoA), .shift(operandoB), .out(resultado));

logic [NUMPAR-1:0] tempResult; // variable temporal para almacenar el resultado
logic [NUMPAR:0] tempCarry; // variable temporal para almacenar el acarreo
logic [NUMPAR-1:0] tempOverflow; // variable temporal para almacenar el desbordamiento

always @(*) begin
	case (codigoOP)
		5'b00000: begin // add
			N = resultado[NUMPAR-1];
			Z = (resultado == 0);
			V = (operandoA[NUMPAR-1] == operandoB[NUMPAR-1] && operandoA[NUMPAR-1] != resultado[NUMPAR-1]);
			C = tempCarry[NUMPAR];
		end
		5'b00001: begin //sub
			N = resultado[NUMPAR-1];
			Z = (resultado == 0);
			V = (operandoA[NUMPAR-1] != operandoB[NUMPAR-1] && operandoA[NUMPAR-1] != resultado[NUMPAR-1]);
			C = tempCarry[NUMPAR];
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
			tempOverflow = resultado[NUMPAR-1:0] ^ operandoA[NUMPAR-1:0]; // cálculo temporal del desbordamiento
			V = (tempOverflow[NUMPAR-2] == 1'b1);
			C = 0;
		end
		5'b01010: begin // div
			N = resultado[NUMPAR-1];
			Z = (resultado == 0);
			V = 0;
			C = 0;
		end
		5'b01001: begin // mod
			N = resultado[NUMPAR-1];
			Z = (resultado == 0);
			V = 0;
			C = 0;
		end
		default: begin
			N = 0;
			Z = 0;
			C = 0;
			V = 0;
		end
	endcase
end

assign seven_segment_output = resultado; // asignación del resultado a los displays de 7 segmentos
assign indicator_leds = {N, Z, C, V}; 
endmodule