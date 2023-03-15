`timescale 1ps / 1ps

module top_module(
  input logic clk,
  input logic reset,
  input logic [3:0] input_data,
  output logic [6:0] bch_number
);

  logic [3:0] synchronized_data;

  // Instantiate the input synchronizer
 input_synchronizer uut_input_synchronizer (
   .clk(clk),
   .d(input_data),
   .q(synchronized_data)
  );

  // Instantiate the binary-to-BCD decoder
  bin_to_bch_decoder uut_bin_to_bch_decoder (
    .bin_number(synchronized_data),
    .bch_number(bch_number)
  );

endmodule
