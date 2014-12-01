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
--  ENTITY				: 	DEMUX_40_TO_120BITS.VHD		
--  VERSION				:	0.2						
--  VENDOR SPECIFIC?	:	YES (Altera)
--  FPGA SPECIFIC? 		:   NO
--  SOFTWARE RELEASE	:	QII 9.0 SP2
--  CREATION DATE		:	10/05/2009
--  LAST UPDATE     	:   08/07/2009  
--  AUTHORs				:	Frederic MARIN (CPPM), Sophie BARON (CERN)
--  LANGAGE 			:	VHDL'93
---------------------------------------------------------------------------------------------------------------------------------
--	DESCRIPTION			:	converts input: 3 successive words of 40bits@120MHz
--							into output: 120bits@40MHz. Inverts the bits order to match the encoder.
--					
---------------------------------------------------------------------------------------------------------------------------------
--	VERSIONS HISTORY	:
--                      DATE            	VERSION           	AUTHOR		DESCRIPTION
--                      10/05/2009   		0.1                	MARIN   	first .BDF entity definition           
--						08/07/2009			0.2					BARON		conversion to vhdl
---------------------------------------------------------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

ENTITY Demux_40_to_120bits IS 
	PORT
	(
		Reset :  IN  STD_LOGIC;
		RX_Clock :  IN  STD_LOGIC;
		Clock_40MHz :  IN  STD_LOGIC;
		Locked :  IN  STD_LOGIC;
		Input :  IN  STD_LOGIC_VECTOR(39 DOWNTO 0);
		Write_Address :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		DV :  OUT  STD_LOGIC;
		Output :  OUT  STD_LOGIC_VECTOR(119 DOWNTO 0)
	);
END Demux_40_to_120bits;

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

ARCHITECTURE rtl OF Demux_40_to_120bits IS 

-- Altera specific dpram macro
--COMPONENT rx_dp_ram
--	PORT(wren : IN STD_LOGIC;
--		 wrclock : IN STD_LOGIC;
--		 rdclock : IN STD_LOGIC;
--		 data : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
--		 rdaddress : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
--		 wraddress : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
--		 q : OUT STD_LOGIC_VECTOR(159 DOWNTO 0)
--	);
--END COMPONENT;

--Xilinx specific
component rx_dp_ram
	port (
	clka: IN std_logic;
	wea: IN std_logic_VECTOR(0 downto 0);
	addra: IN std_logic_VECTOR(4 downto 0);
	dina: IN std_logic_VECTOR(39 downto 0);
	clkb: IN std_logic;
	addrb: IN std_logic_VECTOR(2 downto 0);
	doutb: OUT std_logic_VECTOR(159 downto 0));
end component;

--dpram controller
COMPONENT read_rx_dp_ram
	PORT(Reset : IN STD_LOGIC;
		 RX_Clock : IN STD_LOGIC;
		 Clock_40MHz : IN STD_LOGIC;
		 Locked_On_Header : IN STD_LOGIC;
		 Write_Address : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 DV : OUT STD_LOGIC;
		 Read_Address : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	Word :  STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL	rd_address :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	TempLocked : STD_LOGIC_VECTOR(0 downto 0);

---------------------------------------------------------------------------------------------------------------------------------

BEGIN 

TempLocked(0) <= Locked;

--ALTERA dp_ram instanciation
--b2v_inst6 : rx_dp_ram
--PORT MAP(wren => Locked,
--		 wrclock => RX_Clock,
--		 rdclock => Clock_40MHz,
--		 data => Input,
--		 rdaddress => rd_address,
--		 wraddress => Write_Address,
--		 q => Word);

--XILINX dp_ram instanciation
rx_dpram : RX_DP_RAM
		port map (
			clka 	=> RX_Clock,
			wea 	=> TempLocked,
			addra => Write_Address,
			dina 	=> Input,
			clkb 	=> Clock_40MHz,
			addrb => rd_address,
			doutb => Word);

rxdpram_ctrl : read_rx_dp_ram
PORT MAP(Reset => Reset,
		 RX_Clock => RX_Clock,
		 Clock_40MHz => Clock_40MHz,
		 Locked_On_Header => TempLocked(0),
		 Write_Address => Write_Address,
		 DV => DV,
		 Read_Address => rd_address);

invert_bits: for i in 119 downto 0 generate
	Output(i) <= Word(119-i);
end generate;	


END rtl;