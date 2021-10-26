library ieee;
use ieee.std_logic_1164.all;

entity notgate_tb is
end notgate_tb;

architecture test of notgate_tb is
    -- component declaration, so that it can be instantiated later
    -- must have same name and port list as the entity
    component notgate
        port (
          input1 : in std_logic;
          not_result : out std_logic
        );
    end component;
    signal a, c : std_logic;
begin
    -- creates an instance of andgate
  g: notgate port map(input1 => a, not_result => c);
  
  process begin
    a <= '0';
    wait for 10 ns;
    assert c='1' report "End of test for 0";
    a <= '1';
    wait for 10 ns;
    assert c='0' report "End of test for 1";
    a <= 'X';
    wait for 10 ns;
    assert false report "End of test";
    wait;
  end process;
end test;