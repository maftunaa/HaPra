LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY orgate IS
  PORT (
    input1 : IN STD_LOGIC;
    input2 : IN STD_LOGIC;
    input3 : IN STD_LOGIC;
    input4 : IN STD_LOGIC;
    or_result : OUT STD_LOGIC
  );
END orgate;

ARCHITECTURE rt2 OF orgate IS
  -- interconnection signals, constants, or other components
  SIGNAL or_gate : STD_LOGIC;
BEGIN
  or_gate <= input1 OR input2 OR input3;
  or_result <= or_gate;
END rt2;