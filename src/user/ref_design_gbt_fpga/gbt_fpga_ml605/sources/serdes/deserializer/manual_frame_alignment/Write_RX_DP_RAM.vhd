------------------------------------------------------
--					Write_RX_DP_RAM					--
-- 													--
-- Generates write address for the RX dual port ram --
-- It is incremented every clock cycle except when	--
-- a right shift of 40 bits is required				--
--													--
-- Author: Frédéric Marin							--
-- Date: September 25th, 2008						--
------------------------------------------------------




LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


ENTITY Write_RX_DP_RAM IS
	PORT(
		Reset					: IN	STD_LOGIC;
		Clock					: IN	STD_LOGIC;
		Shift_40b_Cmd			: IN	STD_LOGIC;
		
		Write_Address			: OUT	STD_LOGIC_VECTOR(4 DOWNTO 0)
    );	

END Write_RX_DP_RAM;


ARCHITECTURE a OF Write_RX_DP_RAM IS

SIGNAL Write_Address_i : STD_LOGIC_VECTOR(4 DOWNTO 0);
       
	BEGIN

	Write_Address <= Write_Address_i;

	PROCESS (Reset, Clock)
	
		BEGIN
		
		IF 	Reset = '1' THEN
			Write_Address_i <= (OTHERS => '0');
		ELSIF RISING_EDGE(Clock) THEN
			IF Shift_40b_Cmd = '0' THEN
				IF (CONV_INTEGER(Write_Address_i + 2)) REM 4 = 0 THEN
					Write_Address_i <= Write_Address_i + 2;
				ELSE
					Write_Address_i <= Write_Address_i + 1;
				END IF;
			ELSE -- Shift_40b_Cmd = '1'
				NULL; -- We don't increment the write address to shift right of 40b
			END IF;
		END IF;
	END PROCESS;

END a;