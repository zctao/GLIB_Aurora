`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:59:09 11/19/2014
// Design Name:   CLK_Counter
// Module Name:   C:/Users/LabView User/Documents/ztaotest/Aurora/zttest/prj/cornell_v0_tao2/clk_counter_tb.v
// Project Name:  cornell_v0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLK_Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clk_counter_tb;

	// Inputs
	reg clk;	
	reg reset;
	reg signal1;
	reg signal2;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	CLK_Timer uut (
		.clk(clk), 
		.reset(reset),
		.signal1(signal1),
		.signal2(signal2),		
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		signal1 = 0;
		signal2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 1'b1;
		#10 
		reset = 1'b0;
		#10 
		signal1 = 1'b1;
		#40 
		signal1 = 1'b0;
		#50
		signal2 = 1'b1;
		#40
		signal2 = 1'b0;
		
		#200
		reset = 1'b1;
		#10 
		reset = 1'b0;
		#10 
		signal1 = 1'b1;
		#50 
		signal2 = 1'b1;
		#20
		signal1 = 1'b0;
		#20
		signal2 = 1'b0;
		#80 
		signal1 = 1'b1;
		#40 
		signal1 = 1'b0;
		#50
		signal2 = 1'b1;
		#40
		signal2 = 1'b0;	
		
	end
      
	always 
		#4 clk = !clk;
		
endmodule

