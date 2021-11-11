LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY demux14 IS
    PORT (
        y0 : IN std_logic_vector(2 DOWNTO 0); 
        sel : IN std_logic_vector(1 DOWNTO 0); 
        i0 : OUT std_logic_vector(2 DOWNTO 0);
        i1 : OUT std_logic_vector(2 DOWNTO 0);
        i2 : OUT std_logic_vector(2 DOWNTO 0);
        i3 : OUT std_logic_vector(2 DOWNTO 0)
        );
END demux14;

ARCHITECTURE rtl OF demux14 IS
 -- andgate with 3 inputs
    COMPONENT andgate IS
    port (
        input1 : in std_logic;
        input2 : in std_logic;
        input3 : in std_logic;
        and_result : out std_logic
      );
    END COMPONENT;
	
	    --notgate 
    COMPONENT notgate IS
        PORT (
            input1 : IN STD_LOGIC;
            not_result : OUT STD_LOGIC
        );
    END COMPONENT;
	
	--signals
    SIGNAL not_sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL and1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL and2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL and3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL and4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
	
	BEGIN
    --bitwise operation for each logic gate because the input signals are multilple-bit signals
    not_gate_assignment : FOR i IN 0 TO 1 GENERATE
        not_output1 : notgate port map(sel(i), not_sel(i));
    END GENERATE not_gate_assignment;
    
    and_gate_assignment : FOR i IN 0 TO 2 GENERATE
        and_output1 : andgate PORT MAP(not_sel(0), not_sel(1), y0(i), and1(i));
        and_output2 : andgate PORT MAP(not_sel(0), sel(1), y0(i), and2(i));
        and_output3 : andgate PORT MAP(sel(0), not_sel(1), y0(i), and3(i));
        and_output4 : andgate PORT MAP(sel(0), sel(1), y0(i), and4(i));
    END GENERATE and_gate_assignment;
    
	i0 <= and1;
    i1 <= and2;
    i2 <= and3;
    i3 <= and4;
END rtl;