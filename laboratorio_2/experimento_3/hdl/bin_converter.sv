module bin_converter (
    input logic [5:0] bin_6,
    output logic [3:0] bin_unit,
    output logic [3:0] bin_ten
);



	function logic [5:0] to_decimal;
		 input logic [5:0] binary;
		 to_decimal = binary[0] + 2*binary[1] + 4*binary[2] + 8*binary[3] + 16*binary[4] + 32*binary[5];
	endfunction

	logic [5:0] decimal_value;
	logic [3:0] units;
   logic [3:0] tens;
	always_comb begin
		// Convertir el número binario de 6 bits a un número decimal
		decimal_value = to_decimal(bin_6);

		// Calcular las unidades y las decenas en decimal
		units = decimal_value % 10;
		tens = decimal_value / 10;

		// Convertir las unidades y las decenas a binario
		bin_unit = units;
		bin_ten = tens;
	end

endmodule
