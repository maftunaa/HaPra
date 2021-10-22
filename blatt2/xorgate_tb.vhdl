library ieee;
use ieee.std_logic_1164.all;

entity xorgate_tb is
end xorgate_tb;

architecture test of xorgate_tb is
    -- component declaration, so that it can be instantiated later
    -- must have same name and port list as the entity
    component xorgate
        port (
          input1 : in std_logic;
          input2 : in std_logic;
          xor_result : out std_logic
        );
    end component;
    signal a, b, c : std_logic;
begin
    -- creates an instance of andgate
  g: xorgate port map(input1 => a, input2 => b, xor_result => c);
  
  process begin
    a <= '0';
    b <= '0';
    wait for 10 ns;
    assert c='0' report "End of test for 00";
    a <= '0';
    b <= '1';
    wait for 10 ns;
    assert c='1' report "End of test for 01";
    a <= '1';
    b <= '0';
    wait for 10 ns;
    assert c='1' report "End of test for 10";
    a <= '1';
    b <= '1';
    wait for 10 ns;
    assert c='0' report "End of test for 11";
    a <= 'X';
    b <= 'W';
    wait for 10 ns;
    wait;
  end process;
end test;