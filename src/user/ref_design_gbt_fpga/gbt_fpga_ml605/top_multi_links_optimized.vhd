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
--  ENTITY				: 	TOP_MULTI_LINKS_OPTIMIZED.VHD		
--  VERSION				:	0.2						
--  VENDOR SPECIFIC?	:	XILINX
--  FPGA SPECIFIC? 		:   NO
--  SOFTWARE RELEASE	:	ISE 11.3
--  CREATION DATE		:	10/05/2009
--  LAST UPDATE     	:   01/09/2009  
--  AUTHORs				:	Sophie BARON (CERN)
--  LANGAGE 			:	VHDL'93
---------------------------------------------------------------------------------------------------------------------------------
--	DESCRIPTION			:	top of a generic file in charge of the test of code and ressources optimization of the GBT decoding process
--					
--					
---------------------------------------------------------------------------------------------------------------------------------
--	VERSIONS HISTORY	:
--                      DATE            	VERSION           	AUTHOR		DESCRIPTION
--                      24/07/2009   		0.1                	BARON   	first .vhd entity definition           
--						01/09/2009			0.2					BARON		added a x3 optimisation scheme
--						04/09/2009			0.21				BARON		deinter and descrambler out of the optimization
--																			120 MHz output added on the pll (pll4)
---------------------------------------------------------------------------------------------------------------------------------
--created by sophie baron to test NUMBER_OF_LINKS links 



LIBRARY ieee;
USE ieee.std_logic_1164.all; 
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

LIBRARY work;
USE work.Constant_Declaration.all;

