library ieee;
use ieee.std_logic_1164.all;

--Three blocks are provided in this template(block_1, block_2 and block_3),
--you can complete the design of this multiplier by connecting these blocks,
--or you can also design your own block based on your implementation.

entity add_shift is
  port (
    x,y : in std_logic_vector(3 downto 0);
	z : out std_logic_vector(7 downto 0)
  );
end add_shift;

architecture rtl of add_shift is
	signal M: std_logic_vector(3 downto 0);
    signal A: std_logic_vector(3 downto 0);
	signal temp: std_logic_vector(3 downto 0);
    signal Q: std_logic_vector(3 downto 0);
    signal CNT: std_logic_vector(3 downto 0);

	component adder
	port (
		x: in std_logic(3 downto 0);
		y: in std_logic(3 downto 0);
		sum: out std_logic(3 downto 0)
	);
	end component;

begin
	process(T)
		begin
 FOR i IN 0 TO 3 loop
		A(i) <= '0';
		M(i) <= x(i);
		Q(i) <= y(i);
	END loop;
end process;

	process(T)
		begin
FOR i IN 0 TO 3 loop
	if(y(i) = '0') then
		A <= std_logic_vector(('0' & UNSIGNED(A)) + UNSIGNED(M));
	end if;
	--shiebregister A rechts
	--shiebregister Q links
	END loop;
end process;

	z(0) <= A(0);
	z(1) <= A(1);
	z(2) <= A(2);
	z(3) <= A(3);
	z(4) <= Q(0);
	z(5) <= Q(1);
	z(6) <= Q(2);
	z(7) <= Q(3);
end rtl;

--first block
library ieee;
use ieee.std_logic_1164.all;

entity adder is
  port (
    x: in std_logic(3 downto 0);
    y: in std_logic(3 downto 0);
    sum: out std_logic(7 downto 0)
  );
end adder;

architecture rtl of block_1 is
begin
	sum <= std_logic_vector(('0' & UNSIGNED(x)) + UNSIGNED(y));
end rtl;
