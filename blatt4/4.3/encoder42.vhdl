library ieee;
use ieee.std_logic_1164.all;

entity encoder42 is 
	port (
		i : in  std_logic_vector(3 downto 0);
		y : out std_logic_vector(1 downto 0)
		);
end encoder42;

architecture rtl of encoder42 is

	 --signals
    SIGNAL tempr : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL andgate: STD_LOGIC_VECTOR;
	SIGNAL notgate2: STD_LOGIC_VECTOR;
	SIGNAL notgate3: STD_LOGIC_VECTOR;
begin
	notgate3 <= not i(3);
	notgate2 <= not i(2);
	andgate <= notgate3 and i(2);
	tempr(0) <= andgate or i(3);
	andgate <= notgate3 and notgate2 and i(1);
	tempr(1) <= andgate or i(3);

	y <= tempr;
end rtl;