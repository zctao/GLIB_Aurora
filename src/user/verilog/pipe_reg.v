`timescale 1ns / 1ps
// pipe_reg
//
// This module provides a generic pipeline register whose size can be specified
// when it is instantiated.

module pipe_reg(d,q,clk);
	parameter SIZE = 16;   // can be overridden
	input clk;        
	input [SIZE-1:0] d; 
	output reg [SIZE-1:0] q;

	always @(posedge clk) begin
		q <= d;
	end

endmodule

