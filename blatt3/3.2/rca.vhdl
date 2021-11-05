LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY rca IS
  PORT (
    a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    cout : OUT STD_LOGIC;
    sum : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END rca;

ARCHITECTURE rtl OF rca IS
  COMPONENT fa
    PORT (
      a : IN STD_LOGIC;
      b : IN STD_LOGIC;
      cin : IN STD_LOGIC;
      cout : OUT STD_LOGIC;
      sum : OUT STD_LOGIC
    );
  END COMPONENT;
  --signals
  SIGNAL wire_1 : STD_LOGIC;
  SIGNAL wire_2 : STD_LOGIC;
  SIGNAL wire_3 : STD_LOGIC;
  SIGNAL wire_4 : STD_LOGIC;
  SIGNAL wire_5 : STD_LOGIC;
  SIGNAL wire_6 : STD_LOGIC;
  SIGNAL wire_7 : STD_LOGIC;

BEGIN
  add0 : fa PORT MAP(a => a(0), b => b(0), cin => '0', cout => wire_1, sum => sum(0));
  add1 : fa PORT MAP(a => a(1), b => b(1), cin => wire_1, cout => wire_2, sum => sum(1));
  add2 : fa PORT MAP(a => a(2), b => b(2), cin => wire_2, cout => wire_3, sum => sum(2));
  add3 : fa PORT MAP(a => a(3), b => b(3), cin => wire_3, cout => wire_4, sum => sum(3));
  add4 : fa PORT MAP(a => a(4), b => b(4), cin => wire_4, cout => wire_5, sum => sum(4));
  add5 : fa PORT MAP(a => a(5), b => b(5), cin => wire_5, cout => wire_6, sum => sum(5));
  add6 : fa PORT MAP(a => a(6), b => b(6), cin => wire_6, cout => wire_7, sum => sum(6));
  add7 : fa PORT MAP(a => a(7), b => b(7), cin => wire_7, cout => cout, sum => sum(7));
END rtl;