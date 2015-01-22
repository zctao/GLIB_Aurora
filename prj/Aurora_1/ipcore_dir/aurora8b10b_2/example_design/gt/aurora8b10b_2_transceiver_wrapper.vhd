-------------------------------------------------------------------------------
-- (c) Copyright 2008 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
--
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version : 7.1i
--  \   \         Application :
--  /   /         Filename : aurora8b10b_2_GTX_WRAPPER.vhd
-- /___/   /\     Timestamp : 02/16/2005 10:19:02
-- \   \  /  \
--  \___\/\___\
--------------------------------------------------------------------------------
--Command:
--Design Name: aurora8b10b_2_GTX_WRAPPER
--
-- Module aurora8b10b_2_GTX_WRAPPER
-- Generated by Xilinx Architecture Wizard
-- Written for synthesis tool: XST
--------------------------------------------------------------------------------
library IEEE;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity aurora8b10b_2_GTX_WRAPPER is
generic
(
    SIM_GTXRESET_SPEEDUP :integer :=   0      --Set to 1 to speed up sim reset
);  

port
(

---------------------- Loopback and Powerdown Ports ----------------------
LOOPBACK_IN                               : in    std_logic_vector (2 downto 0);
--------------------- Receive Ports - 8b10b Decoder ----------------------
RXCHARISCOMMA_OUT : out   std_logic_vector (3 downto 0);
RXCHARISK_OUT     : out   std_logic_vector (3 downto 0);
RXDISPERR_OUT     : out   std_logic_vector (3 downto 0);
RXNOTINTABLE_OUT  : out   std_logic_vector (3 downto 0);

----------------- Receive Ports - Channel Bonding Ports -----------------
ENCHANSYNC_IN     : in    std_logic;
CHBONDDONE_OUT    : out   std_logic;

----------------- Receive Ports - Clock Correction Ports -----------------
RXBUFERR_OUT      : out   std_logic;

------------- Receive Ports - Comma Detection and Alignment --------------
RXREALIGN_OUT     : out   std_logic;
ENMCOMMAALIGN_IN  : in    std_logic;
ENPCOMMAALIGN_IN  : in    std_logic;

----------------- Receive Ports - RX Data Path interface -----------------
RXDATA_OUT        : out   std_logic_vector (31 downto 0);
RXRECCLK1_OUT     : out   std_logic;
RXRECCLK2_OUT     : out   std_logic;
RXRESET_IN        : in    std_logic;
RXUSRCLK_IN                               : in    std_logic;
RXUSRCLK2_IN                              : in    std_logic;
----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
RXEQMIX_IN           : in    std_logic_vector(2 downto 0);
RX1N_IN           : in    std_logic;
RX1P_IN           : in    std_logic;
--------------- Receive Ports - RX Polarity Control Ports ----------------
RXPOLARITY_IN     : in    std_logic;
----------- Shared Ports - Dynamic Reconfiguration Port (DRP) ------------
    DADDR_IN       : in   std_logic_vector(7 downto 0);
    DCLK_IN        : in   std_logic;
    DEN_IN         : in   std_logic;
    DI_IN          : in   std_logic_vector(15 downto 0);
    DRDY_OUT       : out  std_logic;
    DRPDO_OUT      : out  std_logic_vector(15 downto 0);
    DWE_IN         : in   std_logic;
------------------- Shared Ports - Tile and PLL Ports --------------------
REFCLK                                    : in    std_logic;
GTXRESET_IN                               : in    std_logic;
PLLLKDET_OUT      : out   std_logic;
POWERDOWN_IN                              : in    std_logic;                 
LINK_RESET_IN      : in   std_logic_vector(1 downto 0);

-------------- Transmit Ports - 8b10b Encoder Control Ports --------------
TXCHARISK_IN      : in    std_logic_vector (3 downto 0);

---------------- Transmit Ports - TX Data Path interface -----------------
TXDATA_IN         : in    std_logic_vector (31 downto 0);
TXOUTCLK1_OUT     : out   std_logic;
TXOUTCLK2_OUT     : out   std_logic;
TXRESET_IN        : in    std_logic;
TXUSRCLK_IN                               : in    std_logic;      
TXUSRCLK2_IN                              : in    std_logic;
TXBUFERR_OUT      : out   std_logic;

------------- Transmit Ports - TX Driver and OOB signalling --------------
TX1N_OUT          : out   std_logic;
TX1P_OUT          : out   std_logic
);

end aurora8b10b_2_GTX_WRAPPER;


