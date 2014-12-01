------------------------------------------------------
--					RW_TX_DP_RAM					--
-- 													--
-- Manages the read and write counters for the dual --
-- port RAM used as multiplexor for the emssion path--
--													--
-- Author: Frédéric Marin							--
-- Date: Septembre 25th, 2008						--
------------------------------------------------------




LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


ENTITY RW_TX_DP_RAM IS
	PORT(
		Reset			: IN	STD_LOGIC;
		Clock_120MHz	: IN	STD_LOGIC;
		Clock_40MHz		: IN	STD_LOGIC;
		
		Write_Address	: OUT	STD_LOGIC_VECTOR(2 DOWNTO 0);
		Read_Address	: OUT	STD_LOGIC_VECTOR(4 DOWNTO 0)
    );	

END RW_TX_DP_RAM;


ARCHITECTURE a OF RW_TX_DP_RAM IS

SIGNAL Write_Address_i : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Read_Address_i : STD_LOGIC_VECTOR(4 DOWNTO 0);
       
	BEGIN

	Write_Address	<= Write_Address_i;
	Read_Address	<= Read_Address_i;
	
	Writing:
	PROCESS (Reset, Clock_40MHz)
	
		BEGIN
		
		IF 	Reset = '1' THEN
			Write_Address_i <= "110"; -- 6
		ELSIF RISING_EDGE(Clock_40MHz) THEN
			Write_Address_i <= Write_Address_i + 1;
		END IF;
	END PROCESS;
	
	
	Reading:
	PROCESS (Reset, Clock_120MHz)

		BEGIN
		
		IF Reset = '1' THEN
			Read_Address_i <= (OTHERS => '0');
		ELSIF RISING_EDGE(Clock_120MHz) THEN
			IF (CONV_INTEGER(Read_Address_i + 2)) REM 4 = 0 THEN	-- The RAM is 160-bits wide but we only use 120-bits
				Read_Address_i <= Read_Address_i + 2;				-- So the last read address, corresponding the 40 MSB
			ELSE													-- 159 downto 120, is not read.
				Read_Address_i <= Read_Address_i + 1;
			END IF;
		END IF;
	END PROCESS;

END a;