ENTITY TOP_MULTI_LINKS_OPTIMIZED IS 
	PORT
	(
		Reset_Button :  IN  STD_LOGIC;--is _N for Altera
		RefClk_p :  IN  STD_LOGIC;
		RefClk_n :  IN  STD_LOGIC;
		Serial_Loopback_N :  IN  STD_LOGIC;
		RX_Serial_p:  IN  STD_LOGIC_VECTOR(NUMBER_OF_LINKS-1 downto 0);--xilinx specific
		RX_Serial_n:  IN  STD_LOGIC_VECTOR(NUMBER_OF_LINKS-1 downto 0);--xilinx specific
		Reset_Continuous_Error_Detection :  IN  STD_LOGIC;--is _N for Altera
		TX_Serial_p :  OUT  STD_LOGIC_VECTOR(NUMBER_OF_LINKS-1 downto 0);--xilinx specific
		TX_Serial_n :  OUT  STD_LOGIC_VECTOR(NUMBER_OF_LINKS-1 downto 0);--xilinx specific
		SFPA_Disable :  OUT  STD_LOGIC;
		LED :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END top_multi_links_optimized;

ARCHITECTURE rtl OF top_multi_links_optimized IS 

-------------------------------------------------------------------------
--GENERATOR COMPONENT DECLARATION
-------------------------------------------------------------------------
COMPONENT word_generator
	PORT(Clock_40MHz : IN STD_LOGIC;
		 Generated_Word : OUT STD_LOGIC_VECTOR(83 DOWNTO 0)
	);
END COMPONENT;
    

-------------------------------------------------------------------------
--ENCODING COMPONENTS DECLARATION
-------------------------------------------------------------------------
COMPONENT Scrambling
	GENERIC (N: INTEGER :=0);
	PORT
	(
		Reset :  IN  STD_LOGIC;
		Clock :  IN  STD_LOGIC;
		Input :  IN  STD_LOGIC_VECTOR(83 DOWNTO 0);
		Header :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Output :  OUT  STD_LOGIC_VECTOR(83 DOWNTO 0)
	);
END COMPONENT;

COMPONENT Encoding IS 
	PORT
	(
		Header :  	IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Input :  	IN  STD_LOGIC_VECTOR(83 DOWNTO 0);
		Output :  	OUT  STD_LOGIC_VECTOR(119 DOWNTO 0)
	);
END COMPONENT;

COMPONENT Interleaving IS
	PORT(
		Input	: IN	STD_LOGIC_VECTOR(119 DOWNTO 0);
		Output	: OUT	STD_LOGIC_VECTOR(119 DOWNTO 0)
    );	
END COMPONENT;

COMPONENT Mux_120_to_40bits IS 
	PORT
	(
		Reset :  IN  STD_LOGIC;
		Clock_120MHz :  IN  STD_LOGIC;
		Clock_40MHz :  IN  STD_LOGIC;
		Input :  IN  STD_LOGIC_VECTOR(119 DOWNTO 0);
		Output :  OUT  STD_LOGIC_VECTOR(39 DOWNTO 0)
	);
END COMPONENT;

-------------------------------------------------------------------------
--TRANSCEIVER COMPONENTS DECLARATION
-------------------------------------------------------------------------
--Xilinx - Virtex 5 specific
    COMPONENT gtx_serdes
        GENERIC (
            g_SIMULATION : integer);
        PORT(
		      
            gtx_refclk_i : in  std_logic;
            gtx_reset_i  : in  std_logic;
            gtx_lbena_i  : in  std_logic;
            tx_reset_i   : in  std_logic;
            rx_reset_i   : in  std_logic;
            tx_data_i    : in  std_logic_vector(39 downto 0);
            gtx_rxp_i    : in  std_logic;
            gtx_rxn_i    : in  std_logic;
            gtx_ready_o  : out std_logic;
            tx_usrclk_o  : out std_logic;
            rx_usrclk_o  : out std_logic;
				gtx_refclk_o : out std_logic;
            rx_data_o    : out std_logic_vector(39 downto 0);
            gtx_txp_o    : out std_logic;
            gtx_txn_o    : out std_logic
        );
    END COMPONENT;

-------------------------------------------------------------------------
--DECODING COMPONENTS DECLARATION
-------------------------------------------------------------------------
COMPONENT Manual_Frame_Alignment IS 
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
END COMPONENT;

COMPONENT Pattern_Search IS
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
END COMPONENT;

COMPONENT Demux_40_to_120bits IS 
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
END COMPONENT;

COMPONENT Frame_TDM_x2 IS 
	PORT
	(
		Reset 		:  IN  STD_LOGIC;
		Clock_80MHz 	:  IN  STD_LOGIC; --80MHz or 160MHz depending on the optimization factor
		Input_Frame		:  IN  Frame120_TDMx2;
		Input_DV		:  IN  std_logic_vector(1 downto 0);
		Mux_ctrl 		:  OUT std_logic;
		Output_Frame	:  OUT std_logic_vector(119 downto 0);
		Output_DV		:  out std_logic
	);
END COMPONENT;

COMPONENT Frame_TDM_x3 IS 
	PORT
	(
		Reset 		:  IN  STD_LOGIC;
		Clock_120MHz 	:  IN  STD_LOGIC; --80MHz, 120 or 160MHz depending on the optimization factor
		Input_Frame		:  IN  Frame120_TDMx3;
		Input_DV		:  IN  std_logic_vector(2 downto 0);
		Mux_ctrl 		:  OUT std_logic_vector(1 downto 0);
		Output_Frame	:  OUT std_logic_vector(119 downto 0);
		Output_DV		:  out std_logic
	);
END COMPONENT;

COMPONENT Frame_TDM_x4 IS 
	PORT
	(
		Reset 		:  IN  STD_LOGIC;
		Clock_160MHz 	:  IN  STD_LOGIC; --80MHz or 160MHz depending on the optimization factor
		Input_Frame		:  IN  Frame120_TDMx4;
		Input_DV		:  IN  std_logic_vector(3 downto 0);
		Mux_ctrl 		:  OUT std_logic_vector(1 downto 0);
		Output_Frame	:  OUT std_logic_vector(119 downto 0);
		Output_DV		:  out std_logic
	);
END COMPONENT;

COMPONENT Reverse_Interleaving IS
	PORT(
		Input					: IN	STD_LOGIC_VECTOR(119 DOWNTO 0);
		Output					: OUT	STD_LOGIC_VECTOR(119 DOWNTO 0)
    );	
END COMPONENT;

COMPONENT Decoding IS 
	PORT
	(
		Clock_40MHz :  	IN  STD_LOGIC;
		DV_In :  		IN  STD_LOGIC;
		Input :  		IN  STD_LOGIC_VECTOR(119 DOWNTO 0);
		--reset :			IN STD_LOGIC; --added for the vhdl version, was not present on the bdf
		DV_Out :  		OUT  STD_LOGIC;
		Output :  		OUT  STD_LOGIC_VECTOR(83 DOWNTO 0)
	);
END COMPONENT;

COMPONENT Descrambling IS 
	PORT
	(
		Reset 		:  IN  STD_LOGIC;
		Clock_40MHz :  IN  STD_LOGIC;
		DV_In 		:  IN  STD_LOGIC;
		Input 		:  IN  STD_LOGIC_VECTOR(83 DOWNTO 0);
		DV_Out 		:  OUT  STD_LOGIC;
		Output 		:  OUT  STD_LOGIC_VECTOR(83 DOWNTO 0)
	);
END COMPONENT;

COMPONENT Frame_TDD_x2 IS 
	PORT
	(
		Reset 		:  IN  STD_LOGIC;
		Clock_80MHz 	:  IN  STD_LOGIC; --80MHz or 160MHz depending on the optimization factor
		Clock_40MHz 	:  IN  STD_LOGIC;
		Input_Frame		:  IN  std_logic_vector(83 downto 0);
		Input_DV		:  IN  std_logic;
		Mux_ctrl 		:  in std_logic;
		Output_Frame	:  OUT Frame84_TDDx2;--a pair of 120-bits frames is delivered every 25ns
		Output_DV		:  out std_logic_vector(1 downto 0)
	);
END COMPONENT;

COMPONENT Frame_TDD_x3 IS 
	PORT
	(
		Reset 		:  IN  STD_LOGIC;
		Clock_120MHz 	:  IN  STD_LOGIC; --80MHz, 120 or 160MHz depending on the optimization factor
		Clock_40MHz 	:  IN  STD_LOGIC;
		Input_Frame		:  IN  std_logic_vector(83 downto 0);
		Input_DV		:  IN  std_logic;
		Mux_ctrl 		:  in  std_logic_vector(1 downto 0);
		Output_Frame	:  OUT Frame84_TDDx3;--a triplet of 120-bits frames is delivered every 25ns
		Output_DV		:  out std_logic_vector(2 downto 0)
	);
END COMPONENT;

COMPONENT Frame_TDD_x4 IS 
	PORT
	(
		Reset 		:  IN  STD_LOGIC;
		Clock_160MHz 	:  IN  STD_LOGIC; --80MHz or 160MHz depending on the optimization factor
		Clock_40MHz 	:  IN  STD_LOGIC;
		Input_Frame		:  IN  std_logic_vector(83 downto 0); -- one frame delivered every 6.25ns
		Input_DV		:  IN  std_logic;
		Mux_ctrl 		:  in  std_logic_vector(1 downto 0);
		Output_Frame	:  OUT Frame84_TDDx4;--a packet of 4 120-bits frames is delivered every 25ns
		Output_DV		:  out std_logic_vector(3 downto 0)		
	);
END COMPONENT;

COMPONENT Error_Detection_Module
	PORT(Clock : IN STD_LOGIC;
		 Reset_Error_Seen_When_DV : IN STD_LOGIC;
		 Reset_Error_Seen : IN STD_LOGIC;
		 DV : IN STD_LOGIC;
		 Received_Data : IN STD_LOGIC_VECTOR(83 DOWNTO 0);
		 Error_Seen_When_DV : OUT STD_LOGIC;
		 Error_Seen : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT reset_manager
	PORT(Reset_Button_N : IN STD_LOGIC;
		 Clock_40MHz : IN STD_LOGIC;
		 TX_Digital_Reset : OUT STD_LOGIC;
		 RX_Analog_Reset : OUT STD_LOGIC;
		 RX_Digital_Reset : OUT STD_LOGIC
	);
END COMPONENT;

--XILINX SPECIFIC COMPONENT 

COMPONENT clk_wiz_v1_6 is
port
 (
  CLK_IN1           : in     std_logic;
  CLK_OUT1          : out    std_logic;
  CLK_OUT2          : out    std_logic;
  CLK_OUT3          : out    std_logic;
  CLK_OUT4          : out    std_logic;
  RESET             : in     std_logic;
  LOCKED            : out    std_logic
 );
 END COMPONENT;
 
--COMPONENT PLL is
--   port ( CLKIN1_IN   : in    std_logic; 
--          RST_IN      : in    std_logic; 
--          CLKOUT0_OUT : out   std_logic; 
--          CLKOUT1_OUT : out   std_logic; 
--          CLKOUT2_OUT : out   std_logic; 
--          CLKOUT3_OUT : out   std_logic; 
--          LOCKED_OUT  : out   std_logic
--	);
--END COMPONENT;

-------------------------------------------------------------------------
--SIGNALS DECLARATION
-------------------------------------------------------------------------
--GENERAL PURPOSE SIGNALS
SIGNAL	Clock_40MHz, Clock_80MHz, Clock_120MHz, Clock_160MHz,PLL_locked,gtx_refclk_120M, RefClk : STD_LOGIC;
SIGNAL	Reset_Continuous_Error_Detection_N,  Reset_Button_N		: STD_LOGIC;
SIGNAL	RX_Analog_Reset 						: STD_LOGIC;
SIGNAL	RX_Digital_Reset 						: STD_LOGIC;
SIGNAL	TX_Digital_Reset 						: STD_LOGIC;
--ENCODING SIGNALS
SIGNAL	Input_word 								: std_logic_vector(83 downto 0);
SIGNAL	Header 									: Header4_array;
SIGNAL	Scramble_out							: Word84_array;
SIGNAL	Mux_out 								: Frame120_array;
SIGNAL	Encoder_out 							: Frame120_array;
SIGNAL  TX_Parallel 							: Word40_array;
--TRANSCEIVER SIGNALS
SIGNAL  Byte_Aligned_Status  					: std_logic_vector(NUMBER_OF_LINKS-1 DOWNTO 0);
SIGNAL  Serial_loopback							: STD_LOGIC;
SIGNAL  RX_Clock, TX_Clock			 			: std_logic_vector(NUMBER_OF_LINKS-1 DOWNTO 0); 
--DECODING SIGNALS
SIGNAL  GX_Alignment_Done, Bit_Slip_Cmd, GX_Alignment_Status: std_logic_vector(NUMBER_OF_LINKS-1 DOWNTO 0);
SIGNAL 	RX_Parallel, Shifted_40bits_Word 		: Word40_array;
SIGNAL  wr_add_pat_search 						: Word5_array;
SIGNAL  Locked, DV, decode_DV_in				: std_logic_vector(NUMBER_OF_LINKS-1 DOWNTO 0);
SIGNAL  demux_in 								: Word40_array;
SIGNAL  wr_add_demux							: Word5_array;
SIGNAL  demux_out								: Frame120_array;
--OPTIMIZATION SIGNALS
SIGNAL  Frame_pair_in							: arrayofFrame120_TDMx2; 
SIGNAL  Frame_triple_in 						: arrayofFrame120_TDMx3; 
SIGNAL  Frame_quad_in 							: arrayofFrame120_TDMx4; 
SIGNAL  Frame_pair_out							: arrayofFrame84_TDDx2; 
SIGNAL  Frame_triple_out						: arrayofFrame84_TDDx3; 
SIGNAL  Frame_quad_out							: arrayofFrame84_TDDx4; 
SIGNAL  DV_pair_in, DV_pair_out					: Word2_array;
SIGNAL  DV_triple_in, DV_triple_out				: Word3_array;
SIGNAL  DV_quad_in, DV_quad_out 				: Word4_array;
SIGNAL  deinter_in, Not_Corrected_Data, decoder_in		: Frame120_array;
SIGNAL  mux_ctrlx2								: std_logic_vector(NUMBER_OF_LINKS-1 DOWNTO 0);
SIGNAL  mux_ctrlx3								: Word2_array;
SIGNAL  mux_ctrlx4								: Word2_array;
SIGNAL  All_DV									: std_logic; -- OR of all the DV(i)
SIGNAL  decode_DV_Out, descr_DV_in				: std_logic_vector(NUMBER_OF_LINKS-1 DOWNTO 0);
SIGNAL  decoder_out, descr_in					: Word84_array;
SIGNAL  Output_Corrected						: Word84_array;
SIGNAL  Data_Valid_Corrected					: std_logic_vector(NUMBER_OF_LINKS-1 DOWNTO 0);
--ERROR DETECTION SIGNALS - 
SIGNAL	Corrected_Word_DV 						: std_logic_vector(NUMBER_OF_LINKS-1 DOWNTO 0);
SIGNAL  Corrected_Word							: Word84_array;
SIGNAL  Error_Seen_on_corrected_When_DV			: std_logic_vector(NUMBER_OF_LINKS-1 DOWNTO 0);
SIGNAL  Error_Seen_on_corrected					: std_logic_vector(NUMBER_OF_LINKS-1 DOWNTO 0);
SIGNAL  system_error_when_DV, system_error		: std_logic;
SIGNAL  Temp_Error_Seen_on_corrected_When_DV	: std_logic_vector(NUMBER_OF_LINKS DOWNTO 0);
SIGNAL  Temp_Error_Seen_on_corrected,temp_DV	: std_logic_vector(NUMBER_OF_LINKS DOWNTO 0);
SIGNAL  Temp_system_error_when_DV, Temp_system_error		: std_logic;
signal tied_to_ground : std_logic;
--signal tied_to_high : std_logic;

BEGIN 
SFPA_Disable <= '0';
Serial_loopback <= NOT (Serial_loopback_N);
tied_to_ground     <= '0';
--tied_to_high <='1';
-------------------------------------------------------------------------
--ONE COMMON GENERATOR FOR ALL THE ENCODED FRAMES
-------------------------------------------------------------------------
word_gene : word_generator
	PORT MAP(Clock_40MHz 	=> Clock_40MHz,
		 Generated_Word 	=> Input_word);
		 
		
		 
-------------------------------------------------------------------------
--GENERATES NUMBER_OF_LINKS ENCODED FRAMES
-------------------------------------------------------------------------
encoded_frames_instantiation: for i in 0 to NUMBER_OF_LINKS-1 generate 

	--input: 84bits words @ 40 MHz
	--output: 88bits@40MHz (header + scrambled 84bits word)
	scrambler : scrambling
	GENERIC MAP(N => i)
	PORT MAP(Reset 	=> TX_Digital_Reset,
		 Clock 		=> Clock_40MHz,
		 Input 		=> Input_word,
		 Header 	=> Header(i),
		 Output 	=> Scramble_out(i));

	--input: 88bits @ 40MHz
	--output: (88bits +32 FEC bits)=120bits@40MHz
	encoder : encoding
	PORT MAP(Header => Header(i),
		 Input 		=> Scramble_out(i),
		 Output 	=> Encoder_out(i));

	--input: 120bits@40MHz
	--output: 120 nibble based interleaved @40MHz
	interleaver : interleaving
	PORT MAP(Input 	=> Encoder_out(i),
		 Output 	=> Mux_out(i));

	--input: 120bits@40MHz
	--output: 40bits@120MHz
	mux : mux_120_to_40bits
	PORT MAP(Reset 		=> TX_Digital_Reset,
		 Clock_40MHz 	=> Clock_40MHz,
		 Clock_120MHz 	=> Clock_120MHz,
		 Input 			=> Mux_out(i),
		 Output 		=> TX_Parallel(i));
end generate;		 

-------------------------------------------------------------------------
--INSTANCIATES NUMBER_OF_LINKS GXB TRANSCEIVER BLOCKS
-------------------------------------------------------------------------

--individual transceivers instanciations
transceivers_instantiation: for i in 0 to NUMBER_OF_LINKS-1 generate 
--	ALTERA transceiver : gx_serdes
--				PORT MAP(pll_inclk 		=> RefClk,
--					 cal_blk_clk 		=> Clock_40MHz,
--					 rx_analogreset(0) 	=> RX_analog_Reset,
--					 rx_datain(0) 		=> RX_Serial(i),
--					 rx_digitalreset(0) => RX_Digital_Reset,
--					 rx_enapatternalign(0) => '0',
--					 rx_seriallpbken(0) => Serial_loopback,
--					 tx_datain 			=> TX_Parallel(i),
--					 tx_digitalreset(0) => TX_Digital_Reset,
--					 rx_byteorderalignstatus(0) => GX_Alignment_Done(i),
--					 rx_clkout(0) 		=> RX_Clock(i),
--					 rx_dataout 		=> RX_Parallel(i),
--					 tx_clkout(0) 		=> TX_Clock(i),
--					 tx_dataout(0) 		=> TX_Serial(i));
					 
	transceiver : gtx_serdes GENERIC MAP (
            g_SIMULATION => 0)
        PORT MAP(
            gtx_refclk_i => RefClk,
				gtx_reset_i  => TX_Digital_Reset,        -- should be replaced by global reset
            gtx_lbena_i  => Serial_loopback,
            tx_reset_i   => TX_Digital_Reset,
            rx_reset_i   => RX_Digital_Reset,
            tx_data_i    => TX_Parallel(i),
            gtx_rxp_i    => RX_Serial_p(i),
            gtx_rxn_i    => RX_Serial_n(i),
            gtx_ready_o  => GX_Alignment_Done(i),--s_gtx_ready,
            tx_usrclk_o  => TX_Clock(i),
            rx_usrclk_o  => RX_Clock(i),
				gtx_refclk_o => gtx_refclk_120M,
            rx_data_o    => RX_Parallel(i),
            gtx_txp_o    => TX_Serial_p(i),
            gtx_txn_o    => TX_Serial_n(i)
            );
end generate;
					 			 
-------------------------------------------------------------------------
--GENERATES NUMBER_OF_LINKS * MANUAL ALIGNEMENT, PATTERN SEARCH, DEMUX and DEINTERLEAVE
-------------------------------------------------------------------------
alignment_demux_and_deinterlv_instantiation: for i in 0 to NUMBER_OF_LINKS-1 generate 
	mfa : manual_frame_alignment
	PORT MAP(Reset 				=> RX_Digital_Reset,
			 RX_Clock 			=> RX_Clock(i),
			 GX_Alignment_Done 	=> GX_Alignment_Done(i),
			 Bit_Slip_Cmd 		=> Bit_Slip_Cmd(i),
			 RX_Parallel 		=> RX_Parallel(i),
			 GX_Alignment_Done_Out => GX_Alignment_Status(i),
			 Shifted_40bits_Word => Shifted_40bits_Word(i),
			 Write_Address 		=> wr_add_pat_search(i));
			 
	pat_search : pattern_search
	PORT MAP(Reset 				=> RX_Digital_Reset,
			 Clock 				=> RX_Clock(i),
			 GX_Alignment_Status => GX_Alignment_Status(i),
			 Word_In 			=> Shifted_40bits_Word(i),
			 Write_Address_In 	=> wr_add_pat_search(i),
			 Bit_Slip_Cmd 		=> Bit_Slip_Cmd(i),
			 Locked 			=> Locked(i),
			 Word_Out 			=> demux_in(i),
			 Write_Address_Out 	=> wr_add_demux(i));

	demux : demux_40_to_120bits
	PORT MAP(Reset 				=> RX_Digital_Reset,
			 RX_Clock 			=> RX_Clock(i),
			 Clock_40MHz 		=> Clock_40MHz,
			 Locked 			=> Locked(i),
			 Input 				=> demux_in(i),
			 Write_Address 		=> wr_add_demux(i),
			 DV 				=> DV(i),
			 Output 			=> demux_out(i));
			 
	deinter : reverse_interleaving --no clock cycles, just rerouting
		PORT MAP(Input 	=> demux_out(i),
			 Output 	=> Not_Corrected_Data(i));
			 
end generate;

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
--RESSOURCE OPTIMIZATION BEGINS HERE
-------------------------------------------------------------------------
-------------------------------------------------------------------------
--OPTIMIZE = 0 => no optimization scheme: generates one deint/dec/descr chain per link
--which gives NUMBER_OF_LINKS chains running @ 40MHz
not_optimized_decoding_chain: if (OPTIMIZE= 0) generate
	link_gen: for i in 0 to (NUMBER_OF_LINKS-1) generate 
	
		decode : decoding
		PORT MAP(Clock_40MHz => Clock_40MHz,
			 DV_In 		=> DV(i),
			 Input 		=> Not_Corrected_Data(i),
			 DV_Out 	=> descr_DV_In(i),
			 Output 	=> descr_in(i));		 
		
	end generate link_gen;
end generate not_optimized_decoding_chain;


-------------------------------------------------------------------------
--OPTIMIZE = 2 => optimization scheme by pair: one deint/dec/descr chain per 2-links, which gives NUMBER_OF_LINKS/2 chains
--running @ 80MHz
optimized_by_2_decoding_chain: if (OPTIMIZE= 2) generate --elsif generate is not supported by VHDL 93
	link_gen: for i in 0 to (NUMBER_OF_LINKS/2-1) generate  
	
	--Frame_pair(i) is a pair of 2 120-bits frames
	Frame_pair_in(i)(0) <= Not_Corrected_Data(i*2);
	Frame_pair_in(i)(1) <= Not_Corrected_Data(i*2+1);
	
	--Frame_pair(i) is a pair of 2 std_logic
	DV_pair_in(i)(0) <= DV(i*2);
	DV_pair_in(i)(1) <= DV(i*2+1);
	
	tdm_x2: Frame_TDM_x2  --Time Division Multiplexing by a factor of 2 
	PORT MAP(Reset 		=> RX_Digital_Reset,
		Clock_80MHz 	=> Clock_80MHz, --80MHz or 160MHz depending on the optimization factor
		Input_Frame		=> Frame_pair_in(i), --Input_Frame is an array of 2 std_logic_vector120@40MHz
		Input_DV 		=> DV_pair_in(i), --DV_pair is an array of 2 std logic (one DV per frame)
		Mux_ctrl 		=> mux_ctrlx2(i),
		Output_Frame 	=> decoder_in(i), --Output Frame is one 120bit frame @ 80MHz
		Output_DV 		=> decode_DV_in(i)); --Output_DV is one bit@80MHz

	decode : decoding
	PORT MAP(Clock_40MHz => Clock_80MHz,-- the decoder is now working at 80MHz instead of 40MHz
		 DV_In 		=> decode_DV_in(i),
		 Input 		=> decoder_in(i),
		 DV_Out 	=> decode_DV_out(i),
		 Output 	=> decoder_out(i));
	
	tdd_x2: Frame_TDD_x2 --Time Division Demultiplexing by a factor of 2 
	PORT MAP(Reset => RX_Digital_Reset,
		Clock_80MHz => Clock_80MHz,
		Clock_40MHz => Clock_40MHz,
		Input_Frame => decoder_out(i),
		Input_DV	=> decode_DV_out(i),
		Mux_ctrl 	=> mux_ctrlx2(i),
		Output_Frame => frame_pair_out(i), --a pair of 84-bits frames is delivered every 25ns
		Output_DV 	=> DV_pair_out(i)); --a pair of DV is delivered every 25ns
		 
	--Corrected_Word_DV <= (others => '0');
	descr_in(i*2) 	<= frame_pair_out(i)(0);
	descr_in(i*2+1) <= frame_pair_out(i)(1);
	
	descr_DV_In(i*2) 	<= DV_pair_out(i)(0);
	descr_DV_In(i*2+1) 	<= DV_pair_out(i)(1);
	
	end generate link_gen;
 end generate optimized_by_2_decoding_chain;
	
-------------------------------------------------------------------------
--OPTIMIZE = 3 => optimization scheme by pair: one deint/dec/descr chain per 3-links, which gives NUMBER_OF_LINKS/3 chains
--running @ 120MHz
optimized_by_3_decoding_chain: if (OPTIMIZE= 3) generate --elsif generate is not supported by VHDL 93
	link_gen: for i in 0 to (NUMBER_OF_LINKS/3-1) generate  
	
	--Frame_pair(i) is a triplet of 3 120-bits frames
	Frame_triple_in(i)(0) <= Not_Corrected_Data(i*3);
	Frame_triple_in(i)(1) <= Not_Corrected_Data(i*3+1);
	Frame_triple_in(i)(2) <= Not_Corrected_Data(i*3+2);
	
	--Frame_pair(i) is a triplet of 3 std_logic
	DV_triple_in(i)(0) <= DV(i*3);
	DV_triple_in(i)(1) <= DV(i*3+1);
	DV_triple_in(i)(2) <= DV(i*3+2);
	
	tdm_x3: Frame_TDM_x3 --Time Division Multiplexing by a factor of 3 
	PORT MAP(Reset 	=> RX_Digital_Reset,
		Clock_120MHz => Clock_120MHz, --80MHz or 160MHz depending on the optimization factor
		Input_Frame	=> Frame_triple_in(i), --Input_Frame is an array of 2 std_logic_vector120@40MHz
		Input_DV 	=> DV_triple_in(i), --DV_pair is an array of 2 std logic (one DV per frame)
		Mux_ctrl 	=> mux_ctrlx3(i),
		Output_Frame => decoder_in(i), --Output Frame is one 120bit frame @ 80MHz
		Output_DV 	=> decode_DV_in(i)); --Output_DV is one bit@80MHz

	decode : decoding
	PORT MAP(Clock_40MHz => Clock_120MHz,-- the decoder is now working at 80MHz instead of 40MHz
		 DV_In 		=> decode_DV_in(i),
		 Input 		=> decoder_in(i),
		 DV_Out 	=> decode_DV_out(i),
		 Output 	=> decoder_out(i));
		 
	tdd_x3: Frame_TDD_x3 --Time Division Demultiplexing by a factor of 3 
	PORT MAP(Reset => RX_Digital_Reset,
		Clock_120MHz => Clock_120MHz,
		Clock_40MHz => Clock_40MHz,
		Input_Frame => decoder_out(i),
		Input_DV	=> decode_DV_out(i),
		Mux_ctrl 	=> mux_ctrlx3(i),
		Output_Frame => frame_triple_out(i), --a triplet of 84-bits frames is delivered every 25ns
		Output_DV 	=> DV_triple_out(i)); --a triplet of DV is delivered every 25ns
		 
	--Corrected_Word_DV <= (others => '0');
	descr_in(i*3) 	<= frame_triple_out(i)(0);
	descr_in(i*3+1) <= frame_triple_out(i)(1);
	descr_in(i*3+2) <= frame_triple_out(i)(2);
	
	descr_DV_In(i*3) 	<= DV_triple_out(i)(0);
	descr_DV_In(i*3+1) 	<= DV_triple_out(i)(1);
	descr_DV_In(i*3+2) 	<= DV_triple_out(i)(2);
	
	end generate link_gen;
 end generate optimized_by_3_decoding_chain;
	
		
-------------------------------------------------------------------------
--OPTIMIZE = 4 => optimization scheme by packets of 4: one deint/dec/descr chain per 4-links, which gives NUMBER_OF_LINKS/4 chains
--running @ 80MHz
optimized_by_4_decoding_chain: if (OPTIMIZE= 4) generate
	link_gen: for i in 0 to (NUMBER_OF_LINKS/4-1) generate 
	
	--Frame_pair(i) is a pair of 2 120-bits frames
	Frame_quad_in(i)(0) <= Not_Corrected_Data(i*4);
	Frame_quad_in(i)(1) <= Not_Corrected_Data(i*4+1);
	Frame_quad_in(i)(2) <= Not_Corrected_Data(i*4+2);
	Frame_quad_in(i)(3) <= Not_Corrected_Data(i*4+3);	
	
	--Frame_pair(i) is a pair of 2 std_logic
	DV_quad_in(i)(0) <= DV(i*4);
	DV_quad_in(i)(1) <= DV(i*4+1);
	DV_quad_in(i)(2) <= DV(i*4+2);
	DV_quad_in(i)(3) <= DV(i*4+3);
	
	tdm_x4: Frame_TDM_x4  --Time Division Multiplexing by a factor of 4
	PORT MAP(Reset 	=> RX_Digital_Reset,
		Clock_160MHz => Clock_160MHz, --80MHz or 160MHz depending on the optimization factor
		Input_Frame	=> Frame_quad_in(i), --Input_Frame is an array of 2 std_logic_vector120@40MHz
		Input_DV 	=> DV_quad_in(i), --DV_pair is an array of 2 std logic (one DV per frame)
		Mux_ctrl 	=> mux_ctrlx4(i),
		Output_Frame => decoder_in(i), --Output Frame is one 120bit frame @ 80MHz
		Output_DV 	=> decode_DV_in(i)); --Output_DV is one bit@80MHz
	

	decode : decoding
	PORT MAP(Clock_40MHz => Clock_160MHz,-- the decoder is now working at 160MHz instead of 40MHz
		 DV_In 		=> decode_DV_in(i),
		 Input 		=> decoder_in(i),
		 DV_Out 	=> decode_DV_out(i),
		 Output 	=> decoder_out(i));
	
	tdd_x4: Frame_TDD_x4 --Time Division Demultiplexing by a factor of 4 
	PORT MAP(Reset => RX_Digital_Reset,
		Clock_160MHz => Clock_160MHz,
		Clock_40MHz => Clock_40MHz,
		Input_Frame => decoder_out(i),
		Input_DV	=> decode_DV_out(i),
		Mux_ctrl 	=> mux_ctrlx4(i),
		Output_Frame => frame_quad_out(i), --a quad of 84-bits frames is delivered every 25ns
		Output_DV 	=> DV_quad_out(i)); --a quad of DVs is delivered every 25ns
	
	descr_in(i*4) 		<= frame_quad_out(i)(0);
	descr_in(i*4+1) 	<= frame_quad_out(i)(1);
	descr_in(i*4+2) 	<= frame_quad_out(i)(2);
	descr_in(i*4+3) 	<= frame_quad_out(i)(3);
	
	descr_DV_In(i*4) 	<= DV_quad_out(i)(0);
	descr_DV_In(i*4+1)	<= DV_quad_out(i)(1);
	descr_DV_In(i*4+2)	<= DV_quad_out(i)(2);
	descr_DV_In(i*4+3)	<= DV_quad_out(i)(3);	 
	
	end generate link_gen;
end generate optimized_by_4_decoding_chain;

-------------------------------------------------------------------------
--RESSOURCE OPTIMIZATION ENDS HERE
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-------------------------------------------------------------------------
--GENERATES NUMBER_OF_LINKS DESCRAMBLERS
-------------------------------------------------------------------------
descrambler_instantiation: for i in 0 to NUMBER_OF_LINKS-1 generate 

	Descrambling_Corrected : descrambling
		PORT MAP(Reset => RX_Digital_Reset,
			 Clock_40MHz 	=> Clock_40MHz,
			 DV_In 			=> descr_DV_In(i),
			 Input 			=> descr_in(i),
			 DV_Out 		=> Corrected_Word_DV(i),
			 Output 		=> Corrected_Word(i));
			 
end generate descrambler_instantiation;
-------------------------------------------------------------------------
--GENERATES NUMBER_OF_LINKS ERROR DETECTION BLOCKS
-------------------------------------------------------------------------
error_detection_generation: for i in 0 to NUMBER_OF_LINKS-1 generate 
-- error detection
	Error_Detection_On_Corrected_Data : Error_Detection_Module
	PORT MAP(Clock => Clock_40MHz,
		 Reset_Error_Seen_When_DV 	=> RX_Digital_Reset,
		 Reset_Error_Seen 			=> Reset_Continuous_Error_Detection,
		 DV 						=> Corrected_Word_DV(i),
		 Received_Data 				=> Corrected_Word(i),
		 Error_Seen_When_DV 		=> Error_Seen_on_corrected_When_DV(i),
		 Error_Seen 				=> Error_Seen_on_corrected(i));

--	Error_Detection_On_Non_Corrected_Data : error_detection_module
--	PORT MAP(Clock => Clock_40MHz,
--		 Reset_Error_Seen_When_DV => RX_Digital_Reset,
--		 Reset_Error_Seen => Reset_Continuous_Error_Detection,
--		 DV => Non_Corrected_Word_DV(i),
--		 Received_Data => Non_Corrected_Word(i),
--		 Error_Seen_When_DV => Error_Seen_on_non_corrected_when_DV(i),
--		 Error_Seen => Error_Seen_on_non_corrected(i));
end generate;	
	
-------------------------------------------------------------------------
--UTILITIES
------------------------------------------------------------------------- 
-------------------------------------------------------------------------
--Error detection gathering
-------------------------------------------------------------------------
--All_DV is an OR of all the DV(i) of the word Alignment processes
temp_DV(0) <= '0';

all_dv_generate: for i in 0 to NUMBER_OF_LINKS-1 generate
	temp_DV(i+1) <= DV(i) or temp_DV(i);
end generate;

All_DV <= temp_DV(NUMBER_OF_LINKS);	

--system_error is an OR of all the Error_Seen_on_corrected(i) after the end of the full process
temp_error_seen_on_corrected(0) <= '0';

system_error_generate: for i in 0 to NUMBER_OF_LINKS-1 generate
	temp_error_seen_on_corrected(i+1) <= Error_Seen_on_corrected(i) or temp_error_seen_on_corrected(i);
end generate;

system_error <= temp_error_seen_on_corrected(NUMBER_OF_LINKS);		

--system_error_when_DV is an OR of all the Error_Seen_on_corrected_when_DV(i) after the end of the full process, once the alignment is done
temp_error_seen_on_corrected_When_DV(0) <= '0';

system_error_when_dv_generate: for i in 0 to NUMBER_OF_LINKS-1 generate
	temp_error_seen_on_corrected_When_DV(i+1) <= Error_Seen_on_corrected_When_DV(i) or temp_error_seen_on_corrected_When_DV(i);
end generate;

system_error_when_DV <= temp_error_seen_on_corrected_When_DV(NUMBER_OF_LINKS);

-------------------------------------------------------------------------
--LEDs instanciation
-------------------------------------------------------------------------

--user leds (SIIGX PCIe DEV KIT) - D10,D9 are free
LED(2) <= (All_DV);                 -- AK27,
LED(3) <= (Corrected_Word(0)(83)); 	-- AK28 (should flash when words are changing)
LED(5) <= (system_error); 				-- AH27
LED(4) <= (system_error_when_DV); 	-- AJ26
--LED(6) <= NOT(Error_Seen_on_non_corrected_when_DV); --D14
--LED(7) <= NOT(Error_Seen_on_non_corrected); --D13	

-------------------------------------------------------------------------
--RESET managment
-------------------------------------------------------------------------

b2v_inst1 : reset_manager
PORT MAP(Reset_Button_N => Reset_Button_N,
		 Clock_40MHz => Clock_40MHz,
		 TX_Digital_Reset => TX_Digital_Reset,
		 RX_Analog_Reset => RX_Analog_Reset,
		 RX_Digital_Reset => RX_Digital_Reset);

Reset_Continuous_Error_Detection_N <= NOT(Reset_Continuous_Error_Detection);
Reset_Button_N <= NOT(Reset_Button);

-------------------------------------------------------------------------
--PLL instanciation
-------------------------------------------------------------------------

q0_clk0_refclk_ibufds_i : IBUFDS_GTXE1
    port map
    (
        O    =>      RefClk,
        ODIV2  =>      open,
        CEB  =>  tied_to_ground ,
        I  => RefClk_p,
        IB => RefClk_n
    );




--cmp_refclk_126_ibufds: IBUFDS
--        port map (
--            O  => RefClk,
--            I  => RefClk_p,
--            IB => RefClk_n);

b2v_inst5 : clk_wiz_v1_6

PORT MAP
 (
  CLK_IN1   => gtx_refclk_120M,
  CLK_OUT1  => Clock_40MHz,
  CLK_OUT2  => Clock_80MHz,
  CLK_OUT3  => Clock_120MHz,
  CLK_OUT4  => Clock_160MHz,
  RESET     => Reset_Button,
  LOCKED    => PLL_locked
  );
--PORT MAP(CLKIN1_IN 	=> gtx_refclk_120M,--PLL_Input,
--			RST_IN		=> Reset_Button, --??
--			CLKOUT0_OUT => Clock_40MHz,
--			CLKOUT1_OUT => Clock_80MHz,
--			CLKOUT2_OUT => Clock_120MHz,
--			CLKOUT3_OUT => Clock_160MHz,
--			LOCKED_OUT  => PLL_locked);


END rtl;
