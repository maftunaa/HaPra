library ieee;
use ieee.std_logic_1164.all;

ENTITY maindecoder_tb IS
END maindecoder_tb;

ARCHITECTURE testbench OF maindecoder_tb IS


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

    signal op : std_logic_vector(5 downto 0);
    signal memtoreg, memwrite, branch ,alusrc, regdst, regwrite, jump : std_logic;
    signal aluop: std_logic_vector(1 downto 0);

begin
    uut: maindecoder port map(
        op => op,
        memtoreg => memtoreg,
        memwrite => memwrite,
        branch => branch, alusrc => alusrc,
        regdst => regdst, regwrite => regwrite,
        jump => jump, aluop => aluop );

    process begin
        op <= "000000";
        wait for 10 ns;
        op <= "100011";
        wait for 10 ns;
        op <= "101011";
        wait for 10 ns;
        op <= "000100";
        wait for 10 ns;
        op <= "001000";
        wait for 10 ns;
        op <= "000010";
        wait for 10 ns;
        op <= "111111";
        wait for 10 ns;
        wait;
        end process;
end testbench;