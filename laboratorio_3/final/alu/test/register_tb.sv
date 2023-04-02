module register_tb;

  // Parámetros del registro
  parameter WIDTH = 1;

  // Señales de entrada
  logic clk = 0;
  logic reset = 0;
  logic d = 0;

  // Señales de salida
  logic q = 0;

  // Instancia del módulo
  register #(.WIDTH(WIDTH)) dut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
  );

  // Generador de reloj
  always #5 clk = ~clk;

  // Testcase
  initial begin
	$display("Iniciando testbench");
	#20 d = 1;
	#30 reset = 1;
	#20 reset = 0;
	#20 d = 0;
	#20 d = 1;
	#20 $finish;
  end

endmodule
