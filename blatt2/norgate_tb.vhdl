library ieee;
use ieee.std_logic_1164.all;

entity norgate_tb is
end norgate_tb;

architecture test of norgate_tb is
    -- component declaration, so that it can be instantiated later
    -- must have same name and port list as the entity
    component norgate
        port (
          input1 : in std_logic;
          input2 : in std_logic;
          nor_result : out std_logic
        );
    end component;
    signal a, b, c : std_logic;
begin
    -- creates an instance of andgate
  g: norgate port map(input1 => a, input2 => b, nor_result => c);
  
  process begin
    a <= '0';
    b <= '0';
    wait for 10 ns;
    assert c='1' report "End of test for 00";
    a <= '0';
    b <= '1';
    wait for 10 ns;
    assert c='0' report "End of test for 01";
    a <= '1';
    b <= '0';
    wait for 10 ns;
    assert c='0' report "End of test for 10";
    a <= '1';
    b <= '1';
    wait for 10 ns;
    assert c='0' report "End of test for 11";
    a <= 'X';
    b <= 'W';
    wait for 10 ns;
    assert false report "End of test";
    wait;
  end process;
end test;