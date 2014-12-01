`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:13 10/08/2014 
// Design Name: 
// Module Name:    FrameGenChk_top 
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
module FrameGenChk_top #
(
     parameter   USE_CHIPSCOPE        = 0   
)
(
	 // User IO
    RESET,
	 
    HARD_ERR_1,
    SOFT_ERR_1,
    FRAME_ERR_1,
    ERR_COUNT_1,
	 HARD_ERR_2,
    SOFT_ERR_2,
    FRAME_ERR_2,
    ERR_COUNT_2,

    LANE_UP_1,
    CHANNEL_UP_1,
    LANE_UP_2,
    CHANNEL_UP_2,

	 INIT_CLK_1,
	 INIT_CLK_2,
    GT_RESET_IN,
    GT_REFCLK1_1,
	 GT_REFCLK1_2,
	 
	 io_clk_1,
	 io_clk_2,
    // GT I/O
    RXP1,
    RXN1,
    TXP1,
    TXN1,
	 RXP2,
    RXN2,
    TXP2,
    TXN2
);
//***********************************Port Declarations*******************************
    // User I/O
    input              RESET;
    input              GT_RESET_IN;
	 
    output             HARD_ERR_1;
    output             SOFT_ERR_1;
    output             FRAME_ERR_1;
    output  [0:7]      ERR_COUNT_1;
	 output             HARD_ERR_2;
    output             SOFT_ERR_2;
    output             FRAME_ERR_2;
    output  [0:7]      ERR_COUNT_2;


    output             LANE_UP_1;
    output             CHANNEL_UP_1;
	 output             LANE_UP_2;
    output             CHANNEL_UP_2;
    // Clocks
    input				  GT_REFCLK1_1;
	 input              GT_REFCLK1_2;
	 input				  INIT_CLK_1;
	 input              INIT_CLK_2;
	 input              io_clk_1;
	 input              io_clk_2;

    // GT Serial I/O
    input              RXP1;
    input              RXN1;
    output             TXP1;
    output             TXN1;
	 input              RXP2;
    input              RXN2;
    output             TXP2;
    output             TXN2;

//**************************External Register Declarations****************************
    reg                HARD_ERR_1;
    reg                SOFT_ERR_1;
    reg                FRAME_ERR_1;
    reg     [0:7]      ERR_COUNT_1;   
    reg                LANE_UP_1;
    reg                CHANNEL_UP_1;
	 reg                HARD_ERR_2;
    reg                SOFT_ERR_2;
    reg                FRAME_ERR_2;
    reg     [0:7]      ERR_COUNT_2;   
    reg                LANE_UP_2;
    reg                CHANNEL_UP_2;
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

    wire [35:0] icon_to_vio_i_1;
    wire [63:0] sync_in_i_1;
    wire [15:0] sync_out_i_1;

    wire        lane_up_i_i_1;
    wire        tx_lock_i_i_1;
    wire        lane_up_reduce_i_1;
    wire        rst_cc_module_i_1;

    wire    [0:31]     tied_to_gnd_vec_i_1;
    // TX AXI PDU I/F wires
    wire    [0:31]     tx_data_i_1;
    wire               tx_tvalid_i_1;
    wire               tx_tready_i_1;
    wire    [0:3]      tx_tkeep_i_1;
    wire               tx_tlast_i_1;

    // RX AXI PDU I/F wires
    wire    [0:31]     rx_data_i_1;
    wire               rx_tvalid_i_1;
    wire    [0:3]      rx_tkeep_i_1;
    wire               rx_tlast_i_1;
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

    wire [35:0] icon_to_vio_i_2;
    wire [63:0] sync_in_i_2;
    wire [15:0] sync_out_i_2;

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
        ERR_COUNT_1       <=  err_count_i_1;
        LANE_UP_1         <=  lane_up_i_1;
        CHANNEL_UP_1      <=  channel_up_i_1;
    end
	 
	 always @(posedge user_clk_i_2)
    begin
        HARD_ERR_2      <=  hard_err_i_2;
        SOFT_ERR_2      <=  soft_err_i_2;
        FRAME_ERR_2     <=  frame_err_i_2;
        ERR_COUNT_2       <=  err_count_i_2;
        LANE_UP_2         <=  lane_up_i_2;
        CHANNEL_UP_2      <=  channel_up_i_2;
    end
	 
	 
//_____________________________ FRAME MODULE ________________________________
	 FrameGenChk_Module frame_1
	 (
		  .RESET(system_reset_i_1),
	     .CHANNEL_UP(channel_up_i_1),
	     .USER_CLK(user_clk_i_1),
		  //Frame Gen Ports
	     .AXI4_S_IP_TREADY(tx_tready_i_1),
	     .AXI4_S_OP_TDATA(tx_data_i_1),
	     .AXI4_S_OP_TKEEP(tx_tkeep_i_1),
	     .AXI4_S_OP_TLAST(tx_tlast_i_1),
	     .AXI4_S_OP_TVALID(tx_tvalid_i_1),
	     //Frame Check Ports
	     .AXI4_S_IP_TX_TDATA(rx_data_i_1),
	     .AXI4_S_IP_TX_TKEEP(rx_tkeep_i_1),
	     .AXI4_S_IP_TX_TLAST(rx_tlast_i_1),
	     .AXI4_S_IP_TX_TVALID(rx_tvalid_i_1),
	     .ERR_COUNT(err_count_i_1)
	 );
	 /*
	 FrameGenChk_Module frame_2
	 (
		  .RESET(system_reset_i_2),
	     .CHANNEL_UP(channel_up_i_2),
	     .USER_CLK(user_clk_i_2),
		  //Frame Gen Ports
	     .AXI4_S_IP_TREADY(tx_tready_i_2),
	     .AXI4_S_OP_TDATA(tx_data_i_2),
	     .AXI4_S_OP_TKEEP(tx_tkeep_i_2),
	     .AXI4_S_OP_TLAST(tx_tlast_i_2),
	     .AXI4_S_OP_TVALID(tx_tvalid_i_2),
	     //Frame Check Ports
	     .AXI4_S_IP_TX_TDATA(rx_data_i_2),
	     .AXI4_S_IP_TX_TKEEP(rx_tkeep_i_2),
	     .AXI4_S_IP_TX_TLAST(rx_tlast_i_2),
	     .AXI4_S_IP_TX_TVALID(rx_tvalid_i_2),
	     .ERR_COUNT(err_count_i_2)
	 );
	 */
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
	 
//_____________________________ AURORA MODULE _______________________________	 
	 aurora_looptest aurora_i
	 (
       .RESET(RESET),
	    .GT_RESET_IN(GT_RESET_IN),
	    .INIT_CLK_1(INIT_CLK_1),
		 .INIT_CLK_2(INIT_CLK_2),
	    .GT_REFCLK1_1(GT_REFCLK1_1),
		 .GT_REFCLK1_2(GT_REFCLK1_2),
		 .io_clk_1(io_clk_1),
		 .io_clk_2(io_clk_2),
	    
		 //AURORA_1
	    .hard_err_i_1(hard_err_i_1),
	    .soft_err_i_1(soft_err_i_1),
	    .frame_err_i_1(frame_err_i_1),
	    .lane_up_i_1(lane_up_i_1),
	    .channel_up_i_1(channel_up_i_1),
		 //GT I/O
	    .RXP1(RXP1),
	    .RXN1(RXN1),
	    .TXP1(TXP1),
	    .TXN1(TXN1),
		 //TX Interface
	    .tx_data_i_1(tx_data_i_1),
	    .tx_tvalid_i_1(tx_tvalid_i_1),
	    .tx_tready_i_1(tx_tready_i_1),
	    .tx_tkeep_i_1(tx_tkeep_i_1),
	    .tx_tlast_i_1(tx_tlast_i_1),
		 //RX Interface
	    .rx_data_i_1(rx_data_i_1),
	    .rx_tvalid_i_1(rx_tvalid_i_1),
	    .rx_tkeep_i_1(rx_tkeep_i_1),
	    .rx_tlast_i_1(rx_tlast_i_1),
		 //Clock and reset output signal
	    .user_clk_i_1(user_clk_i_1),
	    .system_reset_i_1(system_reset_i_1),
	    .pll_not_locked_i_1(pll_not_locked_i_1),
	    .tx_lock_i_1(tx_lock_i_1),
	
	    //AURORA_2
	    .hard_err_i_2(hard_err_i_2),
	    .soft_err_i_2(soft_err_i_2),
	    .frame_err_i_2(frame_err_i_2),
	    .lane_up_i_2(lane_up_i_2),
	    .channel_up_i_2(channel_up_i_2),
		 //GT I/O
	    .RXP2(RXP2),
	    .RXN2(RXN2),
	    .TXP2(TXP2),
	    .TXN2(TXN2),
		 //TX Interface
	    .tx_data_i_2(tx_data_i_2),
	    .tx_tvalid_i_2(tx_tvalid_i_2),
	    .tx_tready_i_2(tx_tready_i_2),
	    .tx_tkeep_i_2(tx_tkeep_i_2),
	    .tx_tlast_i_2(tx_tlast_i_2),
		 //RX Interface
	    .rx_data_i_2(rx_data_i_2),
	    .rx_tvalid_i_2(rx_tvalid_i_2),
	    .rx_tkeep_i_2(rx_tkeep_i_2),
	    .rx_tlast_i_2(rx_tlast_i_2),
		 //Clock and reset output signal
	    .user_clk_i_2(user_clk_i_2),
	    .system_reset_i_2(system_reset_i_2),
	    .pll_not_locked_i_2(pll_not_locked_i_2),
	    .tx_lock_i_2(tx_lock_i_2)
	 );
	 
/*	 
generate
if (USE_CHIPSCOPE==1)
begin : chipscope1


assign lane_up_i_i = &lane_up_i;
assign tx_lock_i_i = tx_lock_i;

    // Shared VIO Inputs
        assign  sync_in_i[15:0]         =  tx_d_i;
        assign  sync_in_i[31:16]        =  rx_d_i;
        assign  sync_in_i[39:32]        =  err_count_i;
        assign  sync_in_i[56:40]        =  17'd0;
        assign  sync_in_i[57]           =  frame_err_i;
        assign  sync_in_i[58]           =  soft_err_i;
        assign  sync_in_i[59]           =  hard_err_i;
        assign  sync_in_i[60]           =  tx_lock_i_i;
        assign  sync_in_i[61]           =  pll_not_locked_i;
        assign  sync_in_i[62]           =  channel_up_i;
        assign  sync_in_i[63]           =  lane_up_i_i;

 

  //-----------------------------------------------------------------
  //  VIO core instance
  //-----------------------------------------------------------------
  v6_vio_i i_vio
 
    (
      .control(icon_to_vio_i),
      .clk(user_clk_i),
      .sync_in(sync_in_i),
      .sync_out(sync_out_i)
    );

  //-----------------------------------------------------------------
  //  ICON core instance
  //-----------------------------------------------------------------
  v6_icon_i i_icon
 
    (
      .control0(icon_to_vio_i)
    );
 
                                                                                                                                                                      
end //end USE_CHIPSCOPE=1 generate section
else
begin : no_chipscope1
                                                                                                                                                                      
    // Shared VIO Inputs
        assign  sync_in_i         =  64'h0;

end

 if (USE_CHIPSCOPE==1)
 begin : chipscope2
     // Shared VIO Outputs
 assign  reset_i =   system_reset_i | sync_out_i[0];
 end //end USE_CHIPSCOPE=1 block
 else
 begin: no_chipscope2
     assign  reset_i =   system_reset_i;
 end //end USE_CHIPSCOPE=0 block

endgenerate //End generate for USE_CHIPSCOPE
*/
endmodule
/*
//-------------------------------------------------------------------
//  ICON core module declaration
//-------------------------------------------------------------------
module v6_icon_i
  (
      control0
  );
  output [35:0] control0;
endmodule

//-------------------------------------------------------------------
//  VIO core module declaration
//-------------------------------------------------------------------
module v6_vio_i
  (
    control,
    clk,
    sync_in,
    sync_out
  );
  input  [35:0] control;
  input  clk;
  input  [63:0] sync_in;
  output [15:0] sync_out;
endmodule
*/


