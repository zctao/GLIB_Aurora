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
--  ENTITY				: 	MUX_120_TO_40BITS.VHD		
--  VERSION				:	0.2						
--  VENDOR SPECIFIC?	:	YES (Xilinx) because of the TX_DP_RAM instanciation
--  FPGA SPECIFIC? 		:   VIRTEX5
--  SOFTWARE RELEASE	:	QII 9.0 SP2
--  CREATION DATE		:	10/05/2009
--  LAST UPDATE     	:   08/07/2009  
--  AUTHORs				:	Frederic MARIN (CPPM), Sophie BARON (CERN)
--  LANGAGE 			:	VHDL'93
---------------------------------------------------------------------------------------------------------------------------------
--	DESCRIPTION		:	ensures the conversion of one encoded word +header (=120 bits@40MHz) 
--					into 3 words of 40 bits@120MHz. The first word being transmitted has to be the 40MSB of 
--					the 120bits (containing header)
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

ENTITY Mux_120_to_40bits IS 
	PORT
	(
		Reset :  IN  STD_LOGIC;
		Clock_120MHz :  IN  STD_LOGIC;
		Clock_40MHz :  IN  STD_LOGIC;
		Input :  IN  STD_LOGIC_VECTOR(119 DOWNTO 0);
		Output :  OUT  STD_LOGIC_VECTOR(39 DOWNTO 0)
	);
END Mux_120_to_40bits;

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

ARCHITECTURE rtl OF Mux_120_to_40bits IS 

COMPONENT rw_tx_dp_ram
	PORT(Reset : IN STD_LOGIC;
		 Clock_120MHz : IN STD_LOGIC;
		 Clock_40MHz : IN STD_LOGIC;
		 Read_Address : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 Write_Address : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

--ALTERA specific
--COMPONENT tx_dp_ram
--	PORT(wren : IN STD_LOGIC;
--		 wrclock : IN STD_LOGIC;
--		 rdclock : IN STD_LOGIC;
--		 data : IN STD_LOGIC_VECTOR(159 DOWNTO 0);
--		 rdaddress : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
--		 wraddress : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
--		 q : OUT STD_LOGIC_VECTOR(39 DOWNTO 0)
--	);
--END COMPONENT;

--Xilinx specific
component tx_dp_ram
	port (
	clka: IN std_logic;
	wea: IN std_logic_VECTOR(0 downto 0);
	addra: IN std_logic_VECTOR(2 downto 0);
	dina: IN std_logic_VECTOR(159 downto 0);
	clkb: IN std_logic;
	addrb: IN std_logic_VECTOR(4 downto 0);
	doutb: OUT std_logic_VECTOR(39 downto 0));
end component;

SIGNAL	Zeros :  STD_LOGIC_VECTOR(159 DOWNTO 120);
SIGNAL	rd_address :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	wr_address :  STD_LOGIC_VECTOR(2 DOWNTO 0);

SIGNAL	data :  STD_LOGIC_VECTOR(159 DOWNTO 0);

---------------------------------------------------------------------------------------------------------------------------------

BEGIN 

Zeros <= (others => '0');
data(159 downto 120) <= Zeros(159 DOWNTO 120);

data_generation: for i in 119 downto 0 generate
	data(i) <= Input(119-i);		--the bits are inverted to transmit the MSB first on the GX
end generate data_generation;

--dual port ram control 
dpram_ctrl : rw_tx_dp_ram
PORT MAP(Reset => Reset,
		 Clock_120MHz => Clock_120MHz,
		 Clock_40MHz => Clock_40MHz,
		 Read_Address => rd_address,
		 Write_Address => wr_address);

--ALTERA specific
--dual port ram
--dpram : tx_dp_ram
--PORT MAP(wren => '1',
--		 wrclock => Clock_40MHz,
--		 rdclock => Clock_120MHz,
--		 data => data,
--		 rdaddress => rd_address,
--		 wraddress => wr_address,
--		 q => Output);

--XILINX specific
tx_dpram  : tx_dp_ram
		port map (
			clka => Clock_40MHz,--a port is the write side
			wea => "1",
			addra => wr_address,
			dina => data,
			clkb => Clock_120MHz,--b port is the read side
			addrb => rd_address,
			doutb => Output);

END rtl;