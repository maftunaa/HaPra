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

        signal tempr_instr: std_logic_vector(31 downto 0);

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
                clk <= '0';
                reset <='1';
                tempr_instr <= x"00000000";
                wait for 10 ns;
                --Aufgabe a
                --3 => 0011, wir setzen die 3
                clk <= '0';
                reset <= '0';
                memtoreg <= '0';
                alusrc <= '1';
                jump <= '0';
                pcsrc <= '1';
                regdst <= '0';
                regwrite <= '1';
                alucontrol <= x"00000001";
                readdata <= x"00000003";
                tempr_instr(21) <= '1';
                tempr_instr(22) <= '1';

                instr <= tempr_instr;

                wait for 10 ns;
                clk <='1';
                tempr_instr <= x"00000000";

                wait for 10 ns;

                --7 => 0111, wir setzen die 7
                clk <= '0';
                reset <= '0';
                memtoreg <= '0';
                alusrc <= '1';
                jump <= '0';
                pcsrc <= '1';
                regdst <= '0';
                regwrite <= '1';
                alucontrol <= x"00000001";
                readdata <= x"00000007";

                tempr_instr(16) <= '1';
                tempr_instr(17) <= '1';
                tempr_instr(18) <= '1';

                instr <= tempr_instr;

                wait for 10 ns;
                clk <='1';
                tempr_instr <= x"00000000";

                --Aufgabe b
                wait for 10 ns;
                clk <= '0';
                reset <= '0';
                memtoreg <= '0';
                jump <= '0';
                pcsrc <= '1';
                alusrc <= '0';
                regdst <= '1';
                regwrite <= '1';

                alucontrol <= x"00000000";
                readdata <= x"00000000";
                --erste Zah ist 2
                tempr_instr(22) <= '1';
                --die zweite ist 4
                tempr_instr(18) <= '1';
                instr <= tempr_instr;
                --das Ergebniss befindet sich an instr[11:15], soll [00110] sein
                wait for 10 ns;
                clk <='1';
                tempr_instr <= x"00000000";

                --Aufgabe с
                wait for 10 ns;
                clk <= '0';
                reset <= '0';
                memtoreg <= '0';
                jump <= '0';
                pcsrc <= '1';
                alusrc <= '0';
                regdst <= '1';
                regwrite <= '1';
                alucontrol <= x"00000010";
                readdata <= x"00000000";
                --erste Zah ist 4
                tempr_instr(8) <= '1';
                --die zweite ist 2
                tempr_instr(14) <= '1';
                instr <= tempr_instr;
                --das Ergebniss befindet sich an instr[6:10], soll [00110] sein
                wait;
        end process;
end behavior;