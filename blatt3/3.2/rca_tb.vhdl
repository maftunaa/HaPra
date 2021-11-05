LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY rca_tb IS
END rca_tb;

ARCHITECTURE test OF rca_tb IS
  COMPONENT rca
    PORT (
      a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      cout : OUT STD_LOGIC;
      sum : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
  END COMPONENT;

  SIGNAL a : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL b : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL cout : STD_LOGIC;
  SIGNAL sum : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
  g : rca port map(a, b, cout, sum);

  PROCESS BEGIN
    a <= "10101010";
    b <= "01010101";
    WAIT FOR 1 ns;
    a <= "11001100";
    b <= "11110000";
    WAIT FOR 1 ns;
    a <= "11010111";
    b <= "01011010";
    WAIT FOR 1 ns;
    WAIT;
  END PROCESS;
END test;