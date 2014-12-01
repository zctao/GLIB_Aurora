`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:02:08 10/20/2014
// Design Name:   FrameGenChk_top
// Module Name:   D:/GLIB Firmware/branches/zttest/Aurora/test6/FrameGenChk_tb.v
// Project Name:  test6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FrameGenChk_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FrameGenChk_tb;

//*************************Parameter Declarations**************************

    parameter       SIM_MAX_TIME  = 525000; //To quit the simulation
    //125.0MHz GTX Reference clock
    parameter       CLOCKPERIOD_1 = 8.0;
    parameter       CLOCKPERIOD_2 = 8.0;
	 
	 
	// Inputs
	reg RESET;
	//reg INIT_CLK_1;
	//reg INIT_CLK_2;
	reg GT_RESET_IN;
	reg GT_REFCLK1_1;
	reg GT_REFCLK1_2;
	reg io_clk_1;
	reg io_clk_2;
	//reg RXP1;
	//reg RXN1;
	//reg RXP2;
	//reg RXN2;

	// Outputs
	wire HARD_ERR_1;
	wire SOFT_ERR_1;
	wire FRAME_ERR_1;
	wire [0:7] ERR_COUNT_1;
	wire HARD_ERR_2;
	wire SOFT_ERR_2;
	wire FRAME_ERR_2;
	wire [0:7] ERR_COUNT_2;
	wire LANE_UP_1;
	wire CHANNEL_UP_1;
	wire LANE_UP_2;
	wire CHANNEL_UP_2;
	wire TXP1;
	wire TXN1;
	wire TXP2;
	wire TXN2;


   //__________________________Global Signals_____________________________
   

    initial
        begin
            //GT_RESET_IN = 1'b0;       
            GT_RESET_IN = 1'b1;
            #(16*CLOCKPERIOD_1);
            GT_RESET_IN = 1'b0;
    end


    //____________________________Clocks____________________________

    initial
        //reference_clk_1_n_r = 1'b0;
		  GT_REFCLK1_1 = 1'b0;

    always 
        //#(CLOCKPERIOD_1 / 2) reference_clk_1_n_r = !reference_clk_1_n_r;
		  #(CLOCKPERIOD_1 / 2) GT_REFCLK1_1 = !GT_REFCLK1_1;
	
    //assign reference_clk_1_p_r = !reference_clk_1_n_r;



    initial
        //reference_clk_2_n_r = 1'b0;
		  GT_REFCLK1_2 = 1'b0;


    always 
        //#(CLOCKPERIOD_2 / 2) reference_clk_2_n_r = !reference_clk_2_n_r;
		  #(CLOCKPERIOD_2 / 2) GT_REFCLK1_2 = !GT_REFCLK1_2;

    //assign reference_clk_2_p_r = !reference_clk_2_n_r;
	 
    initial
        //reference_clk_2_n_r = 1'b0;
		  io_clk_1 = 1'b0;

    always 
        //#(CLOCKPERIOD_2 / 2) reference_clk_2_n_r = !reference_clk_2_n_r;
		  #(CLOCKPERIOD_2 * 2) io_clk_1 = !io_clk_1;
		  
	 initial
        //reference_clk_2_n_r = 1'b0;
		  io_clk_2 = 1'b0;

    always 
        //#(CLOCKPERIOD_2 / 2) reference_clk_2_n_r = !reference_clk_2_n_r;
		  #(CLOCKPERIOD_2 * 2) io_clk_2 = !io_clk_2;




    //____________________________Resets____________________________
   
    initial
    begin
        RESET = 1'b1;
        //#200 RESET = 1'b0;
		  #(16*CLOCKPERIOD_1);
		  RESET = 1'b0;
    end


	// Instantiate the Unit Under Test (UUT)
	FrameGenChk_top uut (
		.RESET(RESET), 
		.HARD_ERR_1(HARD_ERR_1), 
		.SOFT_ERR_1(SOFT_ERR_1), 
		.FRAME_ERR_1(FRAME_ERR_1), 
		.ERR_COUNT_1(ERR_COUNT_1), 
		.HARD_ERR_2(HARD_ERR_2), 
		.SOFT_ERR_2(SOFT_ERR_2), 
		.FRAME_ERR_2(FRAME_ERR_2), 
		.ERR_COUNT_2(ERR_COUNT_2), 
		.LANE_UP_1(LANE_UP_1), 
		.CHANNEL_UP_1(CHANNEL_UP_1), 
		.LANE_UP_2(LANE_UP_2), 
		.CHANNEL_UP_2(CHANNEL_UP_2), 
		.INIT_CLK_1(GT_REFCLK1_1),
      .INIT_CLK_2(GT_REFCLK1_2),		
		.GT_RESET_IN(GT_RESET_IN), 
		.GT_REFCLK1_1(GT_REFCLK1_1),
      .GT_REFCLK1_2(GT_REFCLK1_2),
		.io_clk_1(io_clk_1),
		.io_clk_2(io_clk_2),
		.RXP1(TXP2), 
		.RXN1(TXN2), 
		.TXP1(TXP1), 
		.TXN1(TXN1), 
		.RXP2(TXP1), 
		.RXN2(TXN1), 
		.TXP2(TXP2), 
		.TXN2(TXN2)
	);
	

//Abort the simulation when it reaches to max time limit
initial
begin
  #(SIM_MAX_TIME) $display("\nAURORA_TB : INFO : Reached max. simulation time limit\n");
  $finish;
end
	
	
endmodule

