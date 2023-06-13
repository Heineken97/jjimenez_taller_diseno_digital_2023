module testbench();
	logic clk;
	logic rst;
	logic [31:0] WriteData, DataAddr;
	logic MemWrite;
	logic	CLK_VGA; 
   logic SYNC_H, SYNC_V, SYNC_B, SYNC_BLANK;
	logic [7:0] Red, Green, Blue;
	
	integer i, j;
	integer success = 1;
	
	top_module dut(clk,rst,WriteData,DataAddr,MemWrite,CLK_VGA,SYNC_H,SYNC_V,SYNC_B,SYNC_BLANK,Red,Green,Blue);
	
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