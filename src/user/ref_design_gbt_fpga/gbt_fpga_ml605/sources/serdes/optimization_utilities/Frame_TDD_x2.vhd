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
--  ENTITY				: 	Frame_TDD_x2.VHD		
--  VERSION				:	0.1						
--  VENDOR SPECIFIC?	:	NO
--  FPGA SPECIFIC? 		:   NO
--  SOFTWARE RELEASE	:	QII 9.0 SP2
--  CREATION DATE		:	27/07/2009
--  LAST UPDATE     	:   27/07/2009
--  AUTHORs				:	Sophie BARON (CERN)
--  LANGAGE 			:	VHDL'93
---------------------------------------------------------------------------------------------------------------------------------
--	DESCRIPTION			:	Time Division DEMultiplexing of the 120-bits frame once it has been decoded @80MHz, to deliver 2 120-bits frames @40MHz.
--							This allows to run the decoding scheme (DEINT-RSDEC-DESCR) at either 80MHz in case of 2 channels multiplexing,
--							or 160MHz in the case of 4-channels multiplexing. Therefore, the ressources used for the decoding scheme can be 
-- 							divided by a factor 2 or 4.  
--							moreover, the mux_ctrl bits are received by the entity with an adjustable delay (from 1 to 4 clock cycles) to reach the 
--							Time Domain DEmultiplexer concurrently to its corresponding decoded frame.
---------------------------------------------------------------------------------------------------------------------------------
--	VERSIONS HISTORY	:
--                      DATE            	VERSION           	AUTHOR		DESCRIPTION
--                      27/07/2009   		0.1                	BARON   	first .vhd entity definition           
--------------------------------------------------------------------------------------------------------------------------------- 

-- PROGRAM		"Quartus II"
-- VERSION		"Version 9.0 Build 235 06/17/2009 Service Pack 2 SJ Full Version"
-- CREATED ON		"Tue Jul 07 12:28:11 2009"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all; -- to use to_integer function

LIBRARY work;
USE work.Constant_Declaration.all;

ENTITY Frame_TDD_x2 IS 
	PORT
	(
		Reset 		:  IN  STD_LOGIC;
		Clock_80MHz 	:  IN  STD_LOGIC; --80MHz or 160MHz depending on the optimization factor
		Clock_40MHz 	:  IN  STD_LOGIC;
		Input_Frame		:  IN  std_logic_vector(83 downto 0);
		Input_DV		:  IN  std_logic;
		Mux_ctrl 		:  in std_logic;
		Output_Frame	:  OUT Frame84_TDDx2;--a pair of 84-bits frames is delivered every 25ns
		Output_DV		:  out std_logic_vector(1 downto 0)
	);
END Frame_TDD_x2;

ARCHITECTURE rtl OF Frame_TDD_x2 IS 

SIGNAL Temp_Mux_ctrl 		: unsigned(0 downto 0);
SIGNAL Temp_Output_Frame	: Frame84_TDDx2;
SIGNAL Temp_Output_DV		: std_logic_vector(1 downto 0);
SIGNAL mux_ctrl_int			: INTEGER2BITS;


begin
	
-------------------------------------------------------------------------------------------------------------------
--Output_frame is alternatively loaded with Input_frame(0) and (1). 
-------------------------------------------------------------------------------------------------------------------	
process (Clock_80MHz, Clock_40MHz, reset)
begin
	Temp_Mux_ctrl(0) <= Mux_ctrl;
	mux_ctrl_int <= to_integer(Temp_Mux_ctrl); --mux_ctrl_int is the integer value of either 0/1 in the case of a 2-links optimization, or 0/1/2/3 in the case of a 4-links optimization
	
	if (reset = '1') then
		Temp_Output_Frame(0) <= (others => '0');
		Temp_Output_Frame(1) <= (others => '0');
		Temp_Output_DV <= (others => '0');
	elsif rising_edge(Clock_80MHz) then
		Temp_Output_Frame(mux_ctrl_int) <= Input_Frame;
		Temp_Output_DV(mux_ctrl_int) <= Input_DV;
	end if;
end process;

Output_Frame <= Temp_Output_Frame when rising_edge(clock_40MHz); --latches the 2 words to have them synchronized to the 40MHz
Output_DV 	<= Temp_Output_DV when rising_edge(clock_40MHz);	
end;
