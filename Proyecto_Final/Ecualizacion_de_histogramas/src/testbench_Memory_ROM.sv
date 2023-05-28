module testbench_Memory_ROM;
  reg CLK;
  reg [7:0] yoff, xoff;
  reg [2:0] memorySelect;
  wire pixel;

  initial begin
    // Inicializar las entradas
    CLK = 0;
    yoff = 8'b00000000;
    xoff = 8'b00000000;
    memorySelect = 3'b000;

    // Generar un pulso de reloj cada 10 unidades de tiempo
    forever #10 CLK = ~CLK;

    // Esperar un tiempo para que el valor de salida se estabilice
    #100;

    // Mostrar el valor del pixel obtenido
    $display("Pixel obtenido: %b", pixel);

    // Cambiar las entradas para leer de otro segmento de memoria
    yoff = 8'b00000001;
    xoff = 8'b00000001;
    memorySelect = 3'b001;

    // Esperar un tiempo para que el valor de salida se estabilice
    #100;

    // Mostrar el valor del pixel obtenido
    $display("Pixel obtenido: %b", pixel);

    // Agregar más pruebas según sea necesario

    // Finalizar la simulación
    $finish;
  end

  // Instanciar el módulo Memory_ROM con la señal de reloj CLK
  Memory_ROM dut(
    .yoff(yoff),
    .xoff(xoff),
    .memorySelect(memorySelect),
    .pixel(pixel)
	 );
endmodule
