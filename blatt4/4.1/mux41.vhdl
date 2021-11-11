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
    --you can add more components you need
    --you can also increase the number of inputs, e.g., the "and" gate blow is extended to a 3-input gate.
    COMPONENT andgate IS
        PORT (
            input1 : IN STD_LOGIC;
            input2 : IN STD_LOGIC;
            input3 : IN STD_LOGIC;
            and_output : OUT STD_LOGIC);
    END COMPONENT;
    COMPONENT orgate IS
        PORT (
            input1 : IN STD_LOGIC;
            input2 : IN STD_LOGIC;
            input3 : IN STD_LOGIC;
            input4 : IN STD_LOGIC;
            or_result : OUT STD_LOGIC
        );
    END COMPONENT;
    --you can define more signals here if you need, e.g.,:
    SIGNAL not_sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL and1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL and2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL and3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL and4 : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN
    --bitwise operation for each logic gate because the input signals are multilple-bit signals
    --please complete the implementation based on the schema you designed.
    -- TODO not_sel
    and_gate_assignment : FOR i IN 0 TO 2 GENERATE
        and_output1 : andgate PORT MAP(not_sel(0), not_sel(1), i1(i), and1(i));
        and_output2 : andgate PORT MAP(not_sel(0), not_sel(1), i2(i), and2(i));
        and_output3 : andgate PORT MAP(not_sel(0), not_sel(1), i3(i), and3(i));
        and_output4 : andgate PORT MAP(not_sel(0), not_sel(1), i4(i), and4(i));
    END GENERATE and_gate_assignment;
    y <= and1 OR and2 OR and3 OR and4;
END rtl;