LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY detector_tb IS
END detector_tb;

ARCHITECTURE behavior OF detector_tb IS


COMPONENT detector
PORT(
clk : IN std_logic;
din : IN std_logic;
rst : IN std_logic;
dout : OUT std_logic
);
END COMPONENT;

--Inputs
signal clk : std_logic := '0';
signal din : std_logic := '0';
signal rst : std_logic := '0';

--Outputs
signal dout : std_logic;

BEGIN

 -- Instantiate the Unit Under Test (UUT)
uut: detector PORT MAP (
clk => clk,
din => din,
rst => rst,
dout => dout
);

 -- Clock process definitions
clk_process :process
begin
clk <= '0';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
end process;

 -- Stimulus process
stim_proc: process
begin

rst <= '1';

wait for 100 ns;

rst <= '0';

din <= '0';
wait for 20 ns;

din <= '1';

wait for 20 ns;

din <= '0';

wait for 20 ns;

din <= '1';

wait for 20 ns;

din <= '0';

wait for 20 ns;

din <= '1';

wait for 20 ns;

din <= '0';

wait for 20 ns;

din <= '1';
end process;

END;
