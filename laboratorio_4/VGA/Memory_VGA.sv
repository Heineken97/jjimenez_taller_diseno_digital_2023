module Memory_VGA(
		input logic [7:0] yoff, xoff,
		input logic [11:0] memorySelect,
		output logic pixel);

		logic [119:0] charrom [0:119]; 
		logic [119:0] line;
		
		initial begin
			$readmemb("image_0.txt", charrom);//background
		end
  
		always @(*) begin
        case(memorySelect)
            0: $readmemb("image_0.txt", charrom);//background
            2: $readmemb("image_2.txt", charrom);//2
            4: $readmemb("image_4.txt", charrom);//4
            8: $readmemb("image_8.txt", charrom);//8
            16: $readmemb("image_16.txt", charrom);//16
            32: $readmemb("image_32.txt", charrom);//32
            64: $readmemb("image_64.txt", charrom);//64
            128: $readmemb("image_128.txt", charrom);//128
            256: $readmemb("image_256.txt", charrom);//256
            512: $readmemb("image_512.txt", charrom);//512
            1024: $readmemb("image_1024.txt", charrom);//1024
            2048: $readmemb("image_2048.txt", charrom);//2048
            default: $readmemb("image_0.txt", charrom);//background
        endcase
		  
		  line = charrom[xoff];
		  pixel = line[7'd119-yoff];
    end
	 
endmodule

/*always @* begin
        case(memorySelect)
            0: $readmemb("image_0.txt", charrom);//background
            2: $readmemb("image_2.txt", charrom);//2
            4: $readmemb("image_4.txt", charrom);//4
            8: $readmemb("image_8.txt", charrom);//8
            16: $readmemb("image_16.txt", charrom);//16
            32: $readmemb("image_32.txt", charrom);//32
            64: $readmemb("image_64.txt", charrom);//64
            128: $readmemb("image_128.txt", charrom);//128
            256: $readmemb("image_256.txt", charrom);//256
            512: $readmemb("image_512.txt", charrom);//512
            1024: $readmemb("image_1024.txt", charrom);//1024
            2048: $readmemb("image_2048.txt", charrom);//2048
            default: $readmemb("image_0.txt", charrom);//background
        endcase
		  line = charrom[xoff];
		  pixel = line[7'd119-yoff];
    end*/