architecture BEHAVIORAL of aurora8b10b_2_GTX_WRAPPER is
  attribute core_generation_info               : string;
  attribute core_generation_info of BEHAVIORAL : architecture is "aurora8b10b_2,aurora_8b10b_v8_3,{user_interface=AXI_4_Streaming,backchannel_mode=Sidebands,c_aurora_lanes=1,c_column_used=left,c_gt_clock_1=GTXQ0,c_gt_clock_2=None,c_gt_loc_1=X,c_gt_loc_10=X,c_gt_loc_11=X,c_gt_loc_12=X,c_gt_loc_13=X,c_gt_loc_14=X,c_gt_loc_15=X,c_gt_loc_16=X,c_gt_loc_17=X,c_gt_loc_18=X,c_gt_loc_19=X,c_gt_loc_2=X,c_gt_loc_20=X,c_gt_loc_21=X,c_gt_loc_22=X,c_gt_loc_23=X,c_gt_loc_24=X,c_gt_loc_25=X,c_gt_loc_26=X,c_gt_loc_27=X,c_gt_loc_28=X,c_gt_loc_29=X,c_gt_loc_3=X,c_gt_loc_30=X,c_gt_loc_31=X,c_gt_loc_32=X,c_gt_loc_33=X,c_gt_loc_34=X,c_gt_loc_35=X,c_gt_loc_36=X,c_gt_loc_37=X,c_gt_loc_38=X,c_gt_loc_39=X,c_gt_loc_4=1,c_gt_loc_40=X,c_gt_loc_41=X,c_gt_loc_42=X,c_gt_loc_43=X,c_gt_loc_44=X,c_gt_loc_45=X,c_gt_loc_46=X,c_gt_loc_47=X,c_gt_loc_48=X,c_gt_loc_5=X,c_gt_loc_6=X,c_gt_loc_7=X,c_gt_loc_8=X,c_gt_loc_9=X,c_lane_width=4,c_line_rate=31250,c_nfc=false,c_nfc_mode=IMM,c_refclk_frequency=125000,c_simplex=false,c_simplex_mode=TX,c_stream=false,c_ufc=false,flow_mode=None,interface_mode=Framing,dataflow_config=Duplex}";

