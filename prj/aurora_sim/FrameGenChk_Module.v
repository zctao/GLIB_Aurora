module FrameGenChk_Module 
(	
   input  RESET,
	input  CHANNEL_UP,
	input  USER_CLK,
	
	//Frame Gen Ports
	input         AXI4_S_IP_TREADY,
	output [0:31] AXI4_S_OP_TDATA,
	output [0:3]  AXI4_S_OP_TKEEP,
	output        AXI4_S_OP_TLAST,
	output        AXI4_S_OP_TVALID,
	
	//Frame Check Ports
	input  [0:31] AXI4_S_IP_TX_TDATA,
	input  [0:3]  AXI4_S_IP_TX_TKEEP,
	input         AXI4_S_IP_TX_TLAST,
	input         AXI4_S_IP_TX_TVALID,
	output [0:7]  ERR_COUNT
);


//********************************Wire Declarations**********************************
    // LocalLink TX Interface
    wire    [0:31]     tx_d_i;
    wire    [0:1]      tx_rem_i;
    wire               tx_src_rdy_n_i;
    wire               tx_sof_n_i;
    wire               tx_eof_n_i;
    wire               tx_dst_rdy_n_i;
	 
    // LocalLink RX Interface
    wire    [0:31]     rx_d_i;
    wire    [0:1]      rx_rem_i;
    wire               rx_src_rdy_n_i;
    wire               rx_sof_n_i;
    wire               rx_eof_n_i;

    //_____________________________ TX AXI SHIM _______________________________
    aurora_LL_TO_AXI #
    (
       .DATA_WIDTH(32),
       .STRB_WIDTH(4),
       .REM_WIDTH (2)
    )

    frame_gen_ll_to_axi_pdu_i
    (
     // LocalLink input Interface
     .LL_IP_DATA(tx_d_i),
     .LL_IP_SOF_N(tx_sof_n_i),
     .LL_IP_EOF_N(tx_eof_n_i),
     .LL_IP_REM(tx_rem_i),
     .LL_IP_SRC_RDY_N(tx_src_rdy_n_i),
     .LL_OP_DST_RDY_N(tx_dst_rdy_n_i),

     // AXI4-S output signals
     .AXI4_S_OP_TVALID(AXI4_S_OP_TVALID),
     .AXI4_S_OP_TDATA(AXI4_S_OP_TDATA),
     .AXI4_S_OP_TKEEP(AXI4_S_OP_TKEEP),
     .AXI4_S_OP_TLAST(AXI4_S_OP_TLAST),
     .AXI4_S_IP_TREADY(AXI4_S_IP_TREADY)
    );

    //Connect a frame generator to the TX User interface
    aurora_FRAME_GEN frame_gen_i
    (
        // User Interface
        .TX_D(tx_d_i), 
        .TX_REM(tx_rem_i),    
        .TX_SOF_N(tx_sof_n_i),      
        .TX_EOF_N(tx_eof_n_i),
        .TX_SRC_RDY_N(tx_src_rdy_n_i),
        .TX_DST_RDY_N(tx_dst_rdy_n_i),


        // System Interface
        .USER_CLK(USER_CLK),      
        .RESET(RESET),
        .CHANNEL_UP(CHANNEL_UP)
    );
    //_____________________________ RX AXI SHIM _______________________________
    aurora_AXI_TO_LL #
    (
       .DATA_WIDTH(32),
       .STRB_WIDTH(4),
       .REM_WIDTH (2)
    )
    frame_chk_axi_to_ll_pdu_i
    (
     // AXI4-S input signals
     .AXI4_S_IP_TX_TVALID(AXI4_S_IP_TX_TVALID),
     .AXI4_S_IP_TX_TREADY(),
     .AXI4_S_IP_TX_TDATA(AXI4_S_IP_TX_TDATA),
     .AXI4_S_IP_TX_TKEEP(AXI4_S_IP_TX_TKEEP),
     .AXI4_S_IP_TX_TLAST(AXI4_S_IP_TX_TLAST),

     // LocalLink output Interface
     .LL_OP_DATA(rx_d_i),
     .LL_OP_SOF_N(rx_sof_n_i),
     .LL_OP_EOF_N(rx_eof_n_i) ,
     .LL_OP_REM(rx_rem_i) ,
     .LL_OP_SRC_RDY_N(rx_src_rdy_n_i),
     .LL_IP_DST_RDY_N(1'b0),

     // System Interface
     .USER_CLK(USER_CLK),      
     .RESET(RESET),
     .CHANNEL_UP(CHANNEL_UP)
     );

    aurora_FRAME_CHECK frame_check_i
    (
        // User Interface
        .RX_D(rx_d_i), 
        .RX_REM(rx_rem_i),    
        .RX_SOF_N(rx_sof_n_i),      
        .RX_EOF_N(rx_eof_n_i),
        .RX_SRC_RDY_N(rx_src_rdy_n_i),

        // System Interface
        .USER_CLK(USER_CLK),      
        .RESET(RESET),
        .CHANNEL_UP(CHANNEL_UP),
        .ERR_COUNT(ERR_COUNT)
    );   
	 
	 
endmodule