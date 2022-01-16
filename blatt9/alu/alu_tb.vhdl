LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY alu_tb IS
END alu_tb;
 
ARCHITECTURE testbench OF alu_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
        port(
            a: in std_logic_vector(31 downto 0);
            b: in std_logic_vector(31 downto 0);
            alucontrol: in std_logic_vector(2 downto 0);
            result: buffer std_logic_vector(31 downto 0);
            zero: out std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ALU_Input_1 : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_Input_2 : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_Control_In : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal ALU_Zero : std_logic;
   signal ALU_Result : std_logic_vector(31 downto 0);
   
   constant clk_period : time := 10 ns;
	signal clk: std_logic;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          a => ALU_Input_1,
          b => ALU_Input_2,
          alucontrol => ALU_Control_In,
          result => ALU_Result,
          zero => ALU_Zero
        );

   -- process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;

        -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		ALU_Input_1<=X"00100001";
		ALU_Input_2<=X"00000001";
		ALU_Control_In<="000";		--test for AND
		wait for clk_period*10;
		ALU_Control_In<="001";			--test for OR	
		wait for clk_period*10;
		ALU_Control_In<="010";		--test for add
		wait for clk_period*10;
		ALU_Control_In<="110";		--test for substract
		wait for clk_period*10;
		ALU_Control_In<="111";		--test for set on less then
		wait for clk_period*10;
		ALU_Input_2<=X"00100010";  --test for set on less then (greater)
		ALU_Control_In<="111";		
		wait for clk_period*10;
        ALU_Control_In<="101";    -- test for others
        wait for clk_period*10;
		
      wait;
   end process;


END testbench;