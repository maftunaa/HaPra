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


	signal tb_inst_in : std_logic_vector(15 downto 0);
	signal tb_inst_out : std_logic_vector(31 downto 0);

	signal clk : std_logic; 

begin
	uut: signext port map (
        a => tb_inst_in,
        aext => tb_inst_out
				  );

	-- Clock process definitions
	clk_process : process
	begin
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
        -- test 1: test with sign bit 1
		tb_inst_in <= X"FFFF";
        wait for 10 ns;
        assert tb_inst_out = X"FFFFFFFF" report "error at test 1";

        wait for 10 ns;
		tb_inst_in <= X"0000";
		wait for 10 ns;
		assert tb_inst_out = X"00000000" report "error at test 2";

        wait;
	end process;


end testbench;