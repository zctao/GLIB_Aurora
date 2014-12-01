`timescale 1ns / 1ps
// TS_controller
//
// This module controls all of the logic for the TS (Tracklet Search) block.
//

`include "Constants.txt"

module TS_controller(
	//inputs
	input clk,								// fast processing clock
	input reset,							// reset, assert and negate synched to clk
	input stub_cnt_fifo_empty,			// if not empty, then a new crossing is ready for processing
	input in_stub_cnt_is_zero,			// there are no more stubs to look at for the inner layer
	input out_stub_cnt_is_zero_a,		// there are no more stubs to look at for outer layer module 'a'
	input out_stub_cnt_is_zero_b,		// there are no more stubs to look at for outer layer module 'b'
	input out_stub_cnt_is_zero_c,		// there are no more stubs to look at for outer layer module 'c'
	// outputs
	output stub_cnt_fifo_rd_en,		// read the crossing parameters from the input fifo
	output in_stub_adr_ld_en,			// load the stub memory address of the first inner layer stub 
	output in_stub_cntr_ld_en,			// load the stub counter for the inner layer stubs

	output out_stub_adr_ld_en,			// load the stub memory address of the first outer layer stub
	output in_stub_adr_cnt_en,			// increment the stub memory address for the inner layer stubs
	output out_stub_adr_cnt_en,		// increment the stub memory address for the outer layer stubs
	output out_stub_cntr_ld_en,		// load the stub counters for the outer layer stubs
	output in_stub_cntr_cnt_en,		// decrement the stub counter for the inner layer stubs
	output out_stub_cntr_cnt_en,		// decrement the stub counters for the outer layer stubs 
	output en_comp_a,						// enable possible output FIFO writing for outer layer module 'a' 
	output en_comp_b,						// enable possible output FIFO writing for outer layer module 'b'
	output en_comp_c,						// enable possible output FIFO writing for outer layer module 'c'
	output tracklet_cnt_clr,			// clear the accumulated counts from the last crossing
	output tracklet_cnt_fifo_wr_en	// when done, store the final count
);

	wire cross_proc_sm_bsy;			// if busy, a previous crossing is being processed
	wire start_cross_proc_sm;			// enable processing of this crossing
	wire comparitor_en;					// allow comparison and tracklet writing for valid outer layer stubs
	
	// allow comparison and tracklet writing for valid outer layer stubs
	assign en_comp_a = comparitor_en & !out_stub_cnt_is_zero_a;
	assign en_comp_b = comparitor_en & !out_stub_cnt_is_zero_b;
	assign en_comp_c = comparitor_en & !out_stub_cnt_is_zero_c;

	// signal when all outer layer stub counts are zero
	wire all_out_stub_cnt_zero;
	assign all_out_stub_cnt_zero = out_stub_cnt_is_zero_a & out_stub_cnt_is_zero_b & out_stub_cnt_is_zero_c;

	// Connect a state machine that will set up stuff when we start processing a new crossing
	TS_start_new_cross_sm start_new_cross_sm(
		// inputs
		.clk(clk), .res(reset), .stub_cnt_fifo_empty(stub_cnt_fifo_empty), .proc_sm_bsy(cross_proc_sm_bsy),
		// outputs
		.fifo_rd_en(stub_cnt_fifo_rd_en), .tracklet_cnt_clr(tracklet_cnt_clr), .stub_adr_ld_en(in_stub_adr_ld_en),
		.stub_cntr_ld_en(in_stub_cntr_ld_en), .start_proc(start_cross_proc_sm)
	);

	// Connect a state machine that will process a crossing
	TS_process_cross_sm process_cross_sm(
		// inputs
		.clk(clk), .res(reset), .start_cross_proc_sm(start_cross_proc_sm),
		.in_stub_cnt_is_zero(in_stub_cnt_is_zero), .all_out_stub_cnt_zero(all_out_stub_cnt_zero),
		// outputs
		.cross_proc_sm_bsy(cross_proc_sm_bsy),
		.out_stub_adr_ld_en(out_stub_adr_ld_en),
		.out_stub_cntr_ld_en(out_stub_cntr_ld_en),
		.out_stub_adr_cnt_en(out_stub_adr_cnt_en),
		.out_stub_cntr_cnt_en(out_stub_cntr_cnt_en),
		.comparitor_en(comparitor_en),
		.in_stub_adr_cnt_en(in_stub_adr_cnt_en),
		.in_stub_cntr_cnt_en(in_stub_cntr_cnt_en),
		.tracklet_cnt_fifo_wr_en(tracklet_cnt_fifo_wr_en)
	);



endmodule

