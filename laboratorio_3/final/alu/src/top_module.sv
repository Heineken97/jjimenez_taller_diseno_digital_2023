module top_module(
	 input logic clk,
	 input logic reset,
    input logic change_switches,
    input logic [7:0] switches,
    output logic [6:0] display_units,
    output logic [6:0] display_tens,
    output logic [6:0] display_sign,
    output logic [3:0] result,
    output logic [3:0] flags,
	 output	logic [1:0] leftover_leds
);	

	 logic [7:0] sync_switches;
	 logic sync_change_switches;
	 logic [6:0] sync_display_units;
    logic [6:0] sync_display_tens;
    logic [6:0] sync_display_sign;
    logic [3:0] sync_result;
    logic [3:0] sync_flags;
	 
	    // Asignar las entradas de la ALU según el mapeo de los switches
    logic [3:0] a;
    logic [3:0] b;
    logic [3:0] uc;
    logic [3:0] num_units;
    logic [3:0] num_tens;

	 

	register #(8) uut_rsw(.clk(clk), .reset(~reset), 
		.d(switches), .q(sync_switches));
		
	register #(1) uut_scw(.clk(clk), .reset(~reset), 
		.d(change_switches), .q(sync_change_switches));
		
	register #(7) uut_sdu(.clk(clk), .reset(~reset), 
		.d(sync_display_units), .q(display_units));
		
	register #(7) uut_sdt(.clk(clk), .reset(~reset), 
		.d(sync_display_tens), .q(display_tens));
		
	register #(7) uut_sds(.clk(clk), .reset(~reset), 
		.d(sync_display_sign), .q(display_sign));
		
	register #(4) uut_sr(.clk(clk), .reset(~reset), 
		.d(sync_result), .q(result));
		
	register #(4) uut_sf(.clk(clk), .reset(~reset), 
		.d(sync_flags), .q(flags));


	

 
   always @(*) begin
			leftover_leds = 2'b00;
        if (sync_change_switches) begin
            uc = sync_switches[7:4];
        end else begin;
            a = sync_switches[7:4];
            b = sync_switches[3:0];
        end
   end
	

	alu #(4) dut(
        .a(a),
        .b(b),
        .uc(uc),
        .result(sync_result), 
        .n(sync_flags[3]),
        .z(sync_flags[2]),
        .c(sync_flags[1]),
        .v(sync_flags[0])
    );


     bin_converter uut_converter(
        .bin({flags[1], result}),
        .bin_unit(num_units),
        .bin_ten(num_tens)
    );

    // unit segments
    bin_to_bcd_decoder uut_unit_d(
        .bin_number(num_units),
        .bcd_number(sync_display_units)
    );

    // ten segments
    bin_to_bcd_decoder uut_ten_d(
        .bin_number(num_tens),
        .bcd_number(sync_display_tens)
    );
	 
	sign_to_display uut_sign(
		.n(flags[3]),  
		.seg(sync_display_sign)
	);


endmodule
