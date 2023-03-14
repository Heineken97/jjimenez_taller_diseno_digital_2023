library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_SumadorCompleto is
end entity;

architecture testbench of tb_SumadorCompleto is

    signal a     : std_logic_vector(3 downto 0) := (others => '0');
    signal b     : std_logic_vector(3 downto 0) := (others => '0');
    signal cin   : std_logic := '0';
    signal sum   : std_logic_vector(3 downto 0);
    signal cout  : std_logic;

    signal clk   : std_logic := '0';

begin
    dut : entity work.SumadorCompleto4bits
    port map (
        a     => a,
        b     => b,
        cin   => cin,
        sum   => sum,
        cout  => cout
    );

    clk_process : process
    begin
        while true loop
            clk <= not clk;
				wait for 10 ps;
        end loop;
    end process;

    stimulus : process
    begin
		wait until rising_edge(clk);
        a <= "0000"; b <= "0000"; cin <= '0';
        wait for 10 ps;
        
        a <= "0001"; b <= "0001"; cin <= '0';
        wait for 10 ps;
        
        a <= "0010"; b <= "0001"; cin <= '1';
        wait for 10 ps;
        
        a <= "0100"; b <= "0011"; cin <= '1';
        wait for 10 ps;
        
        a <= "1010"; b <= "1100"; cin <= '1';
        wait for 10 ps;
        
        wait for 10 ps;
    end process;
    
end architecture;