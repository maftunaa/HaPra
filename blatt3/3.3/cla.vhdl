LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY cla IS
  PORT (
    a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    cin : IN STD_LOGIC;
    cout : OUT STD_LOGIC;
    sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END cla;

ARCHITECTURE test OF facla IS
  --facla
  COMPONENT facla
    PORT (
      a : IN STD_LOGIC;
      b : IN STD_LOGIC;
      cin : IN STD_LOGIC;
      g : OUT STD_LOGIC;
      p : OUT STD_LOGIC;
      sum : OUT STD_LOGIC
    );
  END COMPONENT;
  -- clag
  COMPONENT clag
    PORT (
      gin : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      pin : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      cin : IN STD_LOGIC;
      cout : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pout : OUT STD_LOGIC;
      gout : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL G, P : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL C : STD_LOGIC_VECTOR(3 DOWNTO 1);
BEGIN
  logic : clag PORT MAP(G, P, cin, C, p, g);
  fa0 : facla PORT MAP(a(0), b(0), cin, cout, sum(0));
  fa1 : facla PORT MAP(a(1), b(1), cin, cout, sum(1));
  fa2 : facla PORT MAP(a(2), b(2), cin, cout, sum(2));
  fa3 : facla PORT MAP(a(3), b(3), cin, cout, sum(3));

END test;