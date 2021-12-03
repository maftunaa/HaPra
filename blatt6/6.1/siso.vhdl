LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY siso IS
    PORT (
        Din, clk, reset : IN STD_LOGIC;
        Q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END siso;
ARCHITECTURE Structural OF siso IS
    COMPONENT dff IS
        PORT (
            clk, reset, D : IN STD_LOGIC;
            Q : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL Q_temp : STD_LOGIC_VECTOR(7 DOWNTO 1);
BEGIN
    DFF7 : dff PORT MAP(clk, reset, Din, Q_temp(7));
    DFF6 : dff PORT MAP(clk, reset, Q_temp(7), Q_temp(6));
    DFF5 : dff PORT MAP(clk, reset, Q_temp(6), Q_temp(5));
    DFF4 : dff PORT MAP(clk, reset, Q_temp(5), Q_temp(4));
    DFF3 : dff PORT MAP(clk, reset, Q_temp(4), Q_temp(3));
    DFF2 : dff PORT MAP(clk, reset, Q_temp(3), Q_temp(2));
    DFF1 : dff PORT MAP(clk, reset, Q_temp(2), Q_temp(1));
    DFF0 : dff PORT MAP(clk, reset, Q_temp(1), Q(0));
    Q(7 downto 1)<= Q_temp;
END Structural;