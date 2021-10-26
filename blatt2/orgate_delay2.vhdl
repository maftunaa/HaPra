-- Inertial Delay
library ieee;
use ieee.std_logic_1164.all;

entity orgate_delay2 is
    port (
      input1 : in std_logic;
      input2 : in std_logic;
      or_result : out std_logic
    );
end orgate_delay2;

architecture rt9 of orgate_delay2 is
    -- interconnection signals, constants, or other components
    signal or_gate : std_logic;
  begin
    or_gate <= input1 or input2;
    or_result <= or_gate after 10 ns;
    -- ührt aufgrund des "Inertial-Modells" dazu, 
    -- dass alle Impulse des Signals or_gate , die weniger als 10 ns 
    -- Impulsbreite aufweisen, nicht auf dem or_result auftreten.
  end rt9;
  