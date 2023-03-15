library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SumadorCompleto4bits is
port (
    a           : in  std_logic_vector(3 downto 0);
    b           : in  std_logic_vector(3 downto 0);
    cin         : in  std_logic;
    sum         : buffer std_logic_vector(3 downto 0);
    cout        : out std_logic;
    hex_display : out std_logic_vector(6 downto 0) -- Salida a display de 7 segmentos
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
    signal sum_hex : std_logic_vector(3 downto 0);

begin

    u0: sumadorCompleto_1bit port map(a(0), b(0), cin, sum(0), c(0));
    u1: sumadorCompleto_1bit port map(a(1), b(1), c(0), sum(1), c(1));
    u2: sumadorCompleto_1bit port map(a(2), b(2), c(1), sum(2), c(2));
    u3: sumadorCompleto_1bit port map(a(3), b(3), c(2), sum(3), cout);

    -- Convertir la salida binaria del sumador a hexadecimal para el display
    process(sum)
    begin
        case sum is
            when "0000" =>
                hex_display <= "1000000"; -- 0 en hexadecimal
            when "0001" =>
                hex_display <= "1111001"; -- 1 en hexadecimal
            when "0010" =>
                hex_display <= "0100100"; -- 2 en hexadecimal
            when "0011" =>
                hex_display <= "0110000"; -- 3 en hexadecimal
            when "0100" =>
                hex_display <= "0011001"; -- 4 en hexadecimal
            when "0101" =>
                hex_display <= "0010010"; -- 5 en hexadecimal
            when "0110" =>
                hex_display <= "0000010"; -- 6 en hexadecimal
            when "0111" =>
                hex_display <= "1111000"; -- 7 en hexadecimal
            when "1000" =>
                hex_display <= "0000000"; -- 8 en hexadecimal
            when "1001" =>
                hex_display <= "0011000"; -- 9 en hexadecimal
            when "1010" =>
                hex_display <= "0001000"; -- A en hexadecimal
            when "1011" =>
                hex_display <= "0000011"; -- B en hexadecimal
            when "1100" =>
                hex_display <= "1000110"; -- C en hexadecimal
            when "1101" =>
                hex_display <= "0100001"; -- D en hexadecimal
            when "1110" =>
                hex_display <= "0000110"; -- E en hexadecimal
            when "1111" =>
                hex_display<= "0001110"; -- F en hexadecimal
				when others => 
					 hex_display <= "-------"; -- Error, mostrar guiones en el display
					 end case;
				 end process;
		end architecture;


