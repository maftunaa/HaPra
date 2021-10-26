library ieee;
use ieee.std_logic_1164.all;

entity orgate_delay_tb is
end orgate_delay_tb;

architecture test of orgate_delay_tb is
    -- component declaration, so that it can be instantiated later
    -- must have same name and port list as the entity
    component orgate_delay
        port (
          input1 : in std_logic;
          input2 : in std_logic;
          or_result : out std_logic
        );
    end component;
    signal a, b, c : std_logic;
begin
  g: orgate_delay port map(input1 => a, input2 => b, or_result => c);
  
  process begin
    a <= '0';
    b <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    wait for 10 ns;
    a <= 'X';
    b <= 'W';
    wait for 10 ns;
    assert false report "End of test";
    wait;
  end process;
end test;