`timescale 1ns/1ps

module bcd(input logic a, b, c,
							output logic f);
	assign f = ~(a & b & c);				
endmodule