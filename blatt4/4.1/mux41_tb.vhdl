LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux41_tb IS
END mux41_tb;

ARCHITECTURE testbench OF mux41_tb IS
    COMPONENT mux41
        PORT (
            i1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            i2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            i3 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            i4 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            y : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL i1, i2, i3, i4, y : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL sel : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN
    multiplex : mux41 PORT MAP(i1, i2, i3, i4,sel,y);

    PROCESS BEGIN
        i1 <= "000";
        i2 <= "001";
        i3 <= "010";
        i4 <= "011";
        sel <= "00";
        WAIT FOR 10 ns;
        i1 <= "000";
        i2 <= "001";
        i3 <= "010";
        i4 <= "011";
        sel <= "01";
        WAIT FOR 10 ns;
        i1 <= "000";
        i2 <= "001";
        i3 <= "010";
        i4 <= "011";
        sel <= "10";
        WAIT FOR 10 ns;
        i1 <= "000";
        i2 <= "001";
        i3 <= "010";
        i4 <= "011";
        sel <= "11";
        WAIT FOR 10 ns;
        WAIT;
    END PROCESS;
END testbench;