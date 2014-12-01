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
--  ENTITY				: 	MANUAL_FRAME_ALIGNMENT.VHD		
--  VERSION				:	0.2						
--  VENDOR SPECIFIC?	:	NO
--  FPGA SPECIFIC? 		:   NO
--  SOFTWARE RELEASE	:	QII 9.0 SP2
--  CREATION DATE		:	10/05/2009
--  LAST UPDATE     	:   08/07/2009  
--  AUTHORs				:	Frederic MARIN (CPPM)
--  LANGAGE 			:	VHDL'93
---------------------------------------------------------------------------------------------------------------------------------
--	DESCRIPTION			:	ensures the alignement of the 3 words of 40bits together with the pattern searcher
--						
--						
---------------------------------------------------------------------------------------------------------------------------------
--	VERSIONS HISTORY	:
--                      DATE            	VERSION           	AUTHOR		DESCRIPTION
--                      10/05/2009   		0.1                	MARIN   	first .BDF entity definition           
--						08/07/2009			0.2					BARON		conversion into vhdl
---------------------------------------------------------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

ENTITY Manual_Frame_Alignment IS 
	PORT
	(
		RX_Clock :  IN  STD_LOGIC;
		Reset :  IN  STD_LOGIC;
		GX_Alignment_Done :  IN  STD_LOGIC;
		Bit_Slip_Cmd :  IN  STD_LOGIC;
		RX_Parallel :  IN  STD_LOGIC_VECTOR(39 DOWNTO 0);
		GX_Alignment_Done_Out :  OUT  STD_LOGIC;
		Shifted_40bits_Word :  OUT  STD_LOGIC_VECTOR(39 DOWNTO 0);
		Write_Address :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END Manual_Frame_Alignment;

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

ARCHITECTURE rtl OF Manual_Frame_Alignment IS 

COMPONENT right_shifter_39b
	PORT(Reset : IN STD_LOGIC;
		 Clock : IN STD_LOGIC;
		 GX_Alignment_Done_In : IN STD_LOGIC;
		 Input_Word : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
		 Shift_Cmd : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 GX_Alignment_Done_Out : OUT STD_LOGIC;
		 Output_Word : OUT STD_LOGIC_VECTOR(39 DOWNTO 0)
	);
END COMPONENT;

COMPONENT modulo_40_counter
	PORT(Reset : IN STD_LOGIC;
		 Clock : IN STD_LOGIC;
		 Bit_Slip_Cmd : IN STD_LOGIC;
		 Shift_40b_Cmd : OUT STD_LOGIC;
		 Counter_Output : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
	);
END COMPONENT;

COMPONENT write_rx_dp_ram
	PORT(Reset : IN STD_LOGIC;
		 Clock : IN STD_LOGIC;
		 Shift_40b_Cmd : IN STD_LOGIC;
		 Write_Address : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	Shift_Cmd :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	Shift_40b_Cmd :  STD_LOGIC;

---------------------------------------------------------------------------------------------------------------------------------

BEGIN 

right_shift_inst : right_shifter_39b
PORT MAP(Reset => Reset,
		 Clock => RX_Clock,
		 GX_Alignment_Done_In => GX_Alignment_Done,
		 Input_Word => RX_Parallel,
		 Shift_Cmd => Shift_Cmd,
		 GX_Alignment_Done_Out => GX_Alignment_Done_Out,
		 Output_Word => Shifted_40bits_Word);


counter_inst : modulo_40_counter
PORT MAP(Reset => Reset,
		 Clock => RX_Clock,
		 Bit_Slip_Cmd => Bit_Slip_Cmd,
		 Shift_40b_Cmd => Shift_40b_Cmd,
		 Counter_Output => Shift_Cmd);


dpram_ctrl : write_rx_dp_ram
PORT MAP(Reset => Reset,
		 Clock => RX_Clock,
		 Shift_40b_Cmd => Shift_40b_Cmd,
		 Write_Address => Write_Address);


END rtl;