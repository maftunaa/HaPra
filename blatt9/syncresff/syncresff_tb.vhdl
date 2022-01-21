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
            d: in std_logic_vector(7 downto 0);
            q: buffer std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
	
   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal d : std_logic_vector(7 downto 0);
   signal q : std_logic_vector(7 downto 0);
	
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: syncresff PORT MAP (
          clk => clk,
          reset => reset,
          d => d,
          q => q
        );

   -- Clock process definitions
  process begin
    clk <= '0';
    reset <='1';
    d <= "00000001";
    wait for 10 ns;
    clk <= '1';
    reset <='0';
    d <= "00000001";
    wait for 10 ns;
    wait;
   end process;
 
END testbench;