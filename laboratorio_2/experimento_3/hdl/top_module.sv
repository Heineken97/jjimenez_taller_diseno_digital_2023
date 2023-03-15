`timescale 1ps/1ps

module top_module(
  input logic clk,
  input logic reset,
  input logic input_data,
  output logic [6:0] bcd_number_1,
  output logic [6:0] bcd_number_0
);
  logic sync_data;
  logic [5:0] counter_num;
  logic [3:0] counter_num_high;
  logic [3:0] counter_num_low;
  reg [6:0] bcd_high;
  reg [6:0] bcd_low;

  // Instantiate the input synchronizer
  input_synchronizer uut_input_synchronizer (
    .clk(clk),
    .reset(reset),
    .input_data(input_data),
    .synchronized_data(sync_data)
  );

  // Decodificador BCD para el dígito alto
  bin_to_bcd_decoder uut_bcd_high (
    .bin_number(counter_num_high),
    .bcd_number(bcd_high)
  );

  // Decodificador BCD para el dígito bajo
  bin_to_bcd_decoder uut_bcd_low (
    .bin_number(counter_num_low),
    .bcd_number(bcd_low)
  );

  // Resta 1 a counter_num cuando sync_data sea 1
  ContadorRegresivoNbits #(6) dut_counter (
    .clk(sync_data),
    .rst(reset),
    .count(counter_num)
  );
  
  // Separar los dígitos de counter_num
  assign counter_num_high = counter_num[5:4];
  assign counter_num_low = counter_num[3:0];
  
  // Decodificar el dígito alto
  always @(*) begin
    case(counter_num_high)
      2'b00: bcd_high = 7'b0000001; // 0
      2'b01: bcd_high = 7'b1001111; // 1
      2'b10: bcd_high = 7'b0010010; // 2
      2'b11: bcd_high = 7'b0000110; // 3
      default: bcd_high = 7'b1111111; // default to off
    endcase
  end
  
  // Decodificar el dígito bajo
  always @(*) begin
	case(counter_num_low)
		4'b0000: bcd_low = 7'b0000001; // 0
		4'b0001: bcd_low = 7'b1001111; // 1
		4'b0010: bcd_low = 7'b0010010; // 2
		4'b0011: bcd_low = 7'b0000110; // 3
		4'b0100: bcd_low = 7'b1001100; // 4
		4'b0101: bcd_low = 7'b0100100; // 5
		4'b0110: bcd_low = 7'b0100000; // 6
		4'b0111: bcd_low = 7'b0001111; // 7
		4'b1000: bcd_low = 7'b0000000; // 8
		4'b1001: bcd_low = 7'b0001100; // 9
		default: bcd_low = 7'b1111111; // default to off
	endcase
	end

	// Asignar los valores de los dígitos a las salidas correspondientes
	assign bcd_number_1 = bcd_high;
	assign bcd_number_0 = bcd_low;

endmodule