library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sumadorCompleto_1bit is
port (
    a, b, cin  : in  std_logic;
    sum, cout : out std_logic
);
end entity;

architecture structural of sumadorCompleto_1bit is
begin
    sum <= a xor b xor cin;
    cout <= (a and b) or (a and cin) or (b and cin);
end architecture;