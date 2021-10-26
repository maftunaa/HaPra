library ieee;
use ieee.std_logic_1164.all;

entity orgate_delay2_tb is
end orgate_delay2_tb;

architecture test of orgate_delay2_tb is
    -- component declaration, so that it can be instantiated later
    -- must have same name and port list as the entity
    component orgate_delay2
        port (
          input1 : in std_logic;
          input2 : in std_logic;
          or_result : out std_logic
        );
    end component;
    signal a, b, c : std_logic;
begin
  g: orgate_delay2 port map(input1 => a, input2 => b, or_result => c);
  
  process begin
    a <= '0';
    b <= '0';
    --ignoring
    wait for 5 ns;
    assert c='0' report "Ignoring or_result";
    a <= '0';
    b <= '1';
    --ignoring
    wait for 5 ns;
    assert c='1' report "Ignoring or_result";
    a <= '1';
    b <= '0';
    wait for 10 ns;
    assert c='1' report "End of test for 10";
    a <= '1';
    b <= '1';
    wait for 10 ns;
    assert c='1' report "End of test for 11";
    a <= 'X';
    b <= 'W';
    wait for 10 ns;
    assert false report "End of test";
    wait;
  end process;
end test;