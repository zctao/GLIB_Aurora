`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:39:50 12/02/2014
// Design Name:   Aurora_test_top
// Module Name:   C:/Users/LabView User/Documents/ztaotest/GLIB_Aurora/prj/cornell_v0_tao2/aurora_top_tb.v
// Project Name:  cornell_v0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Aurora_test_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module aurora_top_tb;

	// Inputs
	reg reset;
	reg init_clk;
	reg gt_refclk;
	reg io_clk;
	reg [0:15] tx_tdata_1;
	reg tx_tvalid_1;
	reg [0:1] tx_tkeep_1;
	reg tx_tlast_1;
	reg [0:15] tx_tdata_2;
	reg tx_tvalid_2;
	reg [0:1] tx_tkeep_2;
	reg tx_tlast_2;

	// Outputs
	wire hard_err_1;
	wire soft_err_1;
	wire frame_err_1;
	wire hard_err_2;
	wire soft_err_2;
	wire frame_err_2;
	wire lane_up_1;
	wire channel_up_1;
	wire lane_up_2;
	wire channel_up_2;
	wire tx_tready_1;
	wire [0:15] rx_tdata_1;
	wire rx_tvalid_1;
	wire [0:1] rx_tkeep_1;
	wire rx_tlast_1;
	wire tx_tready_2;
	wire [0:15] rx_tdata_2;
	wire rx_tvalid_2;
	wire [0:1] rx_tkeep_2;
	wire rx_tlast_2;
	
	wire txp1;
	wire txn1;
	wire txp2;
	wire txn2;
	wire rxp1;
	wire rxn1;
	wire rxp2;
	wire rxn2;
	
	assign rxp1 = txp2;
	assign rxn1 = txn2;
	assign rxp2 = txp1;
	assign rxn2 = txn1;
	
	// Instantiate the Unit Under Test (UUT)
	aurora_test_1 aurora_1
	(
		// User IO
		.RESET(reset),
		.HARD_ERR_I(hard_err_1),
		.SOFT_ERR_I(soft_err_1),
		.FRAME_ERR_I(frame_err_1),
		.LANE_UP_I(lane_up_1),
		.CHANNEL_UP_I(channel_up_1),
		.INIT_CLK(init_clk),
		.GT_RESET_IN(reset),
	 
		.GT_REFCLK1(gt_refclk),
		.IO_CLK(io_clk),
		// GT I/O
		.RXP(rxp1),
		.RXN(rxn1),
		.TXP(txp1),
		.TXN(txn1),
		//TX Interface
		.TX_TDATA_I(tx_tdata_1),
		.TX_TVALID_I(tx_tvalid_1),
		.TX_TREADY_I(tx_tready_1),
		.TX_TKEEP_I(tx_tkeep_1),
		.TX_TLAST_I(tx_tlast_1),
		//RX Interface
		.RX_TDATA_I(rx_tdata_1),
		.RX_TVALID_I(rx_tvalid_1),
		.RX_TKEEP_I(rx_tkeep_1),
		.RX_TLAST_I(rx_tlast_1),
	   //local tvalid signal for latency test
		.LOCAL_TX_TVALID_OUT(),
		.LOCAL_RX_TVALID_OUT()
	);

	aurora_test_2 aurora_2
	(
		// User IO
		.RESET(reset),
		.HARD_ERR_I(hard_err_2),
		.SOFT_ERR_I(soft_err_2),
		.FRAME_ERR_I(frame_err_2),
		.LANE_UP_I(lane_up_2),
		.CHANNEL_UP_I(channel_up_2),
		.INIT_CLK(init_clk),
		.GT_RESET_IN(reset),
	 
		.GT_REFCLK1(gt_refclk),
		.IO_CLK(io_clk),
		// GT I/O
		.RXP(rxp2),
		.RXN(rxn2),
		.TXP(txp2),
		.TXN(txn2),
		//TX Interface
		.TX_TDATA_I(tx_tdata_2),
		.TX_TVALID_I(tx_tvalid_2),
		.TX_TREADY_I(tx_tready_2),
		.TX_TKEEP_I(tx_tkeep_2),
		.TX_TLAST_I(tx_tlast_2),
		//RX Interface
		.RX_TDATA_I(rx_tdata_2),
		.RX_TVALID_I(rx_tvalid_2),
		.RX_TKEEP_I(rx_tkeep_2),
		.RX_TLAST_I(rx_tlast_2),
	   //local tvalid signal for latency test
		.LOCAL_TX_TVALID_OUT(),
		.LOCAL_RX_TVALID_OUT()
	);

	initial begin
		// Initialize Inputs
		reset = 0;
		init_clk = 0;
		gt_refclk = 0;
		io_clk = 0;
		tx_tdata_1 = 0;
		tx_tvalid_1 = 0;
		tx_tkeep_1 = 0;
		tx_tlast_1 = 0;
		tx_tdata_2 = 0;
		tx_tvalid_2 = 0;
		tx_tkeep_2 = 0;
		tx_tlast_2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 1'b1;
		#1000
		reset = 1'b0;
		#1600
		
		tx_tdata_1 = 16'hcafe;
		tx_tvalid_1 = 1'b1;
		tx_tkeep_1 = 2'b11;
		tx_tlast_1 = 1'b0;
		
		#32
		tx_tdata_1 = 16'hbabe;
		tx_tvalid_1 = 1'b1;
		tx_tkeep_1 = 2'b11;
		tx_tlast_1 = 1'b1;
		
		

	end
		
	//clock
	always
		#4 gt_refclk = !gt_refclk;
	
	always
		#16 io_clk = !io_clk;
		
	always
		#8 init_clk = !init_clk;
		
endmodule

