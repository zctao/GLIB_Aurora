`timescale 1ns / 1ps
// stub_processing_all_modules
//
// This is the top level verilog module that provides logic for all detector modules
// connected to this FPGA
//

`include "Constants.txt"
`include "Address.txt"

module stub_processing_all_modules(
	// clocks and reset
	input reset,					// active HI
	input proc_clk,				// processing clock at a multiple of the crossing clock
	// programming interface
	// inputs
	input io_clk,					// programming clock
	input io_sel,					// this module has been selected for an I/O operation
	input io_sync,					// start the I/O operation
	input [27:0] io_addr,		// slave address, memory or register. Top 4 bits already consumed.
	input io_rd_en,				// this is a read operation
	input io_wr_en,				// this is a write operation
	input [31:0] io_wr_data,	// data to write for write operations
	// outputs
	output [31:0] io_rd_data,	// data returned for read operations
	output io_rd_ack,				// 'read' data from this module is ready
	//link ports
	input  gt_refclk_p,
	input  gt_refclk_n,
	input  init_clk,
	output txp1,
	output txn1,
	input  rxp1,
   input  rxn1,
	output txp2,
	output txn2,
	input  rxp2,
	input  rxn2
);

	// busses of data being read back
	wire [31:0] io_rd_data_01;
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	// decode address bits to pick a module
	// Figure out a more compact way to write this for several dozen modules
	wire sel_01;
	assign sel_01 = io_sel && (io_addr[27:20] == 8'b00000001);	// #1 logic block

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// create an instance of the stub processing logic for one module
	stub_processing_top stub_processing_top_01(
		// clocks and reset
		.reset(reset),						// active HI
		.proc_clk(proc_clk),				// processing clock at a multiple of the crossing clock
		// programming interface
		.io_clk(io_clk),					// programming clock
		.io_sel(sel_01),					// this module is selected for an I/O operation
		.io_sync(io_sync),				// start the I/O operation
		.io_addr(io_addr[19:0]),		// memory address, top 12 bits alread consumed
		.io_rd_en(io_rd_en),				// this is a read operation, enable readback logic
		.io_wr_en(io_wr_en),				// this is a write operation, enable target for one clock
		.io_wr_data(io_wr_data[31:0]),// data to write for write operations
		// outputs
		.io_rd_data(io_rd_data_01),	// data returned for read operations
		.io_rd_ack(io_rd_ack_01),		// 'read' data from this module is ready
		// links
		.gt_refclk_p(gt_refclk_p),
		.gt_refclk_n(gt_refclk_n),
		.init_clk(init_clk),
		.txp1(txp1),
	   .txn1(txn1),
	   .rxp1(rxp1),
		.rxn1(rxn1),
	   .txp2(txp2),
	   .txn2(txn2),
	   .rxp2(rxp2),
		.rxn2(rxn2)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// connect readback mux to return data from the requested source
	reg [31:0] io_rd_data_reg;
	assign io_rd_data = io_rd_data_reg;
	// Assert 'io_rd_ack' if any modules below this function assert their 'io_rd_ack'.
	reg io_rd_ack_reg;
	assign io_rd_ack = io_rd_ack_reg;
	always @(posedge io_clk) begin
		io_rd_ack_reg <= io_sync & io_rd_en & (io_rd_ack_01);
	end

	always @(posedge io_clk) begin
		if (io_rd_ack_01)    io_rd_data_reg <= io_rd_data_01;
	end

		
endmodule
