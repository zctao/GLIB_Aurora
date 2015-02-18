///////////////////////////////////////////////////////////////////////////////
// (c) Copyright 2008 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version : 7.1i
//  \   \         Application :
//  /   /         Filename : aurora_8b10b_2_GTP_WRAPPER.v
// /___/   /\     Timestamp : 02/08/2005 09:12:43
// \   \  /  \
//  \___\/\___\
//
////////////////////////////////////////////////////////////////////////////////
//Command:
//Design Name: aurora_8b10b_2_GTP_WRAPPER
//
// Module aurora_8b10b_2_GTP_WRAPPER
// Generated by Xilinx Architecture Wizard
// Written for synthesis tool: XST
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
(* core_generation_info = "aurora_8b10b_2,aurora_8b10b_v8_3,{user_interface=AXI_4_Streaming,backchannel_mode=Sidebands,c_aurora_lanes=1,c_column_used=left,c_gt_clock_1=GTXQ0,c_gt_clock_2=None,c_gt_loc_1=X,c_gt_loc_10=X,c_gt_loc_11=X,c_gt_loc_12=X,c_gt_loc_13=X,c_gt_loc_14=X,c_gt_loc_15=X,c_gt_loc_16=X,c_gt_loc_17=X,c_gt_loc_18=X,c_gt_loc_19=X,c_gt_loc_2=X,c_gt_loc_20=X,c_gt_loc_21=X,c_gt_loc_22=X,c_gt_loc_23=X,c_gt_loc_24=X,c_gt_loc_25=X,c_gt_loc_26=X,c_gt_loc_27=X,c_gt_loc_28=X,c_gt_loc_29=X,c_gt_loc_3=X,c_gt_loc_30=X,c_gt_loc_31=X,c_gt_loc_32=X,c_gt_loc_33=X,c_gt_loc_34=X,c_gt_loc_35=X,c_gt_loc_36=X,c_gt_loc_37=X,c_gt_loc_38=X,c_gt_loc_39=X,c_gt_loc_4=1,c_gt_loc_40=X,c_gt_loc_41=X,c_gt_loc_42=X,c_gt_loc_43=X,c_gt_loc_44=X,c_gt_loc_45=X,c_gt_loc_46=X,c_gt_loc_47=X,c_gt_loc_48=X,c_gt_loc_5=X,c_gt_loc_6=X,c_gt_loc_7=X,c_gt_loc_8=X,c_gt_loc_9=X,c_lane_width=2,c_line_rate=31250,c_nfc=false,c_nfc_mode=IMM,c_refclk_frequency=125000,c_simplex=false,c_simplex_mode=TX,c_stream=false,c_ufc=false,flow_mode=None,interface_mode=Framing,dataflow_config=Duplex}" *)
module aurora_8b10b_2_GTX_WRAPPER #
(

    // Simulation attribute
    parameter   SIM_GTXRESET_SPEEDUP=   0      // Set to 1 to speed up sim reset

)
(

//---------------------- Loopback and Powerdown Ports ----------------------
    LOOPBACK_IN,
//--------------------- Receive Ports - 8b10b Decoder ----------------------
    RXCHARISCOMMA_OUT,
    RXCHARISK_OUT,
    RXDISPERR_OUT,
    RXNOTINTABLE_OUT,
//----------------- Receive Ports - Channel Bonding Ports -----------------
    ENCHANSYNC_IN,
    CHBONDDONE_OUT,
//----------------- Receive Ports - Clock Correction Ports -----------------
    RXBUFERR_OUT,
//------------- Receive Ports - Comma Detection and Alignment --------------
    RXREALIGN_OUT,
    ENMCOMMAALIGN_IN,
    ENPCOMMAALIGN_IN,
//----------------- Receive Ports - RX Data Path interface -----------------
    RXDATA_OUT,
    RXRECCLK1_OUT,
    RXRECCLK2_OUT,
    RXRESET_IN,
    RXUSRCLK_IN,
    RXUSRCLK2_IN,
//----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    RXEQMIX_IN,
    RX1N_IN,
    RX1P_IN,
//--------------- Receive Ports - RX Polarity Control Ports ----------------
    RXPOLARITY_IN,
//----------- Shared Ports - Dynamic Reconfiguration Port (DRP) ------------
    DADDR_IN,
    DCLK_IN,
    DEN_IN,
    DI_IN,
    DRDY_OUT,
    DRPDO_OUT,
    DWE_IN,
//------------------- Shared Ports - Tile and PLL Ports --------------------
    REFCLK,
    GTXRESET_IN,
    PLLLKDET_OUT,
//-------------- Transmit Ports - 8b10b Encoder Control Ports --------------
    TXCHARISK_IN,
//---------------- Transmit Ports - TX Data Path interface -----------------
    TXDATA_IN,
    TXOUTCLK1_OUT,
    TXOUTCLK2_OUT,
    TXRESET_IN,
    TXUSRCLK_IN,
    TXUSRCLK2_IN,
    TXBUFERR_OUT,
//------------- Transmit Ports - TX Driver and OOB signalling --------------
    TX1N_OUT,
    TX1P_OUT,
    LINK_RESET_IN,
    POWERDOWN_IN
);
`define DLY #1
//***************************** Port Declarations *****************************
//---------------------- Loopback and Powerdown Ports ----------------------
 input    [2:0]    LOOPBACK_IN;
//--------------------- Receive Ports - 8b10b Decoder ----------------------
 output  [1:0]  RXCHARISCOMMA_OUT;
 output  [1:0]  RXCHARISK_OUT;
 output  [1:0]  RXDISPERR_OUT;
 output  [1:0]  RXNOTINTABLE_OUT;
//----------------- Receive Ports - Channel Bonding Ports -----------------
 input             ENCHANSYNC_IN;
 output            CHBONDDONE_OUT;
//----------------- Receive Ports - Clock Correction Ports -----------------
 output            RXBUFERR_OUT;
//------------- Receive Ports - Comma Detection and Alignment --------------
 output            RXREALIGN_OUT;
 input             ENMCOMMAALIGN_IN;
 input             ENPCOMMAALIGN_IN;
//----------------- Receive Ports - RX Data Path interface -----------------
output  [15:0]   RXDATA_OUT;
 output            RXRECCLK1_OUT;
 output            RXRECCLK2_OUT;
 input             RXRESET_IN;
 input             RXUSRCLK_IN;
 input             RXUSRCLK2_IN;
//----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
 input   [2:0]     RXEQMIX_IN; 
 input             RX1N_IN; 
 input             RX1P_IN; 
//--------------- Receive Ports - RX Polarity Control Ports ----------------
 input             RXPOLARITY_IN;
//----------- Shared Ports - Dynamic Reconfiguration Port (DRP) ------------
 input   [7:0]     DADDR_IN; 
 input             DCLK_IN; 
 input             DEN_IN; 
 input   [15:0]    DI_IN; 
 output            DRDY_OUT; 
 output  [15:0]    DRPDO_OUT; 
 input             DWE_IN; 
//------------------- Shared Ports - Tile and PLL Ports --------------------
 input             REFCLK;
 input             GTXRESET_IN;
 output            PLLLKDET_OUT;
 input             POWERDOWN_IN;
//-------------- Transmit Ports - 8b10b Encoder Control Ports --------------
 input    [1:0]  TXCHARISK_IN;
//---------------- Transmit Ports - TX Data Path interface -----------------
 input    [15:0]  TXDATA_IN;
 output            TXOUTCLK1_OUT;
 output            TXOUTCLK2_OUT;
 input             TXRESET_IN;
 output            TXBUFERR_OUT;
 input             TXUSRCLK_IN;
 input             TXUSRCLK2_IN;
//------------- Transmit Ports - TX Driver and OOB signalling --------------
 output            TX1N_OUT;
 output            TX1P_OUT;
 input    [1:0]    LINK_RESET_IN;

//***************************** Wire Declarations *****************************
// Ground and VCC signals
 wire               tied_to_ground_i;
 wire    [63:0]     tied_to_ground_vec_i;
 wire               tied_to_vcc_i;
 wire    [63:0]     tied_to_vcc_vec_i;
// floating input port connection signals
 wire    [1:0]      open_rxbufstatus_i;
 wire               open_txbufstatus_i;
// wire to output lock signal
 wire               tx_plllkdet_o;
 wire               rx_plllkdet_o;

// Channel Bonding
 wire     [3:0]    chbondi;
 wire     [3:0]    chbondo;

 wire     [3:0]    chbondi_unused_i;

 wire              rxreset_i;

 wire  [12:0]            gtxtest_w;

//********************************* Main Body of Code**************************
//-------------------------  Static signal Assigments ---------------------  
 assign tied_to_ground_i             = 1'b0;
 assign tied_to_ground_vec_i         = 64'h0000000000000000;
 assign tied_to_vcc_i                = 1'b1;
 assign tied_to_vcc_vec_i            = 64'hffffffffffffffff;

// Assign lock signals
 assign  PLLLKDET_OUT  =   rx_plllkdet_o;

 assign chbondi_unused_i  = 4'b0000;
 assign  CHBONDDONE_OUT = 1'b1;
 assign  chbondi = chbondi_unused_i;

   assign gtxtest_w = {3'b100,4'h0,LINK_RESET_IN[0],LINK_RESET_IN[0],LINK_RESET_IN[0],3'b0};

 assign rxreset_i = RXRESET_IN || LINK_RESET_IN[1];

//------------------------- GTX Instantiations  --------------------------  
aurora_8b10b_2_gtx #
    (
        // Simulation attributes
        .GTX_SIM_GTXRESET_SPEEDUP   (SIM_GTXRESET_SPEEDUP),
       
        // Share RX PLL parameter
        .GTX_TX_CLK_SOURCE          ("RXPLL"),
        // Save power parameter
        .GTX_POWER_SAVE             (10'b0000110100)   
    )
GTXE1_INST
    (
        //---------------------- Loopback and Powerdown Ports ----------------------
        .LOOPBACK_IN                    (LOOPBACK_IN),
        .RXPOWERDOWN_IN                 ({2{POWERDOWN_IN}}),
        .TXPOWERDOWN_IN                 ({2{POWERDOWN_IN}}),
        //--------------------- Receive Ports - 8b10b Decoder ----------------------
        .RXCHARISCOMMA_OUT              (RXCHARISCOMMA_OUT),
        .RXCHARISK_OUT                  (RXCHARISK_OUT),
	.RXDISPERR_OUT                  (RXDISPERR_OUT),
        .RXNOTINTABLE_OUT               (RXNOTINTABLE_OUT),
        //----------------- Receive Ports - Clock Correction Ports -----------------
        .RXCLKCORCNT_OUT                (),
        //------------- Receive Ports - Comma Detection and Alignment --------------
        .RXBYTEREALIGN_OUT              (RXREALIGN_OUT),
        .RXENMCOMMAALIGN_IN             (ENMCOMMAALIGN_IN),
        .RXENPCOMMAALIGN_IN             (ENPCOMMAALIGN_IN),
        //----------------- Receive Ports - RX Data Path interface -----------------
        .RXDATA_OUT                     (RXDATA_OUT),
        .RXRESET_IN                     (rxreset_i),
        .RXUSRCLK2_IN                   (RXUSRCLK2_IN),
        //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
        .RXCDRRESET_IN                  (1'b0),
        .RXEQMIX_IN                     (RXEQMIX_IN),
        .RXN_IN                         (RX1N_IN),
        .RXP_IN                         (RX1P_IN),
        //------ Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
        .RXBUFSTATUS_OUT                ({RXBUFERR_OUT, open_rxbufstatus_i}),
        //---------------------- Receive Ports - RX PLL Ports ----------------------
        .GTXRXRESET_IN                  (GTXRESET_IN),
        .MGTREFCLKRX_IN                 ({tied_to_ground_i , REFCLK}), 
        .PLLRXRESET_IN                  (1'b0),
        .RXPLLLKDET_OUT                 (rx_plllkdet_o),
        .RXRESETDONE_OUT                (),
        //--------------- Receive Ports - RX Polarity Control Ports ----------------
	.RXPOLARITY_IN                  (RXPOLARITY_IN),
        //----------- Shared Ports - Dynamic Reconfiguration Port (DRP) ------------
        .DADDR_IN                       (DADDR_IN),
        .DCLK_IN                        (DCLK_IN),
        .DEN_IN                         (DEN_IN),
        .DI_IN                          (DI_IN),
        .DRDY_OUT                       (DRDY_OUT),
        .DRPDO_OUT                      (DRPDO_OUT),
        .DWE_IN                         (DWE_IN),
        //-------------- Transmit Ports - 8b10b Encoder Control Ports --------------
	.TXCHARISK_IN                   (TXCHARISK_IN),
        //---------------- Transmit Ports - TX Data Path interface -----------------
        .TXDATA_IN                      (TXDATA_IN),
        .TXOUTCLK_OUT                   (TXOUTCLK1_OUT),
        .TXRESET_IN                     (TXRESET_IN),
        .TXUSRCLK2_IN                   (TXUSRCLK2_IN),
        //-------------- Transmit Ports - TX Driver and OOB signaling --------------
        .TXN_OUT                        (TX1N_OUT),
        .TXP_OUT                        (TX1P_OUT),
        //--------- Transmit Ports - TX Elastic Buffer and Phase Alignment ---------
        .TXBUFSTATUS_OUT                ({TXBUFERR_OUT, open_txbufstatus_i}),
        //--------------------- Transmit Ports - TX PLL Ports ----------------------
        .GTXTXRESET_IN                  (GTXRESET_IN),
        .MGTREFCLKTX_IN                 ({tied_to_ground_i , REFCLK}), 
        .PLLTXRESET_IN                  (1'b0),
        .GTXTEST_IN                     (gtxtest_w),
        .TXPLLLKDET_OUT                 (tx_plllkdet_o),
        .TXRESETDONE_OUT                ()
    );

endmodule
