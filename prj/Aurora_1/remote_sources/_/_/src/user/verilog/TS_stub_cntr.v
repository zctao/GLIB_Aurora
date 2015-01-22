`timescale 1ns / 1ps
// TS_stub_cntr
//
// This module provides a "down" counter to keep track of how many stubs are left to look at.
//
// The counter will count down to zero, and then stop there. The output 'is_zero' is asserted
// when the count gets to zero.
// The actual count is not an output.

`include "Constants.txt"

module TS_stub_cntr(
	//inputs
	input clk,      // fast processing clock
	input ld_en,    // load new data into the counter 
	input cnt_en,   // decrement the counter by one 
	input [`STUB_CNT_BITS-1:0] init,        // initial number of stubs for this crossing
	// outputs
	output is_zero  // asserted when the counter get to zero.
);

	reg [`STUB_CNT_BITS-1:0] remain;    // remaining number of stubs

	// load, decrement, or hold 
	always @(posedge clk) begin
		if (ld_en)
			remain <= init;          // load
		else if (cnt_en & !is_zero)
			remain <= remain - 1'b1; // decrement if not already at zero
		else
			remain <= remain;        // hold
	end

	// not registered for now.
	assign is_zero = remain[`STUB_CNT_BITS-1:0] == `STUB_CNT_BITS'b0;
	
endmodule

