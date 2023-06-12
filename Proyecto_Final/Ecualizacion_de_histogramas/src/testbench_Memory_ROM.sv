module testbench_Memory_ROM;
  
  // Parámetros
  parameter MEM_DEPTH = 256;
  
  // Señales
  logic [7:0] yoff, xoff;
  logic [2:0] memorySelect;
  logic pixel;
  
  logic [255:0] charrom [0:255]; 
  logic [255:0] line;
  /*
  // Instancia del módulo Memory_ROM
  Memory_ROM dut (
    .yoff(yoff),
    .xoff(xoff),
    .memorySelect(memorySelect),
    .pixel(pixel)
  );
  */
  // Generador de estímulos
  initial begin
	  // Inicializar señales
		yoff = 0;
		xoff = 0;
		memorySelect = 1;
		case (memorySelect)
			0: $readmemh("image_OLD.txt", charrom); // Cargar el archivo de OLD_IMAGE
			1: $readmemh("image_NEW.txt", charrom); // Cargar el archivo de NEW_IMAGE
			default: $readmemh("image_BACKGROUND.txt", charrom); // Cargar el archivo de fondo por defecto
		endcase
			
		// Esperar un ciclo antes de leer datos
		#1;
			
		// Leer y mostrar datos de la memoria ROM
			
		repeat (MEM_DEPTH) begin
		// Leer datos
			#1; // Esperar un ciclo antes de cambiar las entradas
			$display("xoff = %d, yoff = %d, memorySelect = %d, pixel = %d",xoff, yoff, memorySelect, pixel);
			// Incrementar las direcciones
			yoff = yoff + 1;
			if (yoff == 256) begin
				yoff = 0;
			end
			xoff = xoff + 1;
			if (xoff == 256) begin
				xoff = 0;
			end
		end
		line <= charrom[xoff];
		pixel <= line[8'd255 - yoff];
	end
	
endmodule

