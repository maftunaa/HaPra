LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SR_Latch_tb IS
END SR_Latch_tb;

ARCHITECTURE testbench OF SR_Latch_tb IS

    COMPONENT SR_Latch
        PORT (
            S, R : IN STD_LOGIC;
            Q, not_Q : OUT STD_LOGIC
        );
    END COMPONENT;
    SIGNAL S, R, Q, not_Q : STD_LOGIC;
    

BEGIN
    latch : SR_Latch PORT MAP(S, R, Q, not_Q);
    
    PROCESS BEGIN
        S <= '1';
        R <= '1';
        WAIT FOR 10 ns;
        S <= '0';
        R <= '1';
        WAIT FOR 10 ns;
        S <= '1';
        R <= '0';
        WAIT FOR 10 ns;
        S <= '0';
        R <= '0';
        WAIT FOR 10 ns;
        WAIT;
    END PROCESS;
END testbench;