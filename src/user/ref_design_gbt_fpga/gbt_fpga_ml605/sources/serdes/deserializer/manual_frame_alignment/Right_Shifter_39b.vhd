------------------------------------------------------
--					Right_Shifter_39b				--
-- 													--
-- Shifts data from the left to right				--
--													--
-- Author: Frédéric Marin							--
-- Date: September 25th, 2008						--
------------------------------------------------------




LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
                	                


ENTITY Right_Shifter_39b IS
	PORT(
		Reset					: IN	STD_LOGIC;
		Clock					: IN	STD_LOGIC;
		Input_Word				: IN	STD_LOGIC_VECTOR(39 DOWNTO 0);
		GX_Alignment_Done_In	: IN	STD_LOGIC;
		Shift_Cmd				: IN	STD_LOGIC_VECTOR(5 DOWNTO 0);
		
		Output_Word				: OUT	STD_LOGIC_VECTOR(39 DOWNTO 0);
		GX_Alignment_Done_Out	: OUT	STD_LOGIC
    );	

END Right_Shifter_39b;


ARCHITECTURE a OF Right_Shifter_39b IS

SIGNAL Previous_Word : STD_LOGIC_VECTOR(39 DOWNTO 0);
SIGNAL GX_Alignment_Done_temp : STD_LOGIC;

	BEGIN
	
	PROCESS (Reset, Clock)
	
		BEGIN
		
		IF 	Reset = '1' THEN
			Output_Word				<= (OTHERS => '0');
			Previous_Word			<= (OTHERS => '0');
			GX_Alignment_Done_temp	<= '0';
			GX_Alignment_Done_Out	<= '0';
		ELSIF RISING_EDGE(Clock) THEN
			Previous_Word				<= Input_Word;
			GX_Alignment_Done_temp		<= GX_Alignment_Done_In;
			GX_Alignment_Done_Out		<= GX_Alignment_Done_temp;
			CASE Shift_Cmd IS
				WHEN "000000" => -- 0
					Output_Word <= Previous_Word;
				WHEN "000001" => -- 1
					Output_Word <= Input_Word(0) & Previous_Word(39 DOWNTO 1);
				WHEN "000010" => -- 2
					Output_Word <= Input_Word(1 DOWNTO 0) & Previous_Word(39 DOWNTO 2);
				WHEN "000011" => -- 3
					Output_Word <= Input_Word(2 DOWNTO 0) & Previous_Word(39 DOWNTO 3);
				WHEN "000100" => -- 4
					Output_Word <= Input_Word(3 DOWNTO 0) & Previous_Word(39 DOWNTO 4);
				WHEN "000101" => -- 5
					Output_Word <= Input_Word(4 DOWNTO 0) & Previous_Word(39 DOWNTO 5);
				WHEN "000110" => -- 6
					Output_Word <= Input_Word(5 DOWNTO 0) & Previous_Word(39 DOWNTO 6);
				WHEN "000111" => -- 7
					Output_Word <= Input_Word(6 DOWNTO 0) & Previous_Word(39 DOWNTO 7);
				WHEN "001000" => -- 8
					Output_Word <= Input_Word(7 DOWNTO 0) & Previous_Word(39 DOWNTO 8);
				WHEN "001001" => -- 9
					Output_Word <= Input_Word(8 DOWNTO 0) & Previous_Word(39 DOWNTO 9);
				WHEN "001010" => -- 10
					Output_Word <= Input_Word(9 DOWNTO 0) & Previous_Word(39 DOWNTO 10);
				WHEN "001011" => -- 11
					Output_Word <= Input_Word(10 DOWNTO 0) & Previous_Word(39 DOWNTO 11);
				WHEN "001100" => -- 12
					Output_Word <= Input_Word(11 DOWNTO 0) & Previous_Word(39 DOWNTO 12);
				WHEN "001101" => -- 13
					Output_Word <= Input_Word(12 DOWNTO 0) & Previous_Word(39 DOWNTO 13);
				WHEN "001110" => -- 14
					Output_Word <= Input_Word(13 DOWNTO 0) & Previous_Word(39 DOWNTO 14);
				WHEN "001111" => -- 15
					Output_Word <= Input_Word(14 DOWNTO 0) & Previous_Word(39 DOWNTO 15);
				WHEN "010000" => -- 16
					Output_Word <= Input_Word(15 DOWNTO 0) & Previous_Word(39 DOWNTO 16);
				WHEN "010001" => -- 17
					Output_Word <= Input_Word(16 DOWNTO 0) & Previous_Word(39 DOWNTO 17);
				WHEN "010010" => -- 18
					Output_Word <= Input_Word(17 DOWNTO 0) & Previous_Word(39 DOWNTO 18);
				WHEN "010011" => -- 19
					Output_Word <= Input_Word(18 DOWNTO 0) & Previous_Word(39 DOWNTO 19);
				WHEN "010100" => -- 20
					Output_Word <= Input_Word(19 DOWNTO 0) & Previous_Word(39 DOWNTO 20);
				WHEN "010101" => -- 21
					Output_Word <= Input_Word(20 DOWNTO 0) & Previous_Word(39 DOWNTO 21);
				WHEN "010110" => -- 22
					Output_Word <= Input_Word(21 DOWNTO 0) & Previous_Word(39 DOWNTO 22);
				WHEN "010111" => -- 23
					Output_Word <= Input_Word(22 DOWNTO 0) & Previous_Word(39 DOWNTO 23);
				WHEN "011000" => -- 24
					Output_Word <= Input_Word(23 DOWNTO 0) & Previous_Word(39 DOWNTO 24);
				WHEN "011001" => -- 25
					Output_Word <= Input_Word(24 DOWNTO 0) & Previous_Word(39 DOWNTO 25);
				WHEN "011010" => -- 26
					Output_Word <= Input_Word(25 DOWNTO 0) & Previous_Word(39 DOWNTO 26);
				WHEN "011011" => -- 27
					Output_Word <= Input_Word(26 DOWNTO 0) & Previous_Word(39 DOWNTO 27);
				WHEN "011100" => -- 28
					Output_Word <= Input_Word(27 DOWNTO 0) & Previous_Word(39 DOWNTO 28);
				WHEN "011101" => -- 29
					Output_Word <= Input_Word(28 DOWNTO 0) & Previous_Word(39 DOWNTO 29);
				WHEN "011110" => -- 30
					Output_Word <= Input_Word(29 DOWNTO 0) & Previous_Word(39 DOWNTO 30);
				WHEN "011111" => -- 31
					Output_Word <= Input_Word(30 DOWNTO 0) & Previous_Word(39 DOWNTO 31);
				WHEN "100000" => -- 32
					Output_Word <= Input_Word(31 DOWNTO 0) & Previous_Word(39 DOWNTO 32);
				WHEN "100001" => -- 33
					Output_Word <= Input_Word(32 DOWNTO 0) & Previous_Word(39 DOWNTO 33);
				WHEN "100010" => -- 34
					Output_Word <= Input_Word(33 DOWNTO 0) & Previous_Word(39 DOWNTO 34);
				WHEN "100011" => -- 35
					Output_Word <= Input_Word(34 DOWNTO 0) & Previous_Word(39 DOWNTO 35);
				WHEN "100100" => -- 36
					Output_Word <= Input_Word(35 DOWNTO 0) & Previous_Word(39 DOWNTO 36);
				WHEN "100101" => -- 37
					Output_Word <= Input_Word(36 DOWNTO 0) & Previous_Word(39 DOWNTO 37);
				WHEN "100110" => -- 38
					Output_Word <= Input_Word(37 DOWNTO 0) & Previous_Word(39 DOWNTO 38);
				WHEN OTHERS => -- >=39
					Output_Word <= Input_Word(38 DOWNTO 0) & Previous_Word(39);
			END CASE;
		END IF;
	END PROCESS;

END a;