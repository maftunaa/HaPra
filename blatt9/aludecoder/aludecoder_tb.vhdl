library ieee;
use ieee.std_logic_1164.all;

ENTITY aludecoder_tb IS
END aludecoder_tb;

ARCHITECTURE testbench OF aludecoder_tb IS


component aludecoder
port(
    funct: in std_logic_vector(5 downto 0);
    aluop: in std_logic_vector(1 downto 0);
    alucontrol: out std_logic_vector(2 downto 0)
    );
end component;

signal funct: std_logic_vector(5 downto 0);
signal aluop:  std_logic_vector(1 downto 0);
signal alucontrol:  std_logic_vector(2 downto 0);

begin
    uut: aludecoder port map(
        funct => funct,
        aluop => aluop,
        alucontrol => alucontrol);

    process begin
        funct  <= "100000";
        aluop <= "00";
        wait for 10 ns;
        assert alucontrol = "010" report "error";
        funct  <= "100000";
        aluop <= "01";
        wait for 10 ns;
        assert alucontrol = "110" report "error";
        funct  <= "100000";
        aluop <= "11";
        wait for 10 ns;
        assert alucontrol = "010" report "error";
        funct  <= "100010";
        aluop <= "11";
        wait for 10 ns;
        assert alucontrol = "110" report "error";
        funct  <= "100100";
        aluop <= "11";
        wait for 10 ns;
        assert alucontrol = "000" report "error";
        funct  <= "100101";
        aluop <= "11";
        wait for 10 ns;
        assert alucontrol = "001" report "error";
        funct  <= "101010";
        aluop <= "11";
        wait for 10 ns;
        assert alucontrol = "111" report "error";
        funct  <= "111111";
        aluop <= "11";
        wait for 10 ns;
        assert alucontrol = "---" report "error";
        wait;
    end process;
end testbench;