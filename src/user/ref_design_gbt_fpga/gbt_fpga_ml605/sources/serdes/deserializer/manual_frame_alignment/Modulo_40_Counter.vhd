------------------------------------------------------
--				Modulo_40_Counter					--
-- 													--
-- Counts modulo 40 and sends a command when counter--
-- value equal 0 modulo 40							--
-- Counting enabled through "Bit_Slip_Cmd" input.	--
--													--
-- Author: Frédéric Marin							--
-- Date: September 25th, 2008						--
------------------------------------------------------




LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


ENTITY Modulo_40_Counter IS
	PORT(
		Reset					: IN	STD_LOGIC;
		Clock					: IN	STD_LOGIC;
		Bit_Slip_Cmd			: IN	STD_LOGIC;
		
		Counter_Output			: OUT	STD_LOGIC_VECTOR(5 DOWNTO 0);
		Shift_40b_Cmd			: OUT	STD_LOGIC
    );	

END Modulo_40_Counter;


ARCHITECTURE a OF Modulo_40_Counter IS
       
SIGNAL Counter_Temp : STD_LOGIC_VECTOR(5 DOWNTO 0);
       
	BEGIN

	Counter_Output <= Counter_Temp;
	
	PROCESS (Reset, Clock)
	
		BEGIN
		
		IF 	Reset = '1' THEN
			Counter_Temp	<= (OTHERS => '0');
			Shift_40b_Cmd	<= '0';
		ELSIF RISING_EDGE(Clock) THEN
			IF Bit_Slip_Cmd = '1' THEN
				IF Counter_Temp = "100111" THEN -- 39
					Counter_Temp <= "000000";
					Shift_40b_Cmd <= '1';
				ELSE
					Counter_Temp <= Counter_Temp + 1;
					Shift_40b_Cmd <= '0';
				END IF;
			ELSE
				Shift_40b_Cmd <= '0';
			END IF;
		END IF;
	END PROCESS;

END a;