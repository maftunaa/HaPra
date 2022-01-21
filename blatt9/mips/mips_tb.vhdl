library ieee;
use ieee.std_logic_1164.all;

ENTITY mips_tb IS
END mips_tb;

ARCHITECTURE behavior OF mips_tb IS


    component mips
        port(
            clk: in std_logic;
            reset: in std_logic;
            pc: buffer std_logic_vector(31 downto 0);
            instr: in std_logic_vector(31 downto 0);
            readdata: in std_logic_vector(31 downto 0);
            aluout: buffer std_logic_vector(31 downto 0);
            writedata: buffer std_logic_vector(31 downto 0);
            memwrite: out std_logic
        );
    end component;

    signal tempr_instr: std_logic_vector(31 downto 0);

begin
    behavior: mips port map(
        clk => clk,
        reset => reset,
        pc => pc,
        instr => instr,
        readdata => readdata,
        aluout => aluout,
        writedata => writedata,
        memwrite => memwrite );

    clk_process :process
    begin
        clk <= '0';
        reset <='1';
        tempr_instr <= x"00000000";
        wait for 10 ns;
        --Teilaufgabe 1
        --3 => 0011, wir setzen die 3
        clk <= '0';
        reset <= '0';
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
        readdata <= x"00000007";

        tempr_instr(16) <= '1';
        tempr_instr(17) <= '1';
        tempr_instr(18) <= '1';

        instr <= tempr_instr;

        --Teilaufgabe 2
        clk <= '0';
        reset <= '0';
        readdata <= x"00000000";
        tempr_instr(21) <= '1';
        tempr_instr(22) <= '1';
        tempr_instr(16) <= '1';
        tempr_instr(17) <= '1';
        tempr_instr(18) <= '1';
        instr <= tempr_instr;
        --das Ergebniss befindet sich in inst[15:11]
        wait;
    end process;
end behavior;