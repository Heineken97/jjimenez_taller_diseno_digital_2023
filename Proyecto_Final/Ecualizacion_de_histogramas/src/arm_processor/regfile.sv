module regfile#(parameter BusWidth=32,RegisterFileSize= 15)(
	input logic clk, rst,
	//	Write Control
	input logic	i_Write_Enable,

	//	Register Address inputs
	input logic[3:0]	i_Address_ToRead1, i_Address_ToRead2,
	input logic[3:0]	i_Address_ToWrite,

	//	PC Write input
	input logic[(BusWidth - 1):0]	i_R15,

	//	Data Control
	input logic[(BusWidth - 1):0]	i_Write_Data,
	output logic[(BusWidth - 1):0]	o_Read_Data1, o_Read_Data2);

	int i;
	logic		[(BusWidth - 1):0] RegisterFile[(RegisterFileSize - 1):0];


	always_ff@(posedge clk, posedge rst)begin
		if (rst)
		begin
			//o_Read_Data1 <= 'd0;
			//o_Read_Data2 <= 'd0;
			for (i = 0; i < 15; i = i + 1) RegisterFile[i] <= 32'd0;
		end
		else if (i_Write_Enable)RegisterFile[i_Address_ToWrite] <= i_Write_Data;
	end

	assign o_Read_Data1 = (i_Address_ToRead1 == 4'd15) ?	i_R15 : RegisterFile[i_Address_ToRead1];
	assign o_Read_Data2 = (i_Address_ToRead2 == 4'd15) ?	i_R15 : RegisterFile[i_Address_ToRead2];

endmodule