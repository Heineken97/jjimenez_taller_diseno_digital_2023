module Memory_ROM(
		input logic [7:0] yoff, xoff,
		input logic [2:0] memorySelect,
		output logic pixel);

		logic [255:0] charrom [0:255]; 
		logic [255:0] line;

		initial begin
			$readdec("image_BACKGROUND.txt", charrom);//background
		end
		
		always @(*) begin
			case(memorySelect)
				0: $readdec("image_OLD.txt", charrom);//OLD_IMAGE
				1: $readdec("image_NEW.txt", charrom);//NEW_IMAGE
				default: $readdec("image_BACKGROUND.txt", charrom);//background
			endcase
		line = charrom[xoff];
		pixel = line[8'd255-yoff];
		end
endmodule
