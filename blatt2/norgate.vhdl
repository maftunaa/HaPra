library ieee;
use ieee.std_logic_1164.all;

entity norgate is
    port (
      input1 : in std_logic;
      input2 : in std_logic;
      nor_result : out std_logic
    );
end norgate;

architecture rt3 of norgate is
    -- interconnection signals, constants, or other components
    signal nor_gate : std_logic;
  begin
    nor_gate <= input1 nor input2;
    nor_result <= or_gate;
  end rt3;