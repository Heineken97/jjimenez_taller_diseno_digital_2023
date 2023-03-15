`timescale 1ps/1ps

module tb_bin_to_bch_decoder;

    // Inputs
    logic [3:0] bin_number;
    
    // Outputs
    logic [6:0] bch_number;

    // Instantiate the Unit Under Test (UUT)
    bin_to_bch_decoder uut (
        .bin_number(bin_number), 
        .bch_number(bch_number)
    );

    initial begin
        // Wait 20ns for global reset to finish
        #20;

        // Test value 0
        bin_number = 4'b0000;
        #10;
        $display("bin_number = %b, bch_number = %b", bin_number, bch_number);
        
        // Test value 1
        bin_number = 4'b0001;
        #10;
        $display("bin_number = %b, bch_number = %b", bin_number, bch_number);
        
        // Test value 2
        bin_number = 4'b0010;
        #10;
        $display("bin_number = %b, bch_number = %b", bin_number, bch_number);
        
        // Test value 5
        bin_number = 4'b0101;
        #10;
        $display("bin_number = %b, bch_number = %b", bin_number, bch_number);
        
        // Test value 10
        bin_number = 4'b1010;
        #10;
        $display("bin_number = %b, bch_number = %b", bin_number, bch_number);
        
        // Test value 12
        bin_number = 4'b1100;
        #10;
        $display("bin_number = %b, bch_number = %b", bin_number, bch_number);
        
        // Test value 13
        bin_number = 4'b1101;
        #10;
        $display("bin_number = %b, bch_number = %b", bin_number, bch_number);
        
        // Test value 15
        bin_number = 4'b1111;
        #10;
        $display("bin_number = %b, bch_number = %b", bin_number, bch_number);

        // End simulation
        $finish;
    end

endmodule
