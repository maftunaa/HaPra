library ieee;
use ieee.std_logic_1164.all;

entity ms_ff_tb is
end ms_ff_tb;

architecture testbench of ms_ff_tb is
    COMPONENT ms_ff
        PORT (
            d, clk: in std_logic;
            Q, not_Q : out std_logic
        );
    END COMPONENT;

    SIGNAL clk, d, Q, not_Q  : std_logic;

BEGIN
    flop : ms_ff PORT MAP(clk, d, q, not_Q);

    PROCESS BEGIN
        clk <= '1';
        d <= '1';
        WAIT FOR 1 ns;
        clk <= '0';
        d <= '1';
        WAIT FOR 1 ns;
        clk <= '1';
        d <= '1';
        WAIT FOR 1 ns;
        clk <= '0';
        d <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        d <= '0';
        WAIT FOR 1 ns;
        clk <= '0';
        d <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        d <= '0';
        WAIT FOR 1 ns;
        clk <= '0';
        d <= '1';
        WAIT FOR 1 ns;
        clk <= '1';
        d <= '1';
        WAIT FOR 1 ns;
        clk <= '0';
        d <= '1';
        WAIT FOR 1 ns;
        clk <= '1';
        d <= '1';
        WAIT FOR 1 ns;
        clk <= '0';
        d <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        d <= '0';
        WAIT FOR 1 ns;
        clk <= '0';
        d <= '0';
        WAIT FOR 1 ns;
        WAIT;
    END PROCESS;
   
end testbench;