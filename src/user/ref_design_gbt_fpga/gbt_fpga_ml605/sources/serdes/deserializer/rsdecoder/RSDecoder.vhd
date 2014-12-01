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
--  ENTITY				: 	RSDECODER.VHD		
--  VERSION				:	0.2						
--  VENDOR SPECIFIC?	:	NO
--  FPGA SPECIFIC? 		:   NO
--  SOFTWARE RELEASE	:	QII 9.0 SP2
--  CREATION DATE		:	07/10/2008
--  LAST UPDATE     	:   08/07/2009  
--  AUTHORs				:	Frederic MARIN (CPPM), Sophie BARON (CERN)
--  LANGAGE 			:	VHDL'93
---------------------------------------------------------------------------------------------------------------------------------
--	DESCRIPTION			:	Manually translated from verilog Reed Solomon decoder in the GBT A. Marchioro	2006
-- 							Input: receivedcode		60 bit wide				--
-- 							Output: correctedmsg		44 bit wide				--
--					
---------------------------------------------------------------------------------------------------------------------------------
--	VERSIONS HISTORY	:
--                      DATE            	VERSION           	AUTHOR		DESCRIPTION
--                      10/05/2009   		0.1                	MARIN   	first .vhdl entity definition           
--						08/07/2009			0.2					BARON		cosmetic changes
---------------------------------------------------------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


ENTITY RSDecoder IS
	PORT(
			receivedcode	: IN	STD_LOGIC_VECTOR(59 DOWNTO 0);
			correctedmsg	: OUT	STD_LOGIC_VECTOR(43 DOWNTO 0)
		);
END RSDecoder;


ARCHITECTURE a OF RSDecoder IS

COMPONENT syndromes IS
	PORT(
		polycoeffs	: IN	STD_LOGIC_VECTOR(59 DOWNTO 0);
		s1			: OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
		s2			: OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
		s3			: OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
		s4			: OUT	STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
END COMPONENT;

COMPONENT lambdadeterminant IS
	PORT(
		s1			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		s2			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		s3			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		detiszero	: OUT 	STD_LOGIC
		);
END COMPONENT;

COMPONENT errorlocpolynomial IS
	PORT(
		s1			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		s2			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		s3			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		s4			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		detiszero	: IN	STD_LOGIC;
		L1			: OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
		L2			: OUT	STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
END COMPONENT;

COMPONENT ChienSearch IS
	PORT(
		L1			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		L2			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		detiszero	: IN	STD_LOGIC;
		xx0			: OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
		xx1			: OUT	STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
END COMPONENT;

COMPONENT RSTwoErrorsCorrect IS
	PORT(
		s1			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		s2			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		xx0			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		xx1			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		reccoeffs	: IN	STD_LOGIC_VECTOR(59 DOWNTO 0);
		detiszero	: IN	STD_LOGIC;
		corcoeffs	: OUT	STD_LOGIC_VECTOR(59 DOWNTO 0)
		);
END COMPONENT;

SIGNAL detiszero	: STD_LOGIC;
-- Syndromes
SIGNAL s1,s2,s3,s4 	: STD_LOGIC_VECTOR(3 DOWNTO 0);
-- Locations of the two errors
SIGNAL L1,L2		: STD_LOGIC_VECTOR(3 DOWNTO 0);
-- Magnitudes
SIGNAL xx0,xx1		: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL corcoeffs	: STD_LOGIC_VECTOR(59 DOWNTO 0);

	BEGIN
	
	syndromes_inst : syndromes
	PORT MAP(
			polycoeffs	=> receivedcode,
			s1			=> s1,
			s2			=> s2,
			s3			=> s3,
			s4			=> s4
			);
			
	lambdadeterminant_inst : lambdadeterminant
	PORT MAP(
			s1			=> s1,
			s2			=> s2,
			s3			=> s3,
			detiszero	=> detiszero
			);
			
	errorlocpolynomial_inst : errorlocpolynomial
	PORT MAP(
			s1			=> s1,
			s2			=> s2,
			s3			=> s3,
			s4			=> s4,
			detiszero	=> detiszero,
			L1			=> L1,
			L2			=> L2
			);
			
	ChienSearch_inst : ChienSearch
	PORT MAP(
			L1			=> L1,
			L2			=> L2,
			detiszero	=> detiszero,
			xx0			=> xx0,
			xx1			=> xx1
			);
			
	RSTwoErrorsCorrect_inst : RSTwoErrorsCorrect
	PORT MAP(
			s1			=> s1,
			s2			=> s2,
			xx0			=> xx0,
			xx1			=> xx1,
			reccoeffs	=> receivedcode,
			detiszero	=> detiszero,
			corcoeffs	=> corcoeffs
			);
			
	correctedmsg	<=	receivedcode(59 DOWNTO 16) WHEN (s1 = X"0" AND s2 = X"0" AND s3 = X"0" and s4 = X"0") ELSE
						corcoeffs(59 DOWNTO 16);

END a;