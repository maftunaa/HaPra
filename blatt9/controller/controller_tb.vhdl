library ieee;
use ieee.std_logic_1164.all;

ENTITY controller_tb IS
END controller_tb;

ARCHITECTURE testbench OF controller_tb IS

component controller
    port(
        op: in std_logic_vector(5 downto 0);
        funct: in std_logic_vector(5 downto 0);
        zero: in std_logic;
        memtoreg: out std_logic;
        memwrite: out std_logic;
        pcsrc: out std_logic;
        alusrc: out std_logic;
        regdst: out std_logic;
        regwrite: out std_logic;
        jump: out std_logic;
        alucontrol: out std_logic_vector(2 downto 0)
    );
end component;

signal op, funct : std_logic_vector(5 downto 0);
signal zero, memtoreg, memwrite, pcsrc, alusrc, regdst, regwrite, jump : std_logic;
signal alucontrol: std_logic_vector(2 downto 0);

begin
    uut: controller port map(
        op => op,
        funct => funct,
        zero => zero,
        memtoreg => memtoreg,
        memwrite => memwrite,
        pcsrc => pcsrc,
        alusrc => alusrc,
        regdst => regdst,
        regwrite => regwrite,
        jump => jump,
        alucontrol => alucontrol );
    
    process begin
        op <= "000000";
        funct  <= "100000";
        zero <= '0';
        wait for 10 ns;
        op <= "000000";
        funct  <= "100000";
        zero <= '1';
        wait for 10 ns;
        op <= "100011";
        funct  <= "100000";
        zero <= '0';
        wait for 10 ns;
        op <= "100011";
        funct  <= "100000";
        zero <= '1';
        wait for 10 ns;
        wait for 10 ns;
        op <= "100011";
        funct  <= "100100";
        zero <= '0';
        wait for 10 ns;
        op <= "100011";
        funct  <= "100100";
        zero <= '1';
        wait for 10 ns;
        wait;
    end process;
end testbench;


