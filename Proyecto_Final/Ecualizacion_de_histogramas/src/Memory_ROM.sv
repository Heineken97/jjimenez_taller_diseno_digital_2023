module Memory_ROM(
		input logic [2:0] memorySelect,
		output logic pixel);

		logic [65535:0] charrom [0:65535]; 
		logic [65535:0] line;

		initial begin
			$readmemb("image_BACKGROUND.txt", charrom);//background
		end
		
		always @(*) begin
        case(memorySelect)
            0: $readmemb("image_OLD.txt", charrom);//OLD_IMAGE
            1: $readmemb("image_NEW.txt", charrom);//NEW_IMAGE
            default: $readmemb("image_BACKGROUND.txt", charrom);//background
        endcase
		  
		  line = charrom[0];
		  pixel = line[7];
    end
	 
endmodule
