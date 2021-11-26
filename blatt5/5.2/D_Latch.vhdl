library ieee;
use ieee.std_logic_1164.all;

entity D_Latch is
    port(
        D, clk : in std_logic;
        Q, not_Q : out std_logic
    );
end D_Latch;

architecture Behavioral of D_Latch is

    signal sq, not_sq, sen, ren : std_logic;
begin
    sen <= D nand clk;
    ren <= (not D) nand clk;
    sq <= sen nand not_sq;
    not_sq <= ren nand sq;

    Q <= sq;
    not_Q <=not_sq;

end Behavioral;