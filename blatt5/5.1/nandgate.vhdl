library ieee;
use ieee.std_logic_1164.all;

entity nandgate is
    port (
      input1 : in std_logic;
      input2 : in std_logic;
      nand_result : out std_logic
    );
end nandgate;

architecture rt6 of nandgate is
    -- interconnection signals, constants, or other components
    signal nand_gate : std_logic;
  begin
    nand_gate <= input1 nand input2;
    nand_result <= nand_gate;
  end rt6;
  