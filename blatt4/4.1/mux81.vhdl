LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mux81 IS
    PORT (
        i1_81 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        i2_81 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        i3_81 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        i4_81 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        i5_81 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        i6_81 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        i7_81 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        i8_81 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        sel_81 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        y_81 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END mux81;

ARCHITECTURE rtl OF mux81 IS

    COMPONENT mux41 IS
        PORT (
            i1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            i2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            i3 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            i4 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            y : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
        );
    END COMPONENT;

    -- andgate with 2 inputs
    COMPONENT and2gate IS
        PORT (
            input1 : IN STD_LOGIC;
            input2 : IN STD_LOGIC;
            and_result : OUT STD_LOGIC
        );
    END COMPONENT;

    -- orgate with 2 inputs
    COMPONENT or2gate IS
        PORT (
            input1 : IN STD_LOGIC;
            input2 : IN STD_LOGIC;
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
    SIGNAL not_sel : STD_LOGIC;
    SIGNAL m1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL m2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL sel81 : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL and1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL and2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL out_or : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN

    sel81_assignment : FOR i IN 0 TO 1 GENERATE
        sel81(i) <= sel_81(i + 1);
    END GENERATE sel81_assignment;

    mux1 : mux41 PORT MAP(i1_81, i2_81, i3_81, i4_81, sel81, m1);
    mux2 : mux41 PORT MAP(i5_81, i6_81, i7_81, i8_81, sel81, m1);

    
    not_output1 : notgate port map(sel_81(0), not_sel);
    

    and_gate_assignment : FOR i IN 0 TO 2 GENERATE
        and_output1 : and2gate PORT MAP(not_sel, m1(i), and1(i));
        and_output2 : and2gate PORT MAP(sel_81(0), m2(i), and2(i));
    END GENERATE and_gate_assignment;

    or_gate_assignment : FOR i IN 0 TO 2 GENERATE
        or_output1 : or2gate PORT MAP(and1(i), and2(i), out_or(i));
    END GENERATE or_gate_assignment;
    y_81 <= out_or;

END rtl;