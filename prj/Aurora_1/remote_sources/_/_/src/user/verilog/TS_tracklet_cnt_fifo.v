`timescale 1ns / 1ps
// TS_tracklet_cnt_fifo
//

`include "Constants.txt"

module TS_tracklet_cnt_fifo(
	//inputs
	input clk,                                  // fast processing clock
	input reset,
	input [`TRACKLET_CNT_BITS-1:0] cnt_a,       // number of tracklets for the 'a' module pair
	input [`TRACKLET_CNT_BITS-1:0] cnt_b,       // number of tracklets for the 'b' module pair
	input [`TRACKLET_CNT_BITS-1:0] cnt_c,       // number of tracklets for the 'c' module pair
	input rd_en, wr_en,

	// outputs
	output [`STRUCT_TRACKLET_CNT_BITS-1:0] struct_tracklet_cnt,   // concatenated count for all input module pairs
	output tracklet_cnt_fifo_empty                   // no new data in the FIFO
);

	wire [`STRUCT_TRACKLET_CNT_BITS-1:0] in_dat;
	// Stub data is packed in a multi-bit word. Define the boundaries.
	assign in_dat[`TRACKLET_CNT_A_MSB:`TRACKLET_CNT_A_LSB] = cnt_a;
	assign in_dat[`TRACKLET_CNT_B_MSB:`TRACKLET_CNT_B_LSB] = cnt_b;
	assign in_dat[`TRACKLET_CNT_C_MSB:`TRACKLET_CNT_C_LSB] = cnt_c;

	TS_tracklet_cnt_fifo_core tracklet_cnt_fifo_core(.clk(clk), .rst(reset), .din(in_dat), .wr_en(wr_en),
		.rd_en(rd_en), .dout(struct_tracklet_cnt), .empty(tracklet_cnt_fifo_empty));

endmodule

