library ieee;
use ieee.std_logic_1164.all;

entity multiplicand is
    port (
        reset : in std_logic ;
        A_in : in std_logic_vector (3 downto 0);
        LOAD_cmd : in std_logic ;
        RA : out std_logic_vector (3 downto 0));
end;

architecture struc of multiplicand is
component dff
    port (
        reset : in std_logic;
        clk : in std_logic;
        D : in std_logic;
        Q : out std_logic
        );
end component;

begin

DFFs: for i in 3 downto 0 generate
    DFFReg: dff port map (reset, LOAD_cmd, A_in(i), RA(i));
end generate;

end struc;