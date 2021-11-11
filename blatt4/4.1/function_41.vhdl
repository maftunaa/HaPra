LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY function_41 IS
    PORT (
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        C : IN STD_LOGIC;
        y : OUT STD_LOGIC
    );
END function_41;

ARCHITECTURE rtl OF function_41 IS

    COMPONENT mux41 IS
        PORT (
            i1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            i2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            i3 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            i4 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            y : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
        );
    END COMPONENT mux41;

BEGIN

END rtl;