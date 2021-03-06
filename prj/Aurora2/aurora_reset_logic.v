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
//  AURORA RESET LOGIC
//
//
//
//  Description: RESET logic generation using Debouncer
//
//        
`timescale 1 ns / 1 ps
module aurora_RESET_LOGIC
(
    // User IO
    RESET,
    USER_CLK,
	 INIT_CLK,
    //INIT_CLK_P,
    //INIT_CLK_N,
    GT_RESET_IN,
    TX_LOCK_IN,
    PLL_NOT_LOCKED,
    INIT_CLK_O,
    SYSTEM_RESET,
    GT_RESET_OUT
);

`define DLY #1
//***********************************Port Declarations*******************************
    // User I/O
    input              RESET;
    input              USER_CLK;
    input			   INIT_CLK;
	//input              INIT_CLK_P;
    //input              INIT_CLK_N;
    input              GT_RESET_IN;
    input              TX_LOCK_IN;
    input              PLL_NOT_LOCKED;
    output             INIT_CLK_O;
    output             SYSTEM_RESET;
    output             GT_RESET_OUT;

//**************************Internal Register Declarations****************************
    reg     [0:3]      debounce_gt_rst_r;
    reg     [0:3]      reset_debounce_r;
    reg                reset_debounce_r2;
    reg                reset_debounce_r3;
    reg                reset_debounce_r4;

    wire               SYSTEM_RESET;
//********************************Wire Declarations**********************************

//    wire               init_clk_i;
    wire               gt_rst_r;

//*********************************Main Body of Code**********************************


//_________________Debounce the Reset and PMA init signal___________________________
// Simple Debouncer for Reset button. The debouncer has an
// asynchronous reset tied to GT_RESET_IN. This is primarily for simulation, to ensure
// that unknown values are not driven into the reset line

    always @(posedge USER_CLK or posedge gt_rst_r)
        if(gt_rst_r)
            reset_debounce_r    <=  4'b1111;   
        else
            reset_debounce_r    <=  {RESET,reset_debounce_r[0:2]};

    always @ (posedge USER_CLK)
    begin
      reset_debounce_r2 <= &reset_debounce_r;
      reset_debounce_r3 <= reset_debounce_r2 || !TX_LOCK_IN;
      reset_debounce_r4 <= reset_debounce_r3;
    end

    assign SYSTEM_RESET = reset_debounce_r4 || PLL_NOT_LOCKED;

/*
  // Assign an IBUFDS to INIT_CLK
  IBUFDS init_clk_ibufg_i
  (
   .I(INIT_CLK_P),
   .IB(INIT_CLK_N),
   .O(init_clk_i)
  );
*/
/*  IBUF init_clk_ibufg_i
  (
   .I(INIT_CLK),
	.O(init_clk_i)
  );

  assign INIT_CLK_O = init_clk_i;
*/

	assign INIT_CLK_O = INIT_CLK;

// Debounce the GT_RESET_IN signal using the INIT_CLK
    always @(posedge INIT_CLK)
        debounce_gt_rst_r <=  {GT_RESET_IN,debounce_gt_rst_r[0:2]};

    assign  gt_rst_r        =   &debounce_gt_rst_r;
    assign  GT_RESET_OUT    =   gt_rst_r;

endmodule
