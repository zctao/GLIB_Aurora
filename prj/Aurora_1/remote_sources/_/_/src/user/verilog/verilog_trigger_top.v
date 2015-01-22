`timescale 1ns / 1ps
// verilog_trigger_top
//
// This is the top level verilog module for the L1 trigger. It is called from the
// GLIB system through "user_logic_bench_empty.vhd"
//
// This module connects the GLIB's "ipbus" for programmable I/O. It also connects some
// clock and reset resources.
//
// This module brings in all of the L1 trigger code.

`include "Constants.txt"
`include "Address.txt"

module verilog_trigger_top(
	// clocks and reset
	input reset,					// active HI
	input cross_clk,				// crossing (event) clock
	// programming interface
	// Note: address and data bus sizes are hard coded in "ipbus_package.vhd"
	// inputs
	
	input ipb_clk,					// programming clock
	input ipb_strobe,				// this ipb space is selected for an I/O operation 
	input [31:0] ipb_addr,		// slave address, memory or register
	input ipb_write,				// this is a write operation
	input [31:0] ipb_wdata,		// data to write for write operations
	// outputs
	output [31:0] ipb_rdata,	// data returned for read operations
	output ipb_ack,				// 'write' data has been stored, 'read' data is ready
	output ipb_err,					// '1' if error, '0' if OK?
	//aurora ports
	input  my_gt_refclk_p,
	input  my_gt_refclk_n,
	input  my_init_clk,
	output my_sfp_txp1,
	output my_sfp_txn1,
	input  my_sfp_rxp1,
	input  my_sfp_rxn1,
	output my_sfp_txp2,
	output my_sfp_txn2,
	input  my_sfp_rxp2,
	input  my_sfp_rxn2

  );

	//wire my_gt_refclk;

	// busses of data being read back
	wire [31:0] stub_processing_io_rd_data;
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	// decode high address bits to pick a segment
	// only the first segment currently has any logic
	wire stub_processor_sel;
	assign stub_processor_sel = (ipb_addr[31:28] == 4'b0100);	//ipb space, stub processor segment
	wire tracklet_match_sel;
	assign tracklet_match_sel = (ipb_addr[31:28] == 4'b0101);	//ipb space, tracklet match segment
	wire third_segment_sel;
	assign third_segment_sel  = (ipb_addr[31:28] == 4'b0110);	//ipb space, third (undefined) segment
	wire fourth_segment_sel;
	assign fourth_segment_sel = (ipb_addr[31:28] == 4'b0111);	//ipb space, fourth (undefined) segment
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	// Connect a clock multiplier/divide to scale 'cross_clk' to feasable numbers.
	// Maybe divide the crossing clock down to something like 5 MHz and make the processing clock be 120 MHz.
//!!! figure out how to do this
	// For now, just copy 'cross_clk'
	wire proc_clk;
	assign proc_clk = cross_clk;
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	// connect the "stub processor" segment
	stub_processing_all_modules stub_processing_all_modules(
		// clocks and reset
		.reset(reset),						// active HI
		.proc_clk(proc_clk),				// processing clock at a multiple of the crossing clock
		// programming interface
		// inputs
		.io_clk(ipb_clk),					// programming clock
		.io_sel(stub_processor_sel),	// this module has been selected for an I/O operation
		.io_sync(io_sync),				// start the I/O operation
		.io_addr(ipb_addr[27:0]),		// slave address, memory or register. Top 4 bits already consumed.
		.io_rd_en(io_rd_en),				// this is a read operation, enable readback logic
		.io_wr_en(io_wr_en),				// this is a write operation, enable target for one clock
		.io_wr_data(ipb_wdata[31:0]),	// data to write for write operations
		// outputs
		.io_rd_data(stub_processing_io_rd_data),	// data returned for read operations
		.io_rd_ack(stub_processing_io_rd_ack),		// 'read' data from this module is ready
		//links ports
		.gt_refclk_p(my_gt_refclk_p),
	   .gt_refclk_n(my_gt_refclk_n),
		.init_clk(my_init_clk),
		.txp1(my_sfp_txp1),
	   .txn1(my_sfp_txn1),
	   .rxp1(my_sfp_rxp1),
		.rxn1(my_sfp_rxn1),
	   .txp2(my_sfp_txp2),
	   .txn2(my_sfp_txn2),
	   .rxp2(my_sfp_rxp2),
		.rxn2(my_sfp_rxn2)
	);


	////////////////////////////////////////////////////////////////////////////////////////////////////
	// connect the tracklet match segment
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	// connect the third (undefined) segment

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// connect the fourth (undefined) segment
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	// connect a mux to steer the readback data from one of the segments to the ipbus
	reg [31:0] io_rd_data_reg;
	assign ipb_rdata = io_rd_data_reg;
	// Assert 'io_rd_ack' if any modules below this function assert their 'io_rd_ack'.
	reg io_rd_ack_reg;
	always @(posedge ipb_clk) begin
		io_rd_ack_reg <= io_sync & io_rd_en & (stub_processing_io_rd_ack);
	end

	always @(posedge ipb_clk) begin
		if (stub_processing_io_rd_ack)    io_rd_data_reg <= stub_processing_io_rd_data;
	end
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	// connect a state machine to handle wait states and drive 'ipb_ack'
	IPB_IO_interface IPB_IO_interface(
		// inputs
		.clk(ipb_clk),     	      // IPbus clock
		.res(reset),         	   // Global reset
		.ipb_strobe(ipb_strobe),	// IPbus strobe
		.ipb_write(ipb_write),     // IPbus write
		.io_rd_ack(io_rd_ack_reg),	// verilog ack
		// outputs
		.io_sync(io_sync),       	// An operation is in progress
		.io_rd_en(io_rd_en),			// this is a read operation, enable readback logic
		.io_wr_en(io_wr_en),      	// one cycle long write enable
		.ipb_ack(ipb_ack)        	// one cycle long ack back to IPbus
	);

endmodule

 