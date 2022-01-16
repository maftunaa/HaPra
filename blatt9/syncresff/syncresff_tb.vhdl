LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY syncresff_tb IS
END syncresff_tb;
 
ARCHITECTURE testbench OF syncresff_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT syncresff
        port(
            clk: in std_logic;
            reset: in std_logic;
            d: in std_logic_vector(w-1 downto 0);
            q: buffer std_logic_vector(w-1 downto 0)
        );
    END COMPONENT;
    
	
   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal d : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal q : std_logic_vector(31 downto 0);
	
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pc PORT MAP (
          clk => clk,
          reset => reset,
          PC_in => PC_in,
          PC_out => PC_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for 10 ns;
		clk <= '0';
		wait for 10 ns;

        -- hold reset state for 100 ns.
        wait for 100 ns;	
        d <= (others => '0');
        wait for 100 ns;
        d <= q + 4;
        wait for 10 ns;
        
        wait for 2 ns;
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        wait for 2 ns;
        
        d <= q + 4;
        wait for 10 ns;
        d <= q + 4;
        wait for 10 ns;
        d <= q + 4;

        wait;
   end process;
 
END testbench;