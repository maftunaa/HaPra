library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_tb is
end adder_tb;

architecture test of adder_tb is
    component adder 
        port(
            a: in std_logic_vector(31 downto 0);
            b: in std_logic_vector(31 downto 0);
            y: out std_logic_vector(31 downto 0)
        );
    end component;

    signal a,b,y : std_logic_vector(31 downto 0);

begin
    uut: adder port map(a,b,y);

    process begin
        a <= X"10000000";
        b <= X"00000001";
        wait for 10 ns;
        a <= X"10001000";
        b <= X"00100001";
        wait for 10 ns;
        wait;
    end process;

end test;