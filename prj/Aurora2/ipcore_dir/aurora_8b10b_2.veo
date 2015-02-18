


//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
// Instantiate the module
aurora_8b10b_2 instance_name (
    .S_AXI_TX_TDATA(S_AXI_TX_TDATA), 
    .S_AXI_TX_TKEEP(S_AXI_TX_TKEEP), 
    .S_AXI_TX_TVALID(S_AXI_TX_TVALID), 
    .S_AXI_TX_TLAST(S_AXI_TX_TLAST), 
    .S_AXI_TX_TREADY(S_AXI_TX_TREADY), 
    .M_AXI_RX_TDATA(M_AXI_RX_TDATA), 
    .M_AXI_RX_TKEEP(M_AXI_RX_TKEEP), 
    .M_AXI_RX_TVALID(M_AXI_RX_TVALID), 
    .M_AXI_RX_TLAST(M_AXI_RX_TLAST), 
    .RXP(RXP), 
    .RXN(RXN), 
    .TXP(TXP), 
    .TXN(TXN), 
    .GT_REFCLK1(GT_REFCLK1), 
    .HARD_ERR(HARD_ERR), 
    .SOFT_ERR(SOFT_ERR), 
    .FRAME_ERR(FRAME_ERR), 
    .CHANNEL_UP(CHANNEL_UP), 
    .LANE_UP(LANE_UP), 
    .WARN_CC(WARN_CC), 
    .DO_CC(DO_CC), 
    .USER_CLK(USER_CLK), 
    .SYNC_CLK(SYNC_CLK), 
    .RESET(RESET), 
    .POWER_DOWN(POWER_DOWN), 
    .LOOPBACK(LOOPBACK), 
    .GT_RESET(GT_RESET), 
    .TX_OUT_CLK(TX_OUT_CLK), 
    .INIT_CLK_IN(INIT_CLK_IN), 
    .RXEQMIX_IN(RXEQMIX_IN), 
    .DADDR_IN(DADDR_IN), 
    .DCLK_IN(DCLK_IN), 
    .DEN_IN(DEN_IN), 
    .DI_IN(DI_IN), 
    .DRDY_OUT(DRDY_OUT), 
    .DRPDO_OUT(DRPDO_OUT), 
    .DWE_IN(DWE_IN), 
    .TX_LOCK(TX_LOCK)
    );


// INST_TAG_END ------ End INSTANTIATION Template ---------