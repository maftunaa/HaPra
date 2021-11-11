LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
--the 4:1 multiplexer to be designed consists of four 3-bit inputs, i.e., i1, i2, i3 and i4.
--sel is a 2-bit select signal.
--y is the output
ENTITY mux41 IS
    PORT (
        i1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        i2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        i3 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        i4 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        y : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END mux41;

ARCHITECTURE rtl OF mux41 IS

    -- andgate with 3 inputs
    COMPONENT andgate IS
    port (
        input1 : in std_logic;
        input2 : in std_logic;
        input3 : in std_logic;
        and_result : out std_logic
      );
    END COMPONENT;

    -- orgate with 4 inputs
    COMPONENT orgate IS
        PORT (
            input1 : IN STD_LOGIC;
            input2 : IN STD_LOGIC;
            input3 : IN STD_LOGIC;
            input4 : IN STD_LOGIC;
            or_result : OUT STD_LOGIC
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
    signal out_or : STD_LOGIC_VECTOR(2 DOWNTO 0); --for output

BEGIN
    --bitwise operation for each logic gate because the input signals are multilple-bit signals
    not_gate_assignment : FOR i IN 0 TO 1 GENERATE
        not_output1 : notgate port map(sel(i), not_sel(i));
    END GENERATE not_gate_assignment;
    
    and_gate_assignment : FOR i IN 0 TO 2 GENERATE
        and_output1 : andgate PORT MAP(not_sel(0), not_sel(1), i1(i), and1(i));
        and_output2 : andgate PORT MAP(sel(0), not_sel(1), i2(i), and2(i));
        and_output3 : andgate PORT MAP(not_sel(0), sel(1), i3(i), and3(i));
        and_output4 : andgate PORT MAP(sel(0), sel(1), i4(i), and4(i));
    END GENERATE and_gate_assignment;
    
    or_gate_assignment : FOR i IN 0 TO 2 GENERATE
        or_output1 : orgate PORT MAP(and1(i), and2(i), and3(i), and4(i), out_or(i));
    END GENERATE or_gate_assignment;
    y <= out_or;
END rtl;