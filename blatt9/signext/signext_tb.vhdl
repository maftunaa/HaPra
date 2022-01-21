library ieee; use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity signext_tb is
	end signext_tb;


architecture testbench of signext_tb is
	-- declaration of UUT
	component signext
    port(
        a: in std_logic_vector(15 downto 0);
        aext: out std_logic_vector(31 downto 0)
      );
	end component;


	signal a : std_logic_vector(15 downto 0);
	signal aext : std_logic_vector(31 downto 0);


begin
	uut: signext port map (
        a => a,
        aext => aext);

	-- Clock process definitions
	process begin
		
		a <= X"FFFF";
        wait for 10 ns;
        assert aext = X"FFFFFFFF" report "error at test 1";
		a <= X"0000";
		wait for 10 ns;
		assert aext = X"00000000" report "error at test 2";

        wait;
	end process;


end testbench;