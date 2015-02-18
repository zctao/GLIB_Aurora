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
///////////////////////////////////////////////////////////////////////////////
//
//  AURORA_EXAMPLE
//
//  Aurora Generator
//
//
//  Description: Sample Instantiation of a 1 2-byte lane module.
//               Only tests initialization in hardware.
//
//        
`timescale 1 ns / 1 ps
(* core_generation_info = "aurora_8b10b_1,aurora_8b10b_v8_3,{user_interface=AXI_4_Streaming,backchannel_mode=Sidebands,c_aurora_lanes=1,c_column_used=left,c_gt_clock_1=GTXQ0,c_gt_clock_2=None,c_gt_loc_1=1,c_gt_loc_10=X,c_gt_loc_11=X,c_gt_loc_12=X,c_gt_loc_13=X,c_gt_loc_14=X,c_gt_loc_15=X,c_gt_loc_16=X,c_gt_loc_17=X,c_gt_loc_18=X,c_gt_loc_19=X,c_gt_loc_2=X,c_gt_loc_20=X,c_gt_loc_21=X,c_gt_loc_22=X,c_gt_loc_23=X,c_gt_loc_24=X,c_gt_loc_25=X,c_gt_loc_26=X,c_gt_loc_27=X,c_gt_loc_28=X,c_gt_loc_29=X,c_gt_loc_3=X,c_gt_loc_30=X,c_gt_loc_31=X,c_gt_loc_32=X,c_gt_loc_33=X,c_gt_loc_34=X,c_gt_loc_35=X,c_gt_loc_36=X,c_gt_loc_37=X,c_gt_loc_38=X,c_gt_loc_39=X,c_gt_loc_4=X,c_gt_loc_40=X,c_gt_loc_41=X,c_gt_loc_42=X,c_gt_loc_43=X,c_gt_loc_44=X,c_gt_loc_45=X,c_gt_loc_46=X,c_gt_loc_47=X,c_gt_loc_48=X,c_gt_loc_5=X,c_gt_loc_6=X,c_gt_loc_7=X,c_gt_loc_8=X,c_gt_loc_9=X,c_lane_width=2,c_line_rate=31250,c_nfc=false,c_nfc_mode=IMM,c_refclk_frequency=125000,c_simplex=false,c_simplex_mode=TX,c_stream=false,c_ufc=false,flow_mode=None,interface_mode=Framing,dataflow_config=Duplex}" *)
module aurora_test_1 #
(
     //parameter   USE_CHIPSCOPE        = 0,
     parameter   SIM_GTXRESET_SPEEDUP = 1     
)
(
    // User IO
    input  wire RESET,
	 output wire HARD_ERR_I,
	 output wire SOFT_ERR_I,
	 output wire FRAME_ERR_I,

	 output wire LANE_UP_I,
	 output wire CHANNEL_UP_I,

	 input wire INIT_CLK,

    input wire GT_RESET_IN,
	 input wire GT_REFCLK1,
	 
	 input wire IO_CLK,
    // GT I/O
    input wire RXP,
    input wire RXN,
    output wire TXP,
    output wire TXN,
	 //TX Interface
	 input wire [0:15] TX_TDATA_I,
	 input wire TX_TVALID_I,
	 output wire TX_TREADY_I,
	 input wire [0:1] TX_TKEEP_I,
    input wire TX_TLAST_I,
	 //RX Interface
	 output wire [0:15] RX_TDATA_I,
    output wire RX_TVALID_I,
    output wire [0:1] RX_TKEEP_I,
    output wire RX_TLAST_I,
	 //local tvalid signal for latency test
	 output wire LOCAL_TX_TVALID_OUT,
	 output wire LOCAL_RX_TVALID_OUT
);

    // GT Reference Clock Interface
    //wire               GT_REFCLK1;

    // Error Detection Interface
    //wire               HARD_ERR_I;
    //wire               SOFT_ERR_I;
    //wire               FRAME_ERR_I;
    // Status
    //wire               CHANNEL_UP_I;
    //wire               LANE_UP_I;
    // Clock Compensation Control Interface
    wire               warn_cc_i;
    wire               do_cc_i;
    // System Interface
    //wire               pll_not_locked_i;
    //wire               user_clk_i;
    wire               sync_clk_i;
    //wire               reset_i;
    wire               power_down_i;
    wire    [2:0]      loopback_i;
    //wire               tx_lock_i;
    wire               init_clk_i;
    wire    [2:0]     rxeqmix_in_i;
    wire    [7:0]     daddr_in_i;
    wire              dclk_in_i;
    wire              den_in_i;
    wire    [15:0]    di_in_i;
    wire              drdy_out_unused_i;
    wire    [15:0]    drpdo_out_unused_i;
    wire              dwe_in_i;

    wire               tx_out_clk_i;

    wire               gt_reset_i;
    //wire               system_reset_i;
    //Frame check signals
    //wire    [0:7]      err_count_i;

    wire        lane_up_reduce_i;
    wire        rst_cc_module_i;

    wire    [0:15]     tied_to_gnd_vec_i;
    
	 // TX AXI local wires
    wire    [0:15]     local_tx_tdata_i;
    wire               local_tx_tvalid_i;
    wire               local_tx_tready_i;
    wire    [0:1]      local_tx_tkeep_i;
    wire               local_tx_tlast_i;

    // RX AXI local wires
    wire    [0:15]     local_rx_tdata_i;
    wire               local_rx_tvalid_i;
	 //wire               local_rx_tready_i;
    wire    [0:1]      local_rx_tkeep_i;
    wire               local_rx_tlast_i;
	 
    //FIFO reset wire
	 wire               s_tx_aresetn;
	 wire               s_rx_aresetn;
	 
	 assign LOCAL_TX_TVALID_OUT = local_tx_tvalid_i;
	 assign LOCAL_RX_TVALID_OUT = local_rx_tvalid_i;
	 
	 reg               lane_up_r;
    reg               lane_up_r2;
//*********************************Main Body of Code**********************************

  //SLACK registers
  always @ (posedge user_clk_i)
  begin
    lane_up_r    <=  LANE_UP_I;
    lane_up_r2   <=  lane_up_r;
  end

  assign lane_up_reduce_i  = &lane_up_r2;
  assign rst_cc_module_i   = !lane_up_reduce_i;

/*
//_______________________________Clock Buffers_________________________________
 IBUFDS_GTXE1 IBUFDS_GTXE1_CLK1
 (
 .I(GTXQ0_P),
 .IB(GTXQ0_N),
 .CEB(1'b0),
 .O(GT_REFCLK1),
 .ODIV2()
 );
*/
	 //I/O Interface
	 //FIFO reset signal
	 assign s_tx_aresetn = ~system_reset_i;
	 assign s_rx_aresetn = ~system_reset_i;
	 
	 //tx fifo
	 aurora_data_fifo tx_fifo
	 (
		  .m_aclk(user_clk_i),
        .s_aclk(IO_CLK),
        .s_aresetn(s_tx_aresetn),
        .s_axis_tvalid(TX_TVALID_I),
        .s_axis_tready(TX_TREADY_I),
        .s_axis_tdata(TX_TDATA_I),
        .s_axis_tkeep(TX_TKEEP_I),
        .s_axis_tlast(TX_TLAST_I),
        .m_axis_tvalid(local_tx_tvalid_i),
        .m_axis_tready(local_tx_tready_i),
        .m_axis_tdata(local_tx_tdata_i),
        .m_axis_tkeep(local_tx_tkeep_i),
        .m_axis_tlast(local_tx_tlast_i)
	 );
	 
	 //rx fifo
	 aurora_data_fifo rx_fifo
	 (
		  .m_aclk(IO_CLK),
        .s_aclk(user_clk_i),
        .s_aresetn(s_rx_aresetn),
        .s_axis_tvalid(local_rx_tvalid_i),
        //.s_axis_tready(local_rx_tready_i),
        .s_axis_tdata(local_rx_tdata_i),
        .s_axis_tkeep(local_rx_tkeep_i),
        .s_axis_tlast(local_rx_tlast_i),
        .m_axis_tvalid(RX_TVALID_I),
        .m_axis_tready(1'b1/*rx_tready_i*/),
        .m_axis_tdata(RX_TDATA_I),
        .m_axis_tkeep(RX_TKEEP_I),
        .m_axis_tlast(RX_TLAST_I)
	 );


    // Instantiate a clock module for clock division.
    aurora_CLOCK_MODULE clock_module_i
    (
        .GT_CLK(tx_out_clk_i),
        .GT_CLK_LOCKED(tx_lock_i),
        .USER_CLK(user_clk_i),
        .SYNC_CLK(sync_clk_i),
        .PLL_NOT_LOCKED(pll_not_locked_i)
    );

//____________________________Register User I/O___________________________________
// Register User Outputs from core.
//
//    always @(posedge user_clk_i)
//    begin
//        HARD_ERR      <=  HARD_ERR_I;
//        SOFT_ERR      <=  SOFT_ERR_I;
//        FRAME_ERR     <=  FRAME_ERR_I;
//        ERR_COUNT       <=  err_count_i;
//        LANE_UP         <=  LANE_UP_I;
//        CHANNEL_UP      <=  CHANNEL_UP_I;
//    end

//____________________________Tie off unused signals_______________________________

    // System Interface
    assign  tied_to_gnd_vec_i   =   16'd0;
    assign  power_down_i        =   1'b0;
    assign  loopback_i          =   3'b000;

//____________________________GT Ports_______________________________

    assign  rxeqmix_in_i  =  3'b111;
    assign  daddr_in_i  =  8'h0;
    assign  dclk_in_i   =  1'b0;
    assign  den_in_i    =  1'b0;
    assign  di_in_i     =  16'h0;
    assign  dwe_in_i    =  1'b0;
//___________________________Module Instantiations_________________________________
    aurora_8b10b_1 #
    (
        .SIM_GTXRESET_SPEEDUP(SIM_GTXRESET_SPEEDUP)
    )
    aurora_module_i
    (
        // AXI TX Interface
        .S_AXI_TX_TDATA(local_tx_tdata_i),
        .S_AXI_TX_TKEEP(local_tx_tkeep_i),
        .S_AXI_TX_TVALID(local_tx_tvalid_i),
        .S_AXI_TX_TLAST(local_tx_tlast_i),
        .S_AXI_TX_TREADY(local_tx_tready_i),

        // AXI RX Interface
        .M_AXI_RX_TDATA(local_rx_tdata_i),
        .M_AXI_RX_TKEEP(local_rx_tkeep_i),
        .M_AXI_RX_TVALID(local_rx_tvalid_i),
        .M_AXI_RX_TLAST(local_rx_tlast_i),
        // V5 Serial I/O
        .RXP(RXP),
        .RXN(RXN),
        .TXP(TXP),
        .TXN(TXN),
        // V5 Reference Clock Interface
        .GT_REFCLK1(GT_REFCLK1),
        // Error Detection Interface
        .HARD_ERR(HARD_ERR_I),
        .SOFT_ERR(SOFT_ERR_I),
        .FRAME_ERR(FRAME_ERR_I),


        // Status
        .CHANNEL_UP(CHANNEL_UP_I),
        .LANE_UP(LANE_UP_I),
        // Clock Compensation Control Interface
        .WARN_CC(warn_cc_i),
        .DO_CC(do_cc_i),
        // System Interface
        .USER_CLK(user_clk_i),
        .SYNC_CLK(sync_clk_i),
        .RESET(system_reset_i),
        .POWER_DOWN(power_down_i),
        .LOOPBACK(loopback_i),
        .GT_RESET(gt_reset_i),
        .TX_LOCK(tx_lock_i),
        .INIT_CLK_IN(init_clk_i),
        .RXEQMIX_IN(rxeqmix_in_i),
        .DADDR_IN  (daddr_in_i),
        .DCLK_IN   (dclk_in_i),
        .DEN_IN    (den_in_i),
        .DI_IN     (di_in_i),
        .DRDY_OUT  (drdy_out_unused_i),
        .DRPDO_OUT (drpdo_out_unused_i),
        .DWE_IN    (dwe_in_i),
        .TX_OUT_CLK(tx_out_clk_i)
    );

    aurora_STANDARD_CC_MODULE standard_cc_module_i
    (
        .RESET(rst_cc_module_i),
        // Clock Compensation Control Interface
        .WARN_CC(warn_cc_i),
        .DO_CC(do_cc_i),
        // System Interface
        .PLL_NOT_LOCKED(pll_not_locked_i),
        .USER_CLK(user_clk_i)
    );

    aurora_RESET_LOGIC reset_logic_i
    (
        .RESET(RESET),
        .USER_CLK(user_clk_i),
        .INIT_CLK(INIT_CLK),
		  //.INIT_CLK_P(INIT_CLK_P),
        //.INIT_CLK_N(INIT_CLK_N),
        .GT_RESET_IN(GT_RESET_IN),
        .TX_LOCK_IN(tx_lock_i),
        .PLL_NOT_LOCKED(pll_not_locked_i),
        .INIT_CLK_O(init_clk_i),
        .SYSTEM_RESET(system_reset_i),
        .GT_RESET_OUT(gt_reset_i)
    );


endmodule
