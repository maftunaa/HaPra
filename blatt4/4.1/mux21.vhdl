LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mux21 IS
    PORT (
        i1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        i2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        sel : STD_LOGIC;
        y : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END mux21;
ARCHITECTURE rtl OF mux21 IS
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

    SIGNAL and1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL and2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL out_or : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL not_sel : STD_LOGIC;

BEGIN
    not_sel <= not sel;
    and_gate_assignment : FOR i IN 0 TO 2 GENERATE
        and_output1 : and2gate PORT MAP(not_sel, i1(i), and1(i));
        and_output2 : and2gate PORT MAP(sel, i2(i), and2(i));
    END GENERATE and_gate_assignment;

    or_gate_assignment : FOR i IN 0 TO 2 GENERATE
        or_output1 : or2gate PORT MAP(and1(i), and2(i), out_or(i));
    END GENERATE or_gate_assignment;

    y <= out_or;
END rtl;