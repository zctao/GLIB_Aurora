`timescale 1ns / 1ps

`include "Constants.txt"

module ST_stub_tagging_top(
	// clocks and reset
	input reset,					// active HI
	input proc_clk,				// processing clock at a multiple of the crossing clock
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

	// define connections between the stub processing module and the tracklet search module
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

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// connect the programming interface
	ST_io_block io_block(
		// clocks and reset
		.reset(reset),						// active HI
		// programming interface
		.io_clk(io_clk),					// programming clock
		.io_sel(io_sel),					// this module is selected for an I/O operation
		.io_addr(io_addr[15:0]),		// memory address, top 16 bits alread consumed
		.io_sync(io_sync),				// start the I/O operation
		.io_rd_en(io_rd_en),				// this is a read operation, enable readback logic
		.io_wr_en(io_wr_en),				// this is a write operation, enable target for one clock
		.io_wr_data(io_wr_data[31:0]),// data to write for write operations
		// outputs
		.io_rd_data(io_rd_data),		// data returned for read operations
		.io_rd_ack(io_rd_ack),			// 'read' data from this module is ready

		// stub memory and fifo for testing with programmed I/O
		//.struct_in_stub(struct_in_stub),
		//.struct_out_stub_a(struct_out_stub_a),
		//.struct_out_stub_b(struct_out_stub_b),
		//.struct_out_stub_c(struct_out_stub_c),
		//.in_stub_adr(in_stub_adr),  // stub mem address of current inner layer stub for this crossing
		//.out_stub_adr(out_stub_adr), // stub mem address of current outer layer stubs for this crossing
		//.struct_stub_cnt(struct_stub_cnt),
		//.stub_cnt_fifo_empty(stub_cnt_fifo_empty), // if not empty, then a set of stubs from a crossing is ready for us
		//.stub_cnt_fifo_rd_en(stub_cnt_fifo_rd_en), // read the stub count data
		
		// links
		.gt_refclk_p(gt_refclk_p),
		.gt_refclk_n(gt_refclk_n),
		.init_clk(init_clk),
		.txp1(txp1),
	   .txn1(txn1),
	   .rxp1(rxp1),
		.rxn1(rxn1),
	   .txp2(txp2),
	   .txn2(txn2),
	   .rxp2(rxp2),
		.rxn2(rxn2)

	);



		
endmodule
