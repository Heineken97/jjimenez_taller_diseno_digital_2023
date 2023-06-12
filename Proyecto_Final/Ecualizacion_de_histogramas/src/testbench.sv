module testbench();
	logic clk,rst;
	logic[31:0]	WriteData, DataAddr;
	logic					MemWrite;


	top_module armv4
		(.clk(clk),.rst(rst),
		.DataAddr(DataAddr), 
		.WriteData(WriteData),
		.MemWrite(MemWrite));

	initial
	begin
		clk = 1'b0;	rst = 1'b0;
		#6;	rst <= 1'b1;	#22;
		rst <= 1'b0;
	end
	
	always
	begin
		#5;	clk <= ~clk;
	end


	always	@(negedge clk)
	begin
		if (MemWrite)
		begin
			if (DataAddr === 100)
			begin
				if (WriteData === 7)
				begin
					$display("Se escribio un 7 en la direccion 100. :-)
					estamos bien! El procesador funciona!");
					$stop;
				end
				else
				begin
					$display("Se cayo :(");
					$stop;
				end
			end
		end
	end

endmodule