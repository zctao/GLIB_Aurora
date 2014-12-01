----------------------------------------------------------------------
----                                                              ----
---- GBT-FPGA SERDES Project                               		  ----
----                                                              ----
---- This file is part of the GBT-FPGA Project              	  ----
---- https://espace.cern.ch/GBT-Project/default.aspx              ----
---- https://svn.cern.ch/reps/gbt_fpga 							  ----
----                                                              ----
----------------------------------------------------------------------
----                                                              ----
----                                                              ----
---- This source file may be used and distributed without         ----
---- restriction provided that this copyright statement is not    ----
---- removed from the file and that any derivative work contains  ----
---- the original copyright notice and the associated disclaimer. ----
----                                                              ----
---- This source file is free software; you can redistribute it   ----
---- and/or modify it under the terms of the GNU General          ----
---- Public License as published by the Free Software Foundation; ----
---- either version 2.0 of the License, or (at your option) any   ----
---- later version.                                               ----
----                                                              ----
---- This source is distributed in the hope that it will be       ----
---- useful, but WITHOUT ANY WARRANTY; without even the implied   ----
---- warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ----
---- PURPOSE. See the GNU General Public License for more details.----
----                                                              ----
---- You should have received a copy of the GNU General           ----
---- Public License along with this source; if not, download it   ----
---- from http://www.gnu.org/licenses/gpl.txt                     ----
----                                                              ----
---------------------------------------------------------------------- 
---------------------------------------------------------------------------------------------------------------------------------
--  ENTITY				: 	PATTERN_SEARCH.VHD		
--  VERSION				:	0.2						
--  VENDOR SPECIFIC?	:	NO
--  FPGA SPECIFIC? 		:   NO
--  SOFTWARE RELEASE	:	QII 9.0 SP2
--  CREATION DATE		:	01/10/2008
--  LAST UPDATE     	:   07/04/2009  
--  AUTHORs				:	Frederic MARIN (CPPM)
--  LANGAGE 			:	VHDL'93
---------------------------------------------------------------------------------------------------------------------------------
--	DESCRIPTION		:	Searches 4-bits header pattern in the 4 LSB of a 120-bits word. The MSB of the header being the
--					bit 0 and its LSB the bit 3. The header pattern can be the idle or data header pattern.
--					If more than "Nb_Accepted_False_Header" are found in "Nb_Checked_Header" checked header, a bit slip
--					command is sent and the locked state is set low.	If more than "Desired_Consec_Correct_Headers"
--					correct consecutive headers are found, the locked state is proclaimed.
---------------------------------------------------------------------------------------------------------------------------------
--	VERSIONS HISTORY	:
--                      DATE            	VERSION           	AUTHOR		DESCRIPTION
--                      01/10/2008   		0.1                	MARIN   	first .vhd entity definition           
--						07/04/2009			0.2					MARIN		modif
---------------------------------------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;	
USE work.Constant_Declaration.all;	-- For the use of the following constants:
										-- Nb_Checked_Header
										-- Data_Header_Pattern_Reversed
										-- Idle_Header_Pattern_Reversed
										-- Nb_Accepted_False_Header
										-- Desired_Consec_Correct_Headers

---------------------------------------------------------------------- 
---------------------------------------------------------------------- 

ENTITY Pattern_Search IS
	PORT(
		Reset					: IN	STD_LOGIC;
		Clock					: IN	STD_LOGIC;
		Word_In					: IN	STD_LOGIC_VECTOR(39 DOWNTO 0);
		GX_Alignment_Status		: IN	STD_LOGIC;
		Write_Address_In		: IN	STD_LOGIC_VECTOR(4 DOWNTO 0);
		
		Bit_Slip_Cmd			: OUT	STD_LOGIC;
		Word_Out				: OUT	STD_LOGIC_VECTOR(39 DOWNTO 0);
		Write_Address_Out		: OUT	STD_LOGIC_VECTOR(4 DOWNTO 0);
		Locked					: OUT	STD_LOGIC
    );	

END Pattern_Search;

