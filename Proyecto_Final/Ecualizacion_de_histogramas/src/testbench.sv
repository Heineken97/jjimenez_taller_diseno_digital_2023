module testbench();
	logic clk;
	logic rst;
	logic [31:0] WriteData, DataAddr;
	logic MemWrite;
	
	integer i, j;
	integer success = 1;
	
	top_module dut(clk,rst,WriteData,DataAddr,MemWrite);
	
	initial begin
		rst <= 1;
		#22
		rst <= 0;
	end
	
	always@(*)begin
		clk <= 1;
		#5;
		clk <= 0;
		#5;
	end
	/*
	always@(nededge clk) begin
		for (i = 0; i < 256; i = i + 1) begin
			for (j = 0; j < 256; j = j + 1) begin
				// Realiza las comparaciones necesarias en cada píxel
				if (image[i][j] == 100 && image[i][j] == 7) begin
				  $display("Simulación Correcta");
				  $stop;
				end else if (image[i][j] != 96) begin
				  success = 0;
				  $display("Simulación Fallida");
				  $stop;
				end
			end
		end
		if (success) begin
		 $display("Simulación Exitosa");
		 $stop;
	  end
	end
	*/
endmodule