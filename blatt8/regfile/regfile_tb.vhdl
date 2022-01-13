library ieee; 
use ieee.std_logic_1164.all; 

entity regfile_tb is    
end entity; 

architecture testbench of regfile_tb is 

component regfile
    port (
        clk: in std_logic;
        we3: in std_logic;
        a1: in std_logic_vector(4 downto 0);
        a2: in std_logic_vector(4 downto 0);
        a3: in std_logic_vector(4 downto 0);
        wd3: in std_logic_vector(31 downto 0);
        rd1: buffer std_logic_vector(31 downto 0);
        rd2: buffer std_logic_vector(31 downto 0)
    );
    end component;
end;



begin 

