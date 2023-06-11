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

endmodule