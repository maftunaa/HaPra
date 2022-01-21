library ieee;
use ieee.std_logic_1164.all;

ENTITY maindecoder_tb IS
END maindecoder_tb;

ARCHITECTURE behavior OF maindecoder_tb IS


    component maindecoder
        port(
            op: in std_logic_vector(5 downto 0);
            memtoreg: out std_logic;
            memwrite: out std_logic;
            branch: out std_logic;
            alusrc: out std_logic;
            regdst: out std_logic;
            regwrite: out std_logic;
            jump: out std_logic;
            aluop: out std_logic_vector(1 downto 0)
        );
    end component;

begin
    behavior: maindecoder port map(
        op => op,
        memtoreg => memtoreg,
        memwrite => memwrite,
        branch => branch, alusrc => alusrc,
        regdst => regdst, regwrite => regwrite,
        jump => jump, aluop => aluop );

end;