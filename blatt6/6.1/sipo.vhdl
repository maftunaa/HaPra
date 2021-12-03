LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY sipo IS

    PORT (
        sin, clk , rst: IN STD_LOGIC;
        sout : OUT STD_LOGIC_VECTOR (8 DOWNTO 0));

END sipo;

ARCHITECTURE shift OF sipo IS
    -- D-FlipFlop
    COMPONENT dff IS
        PORT (
            clk, reset, D : IN STD_LOGIC;
            Q : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL Z : STD_LOGIC_VECTOR (8 DOWNTO 0);

BEGIN

    q1: dff port map(clk,rst,sin, z(0));
    q2: dff port map(clk,rst,z(0), z(1));
    q3: dff port map(clk,rst,z(1), z(2));
    q4: dff port map(clk,rst,z(2), z(3));
    q5: dff port map(clk,rst,z(3), z(4));
    q6: dff port map(clk,rst,z(4), z(5));
    q7: dff port map(clk,rst,z(5), z(6));
    q8: dff port map(clk,rst,z(6), z(7));

    sout <= Z;
END shift;