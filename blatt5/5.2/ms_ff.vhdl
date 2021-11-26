library ieee;
use ieee.std_logic_1164.all;

entity ms_ff is
    port (
      d, clk: in std_logic;
      Q, not_Q : out std_logic
    );
  end ms_ff;

architecture behavioral of ms_ff is
    COMPONENT D_Latch IS
        PORT (
            D, clk : in std_logic;
            Q, not_Q : out std_logic
        );
    END COMPONENT;

    signal sq, not_sq, not_clk : std_logic;

begin

D_Latch_slave : D_Latch port map(sq, not_clk, Q, not_Q);
D_Latch_master : D_Latch port map(D, clk, sq, not_clk);
not_clk <= not clk;

end behavioral;