`timescale 1ns / 1ps
// ST_io_block
//
// This module provides the programmable I/O interface for the 'ST' function.
//

`include "Constants.txt"
`include "Address.txt"

module ST_io_block(
	// clocks and reset
	input reset,					// active HI
	// programming interface
	// inputs
	input io_clk,					// programming clock
	input io_sel,					// this module has been selected for an I/O operation
	input io_sync,					// start the I/O operation
	input [15:0] io_addr,		// slave address, memory or register. Top 16 bits already consumed.
	input io_rd_en,				// this is a read operation
	input io_wr_en,				// this is a write operation
	input [31:0] io_wr_data,	// data to write for write operations
	// outputs
	output [31:0] io_rd_data,	// data returned for read operations
	output io_rd_ack,				// 'read' data from this module is ready

	// stub memory and fifo for testing with programmed I/O
	//output [`STRUCT_STUB_BITS-1:0] struct_in_stub,
	//output [`STRUCT_STUB_BITS-1:0] struct_out_stub_a,
	//output [`STRUCT_STUB_BITS-1:0] struct_out_stub_b,
	//output [`STRUCT_STUB_BITS-1:0] struct_out_stub_c,
	//input [`STUB_ADR_BITS-1:0] in_stub_adr,  // stub mem address of current inner layer stub for this crossing
	//input [`STUB_ADR_BITS-1:0] out_stub_adr, // stub mem address of current outer layer stubs for this crossing
	//output [`STRUCT_STUB_CNT_BITS-1:0] struct_stub_cnt,
	//output stub_cnt_fifo_empty, // if not empty, then a set of stubs from a crossing is ready for us
	//input stub_cnt_fifo_rd_en, // read the stub count data
		
	//link ports
	input  gt_refclk_p,
	input  gt_refclk_n,
	input  init_clk,
	output txp1,
	output txn1,
	input  rxp1,
   input  rxn1,
	output txp2,
	output txn2,
	input  rxp2,
	input  rxn2

);


   /////////////////////////////////////////////////////////////////////////////////////////////////
	//Aurora Modules
	//____________wire/reg declaration_____________
	//IO wire
	wire [0:15] tx_tdata_1;
	wire        tx_tvalid_1;
	wire        tx_tready_1;
	wire [0:1]  tx_tkeep_1;
	wire        tx_tlast_1;
	wire [0:15] rx_tdata_1;
	wire        rx_tvalid_1;
	wire [0:1]  rx_tkeep_1;
	wire        rx_tlast_1;
	
	wire        local_tx_tvalid_out_1;
	wire			local_rx_tvalid_out_1;
	
	wire [0:15] tx_tdata_2;
	wire        tx_tvalid_2;
	wire        tx_tready_2;
	wire [0:1]  tx_tkeep_2;
	wire        tx_tlast_2;
	wire [0:15] rx_tdata_2;
	wire        rx_tvalid_2;
	wire [0:1]  rx_tkeep_2;
	wire        rx_tlast_2;
	
	wire        local_tx_tvalid_out_2;
	wire			local_rx_tvalid_out_2;
	
	//link status
	wire hard_err_1;
	wire soft_err_1;
	wire frame_err_1;
	wire lane_up_1;
	wire channel_up_1;
	wire hard_err_2;
	wire soft_err_2;
	wire frame_err_2;
	wire lane_up_2;
	wire channel_up_2;
	
	//Aurora reg selection
	//aurora_1
	wire aurora1_datareg1_sel;
	wire aurora1_datareg2_sel;
	wire aurora1_datareg3_sel;
	
	wire aurora1_rdbk_data1_sel;
	wire aurora1_rdbk_data2_sel;
	wire aurora1_rdbk_data3_sel;
	wire aurora1_rdbk_stat1_sel;
	wire aurora1_rdbk_stat2_sel;
	wire aurora1_rdbk_stat3_sel;
	
	//aurora_2
	wire aurora2_datareg1_sel;
	wire aurora2_datareg2_sel;
	wire aurora2_datareg3_sel;
	
	wire aurora2_rdbk_data1_sel;
	wire aurora2_rdbk_data2_sel;
	wire aurora2_rdbk_data3_sel;
	wire aurora2_rdbk_stat1_sel;
	wire aurora2_rdbk_stat2_sel;
	wire aurora2_rdbk_stat3_sel;
	
	//Input state machine control
	wire aurora_en_sel;
	wire fsm_reset_sel;
	
	//Timer output regs
	wire aurora_latency1_sel;
	wire aurora_latency2_sel;
	
	wire aurora_latency3_sel;
	wire aurora_latency4_sel;
	
	/*
	wire aurora_latency_sel;
	wire aurora_latency_lb_sel;
	
	wire [31:0] timer_out;
	*/
	//////////////////////////////////////////////////////////////////
	
	/*assign aurora_wr_data = io_wr_en && (io_addr[15:0] == 16'h0001);    //address for write data 0x40120001
	assign aurora_wr_lastd = io_wr_en && (io_addr[15:0] == 16'h0002);   //address for write data with tlast asserted 0x40120002
	assign aurora_rd_data = io_rd_en && (io_addr[15:0] == 16'h0003);    //address for read aurora data 0x40120003
	assign aurora_rd_status = io_rd_en && (io_addr[15:0] == 16'h0004);  //address for read aurora status 0x40120004

	assign data_pack1_sel = io_sel && (io_addr[15:0] == 16'h0005);  //address for data_pack1_reg 0x40120005
	assign data_pack2_sel = io_sel && (io_addr[15:0] == 16'h0006);  //address for data_pack2_reg 0x40120006
	assign data_pack3_sel = io_sel && (io_addr[15:0] == 16'h0007);  //address for data_pack3_reg 0x40120007
	assign aurora1_en_sel = io_sel && (io_addr[15:0] == 16'h0008);//address for data_pack enab ox40120008
	assign aurora_rd_data1 = io_sel && (io_addr[15:0] == 16'h0009); //address for rdbk_data1_reg 0x40120009
	assign aurora_rd_data2 = io_sel && (io_addr[15:0] == 16'h000a); //address for rdbk_data2_reg 0x4012000a
	assign aurora_rd_data3 = io_sel && (io_addr[15:0] == 16'h000b); //address for rdbk_data3_reg 0x4012000b
	assign aurora_rd_stat1 = io_sel && (io_addr[15:0] == 16'h000c); //address for rdbk_stat1_reg 0x4012000c
	assign aurora_rd_stat2 = io_sel && (io_addr[15:0] == 16'h000d); //address for rdbk_stat2_reg 0x4012000d
	assign aurora_rd_stat3 = io_sel && (io_addr[15:0] == 16'h000e); //address for rdbk_stat3_reg 0x4012000e
	*/
	assign aurora_latency1_sel = io_sel && (io_addr[15:0] == 16'h0013);  //address for latency_reg1 0x40120013
	assign aurora_latency2_sel = io_sel && (io_addr[15:0] == 16'h0014);  //address for latency_reg2 0x40120014
	assign aurora_latency3_sel = io_sel && (io_addr[15:0] == 16'h0015);  //address for latency_reg3 0x40120015
	assign aurora_latency4_sel = io_sel && (io_addr[15:0] == 16'h0016);  //address for latency_reg4 0x40120016
	/*
	assign debug_reg1_sel = io_sel && (io_addr[15:0] == 16'h0010);
	assign debug_reg2_sel = io_sel && (io_addr[15:0] == 16'h0011);
	assign debug_reg3_sel = io_sel && (io_addr[15:0] == 16'h0012);
	*/
	
	//All the following need to be added into the address table
	assign aurora_en_sel = io_sel && (io_addr[15:0] == 16'h0020);
	assign fsm_reset_sel = io_sel && (io_addr[15:0] == 16'h0030);
	
	//Aurora 1
	assign aurora1_datareg1_sel = io_sel && (io_addr[15:0] == 16'h0021);
	assign aurora1_datareg2_sel = io_sel && (io_addr[15:0] == 16'h0022);
	assign aurora1_datareg3_sel = io_sel && (io_addr[15:0] == 16'h0023);
	
	assign aurora1_rdbk_data1_sel = io_sel && (io_addr[15:0] == 16'h0024);
	assign aurora1_rdbk_data2_sel = io_sel && (io_addr[15:0] == 16'h0025);
	assign aurora1_rdbk_data3_sel = io_sel && (io_addr[15:0] == 16'h0026);
	assign aurora1_rdbk_stat1_sel = io_sel && (io_addr[15:0] == 16'h0027);
	assign aurora1_rdbk_stat2_sel = io_sel && (io_addr[15:0] == 16'h0028);
	assign aurora1_rdbk_stat3_sel = io_sel && (io_addr[15:0] == 16'h0029);

	//Aurora 2
	assign aurora2_datareg1_sel = io_sel && (io_addr[15:0] == 16'h0031);
	assign aurora2_datareg2_sel = io_sel && (io_addr[15:0] == 16'h0032);
	assign aurora2_datareg3_sel = io_sel && (io_addr[15:0] == 16'h0033);
	
	assign aurora2_rdbk_data1_sel = io_sel && (io_addr[15:0] == 16'h0034);
	assign aurora2_rdbk_data2_sel = io_sel && (io_addr[15:0] == 16'h0035);
	assign aurora2_rdbk_data3_sel = io_sel && (io_addr[15:0] == 16'h0036);
	assign aurora2_rdbk_stat1_sel = io_sel && (io_addr[15:0] == 16'h0037);
	assign aurora2_rdbk_stat2_sel = io_sel && (io_addr[15:0] == 16'h0038);
	assign aurora2_rdbk_stat3_sel = io_sel && (io_addr[15:0] == 16'h0039);
	
	/////////////////////////////////////////////////////////////////////////////
	
	/*
	//latency register
	reg [31:0] latency_reg1;
	reg [31:0] latency_reg2;
	//debug registers
	reg debug_reg1;
	reg debug_reg2;
	reg debug_reg3;
	*/
	
	
	//_______________________________Clock Buffers_________________________________
	wire gt_refclk;
	//wire gt_refclk_1;
	//wire gt_refclk_2;
	
	IBUFDS_GTXE1 IBUFDS_GTXE1_CLK1
	(
		.I(gt_refclk_p),
		.IB(gt_refclk_n),
		.CEB(1'b0),
		.O(gt_refclk),
		.ODIV2()
	);
	
	
	//_____________________________ AURORA MODULE _______________________________	 
	aurora_test_1 aurora_i_1
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
		.LOCAL_TX_TVALID_OUT(local_tx_tvalid_out_1),
		.LOCAL_RX_TVALID_OUT(local_rx_tvalid_out_1)
	);
	
	aurora_test_2 aurora_i_2
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
		.LOCAL_TX_TVALID_OUT(local_tx_tvalid_out_2),
		.LOCAL_RX_TVALID_OUT(local_rx_tvalid_out_2)
	);

/*	///////////////////////////////////////////////////////////////////////////////////////////////
	//a test register
	reg [31:0] my_test_reg;
	wire my_test_addr;
	wire my_test_sel;
	
	assign my_test_addr = (io_addr[15:0] == 16'h000f);
	assign my_test_sel = io_sel && my_test_addr;
	
	initial begin
		my_test_reg = 32'h12345678;
	end
	
	always @(posedge io_clk) begin
		if (my_test_sel && io_wr_en) my_test_reg <= io_wr_data;
		//if (my_test_sel && io_rd_en) io_rd_data_mytestreg <= my_test_reg;
	end*/
	
   /////////////////////////////////////////////////////////////////////////////////////////////////////////
	//write aurora data packet
	reg [1:0]  aurora_en;    //01: enable aurora module 1; 10: enable aurora module 2; 11: enable both; 00: enable neither
	reg        reset_fsm;
	
	reg [15:0] aurora1_datareg1;
	reg [15:0] aurora1_datareg2;
	reg [15:0] aurora1_datareg3;

	reg [15:0] aurora2_datareg1;
	reg [15:0] aurora2_datareg2;
	reg [15:0] aurora2_datareg3;

	Data_FSM aurora1_data_in(
		//output
		.data(tx_tdata_1),
		.last(tx_tlast_1),
		.valid(tx_tvalid_1),
		.keep(tx_tkeep_1),
		//input
		.en(aurora_en[0]),
		.reset(reset_fsm),
		.clk(io_clk),
		.data_1(aurora1_datareg1),
		.data_2(aurora1_datareg2),
		.data_3(aurora1_datareg3)
    );
	 
	 Data_FSM aurora2_data_in(
		//output
		.data(tx_tdata_2),
		.last(tx_tlast_2),
		.valid(tx_tvalid_2),
		.keep(tx_tkeep_2),
		//input
		.en(aurora_en[1]),
		.reset(reset_fsm),
		.clk(io_clk),
		.data_1(aurora2_datareg1),
		.data_2(aurora2_datareg2),
		.data_3(aurora2_datareg3)
    );
	
	
	initial begin
		aurora1_datareg1 <= 16'b0;
		aurora1_datareg2 <= 16'b0;
		aurora1_datareg3 <= 16'b0;
		aurora2_datareg1 <= 16'b0;
		aurora2_datareg2 <= 16'b0;
		aurora2_datareg3 <= 16'b0;
		aurora_en <= 2'b0;
		reset_fsm <= 1'b0;
	end
	always @(posedge io_clk) begin
		if (aurora_en_sel && io_wr_en) aurora_en <= io_wr_data[1:0];
		if (fsm_reset_sel && io_wr_en) reset_fsm <= io_wr_data[0];
		
		if (aurora1_datareg1_sel && io_wr_en) aurora1_datareg1 <= io_wr_data[15:0];
		if (aurora1_datareg2_sel && io_wr_en) aurora1_datareg2 <= io_wr_data[15:0];
		if (aurora1_datareg3_sel && io_wr_en) aurora1_datareg3 <= io_wr_data[15:0];
		
		if (aurora2_datareg1_sel && io_wr_en) aurora2_datareg1 <= io_wr_data[15:0];
		if (aurora2_datareg2_sel && io_wr_en) aurora2_datareg2 <= io_wr_data[15:0];
		if (aurora2_datareg3_sel && io_wr_en) aurora2_datareg3 <= io_wr_data[15:0];
	end


	//Timer
	wire [31:0] latency_1to2;
	wire [31:0] latency_2to1;
	wire [31:0] latency_1to2_local;
	wire [31:0] latency_2to1_local;
	
	reg  [31:0] latency_1to2_reg;
	reg  [31:0] latency_2to1_reg;
	reg  [31:0] latency_1to2_local_reg;
	reg  [31:0] latency_2to1_local_reg;
	
	CLK_Timer timer_1to2  //measure latency from tx_tvalid_1 to rx_tvalid_2
	(
		.clk(init_clk),
		.reset(reset_fsm),   //use state machine reset signal also to reset timer
		.signal1(tx_tvalid_1),
		.signal2(rx_tvalid_2),
		.out(latency_1to2)
	);
	
	CLK_Timer timer_2to1  //measure latency from tx_tvalid_2 to rx_tvalid_1
	(
		.clk(init_clk),
		.reset(reset_fsm),   //use state machine reset signal also to reset timer
		.signal1(tx_tvalid_2),
		.signal2(rx_tvalid_1),
		.out(latency_2to1)
	);
	
	CLK_Timer timer_local_1to2  //measure latency from tx_tvalid_1 to rx_tvalid_2 directly from aurora core (without FIFO buffer)
	(
		.clk(init_clk),
		.reset(reset_fsm),   //use state machine reset signal also to reset timer
		.signal1(local_tx_tvalid_out_1),
		.signal2(local_rx_tvalid_out_2),
		.out(latency_1to2_local)
	);
	
	CLK_Timer timer_local_2to1  //measure latency from tx_tvalid_2 to rx_tvalid_1 directly from aurora core (without FIFO buffer)
	(
		.clk(init_clk),
		.reset(reset_fsm),   //use state machine reset signal also to reset timer
		.signal1(local_tx_tvalid_out_2),
		.signal2(local_rx_tvalid_out_1),
		.out(latency_2to1_local)
	);


	always @ (posedge io_clk) begin
		latency_1to2_reg <= latency_1to2;
		latency_2to1_reg <= latency_2to1;
		latency_1to2_local_reg <= latency_1to2_local;
		latency_2to1_local_reg <= latency_2to1_local;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// readback mux
	// If a particular register or memory is addressed, connect that register's or memory's signals
	// to the 'io_rd_data' output. At the same time, assert 'io_rd_ack' to tell downstream muxes to
	// use the 'io_rd_data' from this module as their source of data.
	reg [31:0] io_rd_data_reg;
	
	reg [31:0] aurora1_rdbk_data1_reg;
	reg [31:0] aurora1_rdbk_data2_reg;
	reg [31:0] aurora1_rdbk_data3_reg;
	reg [31:0] aurora1_rdbk_stat1_reg;
	reg [31:0] aurora1_rdbk_stat2_reg;
	reg [31:0] aurora1_rdbk_stat3_reg;
	
	reg [31:0] aurora2_rdbk_data1_reg;
	reg [31:0] aurora2_rdbk_data2_reg;
	reg [31:0] aurora2_rdbk_data3_reg;
	reg [31:0] aurora2_rdbk_stat1_reg;
	reg [31:0] aurora2_rdbk_stat2_reg;
	reg [31:0] aurora2_rdbk_stat3_reg;
	
	//reg [31:0] rdbk_data_dly;
	//reg [31:0] rdbk_stat_dly;
	
	assign io_rd_data[31:0] = io_rd_data_reg[31:0];
	// Assert 'io_rd_ack' if chip select for this module is asserted during a 'read' operation.
	reg io_rd_ack_reg;
	assign io_rd_ack = io_rd_ack_reg;
	always @(posedge io_clk) begin
		io_rd_ack_reg <= io_sync & io_sel & io_rd_en;
		
		//read aurora data packet
		//rdbk_data_dly <= rx_data;
		//rdbk_stat_dly <= {tx_tready,rx_tvalid,rx_tlast,rx_tkeep[0:3],hard_err_1,soft_err_1,frame_err_1,lane_up_1,channel_up_1,hard_err_2,soft_err_2,frame_err_2,lane_up_2,channel_up_2,15'b0};
		if (rx_tvalid_1 == 1'b1) begin
			aurora1_rdbk_data3_reg <= {16'b0,rx_tdata_1};
			aurora1_rdbk_data2_reg <= aurora1_rdbk_data3_reg;
			aurora1_rdbk_data1_reg <= aurora1_rdbk_data2_reg;
			
			aurora1_rdbk_stat3_reg <= {20'b0,tx_tready_1,rx_tvalid_1,rx_tlast_1,2'b0,rx_tkeep_1[0:1],hard_err_1,soft_err_1,frame_err_1,lane_up_1,channel_up_1};
			aurora1_rdbk_stat2_reg <= aurora1_rdbk_stat3_reg;
			aurora1_rdbk_stat1_reg <= aurora1_rdbk_stat2_reg;
		end
		
		if (rx_tvalid_2 == 1'b1) begin
			aurora2_rdbk_data3_reg <= {16'b0,rx_tdata_2};
			aurora2_rdbk_data2_reg <= aurora2_rdbk_data3_reg;
			aurora2_rdbk_data1_reg <= aurora2_rdbk_data2_reg;
			
			aurora2_rdbk_stat3_reg <= {20'b0,tx_tready_2,rx_tvalid_2,rx_tlast_2,2'b0,rx_tkeep_2[0:1],hard_err_2,soft_err_2,frame_err_2,lane_up_2,channel_up_2};
			aurora2_rdbk_stat2_reg <= aurora2_rdbk_stat3_reg;
			aurora2_rdbk_stat1_reg <= aurora2_rdbk_stat2_reg;
		end
		
	end
	// Route the selected memory to the 'rdbk' output.
	always @(posedge io_clk) begin
//		if (io_rd_en & in_stub_mem_sel) io_rd_data_reg[31:0] <= in_stub_mem_rd_data;	
//		if (io_rd_en & out_stub_mem_a_sel) io_rd_data_reg[31:0] <= out_stub_mem_a_rd_data;
//		if (io_rd_en & out_stub_mem_b_sel) io_rd_data_reg[31:0] <= out_stub_mem_b_rd_data;
//		if (io_rd_en & out_stub_mem_c_sel) io_rd_data_reg[31:0] <= out_stub_mem_c_rd_data;	
		
		//if (io_rd_en & my_test_sel) io_rd_data_reg[31:0] <= my_test_reg;
		
		//read aurora
		/*if (aurora_rd_data) io_rd_data_reg[31:0] <= rx_data;
		if (aurora_rd_status) io_rd_data_reg[31:0] <= {tx_tready,rx_tvalid,rx_tlast,rx_tkeep[0:3],hard_err_1,soft_err_1,frame_err_1,lane_up_1,channel_up_1,hard_err_2,soft_err_2,frame_err_2,lane_up_2,channel_up_2,15'b0};		
		*/
		//Aurora 1
		if (io_rd_en & aurora1_rdbk_data1_sel) io_rd_data_reg[31:0] <= aurora1_rdbk_data1_reg;
		if (io_rd_en & aurora1_rdbk_data2_sel) io_rd_data_reg[31:0] <= aurora1_rdbk_data2_reg;
		if (io_rd_en & aurora1_rdbk_data3_sel) io_rd_data_reg[31:0] <= aurora1_rdbk_data3_reg;
		if (io_rd_en & aurora1_rdbk_stat1_sel) io_rd_data_reg[31:0] <= aurora1_rdbk_stat1_reg;
		if (io_rd_en & aurora1_rdbk_stat2_sel) io_rd_data_reg[31:0] <= aurora1_rdbk_stat2_reg;
		if (io_rd_en & aurora1_rdbk_stat3_sel) io_rd_data_reg[31:0] <= aurora1_rdbk_stat3_reg;
		//Aurora 2
		if (io_rd_en & aurora2_rdbk_data1_sel) io_rd_data_reg[31:0] <= aurora2_rdbk_data1_reg;
		if (io_rd_en & aurora2_rdbk_data2_sel) io_rd_data_reg[31:0] <= aurora2_rdbk_data2_reg;
		if (io_rd_en & aurora2_rdbk_data3_sel) io_rd_data_reg[31:0] <= aurora2_rdbk_data3_reg;
		if (io_rd_en & aurora2_rdbk_stat1_sel) io_rd_data_reg[31:0] <= aurora2_rdbk_stat1_reg;
		if (io_rd_en & aurora2_rdbk_stat2_sel) io_rd_data_reg[31:0] <= aurora2_rdbk_stat2_reg;
		if (io_rd_en & aurora2_rdbk_stat3_sel) io_rd_data_reg[31:0] <= aurora2_rdbk_stat3_reg;
		
		//input data reg
		if (io_rd_en & aurora1_datareg1_sel) io_rd_data_reg[31:0] <= aurora1_datareg1;
		if (io_rd_en & aurora1_datareg2_sel) io_rd_data_reg[31:0] <= aurora1_datareg2;
		if (io_rd_en & aurora1_datareg3_sel) io_rd_data_reg[31:0] <= aurora1_datareg3;
		
		if (io_rd_en & aurora2_datareg1_sel) io_rd_data_reg[31:0] <= aurora2_datareg1;
		if (io_rd_en & aurora2_datareg2_sel) io_rd_data_reg[31:0] <= aurora2_datareg2;
		if (io_rd_en & aurora2_datareg3_sel) io_rd_data_reg[31:0] <= aurora2_datareg3;
		//aurora latency reg
		if (io_rd_en & aurora_latency1_sel) io_rd_data_reg[31:0] <= latency_1to2_reg;
		if (io_rd_en & aurora_latency2_sel) io_rd_data_reg[31:0] <= latency_2to1_reg;
		if (io_rd_en & aurora_latency3_sel) io_rd_data_reg[31:0] <= latency_1to2_local_reg;
		if (io_rd_en & aurora_latency4_sel) io_rd_data_reg[31:0] <= latency_2to1_local_reg;
		//debug regs
		//if (io_rd_en & debug_reg1_sel) io_rd_data_reg[31:0] <= debug_reg1;
		//if (io_rd_en & debug_reg2_sel) io_rd_data_reg[31:0] <= debug_reg2;
		//if (io_rd_en & debug_reg3_sel) io_rd_data_reg[31:0] <= debug_reg3;
			
	end


endmodule

