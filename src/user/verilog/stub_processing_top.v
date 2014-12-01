`timescale 1ns / 1ps
// stub_processing_top
//
// This is the verilog module that provides stub processing logic for one detector module.
//

`include "Constants.txt"
`include "Address.txt"

module stub_processing_top(
	// clocks and reset
	input reset,					// active HI
	input proc_clk,				// processing clock at a multiple of the crossing clock
	// programming interface
	// inputs
	input io_clk,					// programming clock
	input io_sel,					// this module has been selected for an I/O operation
	input io_sync,					// start the I/O operation
	input [19:0] io_addr,		// slave address, memory or register. Top 12 bits already consumed.
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

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// decode address bits to pick a function
	// Possible and/or implemented functions include:
	// a) receiving stub data from the FED
	// b) translating the front-end pixel index into a 2-dimensions (x,z) index
	// 2 4'b0010 stub_tagging_sel: 		attaching the physical coordinates of each stub
	// d) routing stub data to where it is needed (outer layer data is used in multiple places)
	// 4 4'b0100 tracklet_search_sel:	searching for tracklets
	// 5 4'b0101 track_params_sel:		finding track parameters for tracklets
	// g) projecting the tracks to the other layers
	// h) queing the track parameters for transmission.
	wire stub_tagging_sel, tracklet_search_sel, track_params_sel;
	assign stub_tagging_sel = io_sel && (io_addr[19:16] == 4'b0010);
	assign tracklet_search_sel = io_sel && (io_addr[19:16] == 4'b0100);
	assign track_params_sel = io_sel && (io_addr[19:16] == 4'b0101);


	// define connections between the stub tagging module and the tracklet search module
	wire [`STRUCT_STUB_BITS-1:0] struct_in_stub;
	wire [`STRUCT_STUB_BITS-1:0] struct_out_stub_a;
	wire [`STRUCT_STUB_BITS-1:0] struct_out_stub_b;
	wire [`STRUCT_STUB_BITS-1:0] struct_out_stub_c;
	wire [`STUB_ADR_BITS-1:0] in_stub_adr;       // stub memory address of current inner layer stub for this crossing
	wire [`STUB_ADR_BITS-1:0] out_stub_adr;      // stub memory address of current outer layer stubs for this crossing
	wire [`STRUCT_STUB_CNT_BITS-1:0] struct_stub_cnt;
	wire stub_cnt_fifo_empty;
	wire stub_cnt_fifo_rd_en;
	
	// define connections between the tracklet search module and the tracklet parameter calculator
	wire [`STRUCT_TRACKLET_DATA_BITS-1:0] struct_tracklet_a;   // all inner stub, outer stub, and crossing data to define a tracklet
	wire [`STRUCT_TRACKLET_DATA_BITS-1:0] struct_tracklet_b;   // all inner stub, outer stub, and crossing data to define a tracklet
	wire [`STRUCT_TRACKLET_DATA_BITS-1:0] struct_tracklet_c;   // all inner stub, outer stub, and crossing data to define a tracklet
	wire tracklet_rd_en_a;                  // read a piece of data from the tracklet fifo
	wire tracklet_rd_en_b;                  // read a piece of data from the tracklet fifo
	wire tracklet_rd_en_c;                  // read a piece of data from the tracklet fifo
	wire [`STRUCT_TRACKLET_CNT_BITS-1:0] struct_tracklet_cnt;   // amount of data from all module pairs
	wire tracklet_cnt_fifo_empty;
	wire tracklet_cnt_fifo_rd_en;

	// readback data
	wire[31:0] stub_tagging_io_rd_data;
	wire[31:0] tracklet_search_io_rd_data;
	wire[31:0] track_parms_io_rd_data;
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	// create an instance of the stub tagging block
	ST_stub_tagging_top stub_tagging_top(
		// clocks and reset
		.reset(reset),						// active HI
		.proc_clk(proc_clk),				// processing clock at a multiple of the crossing clock
		// programming interface
		.io_clk(io_clk),					// programming clock
		.io_sel(stub_tagging_sel),		// this module is selected for an I/O operation
		.io_sync(io_sync),				// start the I/O operation
		.io_addr(io_addr[15:0]),		// memory address, top 16 bits alread consumed
		.io_rd_en(io_rd_en),				// this is a read operation, enable readback logic
		.io_wr_en(io_wr_en),				// this is a write operation
		.io_wr_data(io_wr_data[31:0]),// data to write for write operations
		// outputs
		.io_rd_data(stub_tagging_io_rd_data),	// data returned for read operations
		.io_rd_ack(stub_tagging_io_rd_ack),		// 'read' data from this module is ready

		// connections between the stub processing module and the tracklet search module
		.struct_in_stub(struct_in_stub),
		.struct_out_stub_a(struct_out_stub_a),
		.struct_out_stub_b(struct_out_stub_b),
		.struct_out_stub_c(struct_out_stub_c),
		.in_stub_adr(in_stub_adr),       // stub memory address of current inner layer stub for this crossing
		.out_stub_adr(out_stub_adr),      // stub memory address of current outer layer stubs for this crossing
		.struct_stub_cnt(struct_stub_cnt),
		.stub_cnt_fifo_empty(stub_cnt_fifo_empty),
		.stub_cnt_fifo_rd_en(stub_cnt_fifo_rd_en),
		
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

/*	////////////////////////////////////////////////////////////////////////////////////////////////////
	// create an instance of the tracklet search block
	TS_tracklet_search_top tracklet_search_top(
		// clocks and reset
		.reset(reset),						// active HI
		.proc_clk(proc_clk),				// processing clock at a multiple of the crossing clock
		// programming interface
		.io_clk(io_clk),					// programming clock
		.io_sel(tracklet_search_sel),	// this module is selected for an I/O operation
		.io_sync(io_sync),				// start the I/O operation
		.io_addr(io_addr[15:0]),		// memory address, top 16 bits alread consumed
		.io_rd_en(io_rd_en),				// this is a read operation, enable readback logic
		.io_wr_en(io_wr_en),				// this is a write operation
		.io_wr_data(io_wr_data[31:0]),// data to write for write operations
		// outputs
		.io_rd_data(tracklet_search_io_rd_data),	// data returned for read operations
		.io_rd_ack(tracklet_search_io_rd_ack),		// 'read' data from this module is ready

		// connections between the stub processing module and the tracklet search module
		.struct_in_stub(struct_in_stub),
		.struct_out_stub_a(struct_out_stub_a),
		.struct_out_stub_b(struct_out_stub_b),
		.struct_out_stub_c(struct_out_stub_c),
		.in_stub_adr(in_stub_adr),       // stub memory address of current inner layer stub for this crossing
		.out_stub_adr(out_stub_adr),      // stub memory address of current outer layer stubs for this crossing
		.struct_stub_cnt(struct_stub_cnt),
		.stub_cnt_fifo_empty(stub_cnt_fifo_empty),
		.stub_cnt_fifo_rd_en(stub_cnt_fifo_rd_en),

		// define connections between the tracklet search module and the tracklet parameter calculator
		.struct_tracklet_a(struct_tracklet_a),       // all inner stub, outer stub, and crossing data to define a tracklet
		.struct_tracklet_b(struct_tracklet_b),       // all inner stub, outer stub, and crossing data to define a tracklet
		.struct_tracklet_c(struct_tracklet_c),       // all inner stub, outer stub, and crossing data to define a tracklet
		.tracklet_rd_en_a(tracklet_rd_en_a),         // read a piece of data from the tracklet fifo
		.tracklet_rd_en_b(tracklet_rd_en_b),         // read a piece of data from the tracklet fifo
		.tracklet_rd_en_c(tracklet_rd_en_c),         // read a piece of data from the tracklet fifo
		.struct_tracklet_cnt(struct_tracklet_cnt),   // amount of data from all module pairs
		.tracklet_cnt_fifo_empty(tracklet_cnt_fifo_empty), // if not empty, then a new crossing is ready to be processed
		.tracklet_cnt_fifo_rd_en(tracklet_cnt_fifo_rd_en) // read the new crossing data from the fifo
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// Create an instance of the logic that calculates track parameters for 1 inner layer module and 3 outer layer modules
	TP_track_params_top track_params_top(
		// clocks and reset
		.reset(reset),						// active HI
		.proc_clk(proc_clk),				// processing clock at a multiple of the crossing clock
		// programming interface
		.io_clk(io_clk),					// programming clock
		.io_sel(track_params_sel),		// this module is selected for an I/O operation
		.io_sync(io_sync),				// start the I/O operation
		.io_addr(io_addr[15:0]),		// memory address, top 16 bits alread consumed
		.io_rd_en(io_rd_en),				// this is a read operation, enable readback logic
		.io_wr_en(io_wr_en),				// this is a write operation
		.io_wr_data(io_wr_data[31:0]),// data to write for write operations
		// outputs
		.io_rd_data(track_parms_io_rd_data),	// data returned for read operations
		.io_rd_ack(track_parms_io_rd_ack),		// 'read' data from this module is ready

		// define connections between the tracklet search module and the tracklet parameter calculator
		.struct_tracklet_a(struct_tracklet_a),       // all inner stub, outer stub, and crossing data to define a tracklet
		.struct_tracklet_b(struct_tracklet_b),       // all inner stub, outer stub, and crossing data to define a tracklet
		.struct_tracklet_c(struct_tracklet_c),       // all inner stub, outer stub, and crossing data to define a tracklet
		.tracklet_rd_en_a(tracklet_rd_en_a),         // read a piece of data from the tracklet fifo
		.tracklet_rd_en_b(tracklet_rd_en_b),         // read a piece of data from the tracklet fifo
		.tracklet_rd_en_c(tracklet_rd_en_c),         // read a piece of data from the tracklet fifo
		.struct_tracklet_cnt(struct_tracklet_cnt),   // amount of data from all module pairs
		.tracklet_cnt_fifo_empty(tracklet_cnt_fifo_empty), // if not empty, then a new crossing is ready to be processed
		.tracklet_cnt_fifo_rd_en(tracklet_cnt_fifo_rd_en) // read the new crossing data from the fifo
	);
*/
	////////////////////////////////////////////////////////////////////////////////////////////////////
	// connect readback mux to return data from the requested source
	reg [31:0] io_rd_data_reg;
	assign io_rd_data = io_rd_data_reg;
	// Assert 'io_rd_ack' if any modules below this function assert their 'io_rd_ack'.
	reg io_rd_ack_reg;
	assign io_rd_ack = io_rd_ack_reg;
	always @(posedge io_clk) begin
		//io_rd_ack_reg <= io_sync & io_rd_en & (stub_tagging_io_rd_ack | tracklet_search_io_rd_ack | track_parms_io_rd_ack);
		io_rd_ack_reg <= io_sync & io_rd_en & stub_tagging_io_rd_ack;
	end

	always @(posedge io_clk) begin
		if (stub_tagging_io_rd_ack)    io_rd_data_reg <= stub_tagging_io_rd_data;
		//if (tracklet_search_io_rd_ack) io_rd_data_reg <= tracklet_search_io_rd_data;
		//if (track_parms_io_rd_ack)     io_rd_data_reg <= track_parms_io_rd_data;
	end

endmodule
