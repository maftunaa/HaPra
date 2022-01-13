library ieee;
use ieee.std_logic_1164.all;

entity dff is
    port (reset : in std_logic ;
        clk : in std_logic ;
        D : in std_logic ;
        Q : out std_logic);
end;

architecture behav of dff is
begin
 process (clk, reset)
    begin
        if reset='0' then
            Q <= '0'; -- clear register
        elsif (clk'event and clk='1') then
            Q <= D; -- load register
        end if;
    end process;
end behav;