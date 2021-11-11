--And Gate for 2 inputs
library ieee;
use ieee.std_logic_1164.all;

entity and2gate is
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    and_result : out std_logic
  );
end and2gate;

-- architecture describes functionality of particular entity
-- like .c implementation of a function
-- actually describes the "internal wiring" of block
architecture rtl of and2gate is
  -- interconnection signals, constants, or other components
  signal and_gate : std_logic;
begin
  and_gate <= input1 and input2;
  and_result <= and_gate;
end rtl;