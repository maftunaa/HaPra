library ieee;
use ieee.std_logic_1164.all;

entity orgate3_tb is
end orgate3_tb;

architecture test of orgate3_tb is
    -- component declaration, so that it can be instantiated later
    -- must have same name and port list as the entity
    component orgate3
        port (
          input1 : in std_logic;
          input2 : in std_logic;
          input3 : in std_logic;
          or_result : out std_logic
        );
    end component;
    signal a, b, c, d : std_logic;
begin
  g: orgate3 port map(input1 => a, input2 => b, input3 => c, or_result => d);
  
  process begin
    a <= '0';
    b <= '0';
    c <= '0';
    --ignoring
    wait for 5 ns;
    assert d='0' report "Ignoring or_result";
    a <= '0';
    b <= '0';
    c <= '1';
    --ignoring
    wait for 5 ns;
    assert d='0' report "Ignoring or_result";
    a <= '0';
    b <= '1';
    c <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    c <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    c <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    c <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    c <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    c <= '1';
    wait for 10 ns;
    wait;
  end process;
end test;