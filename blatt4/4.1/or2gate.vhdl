-- Or GAte with 2 Inputs
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY or2gate IS
  PORT (
    input1 : IN STD_LOGIC;
    input2 : IN STD_LOGIC;
    or_result : OUT STD_LOGIC
  );
END or2gate;

ARCHITECTURE rt2 OF or2gate IS
  -- interconnection signals, constants, or other components
  SIGNAL or_gate : STD_LOGIC;
BEGIN
  or_gate <= input1 OR input2;
  or_result <= or_gate;
END rt2;