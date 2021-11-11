LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY demux41_tb IS
END demux41_tb;

ARCHITECTURE testbench OF demux41_tb IS
    COMPONENT demux41
        PORT (
        y0 : IN std_logic_vector(2 DOWNTO 0); 
        sel : IN std_logic_vector(1 DOWNTO 0); 
        i0 : OUT std_logic_vector(2 DOWNTO 0);
        i1 : OUT std_logic_vector(2 DOWNTO 0);
        i2 : OUT std_logic_vector(2 DOWNTO 0);
        i3 : OUT std_logic_vector(2 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL i0, i1, i2, i3, y0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL sel : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN
    demultiplex : demux41 PORT MAP(y0, sel, i0, i1, i2, i3);

    PROCESS BEGIN
	
		y0 <= "001";
        sel <= "00";
        WAIT FOR 1 ns;
	
		y0 <= "001";		
        sel <= "01";
        WAIT FOR 1 ns;

		y0 <= "001";		
        sel <= "10";
        WAIT FOR 1 ns;

		y0 <= "001";		
        sel <= "11";
        WAIT FOR 1 ns;

        WAIT;
    END PROCESS;
END testbench;