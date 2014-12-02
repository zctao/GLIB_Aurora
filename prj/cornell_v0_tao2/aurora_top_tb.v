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
	reg [0:31] tx_data;
	reg tx_tvalid;
	reg [0:3] tx_tkeep;
	reg tx_tlast;

	// Outputs
	wire HARD_ERR_1;
	wire SOFT_ERR_1;
	wire FRAME_ERR_1;
	wire HARD_ERR_2;
	wire SOFT_ERR_2;
	wire FRAME_ERR_2;
	wire LANE_UP_1;
	wire CHANNEL_UP_1;
	wire LANE_UP_2;
	wire CHANNEL_UP_2;
	wire TXP1;
	wire TXN1;
	wire TXP2;
	wire TXN2;
	wire tx_tready;
	wire [0:31] rx_data;
	wire rx_tvalid;
	wire [0:3] rx_tkeep;
	wire rx_tlast;

	// Instantiate the Unit Under Test (UUT)
	Aurora_test_top uut (
		.RESET(reset), 
		.HARD_ERR_1(HARD_ERR_1), 
		.SOFT_ERR_1(SOFT_ERR_1), 
		.FRAME_ERR_1(FRAME_ERR_1), 
		.HARD_ERR_2(HARD_ERR_2), 
		.SOFT_ERR_2(SOFT_ERR_2), 
		.FRAME_ERR_2(FRAME_ERR_2), 
		.LANE_UP_1(LANE_UP_1), 
		.CHANNEL_UP_1(CHANNEL_UP_1), 
		.LANE_UP_2(LANE_UP_2), 
		.CHANNEL_UP_2(CHANNEL_UP_2), 
		.INIT_CLK_1(init_clk), 
		.INIT_CLK_2(init_clk), 
		.GT_RESET_IN(reset), 
		.GT_REFCLK1_1(gt_refclk), 
		.GT_REFCLK1_2(gt_refclk), 
		.io_clk_1(io_clk), 
		.io_clk_2(io_clk), 
		.RXP1(TXP2), 
		.RXN1(TXN2), 
		.TXP1(TXP1), 
		.TXN1(TXN1), 
		.RXP2(TXP1), 
		.RXN2(TXN1), 
		.TXP2(TXP2), 
		.TXN2(TXN2), 
		.tx_data(tx_data), 
		.tx_tvalid(tx_tvalid), 
		.tx_tready(tx_tready), 
		.tx_tkeep(tx_tkeep), 
		.tx_tlast(tx_tlast), 
		.rx_data(rx_data), 
		.rx_tvalid(rx_tvalid), 
		.rx_tkeep(rx_tkeep), 
		.rx_tlast(rx_tlast)
	);

	initial begin
		// Initialize Inputs
		reset = 0;
		init_clk = 0;
		gt_refclk = 0;
		io_clk = 0;
		tx_data = 0;
		tx_tvalid = 0;
		tx_tkeep = 0;
		tx_tlast = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 1'b1;
		#1000
		reset = 1'b0;
		#16000
		tx_data = 32'hcafebabe;
		tx_tvalid = 1'b1;
		tx_tkeep = 4'b1111;
		tx_tlast = 1'b0;
		//#32
		//tx_data = 0;
		//tx_tvalid = 0;
		//tx_tkeep = 0;
		//tx_tlast = 0;
	end
		
	//clock
	always
		#4 gt_refclk = !gt_refclk;
	
	always
		#16 io_clk = !io_clk;
		
	always
		#8 init_clk = !init_clk;
		
endmodule

