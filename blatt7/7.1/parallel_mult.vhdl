library ieee;
use ieee.std_logic_1164.all;

--Three blocks are provided in this template(block_1, block_2 and block_3), 
--you can complete the design of this multiplier by connecting these blocks,
--or you can also design your own block based on your implementation.

entity parallel_mult is
  port (
    x,y : in std_logic_vector(3 downto 0);
	z : out std_logic_vector(7 downto 0)
  );
end parallel_mult;

architecture rtl of parallel_mult is
	signal A: std_logic_vector(3 downto 0);
	signal C: std_logic_vector(7 downto 0);
	signal S: std_logic_vector(7 downto 0);
	signal U: std_logic_vector(3 downto 0);
	
	component and2
	port (
    andgate_in_1: in std_logic;
    andgate_in_2: in std_logic;
    andgate_out: out std_logic
	);
	end component;
	
    component fa
	port (
    a,b,c,cin : in std_logic;
    cout,sum : out std_logic
	);
	end component;
    
	component ha
	port (
    a,b,c: in std_logic;
    cout,sum: out std_logic
	);
	end component;
	 
begin
	row_0_0 : and2 port map (andgate_in_1 => x(0), andgate_in_2 => y(0), andgate_out => S(0));
    row_0_1 : and2 port map (andgate_in_1 => x(1), andgate_in_2 => y(0), andgate_out => A(1));
    row_0_2 : and2 port map (andgate_in_1 => x(2), andgate_in_2 => y(0), andgate_out => A(2));
    row_0_3 : and2 port map (andgate_in_1 => x(3), andgate_in_2 => y(0), andgate_out => A(3));
	
	row_1_0 : ha port map (a => x(0), b => A(1), c => y(1), cout => C(1), sum => S(1));
	row_1_1 : fa port map (a => x(1), b => A(2), c => y(1), cin => C(1), cout => C(2), sum => S(2));
	row_1_2 : fa port map (a => x(2), b => A(3), c => y(1), cin => C(2), cout => C(3), sum => S(3));
	row_1_3 : ha port map (a => x(3), b => C(3), c => y(1), cout => C(4), sum => S(4));
	
	row_2_0 : ha port map (a => x(0), b => S(2), c => y(2), cout => C(2), sum => S(2));
	row_2_1 : fa port map (a => x(1), b => S(3), c => y(2), cin => C(2), cout => C(3), sum => S(3));
	row_2_2 : fa port map (a => x(2), b => S(4), c => y(2), cin => C(3), cout => U(0), sum => S(4));
	row_2_3 : fa port map (a => x(3), b => C(4), c => y(2), cin => U(0), cout => C(5), sum => S(5));
	
	row_3_0 : ha port map (a => x(0), b => S(3), c => y(3), cout => C(3), sum => S(3));
	row_3_1 : fa port map (a => x(1), b => S(4), c => y(3), cin => C(3), cout => C(4), sum => S(4));
	row_3_2 : fa port map (a => x(2), b => S(5), c => y(3), cin => C(4), cout => U(1), sum => S(5));
	row_3_3 : fa port map (a => x(3), b => C(5), c => y(3), cin => U(1), cout => C(6), sum => S(6));
	
	z(0) <= S(0);
	z(1) <= S(1);
	z(2) <= S(2);
	z(3) <= S(3);
	z(4) <= S(4);
	z(5) <= S(5);
	z(6) <= S(6);
	z(7) <= C(6);
end rtl;

--first block
library ieee;
use ieee.std_logic_1164.all;

entity and2 is
  port (
    andgate_in_1: in std_logic;
    andgate_in_2: in std_logic;
    andgate_out: out std_logic
  );
end and2;

architecture rtl of and2 is
begin
	andgate_out <= andgate_in_1 and andgate_in_2;
end rtl;

--second block.
library ieee;
use ieee.std_logic_1164.all;

entity fa is
  port (
    a,b,c,cin : in std_logic;
    cout,sum : out std_logic
  );
end fa;

architecture rtl of fa is
  signal d : std_logic;
begin
	d <= b and c;
	cout <= (a and d) or (a and cin) or (d and cin);
	sum <= a xor d xor cin;
end rtl;

--third block.
library ieee;
use ieee.std_logic_1164.all;

entity ha is
  port (
    a,b,c: in std_logic;
    cout,sum: out std_logic
  );
end ha;

architecture rtl of ha is
	signal d : std_logic;
begin
	d <= b and c;
	sum <= a xor d;
	cout <= a and d;
end rtl;
