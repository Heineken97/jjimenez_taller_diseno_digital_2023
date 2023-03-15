module tb_ContadorRegresivo;
	parameter N = 8;
	reg clk, rst;
	wire [N-1:0] count;
	integer i;
	ContadorRegresivoNbits #(N) dut(clk, rst, count);
	always #5 clk = ~clk;
	initial begin
		 clk = 0;
		 rst = 1;
		 #10 rst = 0;
		 #10 rst = 1;
		 for (i = 0; i < 2**N; i++) begin
		 #10;
		 end 
		 if (count !== 'd0) begin
			  $display("Valor final incorrecto: %d", count);
			  $finish;
		 end else begin
			  $display("Autoverificacion completada satisfactoriamente");
		 end
		 $finish;
	end

endmodule