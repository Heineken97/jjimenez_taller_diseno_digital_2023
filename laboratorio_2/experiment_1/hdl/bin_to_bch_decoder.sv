`timescale 1ps / 1ps

module bin_to_bch_decoder(
    input [3:0] bin_number,
    output reg [6:0] bch_number
);

always @(*) begin
    case(bin_number)	
		//									 abcdefg
		0: 			bch_number = 7'b0000001; //0
		1: 			bch_number = 7'b1001111; //1
		2: 			bch_number = 7'b0010010; //2
		3: 			bch_number = 7'b0000110; //3
		4: 			bch_number = 7'b1001100; //4
		5: 			bch_number = 7'b0100010; //5
		6: 			bch_number = 7'b0100000; //6
		7: 			bch_number = 7'b0001111; //7
		8: 			bch_number = 7'b0000000; //8
		9: 			bch_number = 7'b0001100; //9
		10:			bch_number = 7'b0001000; //10
		11:			bch_number = 7'b1100000; //11
		12:			bch_number = 7'b0110001; //12
		13:			bch_number = 7'b1000010; //13
		14:			bch_number = 7'b0110000; //14
		15:			bch_number = 7'b0111000; //15
		default: 	bch_number = 7'b1111111; //default to 0
    endcase
end

endmodule