library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY regfile_tb IS
	END regfile_tb;

ARCHITECTURE testbench OF regfile_tb IS 

    -- Component Declaration for the Unit Under Test (UUT)

	COMPONENT regfile
        port (
            clk: in std_logic;
            we3: in std_logic;
            a1: in std_logic_vector(4 downto 0);
            a2: in std_logic_vector(4 downto 0);
            a3: in std_logic_vector(4 downto 0);
            wd3: in std_logic_vector(31 downto 0);
            rd1: buffer std_logic_vector(31 downto 0);
            rd2: buffer std_logic_vector(31 downto 0)
        );
	END COMPONENT;

	signal clk : std_logic := '0';
	signal we3 : std_logic ;
	signal a1, a2, a3 : std_logic_vector(4 downto 0);
	signal wd3, rd1, rd2 : std_logic_vector(31 downto 0);
	


BEGIN

   -- Instantiate the Unit Under Test (UUT)
	uut: regfile PORT MAP (
					    clk => clk,
					    we3 => we3,
                        a1 => a1,
                        a2 => a2,
                        a3 => a3,
                        wd3 => wd3,
                        rd1 => rd1,
                        rd2 => rd2
				    );   


   process begin
	-- write a value into register one	
		clk <= '0';
		we3 <= '1';
		a3 <= "00001";
		wd3 <= X"00000002";
		wait for 10 ns;
		assert a3 = "010" report "error";
		clk <= '1';
		we3 <= '0';
		a1 <= "00001";
		wait for 10 ns;
		clk <= '0';
		we3 <= '1';
		a3 <= "10001";
		wd3 <= X"00000002";
		wait for 10 ns;
		assert a3 = "010" report "error";
		clk <= '1';
		we3 <= '0';
		a2 <= "10001";
		wait for 10 ns;
		wait;
	end process;

END testbench;