--***************************** Compopnent Declaration ****************************
component AURORA8B10B_2_GTX is
generic
(
    -- Simulation attributes
    GTX_SIM_GTXRESET_SPEEDUP    : integer    := 0;
   
    -- Share RX PLL parameter
    GTX_TX_CLK_SOURCE           : string     := "TXPLL";
    -- Save power parameter
    GTX_POWER_SAVE              : bit_vector := "0000000000"
);
port
(
    GTXTEST_IN                              : in   std_logic_vector(12 downto 0);
    ------------------------ Loopback and Powerdown Ports ----------------------
    LOOPBACK_IN                             : in   std_logic_vector(2 downto 0);
    RXPOWERDOWN_IN   	                    : in   std_logic_vector(1 downto 0);
    TXPOWERDOWN_IN   	                    : in   std_logic_vector(1 downto 0);
    ----------------------- Receive Ports - 8b10b Decoder ----------------------
    RXCHARISCOMMA_OUT 		     	    : out std_logic_vector(3 downto 0);
    RXCHARISK_OUT 		     	    : out std_logic_vector(3 downto 0);
    RXDISPERR_OUT 		     	    : out std_logic_vector(3 downto 0);
    RXNOTINTABLE_OUT 		     	    : out std_logic_vector(3 downto 0);
    ------------------- Receive Ports - Clock Correction Ports--
    RXCLKCORCNT_OUT                         : out  std_logic_vector(2 downto 0);
    --------------- Receive Ports - Comma Detection and Alignment --------------
    RXBYTEREALIGN_OUT                       : out  std_logic;
    RXENMCOMMAALIGN_IN                      : in   std_logic;
    RXENPCOMMAALIGN_IN                      : in   std_logic;
    ------------------- Receive Ports - RX Data Path interface -----------------
    RXDATA_OUT                              : out  std_logic_vector(31 downto 0);
    RXRESET_IN                              : in   std_logic;
    RXUSRCLK_IN                             : in   std_logic;
    RXUSRCLK2_IN                            : in   std_logic;
    ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    RXCDRRESET_IN                           : in   std_logic;
    RXEQMIX_IN                              : in   std_logic_vector(2 downto 0);
    RXN_IN                                  : in   std_logic;
    RXP_IN                                  : in   std_logic;
    -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
    RXBUFSTATUS_OUT                         : out  std_logic_vector(2 downto 0);
    ------------------------ Receive Ports - RX PLL Ports ----------------------
    GTXRXRESET_IN                           : in   std_logic;
    MGTREFCLKRX_IN                          : in   std_logic_vector(1 downto 0);
    PLLRXRESET_IN                           : in   std_logic;
    RXPLLLKDET_OUT                          : out  std_logic;
    RXRESETDONE_OUT                         : out  std_logic;
    ----------------- Receive Ports - RX Polarity Control Ports ----------------
    RXPOLARITY_IN                          : in   std_logic;
    ------------- Shared Ports - Dynamic Reconfiguration Port (DRP) ------------
    DADDR_IN                                : in   std_logic_vector(7 downto 0);
    DCLK_IN                                 : in   std_logic;
    DEN_IN                                  : in   std_logic;
    DI_IN                                   : in   std_logic_vector(15 downto 0);
    DRDY_OUT                                : out  std_logic;
    DRPDO_OUT                               : out  std_logic_vector(15 downto 0);
    DWE_IN                                  : in   std_logic;
    ---------------- Transmit Ports - 8b10b Encoder Control Ports --------------
    TXCHARISK_IN			    : in std_logic_vector(3 downto 0);
    ------------------ Transmit Ports - TX Data Path interface -----------------
    TXDATA_IN                               : in   std_logic_vector(31 downto 0);
    TXOUTCLK_OUT                            : out  std_logic;
    TXRESET_IN                              : in   std_logic;
    TXUSRCLK_IN                             : in   std_logic;
    TXUSRCLK2_IN                            : in   std_logic;
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    TXN_OUT                                 : out  std_logic;
    TXP_OUT                                 : out  std_logic;
    --------- Transmit Ports - TX Elastic Buffer and Phase Alignment ---------
    TXBUFSTATUS_OUT                         : out  std_logic_vector(1 downto 0);
    ----------------------- Transmit Ports - TX PLL Ports ----------------------
    GTXTXRESET_IN                           : in   std_logic;
    MGTREFCLKTX_IN                          : in   std_logic_vector(1 downto 0);
    PLLTXRESET_IN                           : in   std_logic;
    TXPLLLKDET_OUT                          : out  std_logic;
    TXRESETDONE_OUT                         : out  std_logic

);
end component;


   signal tied_to_ground_i                               : std_logic;
   signal tied_to_ground_vec_i                           : std_logic_vector (63 downto 0);
   signal tied_to_vcc_i                                  : std_logic;
   signal chbondi                 : std_logic_vector (3 downto 0);
   signal chbondo                 : std_logic_vector (3 downto 0);
   signal open_rxbufstatus        : std_logic_vector (1 downto 0);
   signal open_txbufstatus        : std_logic;
   signal chbondi_unused_i                                    : std_logic_vector (3 downto 0);

   --signal to output lock signal
   signal tx_plllkdet_o          : std_logic;
   signal rx_plllkdet_o          : std_logic;

  signal   rxreset_i            : std_logic;
  signal gtxtest_w                                   : std_logic_vector(12 downto 0);

begin

  tied_to_ground_i                    <= '0';
  tied_to_ground_vec_i(63 downto 0)   <= (others => '0');
  tied_to_vcc_i                       <= '1';

--Assign lock signals
  PLLLKDET_OUT  <=   rx_plllkdet_o;

  chbondi_unused_i  <= "0000";

   CHBONDDONE_OUT <= '1';

   --Connect channel bonding bus
   chbondi <= chbondi_unused_i;

    gtxtest_w <= "1000000" & LINK_RESET_IN(0) & LINK_RESET_IN(0) & LINK_RESET_IN(0) & "000";

    rxreset_i <= RXRESET_IN OR LINK_RESET_IN(1);

