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

/*module Memory_VGA(
    input logic [7:0] img_selected,
    input logic [7:0] yoff, xoff,
    input logic [11:0] memorySelect,
    output logic pixel
);
    logic [119:0] charrom[2047:0]; 
    logic [119:0] line;
    
    always @* begin
        case(memorySelect)
            0: $readmemb("img_VGA_0.txt", charrom);//background
            2: $readmemb("img_VGA_1.txt", charrom);//2
            4: $readmemb("img_VGA_2.txt", charrom);//4
            8: $readmemb("img_VGA_3.txt", charrom);//8
            16: $readmemb("img_VGA_4.txt", charrom);//16
            32: $readmemb("img_VGA_5.txt", charrom);//32
            64: $readmemb("img_VGA_6.txt", charrom);//64
            128: $readmemb("img_VGA_7.txt", charrom);//128
            256: $readmemb("img_VGA_8.txt", charrom);//256
            512: $readmemb("img_VGA_9.txt", charrom);//512
            1024: $readmemb("img_VGA_10.txt", charrom);//1024
            2048: $readmemb("img_VGA_11.txt", charrom);//2048
            default: $readmemb("img_VGA_0.txt", charrom);//background
        endcase
		  line = charrom[yoff];
		  pixel = line[7'd119-xoff];
    end
	 
endmodule

*/