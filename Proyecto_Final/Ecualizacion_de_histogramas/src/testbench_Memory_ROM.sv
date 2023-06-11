module testbench_Memory_ROM;
  
  // Parámetros
  parameter MEM_DEPTH = 256;
  
  // Señales
  logic [7:0] yoff, xoff;
  logic [2:0] memorySelect;
  logic pixel;
  
  // Instancia del módulo Memory_ROM
  Memory_ROM dut (
    .yoff(yoff),
    .xoff(xoff),
    .memorySelect(memorySelect),
    .pixel(pixel)
  );
  
  // Generador de estímulos
  initial begin
    // Inicializar señales
    yoff = 0;
    xoff = 0;
    memorySelect = 1;
    
    // Esperar un ciclo antes de leer datos
    #1;
  
    // Leer y mostrar datos de la memoria ROM
    repeat (MEM_DEPTH) begin
      // Leer datos
      #1; // Esperar un ciclo antes de cambiar las entradas
      $display("xoff = %d, yoff = %d, memorySelect = %d, pixel = %d",
               xoff, yoff, memorySelect, pixel);
      
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
    
    // Finalizar simulación
    #1;
    $finish;
  end
  
endmodule

