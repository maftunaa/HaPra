library ieee;
use ieee.std_logic_1164.all;

entity rca is
  port (
    a : in std_logic_vector(7 downto 0);
    b : in std_logic_vector(7 downto 0);
    cin:in std_logic;
	cout:out std_logic;
    sum : out std_logic_vector(7 downto 0)
  );
end rca;

architecture rtl of rca is
  component fa
    port (
      a : in std_logic;
      b : in std_logic;
      cin : in std_logic;
      cout : out std_logic;
      sum : out std_logic
    );
  end component;
  signal wire_1 : std_logic;
  signal wire_2 : std_logic;
  signal wire_3 : std_logic;
  -- more wires ?
begin
  add0 : fa port map(a => a(0), b => b(0), cin => '0', cout => wire_1, sum => sum(0));
  add1 : fa port map(a => a(1), b => b(1), cin => wire_1, cout => wire_2, sum => sum(1));
  add2 : fa port map(a => a(2), b => b(2), cin => wire_2, cout => wire_3, sum => sum(2));
  add3 : fa port map(a => a(3), b => b(3), cin => wire_3, cout => wire_1, sum => sum(3));
  add4 : fa port map(a => a(4), b => b(4), cin => wire_1, cout => wire_2, sum => sum(4));
  add5 : fa port map(a => a(5), b => b(5), cin => wire_2, cout => wire_3, sum => sum(5));
  add6 : fa port map(a => a(6), b => b(6), cin => wire_3, cout => wire_1, sum => sum(6));
  add7 : fa port map(a => a(7), b => b(7), cin => wire_1, cout => cout, sum => sum(7));
end rtl;