------------------------- GTX Instantiations  --------------------------  
   GTXE1_INST : AURORA8B10B_2_GTX 
    generic map
    (
        -- Simulation attributes
        GTX_SIM_GTXRESET_SPEEDUP    => SIM_GTXRESET_SPEEDUP,
       
        -- Share RX PLL parameter
        GTX_TX_CLK_SOURCE           => "RXPLL",
        -- Save power parameter
        GTX_POWER_SAVE              => "0000110100"

    )
    port map
    (
        GTXTEST_IN                      =>      gtxtest_w, 
        ------------------------ Loopback and Powerdown Ports ----------------------
        LOOPBACK_IN                     =>      LOOPBACK_IN,
        RXPOWERDOWN_IN(0)               =>      POWERDOWN_IN,
        RXPOWERDOWN_IN(1)               =>      POWERDOWN_IN,
        TXPOWERDOWN_IN(0)               =>      POWERDOWN_IN,
        TXPOWERDOWN_IN(1)               =>      POWERDOWN_IN,
        ----------------------- Receive Ports - 8b10b Decoder ----------------------
        RXCHARISCOMMA_OUT               =>      RXCHARISCOMMA_OUT,
        RXCHARISK_OUT                   =>      RXCHARISK_OUT,
        RXDISPERR_OUT                   =>      RXDISPERR_OUT,
        RXNOTINTABLE_OUT                =>      RXNOTINTABLE_OUT,
        ------------------- Receive Ports - Channel Bonding Ports ------------------
        ------------------- Receive Ports - Clock Correction Ports -----------------
        RXCLKCORCNT_OUT                 =>      OPEN,
        --------------- Receive Ports - Comma Detection and Alignment --------------
        RXBYTEREALIGN_OUT               =>      RXREALIGN_OUT,
        RXENMCOMMAALIGN_IN              =>      ENMCOMMAALIGN_IN,
        RXENPCOMMAALIGN_IN              =>      ENPCOMMAALIGN_IN,
        ------------------- Receive Ports - RX Data Path interface -----------------
        RXDATA_OUT                      =>      RXDATA_OUT,
        RXRESET_IN                      =>      rxreset_i,
        RXUSRCLK_IN                     =>      RXUSRCLK_IN,
        RXUSRCLK2_IN                    =>      RXUSRCLK2_IN,
        ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
        RXCDRRESET_IN                   =>      tied_to_ground_i,
        RXEQMIX_IN                      =>      RXEQMIX_IN,
        RXN_IN                          =>      RX1N_IN,
        RXP_IN                          =>      RX1P_IN,
        -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
        RXBUFSTATUS_OUT(2)              =>      RXBUFERR_OUT ,
        RXBUFSTATUS_OUT(1 downto 0)     =>      open_rxbufstatus(1 downto 0),
        ------------------------ Receive Ports - RX PLL Ports ----------------------
        GTXRXRESET_IN                   =>      GTXRESET_IN,
        MGTREFCLKRX_IN(1)               =>      tied_to_ground_i,
        MGTREFCLKRX_IN(0)               =>      REFCLK, 
        PLLRXRESET_IN                   =>      tied_to_ground_i,
        RXPLLLKDET_OUT                  =>      rx_plllkdet_o,
        RXRESETDONE_OUT                 =>      OPEN,
        ----------------- Receive Ports - RX Polarity Control Ports ----------------
        RXPOLARITY_IN                   =>      RXPOLARITY_IN,
        ------------- Shared Ports - Dynamic Reconfiguration Port (DRP) ------------
        DADDR_IN                       => DADDR_IN,
        DCLK_IN                        => DCLK_IN,
        DEN_IN                         => DEN_IN,
        DI_IN                          => DI_IN,
        DRDY_OUT                       => DRDY_OUT,
        DRPDO_OUT                      => DRPDO_OUT,
        DWE_IN                         => DWE_IN,
        ---------------- Transmit Ports - 8b10b Encoder Control Ports --------------
        TXCHARISK_IN                    =>      TXCHARISK_IN,
        ------------------ Transmit Ports - TX Data Path interface -----------------
        TXDATA_IN                       =>      TXDATA_IN,
        TXOUTCLK_OUT                    =>      TXOUTCLK1_OUT,
        TXRESET_IN                      =>      TXRESET_IN,
        TXUSRCLK_IN                     =>      TXUSRCLK_IN,
        TXUSRCLK2_IN                    =>      TXUSRCLK2_IN,
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------
        TXN_OUT                         =>      TX1N_OUT,
        TXP_OUT                         =>      TX1P_OUT,
        --------- Transmit Ports - TX Elastic Buffer and Phase Alignment ---------
        TXBUFSTATUS_OUT(1)              =>      TXBUFERR_OUT ,
        TXBUFSTATUS_OUT(0)              =>      open_txbufstatus,
        ----------------------- Transmit Ports - TX PLL Ports ----------------------
        GTXTXRESET_IN                   =>      GTXRESET_IN,
        MGTREFCLKTX_IN(1)               =>      tied_to_ground_i,
        MGTREFCLKTX_IN(0)               =>      REFCLK, 
        PLLTXRESET_IN                   =>      tied_to_ground_i,
        TXPLLLKDET_OUT                  =>      tx_plllkdet_o,
        TXRESETDONE_OUT                 =>      OPEN
    );

end BEHAVIORAL;  
