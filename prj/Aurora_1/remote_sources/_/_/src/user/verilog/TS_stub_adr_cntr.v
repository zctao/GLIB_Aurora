`timescale 1ns / 1ps
// TS_stub_adr_cntr
//
// This module provides an "up" counter to generate addresses to retrieve stubs
// from the stub memory.
//
// Part of the crossing number is used to initialize the upper bits of the address.
// The lower bits will be zero.
//

`include "Constants.txt"

module TS_stub_adr_cntr(
	//inputs
	input clk,      // fast processing clock
	input ld_en,    // load new data into the counter 
	input cnt_en,   // increment the counter by one 
	input [`CROSS_NUM_BUF_ADR_BITS-1:0] cross_num,        // initial address of first stub for this crossing
	// outputs
	output reg [`STUB_ADR_BITS-1:0] stub_adr    // address of subsequent stubs
);

	// load, decrement, or hold 
	always @(posedge clk) begin
		if (ld_en) begin
			// part of crossing number in upper bits, zero in lower bits
			stub_adr[`STUB_ADR_BITS-1:`STUB_ADR_BITS-`CROSS_NUM_BUF_ADR_BITS] <= 
				cross_num[`CROSS_NUM_BUF_ADR_BITS-1:0];                            // load
			stub_adr[`STUB_ADR_BITS-`CROSS_NUM_BUF_ADR_BITS-1:0] <= 0;            // load
		end
		else if (cnt_en)
			stub_adr <= stub_adr + 1'b1;  // increment
		else
			stub_adr <= stub_adr;         // hold
	end

endmodule

