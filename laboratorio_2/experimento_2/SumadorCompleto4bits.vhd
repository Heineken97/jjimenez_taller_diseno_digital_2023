library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SumadorCompleto4bits is
port (
    a    : in  std_logic_vector(3 downto 0);
    b    : in  std_logic_vector(3 downto 0);
    cin  : in  std_logic;
    sum  : out std_logic_vector(3 downto 0);
    cout : out std_logic
);
end entity;

architecture structural of SumadorCompleto4bits is

    component sumadorCompleto_1bit
    port (
        a, b, cin  : in  std_logic;
        sum, cout : out std_logic
    );
    end component;

    signal c : std_logic_vector(3 downto 0);

begin

    u0: sumadorCompleto_1bit port map(a(0), b(0), cin, sum(0), c(0));
    u1: sumadorCompleto_1bit port map(a(1), b(1), c(0), sum(1), c(1));
    u2: sumadorCompleto_1bit port map(a(2), b(2), c(1), sum(2), c(2));
    u3: sumadorCompleto_1bit port map(a(3), b(3), c(2), sum(3), cout);

end architecture;