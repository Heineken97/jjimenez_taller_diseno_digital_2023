
module Memory_ROM(
    input logic [7:0] yoff, xoff,
    input logic [1:0] memorySelect,
    output logic [2:0] pixel
);

    logic [255:0] charrom [0:255]; 
    logic [255:0] line;

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

