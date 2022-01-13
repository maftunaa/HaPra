library ieee;
use ieee.std_logic_1164.all;

entity test is
    port(
        A_Port, B_Port: in bit_vector(3 downto 0);
        M_Out: out bit_vector(7 downto 0);
        CLK: in std_logic ;;
        START: in BIT;
        DONE: out BIT
    );
end test;
architecture Shift_Mult of test is

begin

process
    variable A, B, M: BIT_VECTOR;
    variable COUNT: INTEGER;
    begin
    wait until (START = 1);
    A := A_Port; COUNT := 0;
    B := B_Port; DONE <='0';
    M := B"0000";
    while (COUNT < 4) loop
    if (A(0) = '1'= then
    M := m + B;
    end if;
    A := SHR(A, M(0));
    B := SHR(M, '0');
    COUNT := COUNT + 1;
    end loop;
    M_Out <= M & A;
    DONE <= '1';
    end process;
end Shift_Mult;