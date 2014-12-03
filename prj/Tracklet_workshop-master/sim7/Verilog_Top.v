`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:53:57 09/26/2014 
// Design Name: 
// Module Name:    Verilog_Top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Verilog_Top;

	// Inputs
	reg reset;
	reg cross_clk;
	reg en_proc; 

	verilog_tracklet_top uut(
		.reset(reset), 
		.clk(cross_clk), 
		.en_proc(en_proc)
	);


	initial begin
		// Initialize Inputs
		reset = 0;
		cross_clk = 0;
		en_proc = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end

	// Add stimulus here
	// clocks
	always begin
		//#3 cross_clk = ~cross_clk;   	// 166 MHz
		#2 cross_clk = ~cross_clk;		// 250 MHz
	end

	// reset
	initial begin
	#110
		reset = 1'b1;
	#10
		reset = 1'b0;
	end


endmodule
