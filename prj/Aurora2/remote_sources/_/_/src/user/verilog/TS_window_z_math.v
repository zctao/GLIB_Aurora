`timescale 1ns / 1ps
// TS_window_z_math
//
// This module does the math to compute one of the (z) window boundaries using the position of
// the current inner layer stub and the contents of the window parameter lookup tables.
//
// The latency is one clock period.

`include "Constants.txt"

module TS_window_z_math(
	//inputs
	input clk,      // fast processing clock
	input signed [`STUB_Z_PHY_BITS-1:0] stub_dat,    // stub (z) position on inner layer
	input signed [`WINDOW_Z_DAT_BITS-1:0] z_offset,  // window boundaries associated with stub from inner layer
	// outputs
	output reg signed [`STUB_Z_PHY_BITS-1:0] out     // position of the window boundary
);

	// add the inputs (as signed numbers)
	always @(posedge clk) begin
		out <= stub_dat + z_offset;
	end

endmodule

