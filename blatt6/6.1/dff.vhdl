--D FlipFlop
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY dff IS
    PORT (
        clk, reset, D : IN STD_LOGIC;
        Q : OUT STD_LOGIC);
END dff;
ARCHITECTURE Behavioral OF dff IS
BEGIN
    PROCESS (clk, reset)
    BEGIN
        IF (reset = '1') THEN
            Q <= '0';
        ELSIF (clk = '1' AND clk'event) THEN
            Q <= D;
        END IF;
    END PROCESS;
END Behavioral;