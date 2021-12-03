LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY siso_tb IS
END siso_tb;
ARCHITECTURE testbench OF siso_tb IS
    COMPONENT siso
        PORT (
            Din, clk, reset : IN STD_LOGIC;
            Q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;
    --Inputs
    SIGNAL din : STD_LOGIC := '0';
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL reset : STD_LOGIC := '0';
    --Outputs
    SIGNAL Q : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
    uut : siso PORT MAP(din, clk, reset, Q);
    clk_process : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR 10 ns;
        clk <= '1';
        WAIT FOR 10 ns;
        Reset <= '1';
        Din <= '1';
        WAIT FOR 10 ns;
        Reset <= '0';
        WAIT;
    END PROCESS;
    

END testbench;