---------------------------------------------------------------------- 
---------------------------------------------------------------------- 


ARCHITECTURE a OF Pattern_Search IS
       
SIGNAL Consec_Correct_Headers			: INTEGER RANGE 0 TO Desired_Consec_Correct_Headers;
SIGNAL False_Header						: INTEGER RANGE 0 TO Nb_Accepted_False_Header+1;
SIGNAL Checked_Header					: INTEGER RANGE 0 TO Nb_Checked_Header;
SIGNAL s_Locked							: STD_LOGIC;
SIGNAL s_Write_Address					: STD_LOGIC_VECTOR(4 DOWNTO 0);

---------------------------------------------------------------------- 
       
	BEGIN

	Locked				<= s_Locked;
	Write_Address_Out	<= s_Write_Address;

	PROCESS (Reset, Clock, GX_Alignment_Status)
	
		BEGIN
		
		IF 	Reset = '1' OR GX_Alignment_Status = '0' THEN
			Bit_Slip_Cmd			<= '0';
			Consec_Correct_Headers	<= 0;
			False_Header			<= 0;
			Checked_Header			<= 0;
			s_Locked				<= '0';
			Word_Out				<= (OTHERS => '0');
			s_Write_Address			<= (OTHERS => '0');
			
		ELSIF RISING_EDGE(Clock) THEN
		
			Word_Out			<= Word_In;
			IF (CONV_INTEGER(s_Write_Address + 2)) REM 4 = 0 THEN
				s_Write_Address <= s_Write_Address + 2;
			ELSE
				s_Write_Address <= s_Write_Address + 1;
			END IF;
			
			IF Write_Address_In(1 DOWNTO 0)= "00" THEN -- Corresponds to MSB part (first word of 40bits)
													-- True every 3 clock cycles (because we don't write address 4)
													 -- done to read every 120 bits
													 -- This runs in fact @120MHz/3 = 40MHz
		
				-- Counter of false headers among a certain number of checked headers
				IF Checked_Header <= Nb_Checked_Header-1 THEN
					Checked_Header <= Checked_Header + 1;
					IF (Word_In(3 DOWNTO 0) /= Data_Header_Pattern_Reversed AND Word_In(3 DOWNTO 0) /= Idle_Header_Pattern_Reversed) THEN
						IF False_Header <= Nb_Accepted_False_Header THEN						
							False_Header <= False_Header + 1;
						END IF;
					END IF;
				ELSE
					Checked_Header	<= 0;
					False_Header	<= 0;
				END IF;
				
				-- Counters of consecutive correct headers
				IF (Word_In(3 DOWNTO 0) = Data_Header_Pattern_Reversed OR Word_In(3 DOWNTO 0) = Idle_Header_Pattern_Reversed) THEN
					IF Consec_Correct_Headers < Desired_Consec_Correct_Headers THEN
						Consec_Correct_Headers <= Consec_Correct_Headers + 1;
					ELSE
						NULL; -- Consec_Correct_Headers stays to Desired_Consec_Correct_Headers
					END IF;
				ELSE
					Consec_Correct_Headers <= 0;
				END IF;
			
				-- Out Of Lock or In Lock state decision
				IF s_Locked = '0' AND Consec_Correct_Headers = Desired_Consec_Correct_Headers THEN -- Goes from OOL to IL
					s_Locked		<= '1';
					s_Write_Address	<= (OTHERS => '0'); -- To write the first correct data @ address "00000"
														-- This assignment crushes the one done line 76
				ELSIF s_Locked = '1' AND False_Header > Nb_Accepted_False_Header THEN -- Return from IL to OOL
					s_Locked <= '0';
					-- nothing done on the write address there since the locked signal is de-asserted
				END IF;
			
			END IF;
			
			-- Sending slip cmd
			IF False_Header = Nb_Accepted_False_Header+1 THEN
				Bit_Slip_Cmd	<= '1';
				False_Header	<= 0;
				Checked_Header	<= 0;
			ELSE
				Bit_Slip_Cmd	<= '0';
			END IF;			
					
		END IF;
	END PROCESS;

END a;