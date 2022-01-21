library ieee;
use ieee.std_logic_1164.all;

ENTITY aludecoder_tb IS
END aludecoder_tb;

ARCHITECTURE behavior OF aludecoder_tb IS


component aludecoder
port(
    funct: in std_logic_vector(5 downto 0);
    aluop: in std_logic_vector(1 downto 0);
    alucontrol: out std_logic_vector(2 downto 0)
    );
end component;

begin
    behavior: aludecoder port map(
        funct => funct,
        aluop => aluop,
        alucontrol => alucontrol);
end;