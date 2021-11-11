LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux81_tb IS
END mux81_tb;

ARCHITECTURE testbench OF mux81_tb IS
  COMPONENT mux81
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
  END COMPONENT;

  SIGNAL i1, i2, i3, i4, i5, i6, i7, i8, y : STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL sel_81 : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN
  multiplex : mux81 PORT MAP(i1, i2, i3, i4, i5, i6, i7, i8, sel_81, y);

  PROCESS BEGIN
    i1 <= "000";
    i2 <= "001";
    i3 <= "010";
    i4 <= "011";
    i5 <= "100";
    i6 <= "101";
    i7 <= "110";
    i8 <= "111";
    sel_81 <= "000";
    WAIT FOR 10 ns;
    sel_81 <= "010";
    WAIT FOR 10 ns;
    sel_81 <= "001";
    WAIT FOR 10 ns;
    sel_81 <= "011";
    WAIT FOR 10 ns;
    sel_81 <= "100";
    WAIT FOR 10 ns;
    sel_81 <= "110";
    WAIT FOR 10 ns;
    sel_81 <= "101";
    WAIT FOR 10 ns;
    sel_81 <= "111";
    WAIT FOR 10 ns;
    WAIT;
  END PROCESS;
END testbench;