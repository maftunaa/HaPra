library ieee;
use ieee.std_logic_1164.all;

entity facla is
  port (
    a : in std_logic;
    b : in std_logic;
    cin : in std_logic;
    g : out std_logic;
    p : out std_logic;
    sum : out std_logic
  );
end facla;

architecture test of facla is
begin
  p <= a xor b;
  g <= a and b;
  sum <= a xor b xor cin;
end test;

