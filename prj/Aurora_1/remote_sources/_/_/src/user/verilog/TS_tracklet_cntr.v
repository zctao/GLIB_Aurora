`timescale 1ns / 1ps
// TS_TRACKLET_cntr
//
// This module provides an "up" counter to keep track of how many tracklets have been
// put in a tracklet fifo.
//

`include "Constants.txt"

module TS_tracklet_cntr(
	//inputs
	input clk,               // fast processing clock
	input clr,               // reset counter to zero 
	input x_valid, z_valid,  // need both to increment counter 
	// outputs
	output reg [`TRACKLET_CNT_BITS-1:0] cnt // number of tracklets for this crossing
);

	// clear, increment, or hold 
	always @(posedge clk) begin
		if (clr)
			cnt <= 0;               // clear
		else if (x_valid & z_valid)
			cnt <= cnt + 1'b1;      // increment
		else
			cnt <= cnt;             // hold
	end

endmodule

