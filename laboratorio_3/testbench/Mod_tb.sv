module Mod_tb;
  parameter N = 8;
  parameter MAX_TEST_CASES = 10;
  logic [N-1:0] dividendo;
  logic [N-1:0] divisor;
  logic [N-1:0] residuo;
  Mod#(N) mod(.dividendo(dividendo), .divisor(divisor), .residuo(residuo));
 
  initial begin
    repeat (MAX_TEST_CASES) begin
      dividendo = $random % 256;
      divisor = $random % 256;
      #1;
      $display("Dividendo: %d, Divisor: %d, Residuo: %d", dividendo, divisor, residuo);
    end
    $finish;
  end

endmodule
