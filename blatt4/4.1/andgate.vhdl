-- from the ieee libary we use std_logic_1164
-- defines a standard for logic values used in electronic design
-- for more info check the std_logic_1164.vhdl file in ghdl/libraries/ieee
-- ieee libary also defines operators and keywords
library ieee;
use ieee.std_logic_1164.all;

entity andgate is
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    input3 : in std_logic;
    and_result : out std_logic
  );
end andgate;

-- architecture describes functionality of particular entity
-- like .c implementation of a function
-- actually describes the "internal wiring" of block
architecture rtl of andgate is
  -- interconnection signals, constants, or other components
  signal and_gate : std_logic;
begin
  and_gate <= input1 and input2 and input3;
  and_result <= and_gate;
end rtl;
