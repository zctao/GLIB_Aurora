`timescale 1ns / 1ps
// TS_out_stub_x_compare
//
// This module compares the (x) physical position of a stub from the outer
// layer with the window boundaries associated with a stub from the inner layer. If
// the stub is within the window, then the output 'match' is asserted.
//
// The latency is one clock period.

`include "Constants.txt"

module TS_out_stub_x_compare(
	//inputs
	input clk,      // fast processing clock
	input valid,    // incoming data is valid and should be compared 
	input signed [`STUB_X_PHY_BITS-1:0] stub_dat,    // stub (x) position on outer layer
	input signed [`STUB_X_PHY_BITS-1:0] x_lim_plus,  // window boundaries associated with stub from inner layer
	input signed [`STUB_X_PHY_BITS-1:0] x_lim_minus, // window boundaries associated with stub from inner layer
	// outputs
	output reg match    // stub data was valid and fell within the window boundaries 
);

	// assert 'match' if data is valid and falls within window
	always @(posedge clk) begin
		if (valid & (stub_dat >= x_lim_minus) & (stub_dat <= x_lim_plus) )
			match <= 1'b1;
		else
			match <= 1'b0;
	end

endmodule

