`timescale 1ns / 1ps
// pipe_mult
//
// This module provides a generic pipelined 18 by 25 multiplier.
//
// The inputs are signed numbers, and are assumed to be aligned to the MSB. They
// should be zero padded in the LSBs as needed. The output will be a 43-bit signed
// number.
//
// The pipe_in and pipe_out bits are for the pipeline chain.
// The latency is three clock periods.
// To save power, the pipieline bits also drive the clock enable bits along the pipeline.

`include "Constants.txt"

module pipe_mult(
	//inputs
	input clk,      // fast processing clock
	input pipe_in,    // the incoming pipeline enable bit 
	input signed [24:0] a,   // the 25-bit input to the DSP slice
	input signed [17:0] b,   // the 18-bit input to the DSP slice
	// outputs
	output pipe_out,         // the pipeline enable bit to be passed to the next stage
	output signed [42:0] p   // the 43-bit product
);

	// the pipeline
	reg [2:0] pipe;
	always @(posedge clk) begin
		pipe[0] <= pipe_in;
		pipe[1] <= pipe[0];
		pipe[2] <= pipe[1];
	end
	assign pipe_out = pipe[2];
	
	// The multiplier, created by a COREGEN macro
	dsp_mult dsp_mult(.clk(clk), .cea3(pipe_in), .cea4(pipe_in), .ceb3(pipe_in), .ceb4(pipe_in),
		.cem(pipe_0), .cep(pipe_1), .a(a), .b(b), .p(p));

endmodule
