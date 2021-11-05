--CLA Logic (CLAG)
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY clag IS
  PORT (
    gin : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    pin : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    cin : IN STD_LOGIC;
    cout : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    pout : OUT STD_LOGIC;
    gout : OUT STD_LOGIC
  );
END clag;
ARCHITECTURE test OF clag IS
  SIGNAL gg_int, pg_int : STD_LOGIC;
BEGIN
cout(0) <= cin;
cout(1) <= gin(0) OR (pin(0) AND cin);
cout(2) <= gin(1) OR (pin(1) AND gin(0)) OR (pin(1) AND pin(0) AND cin);
cout(3) <= gin(2) OR (pin(2) AND gin(1)) OR (pin(2) AND pin(1) AND gin(0)) OR (pin(2) AND pin(1) AND pin(0) AND cin);
pg_int <= pin(3) and pin(2) and pin(1) and pin(0);
gg_int <= gin(3) or (pin(3) and gin(2)) or (pin(3) and pin(2) and gin(1)) or (pin(3) and pin(2) and pin(1) and gin(0));
pout <= pg_int;
gout <= gg_int;

END test;