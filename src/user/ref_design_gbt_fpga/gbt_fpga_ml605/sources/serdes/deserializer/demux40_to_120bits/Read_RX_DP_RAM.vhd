------------------------------------------------------
--					Read_RX_DP_RAM					--
-- 													--
-- Detects the write address value where the first	--
-- valid data were written and then start to		--
-- generate read address							--
--													--
-- Author: Frédéric Marin							--
-- Date: October 1st, 2008 							--
-- Modified on April 8th, 2009						--
------------------------------------------------------




LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;	-- necessary to understand addition of std_logic_vectors to integers


ENTITY Read_RX_DP_RAM IS
	PORT(
		Reset					: IN	STD_LOGIC;
		RX_Clock				: IN	STD_LOGIC;
		Clock_40MHz				: IN	STD_LOGIC;
		Write_Address			: IN	STD_LOGIC_VECTOR(4 DOWNTO 0);
		Locked_On_Header		: IN	STD_LOGIC;
		
		Read_Address			: OUT	STD_LOGIC_VECTOR(2 DOWNTO 0);
		DV						: OUT	STD_LOGIC
    );	

END Read_RX_DP_RAM;


ARCHITECTURE a OF Read_RX_DP_RAM IS

SIGNAL Ready_For_Reading				: STD_LOGIC;
SIGNAL Counter							: INTEGER RANGE 0 TO 11;

SIGNAL Read_Address_i					: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL s_DV								: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Flag								: STD_LOGIC;
       
	BEGIN

	Read_Address <= Read_Address_i;
	-- Process catching the moment when the first valid data were written
	PROCESS(Reset, RX_Clock)
		BEGIN
		
		IF Reset = '1' THEN
			Ready_For_Reading 				<= '0';
			Counter							<= 0;
		ELSIF RISING_EDGE(RX_Clock) THEN
			IF Locked_On_Header = '1' THEN
				IF Counter <= 10 THEN
					Counter <= Counter + 1;
				ELSE
					Ready_For_Reading <= '1';
				END IF;
			ELSE
				Ready_For_Reading 	<= '0';
				Counter <= 0;
			END IF;
		END IF;
	END PROCESS;
	
	-- Process generating the read address
	PROCESS (Reset, Clock_40MHz)

		BEGIN
		
		IF Reset = '1' THEN
			Read_Address_i	<= (OTHERS => '0');
			DV				<= '0';
			s_DV			<= "000";
			Flag 			<= '0';
		ELSIF RISING_EDGE(Clock_40MHz) THEN
			-- To compensate the 2 registers of the DP RAM
			s_DV(1)	<= s_DV(0);
			s_DV(2)	<= s_DV(1);
			DV		<= s_DV(2);
			
			IF Ready_For_Reading = '0' THEN
				Flag <= '1';
			END IF;
					
			IF Ready_For_Reading = '1' AND Flag = '1' THEN
				s_DV(0)			<= '1';
				Read_Address_i	<= (OTHERS => '0');
				Flag <= '0';
			ELSIF Ready_For_Reading = '1' THEN
				s_DV(0)			<= '1';
				Read_Address_i	<= Read_Address_i +1;
			ELSE
				s_DV(0)			<= '0';
				Read_Address_i	<= Read_Address_i +1;
			END IF;
		END IF;
	END PROCESS;

END a;