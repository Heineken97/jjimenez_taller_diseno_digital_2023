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
  logic [3:0] bin_unit;
  logic [3:0] bin_ten;

  // Instantiate the input synchronizer
  input_synchronizer uut_input_synchronizer (
    .clk(clk),
    .d(input_data),
    .q(sync_data)
  );


  // Resta 1 a counter_num cuando sync_data sea 1
  ContadorRegresivoNbits #(6) dut_counter (
    .clk(sync_data),
    .rst(reset),
    .count(counter_num)
  );
  
    // Transform 6 bin number to unit and ten decimal digit in bin
  
  bin_converter uut_converter(
  .bin_6(counter_num),
  .bin_unit(bin_unit),
  .bin_ten(bin_ten)
  );
  
  // unit segments
  bin_to_bcd_decoder uut_unit_d(
	.bin_number(bin_unit),
	.bcd_number(bcd_number_0)
  );
  
  // ten segments
	bin_to_bcd_decoder uut_ten_d(
	.bin_number(bin_ten),
	.bcd_number(bcd_number_1)
  );
  
endmodule