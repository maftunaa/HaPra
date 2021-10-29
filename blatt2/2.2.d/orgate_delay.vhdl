-- Transport Delay
library ieee;
use ieee.std_logic_1164.all;

entity orgate_delay is
    port (
      input1 : in std_logic;
      input2 : in std_logic;
      or_result : out std_logic
    );
end orgate_delay;

architecture rt8 of orgate_delay is
    -- interconnection signals, constants, or other components
    signal or_gate : std_logic;
  begin
    or_gate <= input1 or input2;
    or_result <= transport or_gate after 15 ns; -- Transport Delay 15 ns
  end rt8;
  