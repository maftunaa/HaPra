library ieee;
use ieee.std_logic_1164.all;

ENTITY datapath_tb IS
END datapath_tb;

ARCHITECTURE behavior OF datapath_tb IS


component datapath
    port(
        clk: in std_logic;
        reset: in std_logic;
        memtoreg: std_logic;
        pcsrc: std_logic;
        alusrc: in std_logic;
        regdst: in std_logic;
        regwrite: in std_logic;
        jump: in std_logic;
        alucontrol: in std_logic_vector(2 downto 0);
        readdata: in std_logic_vector(31 downto 0);
        instr: in std_logic_vector(31 downto 0);
        zero: out std_logic;
        pc: buffer std_logic_vector(31 downto 0);
        aluout: buffer std_logic_vector(31 downto 0);
        writedata: buffer std_logic_vector(31 downto 0)
    );
end component;
    --3 => 0011
    --7 => 0111
begin
        behavior: datapath port map(
                clk => clk, reset => reset,
                memtoreg => memtoreg, pcsrc => pcsrc,
                alusrc => alusrc, regdst => regdst,
                regwrite => regwrite, jump => jump,
                alucontrol => alucontrol, readdata => readdata,
                instr => instr, zero => zero, pc => pc,
                aluout => aluout, writedata => writedata);

        clk_process :process
        begin

                wait for 100 ns;

                clk <= '0';
                reset <= '1';
                memtoreg <= '0';
                alusrc <= '1';
                jump <= '0';
                pcsrc <= '1';
                regdst <= '0';
                regwrite <= '1';
                alucontrol <= x"00000001";
                readdata <= x"00000003";
                instr <= x"00000000";

                wait for 100 ns;

                clk <= '0';
                reset <= '0';
                memtoreg <= '0';
                alusrc <= '1';
                jump <= '0';
                pcsrc <= '1';
                regdst <= '0';
                alucontrol <= x"00000001";
                readdata <= x"00000007";
                instr <= x"00000000";
                wait;
        end process;
end behavior;