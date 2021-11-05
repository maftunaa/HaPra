--8 bit Adder Subtractor
-- Aufgabe 3.2 b)
--This example describes a two input 4-bit adder/subtractor design in VHDL. 
--The design unit multiplexes add and subtract operations with an OP input.
-- 0 input produce adder output and 1 input produce subtractor output.
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY addsub IS
  PORT (
    OP : IN STD_LOGIC;
    A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    R : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    Cout, OVERFLOW : OUT STD_LOGIC);
END addsub;
ARCHITECTURE struct OF addsub IS
  COMPONENT fa
    PORT (
      a : IN STD_LOGIC;
      b : IN STD_LOGIC;
      cin : IN STD_LOGIC;
      cout : OUT STD_LOGIC;
      sum : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL C1, C2, C3, C4, C5, C6, C7, C8 : STD_LOGIC;
  SIGNAL TMP : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
  TMP <= OP xor B;
  FA0 : fa PORT MAP(A(0), TMP(0), OP, C1, R(0));
  FA1 : fa PORT MAP(A(1), TMP(1), C1, C2, R(1));
  FA2 : fa PORT MAP(A(2), TMP(2), C2, C3, R(2));
  FA3 : fa PORT MAP(A(3), TMP(3), C3, C4, R(3));
  FA4 : fa PORT MAP(A(4), TMP(4), C4, C5, R(4));
  FA5 : fa PORT MAP(A(5), TMP(5), C5, C6, R(5));
  FA6 : fa PORT MAP(A(6), TMP(6), C6, C7, R(6));
  FA7 : fa PORT MAP(A(7), TMP(7), C7, C8, R(7));
  OVERFLOW <= C7 XOR C8;
  Cout <= C8;

END struct;