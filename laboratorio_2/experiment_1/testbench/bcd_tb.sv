`timescale 1ns/1ps

module bcd_tb();

	logic a, b, c, 
			out;
			
	bcd dot(
		.a(a), 
		.b(b), 
		.c(c), 
		.f(out)
		);
							
	
	initial begin
	
			// Testcase 0
		#10;
		a = 0; b = 0; c = 0;
		$display("NAND3(%0d,%0d,%0d) = %0d", a, b, c, out);
		
		// Testcase 1
		#10;
		a = 0; b = 0; c = 1;
		$display("NAND3(%0d,%0d,%0d) = %0d", a, b, c, out);

		// Testcase 2
		#10;
		a = 0; b = 1; c = 0;
		$display("NAND3(%0d,%0d,%0d) = %0d", a, b, c, out);
		
		// Testcase 3
		#10;
		a = 0; b = 1; c = 1;
		$display("NAND3(%0d,%0d,%0d) = %0d", a, b, c, out);

		
		// Testcase 4
		#10;
		a = 1; b = 0; c = 0;
		$display("NAND3(%0d,%0d,%0d) = %0d", a, b, c, out);

		
		// Testcase 5
		#10;
		a = 1; b = 0; c = 1;
		$display("NAND3(%0d,%0d,%0d) = %0d", a, b, c, out);

		
		// Testcase 6
		#10;
		a = 1; b = 1; c = 0;
		$display("NAND3(%0d,%0d,%0d) = %0d", a, b, c, out);

		
		// Testcase 7
		#10;
		a = 1; b = 1; c = 1;
		$display("NAND3(%0d,%0d,%0d) = %0d", a, b, c, out);
		
		// End testbench
		#10 $finish;

  end
	
	
endmodule