/*module Memory_ROM (
    input logic [7:0] yoff, xoff,
    input logic [1:0] memorySelect,
    output logic [2:0] pixel
);
    logic [2:0] charrom [0:255];
    logic xoff_p = 0;
    logic yoff_p = 0;

    initial begin
        $readmemh("image_BACKGROUND.txt", charrom);
    end

    always @* begin
        case (memorySelect)
            0: $readmemh("image_OLD.txt", charrom);
            1: $readmemh("image_NEW.txt", charrom);
            default: $readmemh("image_BACKGROUND.txt", charrom);
        endcase
		  
		  for (int i = 0; i < 256; i = i + 1) begin
		  
			if(xoff_p == 256 ) begin
				xoff_p = 0;
			end
			
			 for (int j = 0; j < 256; j = j + 1) begin
			 
				pixel <= charrom[xoff_p][yoff_p];
				
				if(yoff_p == 256 ) begin
					yoff_p = 0;
				end
				
				
				
				yoff_p = yoff_p+1;
				
			 end
			 
			 xoff_p = xoff_p+1;
			 
		  end

        // Asignar el valor del píxel correspondiente a las señales de posición
        pixel <= charrom[xoff_p][yoff_p];
    end

endmodule

module Memory_ROM (
    input logic [7:0] yoff, xoff,
    input logic [1:0] memorySelect,
    output logic [2:0] pixel
);
    logic [2:0] charrom [0:256*256-1];
    logic [15:0] index;

    initial begin
        $readmemh("image_BACKGROUND.txt", charrom);
    end

    always @* begin
        case (memorySelect)
            0: $readmemh("image_OLD.txt", charrom);
            1: $readmemh("image_NEW.txt", charrom);
            default: $readmemh("image_BACKGROUND.txt", charrom);
        endcase

        index = xoff*256 + yoff;
        pixel <= charrom[index];
    end
endmodule
*/
module Memory_ROM(
    input logic [7:0] yoff, xoff,
    input logic [1:0] memorySelect,
    output logic [2:0] pixel
);

    logic [0:255] charrom [0:255]; 
    logic [255:0] line ;

    initial begin
        $readmemh("image_BACKGROUND.txt", charrom); // Cargar el archivo de fondo
    end
    
    always @(*) begin
        case (memorySelect)
            0: $readmemh("image_OLD.txt", charrom); // Cargar el archivo de OLD_IMAGE
            1: $readmemh("image_NEW.txt", charrom); // Cargar el archivo de NEW_IMAGE
            default: $readmemh("image_BACKGROUND.txt", charrom); // Cargar el archivo de fondo por defecto
        endcase
        
        line <= charrom[xoff];
        pixel <= line[8'd255 - yoff];
    end
endmodule

