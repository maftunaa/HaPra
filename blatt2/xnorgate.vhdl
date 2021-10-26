library ieee;
use ieee.std_logic_1164.all;

entity xnorgate is
    port (
      input1 : in std_logic;
      input2 : in std_logic;
      xnor_result : out std_logic
    );
end xnorgate;

architecture rt5 of xnorgate is
    -- interconnection signals, constants, or other components
    signal xnor_gate : std_logic;
  begin
    xnor_gate <= input1 xnor input2;
    xnor_result <= xnor_gate;
  end rt5;
  