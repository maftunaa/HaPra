library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux2_tb is
end mux2_tb;

architecture testbench of mux2_tb is
    component mux2 
    port(
        d0: in std_logic_vector(7 downto 0);
        d1: in std_logic_vector(7 downto 0);
        s: in std_logic;
        y: out std_logic_vector(7 downto 0)
      );
    end component;

    signal d0,d1,y : std_logic_vector(7 downto 0);
    signal s: std_logic;

begin
    uut: mux2 port map(d0 => d0, d1 => d1, s => s, y => y);

    process begin
        d0 <= "10000000";
        d1 <= "00000001";
        s <= '1';
        wait for 10 ns;
        assert y = "00000001" report "error";
        d0 <= "10001000";
        d1 <= "00100001";
        s <= '0';
        wait for 10 ns;
        assert y = "10001000" report "error";
        wait;
    end process;

end testbench;