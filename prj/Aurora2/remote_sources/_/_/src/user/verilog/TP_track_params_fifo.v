`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:	 09:46:44 07/03/2013 
// Design Name: 
// Module Name:	 TP_trackparam_fifo 
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
module TP_trackparam_fifo(/*AUTOARG*/
   // Outputs
   DO, EMPTY, FULL,
   // Inputs
   DI, CLK, RDEN, WREN, RESET
   );
	parameter DATA_WIDTH=32;
	parameter FIFO_MODE="FIFO18"; // or FIFO18_36
	

	// FIFO18E1: 18KB FIFO (First In, First Out) Block RAM Memory
	//				 Virtex-6
	// Xilinx HDL Language Template, version 14.5
	output wire [DATA_WIDTH-1:0] DO;
	input wire [DATA_WIDTH-1:0]  DI;
	// CLOCKS
	input wire CLK;
	// INPUT ENABLES
	input wire RDEN;
	input wire WREN;
	
	input wire RESET;
	output wire		  EMPTY, FULL;

	// unused outputs and inputs
	wire [3:0]		  DIP;
	wire [3:0]		  DOP;
	wire [11:0]			  RDCOUNT;
	wire [11:0]			  WRCOUNT;
	wire		  WRERR;
	
	
	wire ALMOSTEMPTY, ALMOSTFULL;

	FIFO18E1 #(
		.ALMOST_EMPTY_OFFSET(13'h0080),	  // Sets the almost empty threshold
		.ALMOST_FULL_OFFSET(13'h0080),	  // Sets almost full threshold
		.DATA_WIDTH(DATA_WIDTH),			  // Sets data width to 4, 9, 18, or 36
		.DO_REG(1),								  // Enable output register (0 or 1) Must be 1 if EN_SYN = FALSE
		.EN_SYN("TRUE"),						 // Specifies FIFO as dual-clock (FALSE) or Synchronous (TRUE)
		.FIFO_MODE(FIFO_MODE),					// Sets mode to FIFO18 or FIFO18_36
		.FIRST_WORD_FALL_THROUGH("FALSE"), // Sets the FIFO FWFT to TRUE or FALSE
		.INIT(36'h000000000),				  // Initial values on output port
		.SRVAL(36'h000000000)				  // Set/Reset value for output port
	)
	FIFO18E1_inst (
		// Read Data: 32-bit (each) output: Read output data
		.DO(DO),							// 32-bit output: data output
		.DOP(DOP),						// 4-bit output: parity data output
		// Status: 1-bit (each) output: Flags and other FIFO status outputs
		.ALMOSTEMPTY(ALMOSTEMPTY), // 1-bit output: almost empty output flag
		.ALMOSTFULL(ALMOSTFULL),	// 1-bit output: almost full output flag
		.EMPTY(EMPTY),					// 1-bit output: empty output flag
		.FULL(FULL),					// 1-bit output: full output flag
		.RDCOUNT(RDCOUNT),			// 12-bit output: read count output
		.RDERR(RDERR),					// 1-bit output: read error output
		.WRCOUNT(WRCOUNT),			// 12-bit output: write count output
		.WRERR(WRERR),					// 1-bit output: write error
		// Read Control Signals: 1-bit (each) input: Read clock, enable and reset input signals
		.RDCLK(CLK),				 // 1-bit input: read clock input
		.RDEN(RDEN),					// 1-bit input: read enable input
		.REGCE(1),						// 1-bit input: clock enable input
		.RST(RESET),					// 1-bit input: reset input
		.RSTREG(RESET),				// 1-bit input: output register set/reset
		// Write Control Signals: 1-bit (each) input: Write clock and enable input signals
		.WRCLK(CLK),				 // 1-bit input: write clock input
		.WREN(WREN),					// 1-bit input: write enable input
		// Write Data: 32-bit (each) input: Write input data
		.DI(DI),							// 32-bit input: data input
		.DIP(DIP)						// 4-bit input: parity input
	);

endmodule
