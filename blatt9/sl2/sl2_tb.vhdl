library ieee; use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sl2_tb is
	end sl2_tb;


architecture testbench of sl2_tb is
	-- declaration of UUT
	component sl2
    port(
        a: in std_logic_vector(31 downto 0);
        y: out std_logic_vector(31 downto 0)
    );
	end component;


	signal a : std_logic_vector(31 downto 0);
	signal y : std_logic_vector(31 downto 0);


begin
	uut: sl2 port map (
        a => a,
        y => y);

	-- Clock process definitions
	process begin
		
		a <= X"FFFFFFFF";
        wait for 10 ns;
        assert y = X"FFFFFFFC" report "error at test 1";
		a <= X"00000001";
		wait for 10 ns;
		assert y = X"00000004" report "error at test 2";

        wait;
	end process;


end testbench;