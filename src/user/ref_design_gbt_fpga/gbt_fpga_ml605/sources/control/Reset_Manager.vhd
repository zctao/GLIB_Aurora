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
--  ENTITY				: 	RESET_MANAGER.VHD		
--  VERSION				:	0.2						
--  VENDOR SPECIFIC?	:	NO
--  FPGA SPECIFIC? 		:   NO
--  SOFTWARE RELEASE	:	QII 9.0 SP2
--  CREATION DATE		:	24/09/2008
--  LAST UPDATE     	:   08/07/2009  
--  AUTHORs				:	Frederic MARIN (CPPM)
--  LANGAGE 			:	VHDL'93
---------------------------------------------------------------------------------------------------------------------------------
--	DESCRIPTION		:	Manages a correct sequence for the reset signals at the power-up and when the reset button is pressed
--					
--					
---------------------------------------------------------------------------------------------------------------------------------
--	VERSIONS HISTORY	:
--                      DATE            	VERSION           	AUTHOR		DESCRIPTION
--                      24/09/2008   		0.1                	MARIN   	first .vhd entity definition           
--						08/07/2009			0.2					BARON		cosmetic changes
---------------------------------------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

ENTITY Reset_Manager IS
	PORT(
			Reset_Button_N	: IN	STD_LOGIC;
			Clock_40MHz		: IN	STD_LOGIC;
			
			TX_Digital_Reset: OUT	STD_LOGIC;
			RX_Analog_Reset	: OUT	STD_LOGIC;
			RX_Digital_Reset: OUT	STD_LOGIC
		);
END Reset_Manager;

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

ARCHITECTURE a OF Reset_Manager IS

CONSTANT Reset_Time : INTEGER := 10000000;--10;
SIGNAL Counter		: INTEGER RANGE 0 TO 3*Reset_Time;
---------------------------------------------------------------------------------------------------------------------------------

	BEGIN
		
	PROCESS(Clock_40MHz, Reset_Button_N)
		BEGIN
		
		IF Reset_Button_N = '0' THEN
			TX_Digital_Reset	<= '1';
			RX_Analog_Reset		<= '1';
			RX_Digital_Reset	<= '1';
			Counter				<= 0;
		ELSIF RISING_EDGE(Clock_40MHz) THEN
			IF Counter < Reset_Time THEN
				Counter	<= Counter + 1;
				TX_Digital_Reset	<= '1';
				RX_Analog_Reset		<= '1';
				RX_Digital_Reset	<= '1';
			ELSIF Counter < 2*Reset_Time THEN
				Counter	<= Counter + 1;
				TX_Digital_Reset	<= '0';
				RX_Analog_Reset		<= '1';
				RX_Digital_Reset	<= '1';
			ELSIF Counter < 3*Reset_Time THEN
				Counter	<= Counter + 1;
				TX_Digital_Reset	<= '0';
				RX_Analog_Reset		<= '0';
				RX_Digital_Reset	<= '1';
			ELSE
				TX_Digital_Reset	<= '0';
				RX_Analog_Reset		<= '0';
				RX_Digital_Reset	<= '0';
			END IF;
		END IF;
	END PROCESS;
END a;
			