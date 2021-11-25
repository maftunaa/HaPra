LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SR_Latch IS
  PORT (
    S, R : IN STD_LOGIC;
    Q, not_Q : OUT STD_LOGIC
  );
END SR_Latch;

ARCHITECTURE Behavioral OF SR_Latch IS
  COMPONENT nandgate IS
    PORT (
      input1 : IN STD_LOGIC;
      input2 : IN STD_LOGIC;
      nand_result : OUT STD_LOGIC
    );
  END COMPONENT;

  SIGNAL x1, x2 : STD_LOGIC;
BEGIN
  r1 : nandgate PORT MAP(R, x2, x1);
  r2 : nandgate PORT MAP(S, x1, x2);
  Q <= x1;
  not_Q <= x2;

END Behavioral;