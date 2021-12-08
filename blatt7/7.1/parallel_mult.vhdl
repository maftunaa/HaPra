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
	signal P1: std_logic_vector(3 downto 0);
	signal P2: std_logic_vector(3 downto 0);
	signal P3: std_logic_vector(3 downto 0);
	signal P4: std_logic_vector(3 downto 0);
	
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
	row_0_0 : and2 port map (x(0), y(0), P1(0));
    row_0_1 : and2 port map (x(1), y(0), P1(1));
    row_0_2 : and2 port map (x(2), y(0), P1(2));
    row_0_3 : and2 port map (x(3), y(0), P1(3));
	
	row_1_0 : ha port map --missing;
	row_1_1 : fa port map --missing;
	row_1_2 : fa port map --missing;
	row_1_3 : ha port map --missing;
	
	row_2_0 : ha port map --missing;
	row_2_1 : fa port map --missing;
	row_2_2 : block_? port map --missing;
	row_2_3 : block_? port map --missing;
	
	row_3_0 : block_? port map --missing; 
	row_3_1 : block_? port map --missing;
	row_3_2 : block_? port map --missing;
	row_3_3 : block_? port map --missing;
	
	z(0) <= --missing;
	z(1) <= --missing;
	z(2) <= --missing;
	z(3) <= --missing;
	z(4) <= --missing;
	z(5) <= --missing;
	z(6) <= --missing;
	z(7) <= --missing;
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
