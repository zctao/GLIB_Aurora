`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:33:28 10/20/2014 
// Design Name: 
// Module Name:    aurora_looptest 
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
module aurora_looptest(
	input RESET,
	input GT_RESET_IN,
	input INIT_CLK_1,
	input INIT_CLK_2,
	input GT_REFCLK1_1,
	input GT_REFCLK1_2,
	input io_clk_1,
	input io_clk_2,
	
	//AURORA_1
	output hard_err_i_1,
	output soft_err_i_1,
	output frame_err_i_1,
	output lane_up_i_1,
	output channel_up_i_1,
		//GT I/O
	input  RXP1,
	input  RXN1,
	output TXP1,
	output TXN1,
		//TX Interface
	input  [0:31] tx_data_i_1,
	input         tx_tvalid_i_1,
	output        tx_tready_i_1,
	input  [0:3]  tx_tkeep_i_1,
	input         tx_tlast_i_1,
		//RX Interface
	output [0:31] rx_data_i_1,
	output        rx_tvalid_i_1,
	output [0:3]  rx_tkeep_i_1,
	output        rx_tlast_i_1,
		//Clock and reset output signal
	output user_clk_i_1,
	output system_reset_i_1,
	output pll_not_locked_i_1,
	output tx_lock_i_1,
	
	//AURORA_2
	output hard_err_i_2,
	output soft_err_i_2,
	output frame_err_i_2,
	output lane_up_i_2,
	output channel_up_i_2,
		//GT I/O
	input  RXP2,
	input  RXN2,
	output TXP2,
	output TXN2,
		//TX Interface
	input  [0:31] tx_data_i_2,
	input         tx_tvalid_i_2,
	output        tx_tready_i_2,
	input  [0:3]  tx_tkeep_i_2,
	input         tx_tlast_i_2,
		//RX Interface
	output [0:31] rx_data_i_2,
	output        rx_tvalid_i_2,
	output [0:3]  rx_tkeep_i_2,
	output        rx_tlast_i_2,
		//Clock and reset output signal
	output user_clk_i_2,
	output system_reset_i_2,
	output pll_not_locked_i_2,
	output tx_lock_i_2

    );

	 aurora_test aurora_i_1
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
			.tx_data_i(tx_data_i_1),
			.tx_tvalid_i(tx_tvalid_i_1),
			.tx_tready_i(tx_tready_i_1),
			.tx_tkeep_i(tx_tkeep_i_1),
			.tx_tlast_i(tx_tlast_i_1),
			//RX Interface
			.rx_data_i(rx_data_i_1),
			.rx_tvalid_i(rx_tvalid_i_1),
			.rx_tkeep_i(rx_tkeep_i_1),
			.rx_tlast_i(rx_tlast_i_1),
			//Clock and reset output signal
			.user_clk_i(user_clk_i_1),
			.system_reset_i(system_reset_i_1),
			.pll_not_locked_i(pll_not_locked_i_1),
			.tx_lock_i(tx_lock_i_1)
	 );
	 
	 	 aurora_test aurora_i_2
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



endmodule
