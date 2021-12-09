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
	signal C1: std_logic_vector(3 downto 0);
	signal S1: std_logic_vector(3 downto 0);
	signal C2: std_logic_vector(3 downto 0);
	signal S2: std_logic_vector(3 downto 0);
	signal C3: std_logic_vector(3 downto 0);
	signal S3: std_logic_vector(3 downto 0);
	
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
	row_0_0 : and2 port map (andgate_in_1 => x(0), andgate_in_2 => y(0), andgate_out => A(0));
    row_0_1 : and2 port map (andgate_in_1 => x(1), andgate_in_2 => y(0), andgate_out => A(1));
    row_0_2 : and2 port map (andgate_in_1 => x(2), andgate_in_2 => y(0), andgate_out => A(2));
    row_0_3 : and2 port map (andgate_in_1 => x(3), andgate_in_2 => y(0), andgate_out => A(3));
	
	row_1_0 : ha port map (a => A(1), b => x(0), c => y(1), cout => C1(0), sum => S1(0));
	row_1_1 : fa port map (a => A(2), b => x(1), c => y(1), cin => C1(0), cout => C1(1), sum => S1(1));
	row_1_2 : fa port map (a => A(3), b => x(2), c => y(1), cin => C1(1), cout => C1(2), sum => S1(2));
	row_1_3 : ha port map (a => C1(2), b => x(3), c => y(1), cout => C1(3), sum => S1(3));
	
-- until hier works 
	row_2_0 : ha port map (a => S1(1), b => x(0), c => y(2), cout => C2(0), sum => S2(0));
	row_2_1 : fa port map (a => S1(2), b => x(1), c => y(2), cin => C2(0), cout => C2(1), sum => S2(1));
 	row_2_2 : fa port map (a => S1(3), b => x(2), c => y(2), cin => C2(1), cout => C2(2), sum => S2(2));
	row_2_3 : fa port map (a => C1(3), b => x(3), c => y(2), cin => C2(2), cout => C2(3), sum => S2(3));
	
	row_3_0 : ha port map (a => S2(1), b => x(0), c => y(3), cout => C3(0), sum => S3(0));
	row_3_1 : fa port map (a => S2(2), b => x(1), c => y(3), cin => C3(0), cout => C3(1), sum => S3(1));
	row_3_2 : fa port map (a => S2(3), b => x(2), c => y(3), cin => C3(1), cout => C3(2), sum => S3(2));
	row_3_3 : fa port map (a => C2(3), b => x(3), c => y(3), cin => C3(2), cout => C3(3), sum => S3(3));
	
	z(0) <= A(0);
	z(1) <= S1(0);
	z(2) <= S2(0);
	z(3) <= S3(0);
	z(4) <= S3(1);
	z(5) <= S3(2);
	z(6) <= S3(3);
	z(7) <= C3(3);
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
