`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:49:44 10/22/2014 
// Design Name: 
// Module Name:    aurora_test_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Aurora_test_top
(
		//aurora_sel?
	
		// User IO
		input  RESET,
	 
		output reg HARD_ERR_1,
		output reg SOFT_ERR_1,
		output reg FRAME_ERR_1,
		//output reg ERR_COUNT_1,
		output reg HARD_ERR_2,
		output reg SOFT_ERR_2,
		output reg FRAME_ERR_2,
		//output ERR_COUNT_2,

		output reg LANE_UP_1,
		output reg CHANNEL_UP_1,
		output reg LANE_UP_2,
		output reg CHANNEL_UP_2,

		input  INIT_CLK_1,
		input  INIT_CLK_2,
		input  GT_RESET_IN,
		input  GT_REFCLK1_1,
		input  GT_REFCLK1_2,
	 
		input  io_clk_1,
		input  io_clk_2,
		// GT I/O
		input  RXP1,
		input  RXN1,
		output TXP1,
		output TXN1,
		input  RXP2,
		input  RXN2,
		output TXP2,
		output TXN2,
		
		//IO Interface
		//TX Interface
	   input [0:31] tx_data,
	   input        tx_tvalid,
	   output       tx_tready,
	   input [0:3]  tx_tkeep,
	   input        tx_tlast,
		//RX Interface
	   output [0:31] rx_data,
	   output        rx_tvalid,
	   output [0:3]  rx_tkeep,
	   output        rx_tlast
);

//********************************Wire Declarations**********************************
    //Aurora_1
	 // Error Detection Interface
    wire               hard_err_i_1;
    wire               soft_err_i_1;
    wire               frame_err_i_1;
    // Status
    wire               channel_up_i_1;
    wire               lane_up_i_1;
    // System Interface
    wire               pll_not_locked_i_1;
    wire               user_clk_i_1;
    wire               reset_i_1;
    wire               tx_lock_i_1;
	 
    wire               system_reset_i_1;
    //Frame check signals
    wire    [0:7]      err_count_i_1;

    //wire [35:0] icon_to_vio_i_1;
    //wire [63:0] sync_in_i_1;
    //wire [15:0] sync_out_i_1;

    wire        lane_up_i_i_1;
    wire        tx_lock_i_i_1;
    wire        lane_up_reduce_i_1;
    wire        rst_cc_module_i_1;

    wire    [0:31]     tied_to_gnd_vec_i_1;
    // TX AXI PDU I/F wires
    //wire    [0:31]     tx_data_i_1;
    //wire               tx_tvalid_i_1;
    //wire               tx_tready_i_1;
    //wire    [0:3]      tx_tkeep_i_1;
    //wire               tx_tlast_i_1;

    // RX AXI PDU I/F wires
    //wire    [0:31]     rx_data_i_1;
    //wire               rx_tvalid_i_1;
    //wire    [0:3]      rx_tkeep_i_1;
    //wire               rx_tlast_i_1;
    reg               lane_up_r_1;
    reg               lane_up_r2_1;
	 
	 //Aurora_2
	 // Error Detection Interface
    wire               hard_err_i_2;
    wire               soft_err_i_2;
    wire               frame_err_i_2;
    // Status
    wire               channel_up_i_2;
    wire               lane_up_i_2;
    // System Interface
    wire               pll_not_locked_i_2;
    wire               user_clk_i_2;
    wire               reset_i_2;
    wire               tx_lock_i_2;
	 
    wire               system_reset_i_2;
    //Frame check signals
    wire    [0:7]      err_count_i_2;

    //wire [35:0] icon_to_vio_i_2;
    //wire [63:0] sync_in_i_2;
    //wire [15:0] sync_out_i_2;

    wire        lane_up_i_i_2;
    wire        tx_lock_i_i_2;
    wire        lane_up_reduce_i_2;
    wire        rst_cc_module_i_2;

    wire    [0:31]     tied_to_gnd_vec_i_2;
    // TX AXI PDU I/F wires
    wire    [0:31]     tx_data_i_2;
    wire               tx_tvalid_i_2;
    wire               tx_tready_i_2;
    wire    [0:3]      tx_tkeep_i_2;
    wire               tx_tlast_i_2;

    // RX AXI PDU I/F wires
    wire    [0:31]     rx_data_i_2;
    wire               rx_tvalid_i_2;
    wire    [0:3]      rx_tkeep_i_2;
    wire               rx_tlast_i_2;
    reg               lane_up_r_2;
    reg               lane_up_r2_2;
	 
//____________________________Register User I/O___________________________________
// Register User Outputs from core.

    always @(posedge user_clk_i_1)
    begin
        HARD_ERR_1      <=  hard_err_i_1;
        SOFT_ERR_1      <=  soft_err_i_1;
        FRAME_ERR_1     <=  frame_err_i_1;
        //ERR_COUNT_1       <=  err_count_i_1;
        LANE_UP_1         <=  lane_up_i_1;
        CHANNEL_UP_1      <=  channel_up_i_1;
    end
	 
	 always @(posedge user_clk_i_2)
    begin
        HARD_ERR_2      <=  hard_err_i_2;
        SOFT_ERR_2      <=  soft_err_i_2;
        FRAME_ERR_2     <=  frame_err_i_2;
        //ERR_COUNT_2       <=  err_count_i_2;
        LANE_UP_2         <=  lane_up_i_2;
        CHANNEL_UP_2      <=  channel_up_i_2;
    end

	 //Aurora Module
	 aurora_test_1 aurora_i_1
	 (
			// User IO
			.RESET(RESET),
			.hard_err_i(hard_err_i_1),
			.soft_err_i(soft_err_i_1),
			.frame_err_i(frame_err_i_1),
			.lane_up_i(lane_up_i_1),
			.channel_up_i(channel_up_i_1),
			.INIT_CLK(INIT_CLK_1),
			.GT_RESET_IN(GT_RESET_IN),
	 
			.GT_REFCLK1(GT_REFCLK1_1),
			.io_clk(io_clk_1),
			// GT I/O
			.RXP(RXP1),
			.RXN(RXN1),
			.TXP(TXP1),
			.TXN(TXN1),
			//TX Interface
			.tx_data_i(tx_data),
			.tx_tvalid_i(tx_tvalid),
			.tx_tready_i(tx_tready),
			.tx_tkeep_i(tx_tkeep),
			.tx_tlast_i(tx_tlast),
			//RX Interface
			.rx_data_i(rx_data),
			.rx_tvalid_i(rx_tvalid),
			.rx_tkeep_i(rx_tkeep),
			.rx_tlast_i(rx_tlast),
			//Clock and reset output signal
			.user_clk_i(user_clk_i_1),
			.system_reset_i(system_reset_i_1),
			.pll_not_locked_i(pll_not_locked_i_1),
			.tx_lock_i(tx_lock_i_1)
	 );
	 
	 aurora_test_2 aurora_i_2
	 (
			// User IO
			.RESET(RESET),
			.hard_err_i(hard_err_i_2),
			.soft_err_i(soft_err_i_2),
			.frame_err_i(frame_err_i_2),
			.lane_up_i(lane_up_i_2),
			.channel_up_i(channel_up_i_2),
			.INIT_CLK(INIT_CLK_2),
			.GT_RESET_IN(GT_RESET_IN),
	 
			.GT_REFCLK1(GT_REFCLK1_2),
			.io_clk(io_clk_2),
			// GT I/O
			.RXP(RXP2),
			.RXN(RXN2),
			.TXP(TXP2),
			.TXN(TXN2),
			//TX Interface
			.tx_data_i(tx_data_i_2),
			.tx_tvalid_i(tx_tvalid_i_2),
			.tx_tready_i(tx_tready_i_2),
			.tx_tkeep_i(tx_tkeep_i_2),
			.tx_tlast_i(tx_tlast_i_2),
			//RX Interface
			.rx_data_i(rx_data_i_2),
			.rx_tvalid_i(rx_tvalid_i_2),
			.rx_tkeep_i(rx_tkeep_i_2),
			.rx_tlast_i(rx_tlast_i_2),
			//Clock and reset output signal
			.user_clk_i(user_clk_i_2),
			.system_reset_i(system_reset_i_2),
			.pll_not_locked_i(pll_not_locked_i_2),
			.tx_lock_i(tx_lock_i_2)
	 );


	 //Connect the second aurora module to loopback buffer instead of frame module
	 Loop_Buf loop_2
	 (
		  .RESET(system_reset_i_2),
	     .USER_CLK(user_clk_i_2),

	     .AXI4_S_IP_TREADY(tx_tready_i_2),
	     .AXI4_S_OP_TDATA(tx_data_i_2),
	     .AXI4_S_OP_TKEEP(tx_tkeep_i_2),
	     .AXI4_S_OP_TLAST(tx_tlast_i_2),
	     .AXI4_S_OP_TVALID(tx_tvalid_i_2),

	     .AXI4_S_IP_TX_TDATA(rx_data_i_2),
	     .AXI4_S_IP_TX_TKEEP(rx_tkeep_i_2),
	     .AXI4_S_IP_TX_TLAST(rx_tlast_i_2),
	     .AXI4_S_IP_TX_TVALID(rx_tvalid_i_2)

	 );

endmodule
