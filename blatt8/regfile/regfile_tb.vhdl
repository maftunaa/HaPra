LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

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


   --Inputs
	signal clk : std_logic := '0';
	signal Read_reg_1 : std_logic_vector(4 downto 0) := (others => '0');
	signal Read_reg_2 : std_logic_vector(4 downto 0) := (others => '0');
	signal Write_reg : std_logic_vector(4 downto 0) := (others => '0');
	signal Write_data : std_logic_vector(31 downto 0) := (others => '0');
	signal write_enable : std_logic := '0';

   --Outputs
	signal Read_data_1 : std_logic_vector(31 downto 0);
	signal Read_data_2 : std_logic_vector(31 downto 0);


BEGIN

   -- Instantiate the Unit Under Test (UUT)
	uut: regfile PORT MAP (
					    clk => clk,
					    we3 => write_enable,
                        a1 => Read_reg_1,
                        a2 => Read_reg_2,
                        a3 => Write_reg,
                        wd3 => Write_data,
                        rd1 => Read_data_1,
                        rd2 => Read_data_2
				    );   


   stimuli: process
	begin
		clk <= '1';
		wait for 10 ns;
		clk <= '0';
		wait for 10 ns;
	-- write a value into register one	
		write_enable <= '1';
		Write_reg <= "00001";
		Write_data <= X"00000002";

		wait for 10 ns;
		write_enable <= '0';
		Read_reg_1 <= "00001";
		

	-- try to write a value into register 0
        wait for 10 ns;
		write_enable <= '1';
		Write_reg <= "00000";
		Write_data <= X"10000000";

		wait for 10 ns;
		write_enable <= '0';
		Read_reg_1 <= "00000";

		wait for 10 ns;

		wait;
	end process;

END testbench;