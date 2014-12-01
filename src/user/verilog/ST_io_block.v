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
	output [`STRUCT_STUB_BITS-1:0] struct_in_stub,
	output [`STRUCT_STUB_BITS-1:0] struct_out_stub_a,
	output [`STRUCT_STUB_BITS-1:0] struct_out_stub_b,
	output [`STRUCT_STUB_BITS-1:0] struct_out_stub_c,
	input [`STUB_ADR_BITS-1:0] in_stub_adr,  // stub mem address of current inner layer stub for this crossing
	input [`STUB_ADR_BITS-1:0] out_stub_adr, // stub mem address of current outer layer stubs for this crossing
	output [`STRUCT_STUB_CNT_BITS-1:0] struct_stub_cnt,
	output stub_cnt_fifo_empty, // if not empty, then a set of stubs from a crossing is ready for us
	input stub_cnt_fifo_rd_en, // read the stub count data
		
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
	//Aurora test
	//____________wire/reg declaration_____________
	//IO wire
	wire [0:31] tx_data;
	wire        tx_tvalid;
	wire        tx_tready;
	wire [0:3]  tx_tkeep;
	wire        tx_tlast;
	wire [0:31] rx_data;
	wire        rx_tvalid;
	wire [0:3]  rx_tkeep;
	wire        rx_tlast;
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
	//Aurora operations
	/*wire aurora_wr_data;
	wire aurora_wr_lastd;
	wire aurora_rd_data;
	wire aurora_rd_status;
	*/
	wire data_pack1_sel;
	wire data_pack2_sel;
	wire data_pack3_sel;
	wire data_pack_en_sel;
	wire aurora_rd_data1;
	wire aurora_rd_data2;
	wire aurora_rd_data3;
	wire aurora_rd_stat1;
	wire aurora_rd_stat2;
	wire aurora_rd_stat3;
	
	wire aurora_latency_sel;
	
	wire debug_reg1_sel;
	wire debug_reg2_sel;
	wire debug_reg3_sel;
	
	//////////////////////////////////////////////////////////////////
	/*assign aurora_wr_data = io_wr_en && (io_addr[15:0] == 16'h0001);    //address for write data 0x40120001
	assign aurora_wr_lastd = io_wr_en && (io_addr[15:0] == 16'h0002);   //address for write data with tlast asserted 0x40120002
	assign aurora_rd_data = io_rd_en && (io_addr[15:0] == 16'h0003);    //address for read aurora data 0x40120003
	assign aurora_rd_status = io_rd_en && (io_addr[15:0] == 16'h0004);  //address for read aurora status 0x40120004
	*/
	assign data_pack1_sel = io_sel && (io_addr[15:0] == 16'h0005);  //address for data_pack1_reg 0x40120005
	assign data_pack2_sel = io_sel && (io_addr[15:0] == 16'h0006);  //address for data_pack2_reg 0x40120006
	assign data_pack3_sel = io_sel && (io_addr[15:0] == 16'h0007);  //address for data_pack3_reg 0x40120007
	assign data_pack_en_sel = io_sel && (io_addr[15:0] == 16'h0008);//address for data_pack enab ox40120008
	assign aurora_rd_data1 = io_sel && (io_addr[15:0] == 16'h0009); //address for rdbk_data1_reg 0x40120009
	assign aurora_rd_data2 = io_sel && (io_addr[15:0] == 16'h000a); //address for rdbk_data2_reg 0x4012000a
	assign aurora_rd_data3 = io_sel && (io_addr[15:0] == 16'h000b); //address for rdbk_data3_reg 0x4012000b
	assign aurora_rd_stat1 = io_sel && (io_addr[15:0] == 16'h000c); //address for rdbk_stat1_reg 0x4012000c
	assign aurora_rd_stat2 = io_sel && (io_addr[15:0] == 16'h000d); //address for rdbk_stat2_reg 0x4012000d
	assign aurora_rd_stat3 = io_sel && (io_addr[15:0] == 16'h000e); //address for rdbk_stat3_reg 0x4012000e
	
	assign aurora_latency_sel = io_sel && (io_addr[15:0] == 16'h0013); //address for latency_reg 0x40120013
	
	assign debug_reg1_sel = io_sel && (io_addr[15:0] == 16'h0010);
	assign debug_reg2_sel = io_sel && (io_addr[15:0] == 16'h0011);
	assign debug_reg3_sel = io_sel && (io_addr[15:0] == 16'h0012);
	
	/////////////////////////////////////////////////////////////////////////////
	//latency register
	reg [7:0] latency_reg;
	
	//debug registers
	reg debug_reg1;
	reg debug_reg2;
	reg debug_reg3;
	
	
	
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
	Aurora_test_top aurora_i 
	(
	
		// User IO
		.RESET(reset),
	 
		.HARD_ERR_1(hard_err_1),
		.SOFT_ERR_1(soft_err_1),
		.FRAME_ERR_1(frame_err_1),
		//.ERR_COUNT_1(err_count_1),
		.HARD_ERR_2(hard_err_2),
		.SOFT_ERR_2(soft_err_2),
		.FRAME_ERR_2(frame_err_2),
		//.ERR_COUNT_2(err_count_2),

		.LANE_UP_1(lane_up_1),
		.CHANNEL_UP_1(channel_up_1),
		.LANE_UP_2(lane_up_2),
		.CHANNEL_UP_2(channel_up_2),

		.INIT_CLK_1(init_clk),
		.INIT_CLK_2(init_clk),
		.GT_RESET_IN(reset),
		.GT_REFCLK1_1(gt_refclk),
		.GT_REFCLK1_2(gt_refclk),
	 
		.io_clk_1(io_clk),
		.io_clk_2(io_clk),
		// GT I/O
		.RXP1(rxp1),
		.RXN1(rxn1),
		.TXP1(txp1),
		.TXN1(txn1),
		.RXP2(rxp2),
		.RXN2(rxn2),
		.TXP2(txp2),
		.TXN2(txn2),
		
		//IO Interface
		 //TX Interface
	    .tx_data(tx_data),
	    .tx_tvalid(tx_tvalid),
	    .tx_tready(tx_tready),
	    .tx_tkeep(tx_tkeep),
	    .tx_tlast(tx_tlast),
		 //RX Interface
	    .rx_data(rx_data),
	    .rx_tvalid(rx_tvalid),
	    .rx_tkeep(rx_tkeep),
	    .rx_tlast(rx_tlast)
	);

	//A Timer for latency measurement
	wire [7:0] timer_out;
	
	CLK_Timer clk_counter
	(
		.clk(io_clk),
		.reset(reset),
		.signal1(tx_tvalid),
		.signal2(rx_tvalid),
		.out(timer_out)
	);
	
	always @ (posedge io_clk) latency_reg <= timer_out;


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
	//write aurora
//	initial begin
//		tx_data <= 0;
//		tx_tvalid <= 1'b1;
//		tx_tkeep <= 4'b1111;
//		tx_tlast <= 0;
//	end
	
/*	always @ (posedge io_clk) begin
		if (aurora_wr_data) begin
			tx_data <= io_wr_data;
			tx_tlast <= 1'b0;
			tx_tkeep <= 4'b1111;
		end
		if (aurora_wr_lastd) begin
			tx_data <= io_wr_data;
			tx_tlast <= 1'b1;
			tx_tkeep <= 4'b1111;
		end
	end
*/	
	//write aurora data packet
	reg [31:0] data_pack1_reg;
	reg [31:0] data_pack2_reg;
	reg [31:0] data_pack3_reg;
	reg        data_pack_en_reg;
	reg        data_pack_go;
	reg        data_pack_gone;
	
	Data_FSM data_pack_in(
		//output
		.data(tx_data),
		.last(tx_tlast),
		.valid(tx_tvalid),
		.keep(tx_tkeep),
		//input
		.en(data_pack_go),
		.reset(reset),
		.clk(io_clk),
		.data_1(data_pack1_reg),
		.data_2(data_pack2_reg),
		.data_3(data_pack3_reg)
    );
	
	
	initial begin
		data_pack1_reg <= 32'b0;
		data_pack2_reg <= 32'b0;
		data_pack3_reg <= 32'b0;
		data_pack_go <= 1'b0;
		data_pack_gone <= 1'b0;
		data_pack_en_reg <= 1'b0;
	end
	always @(posedge io_clk) begin
		if (data_pack1_sel && io_wr_en) data_pack1_reg <= io_wr_data;
		if (data_pack2_sel && io_wr_en) data_pack2_reg <= io_wr_data;
		if (data_pack3_sel && io_wr_en) data_pack3_reg <= io_wr_data;
		if (data_pack_en_sel && io_wr_en) data_pack_en_reg <= io_wr_data[0];
		
		if (data_pack_en_reg) begin      //toggle a "go" signal pulse
			if (data_pack_gone ~^ data_pack_go) begin
				data_pack_go <= !data_pack_go;
				data_pack_gone <= 1'b1;
			end
		end else begin
			data_pack_go <= 1'b0;
			data_pack_gone <= 1'b0;
		end
	end
	

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// readback mux
	// If a particular register or memory is addressed, connect that register's or memory's signals
	// to the 'io_rd_data' output. At the same time, assert 'io_rd_ack' to tell downstream muxes to
	// use the 'io_rd_data' from this module as their source of data.
	reg [31:0] io_rd_data_reg;
	
	reg [31:0] rdbk_data1_reg;
	reg [31:0] rdbk_data2_reg;
	reg [31:0] rdbk_data3_reg;
	reg [31:0] rdbk_stat1_reg;
	reg [31:0] rdbk_stat2_reg;
	reg [31:0] rdbk_stat3_reg;
	
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
		if (rx_tvalid == 1'b1) begin
			rdbk_data3_reg <= rx_data;
			rdbk_data2_reg <= rdbk_data3_reg;
			rdbk_data1_reg <= rdbk_data2_reg;
			
			debug_reg1 <= rdbk_data1_reg;
			debug_reg2 <= debug_reg1;
		
			rdbk_stat3_reg <= {tx_tready,rx_tvalid,rx_tlast,rx_tkeep[0:3],hard_err_1,soft_err_1,frame_err_1,lane_up_1,channel_up_1,hard_err_2,soft_err_2,frame_err_2,lane_up_2,channel_up_2,15'b0};
			rdbk_stat2_reg <= rdbk_stat3_reg;
			rdbk_stat1_reg <= rdbk_stat2_reg;
			
			debug_reg3 <= rdbk_stat1_reg;
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
		if (aurora_rd_data1) io_rd_data_reg[31:0] <= rdbk_data1_reg;
		if (aurora_rd_data2) io_rd_data_reg[31:0] <= rdbk_data2_reg;
		if (aurora_rd_data3) io_rd_data_reg[31:0] <= rdbk_data3_reg;
		if (aurora_rd_stat1) io_rd_data_reg[31:0] <= rdbk_stat1_reg;
		if (aurora_rd_stat2) io_rd_data_reg[31:0] <= rdbk_stat2_reg;
		if (aurora_rd_stat3) io_rd_data_reg[31:0] <= rdbk_stat3_reg;
		//input data reg
		if (io_rd_en & data_pack1_sel) io_rd_data_reg[31:0] <= data_pack1_reg;
		if (io_rd_en & data_pack2_sel) io_rd_data_reg[31:0] <= data_pack2_reg;
		if (io_rd_en & data_pack3_sel) io_rd_data_reg[31:0] <= data_pack3_reg;
		//aurora latency reg
		if (io_rd_en & aurora_latency_sel) io_rd_data_reg[31:0] <= {24'b0,latency_reg};
		//debug regs
		if (io_rd_en & debug_reg1_sel) io_rd_data_reg[31:0] <= debug_reg1;
		if (io_rd_en & debug_reg2_sel) io_rd_data_reg[31:0] <= debug_reg2;
		if (io_rd_en & debug_reg3_sel) io_rd_data_reg[31:0] <= debug_reg3;
			
	end


endmodule

