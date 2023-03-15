library ieee;
use ieee.std_logic_1164.all;

entity bin_to_bch_decoder is
    port (
        bin_number : in std_logic_vector(3 downto 0);
        bch_number : out std_logic_vector(6 downto 0)
    );
end entity;

architecture Behavioral of bin_to_bch_decoder is
begin
    process(bin_number)
    begin
        case bin_number is	
            --									 abcdefg
            when "0000" => bch_number <= "0000001"; --0
            when "0001" => bch_number <= "1001111"; --1
            when "0010" => bch_number <= "0010010"; --2
            when "0011" => bch_number <= "0000110"; --3
            when "0100" => bch_number <= "1001100"; --4
            when "0101" => bch_number <= "0100100"; --5
            when "0110" => bch_number <= "0100000"; --6
            when "0111" => bch_number <= "0001111"; --7
            when "1000" => bch_number <= "0000000"; --8
            when "1001" => bch_number <= "0001100"; --9
            when "1010" => bch_number <= "0001000"; --10
            when "1011" => bch_number <= "1100000"; --11
            when "1100" => bch_number <= "0110001"; --12
            when "1101" => bch_number <= "1000010"; --13
            when "1110" => bch_number <= "0110000"; --14
            when "1111" => bch_number <= "0111000"; --15
            when others => bch_number <= "1111111"; --default to 0
        end case;
    end process;

end architecture;
