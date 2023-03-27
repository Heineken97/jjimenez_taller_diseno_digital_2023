module ShiftL_tb;
    parameter N = 8;
	 
    logic [N-1:0] in;
    logic [N-1:0] shift;
    logic [N-1:0] out;

    ShiftL #(.N(N)) shiftl_inst (.in(in),.shift(shift),.out(out));
	 
    initial begin
        in = 8'hFF;
        shift = 3;
    end
	 
    always @* begin
        $display("in = %b, shift = %d, out = %b", in, shift, out);
    end

endmodule
