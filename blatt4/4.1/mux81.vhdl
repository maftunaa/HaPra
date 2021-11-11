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
    COMPONENT mux21 IS
        PORT (
            i1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            i2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            sel : STD_LOGIC;
            y : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
        );
    END COMPONENT;

    --signals
    SIGNAL sel81 : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL m1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL m2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL m3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL out_or : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN

    sel81_assignment : FOR i IN 0 TO 1 GENERATE
        sel81(i) <= sel_81(i);
    END GENERATE sel81_assignment;

    mux1 : mux41 PORT MAP(i1_81, i2_81, i3_81, i4_81, sel81, m1);
    mux2 : mux41 PORT MAP(i5_81, i6_81, i7_81, i8_81, sel81, m2);
    mux3 : mux21 PORT MAP(m1, m2, sel_81(2), m3);
    y_81 <= m3;

END rtl;