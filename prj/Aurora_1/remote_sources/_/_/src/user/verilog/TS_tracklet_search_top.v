`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// TS_tracklet_search_top.v
//
// This block tries to find tracklets by looking at stubs from one module on the inner layer and several modules
// on the outer layers of a superlayer. The outer layer modules encompass all possible (z) trajectories of a
// track that passes through the one inner layer module. It uses a windowed comparitor to identify the tracklets.
//
// The number of outer layer modules is either 2 or 3. This depends on where the inner layer module is located
// relative to the IP.
// This code can handle 3 outer layer modules. 
//
// The stub data comes from dual-port (DPMEM) memories. The memories are organized as blocks of buffers, with
// each buffer being a fixed size that is big enough to hold the maximum amount of data from a crossing. Part
// of the crossing number is used to select a buffer.
//
// Parameters for accessing the stub memories comes from a FIFO. They are written to the FIFO by a block that
// precedes this one. Included is:
//    a) number of inner layer stubs
//    b) number of outer layer stubs in each module
//    c) the crossing number
//
// The data in the stub memories may or may not be sorted in (z), (x), or (Pt), depending on what happens in the
// on-detector electronics and in the FED. This code make no assumptions.
//
// The stub data are integer representations of the (x,z) coordinates. The (x) coordinate is in the same
// direction as the (phi) coordinate, but it relates to the 'flat' module, rather than the curved radius of a
// layer. The (z) coordinate is the longitudinal distance from the interaction point.
//
// The stub data also includes other pieces of information, such as the crossing number and possibly some data
// about the (Pt) of the stub. In the memory, all data for a stub lives at a single address. For convenience, it
// is brought into this module packed in a structure. Local variables are assigned to various parts of the
// structure.
//
// The processing stage prior to this block translated the (x, z, module_num, rod_num, layer_num) index that
// came from the detector into the physical (x,z) coordinates used here. This handled deviations of the actual
// physical values from the ideal values. The integer units are about 1/10th of the pixel size in each
// dimension, so units of (x) are about 0.00125 cm and units of (z) are about 0.0125 cm. Units of (x,z) are
// relative to Z=0 at the IP and X=0 on a line that bisects a rod.
//
// A pair of lookup tables is used to specify the search window parameters. One of these contains +/- (z)
// offsets. The other contains +/- (x) offsets. The (x,z) cordinates of a stub on the inner layer are used as
// the address to look up the +/- (x,z) boundaries on the outer layer. These tables are also dual-port memory.
// The interface for filling them is provided by the PIO block.
//
// Whenever a pair of stubs that form a tracklet are identified, their data is written to an output FIFO.
//
// Some though needs to go into how everything stays synched by crossing number, when some modules will have no
// data, while others have 8/12/16 stubs. Some modules will be finished dumping data for crossin 'N', while
// another will stil be dumping data for crossing 'N-1'.
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

`include "Constants.txt"
`include "Address.txt"

module TS_tracklet_search_top(
	// clocks and reset
	input reset,					// active HI
	input proc_clk,				// processing clock at a multiple of the crossing clock
	input en_proc,
	// programming interface
	// inputs
	input io_clk,					// programming clock
	input io_sel,					// this module has been selected for an I/O operation
	input io_sync,					// start the I/O operation
	input [15:0] io_addr,		// slave address, memory or register. Top 16 bits already consumed.
	input io_rd_en,				// this is a read operation
	input io_wr_en,				// this is a write operation
	input [31:0] io_wr_data,	// data to write for write operations
	// outputs
	output [31:0] io_rd_data,	// data returned for read operations
	output io_rd_ack,				// 'read' data from this module is ready

	// define connections between the stub processing module and the tracklet search module
	input [`STRUCT_STUB_BITS-1:0] struct_in_stub,
	input [`STRUCT_STUB_BITS-1:0] struct_out_stub_a,
	input [`STRUCT_STUB_BITS-1:0] struct_out_stub_b,
	input [`STRUCT_STUB_BITS-1:0] struct_out_stub_c,
	output [`STUB_ADR_BITS-1:0] in_stub_adr,  // stub mem address of current inner layer stub for this crossing
	output [`STUB_ADR_BITS-1:0] out_stub_adr, // stub mem address of current outer layer stubs for this crossing
	input [`STRUCT_STUB_CNT_BITS-1:0] struct_stub_cnt,
	input stub_cnt_fifo_empty, // if not empty, then a set of stubs from a crossing is ready for us
	output stub_cnt_fifo_rd_en, // read the stub count data
	
	// define connections between the tracklet search module and the tracklet parameter calculator
	output [`STRUCT_TRACKLET_DATA_BITS-1:0] struct_tracklet_a,   // all inner stub, outer stub, and crossing data to define a tracklet
	output [`STRUCT_TRACKLET_DATA_BITS-1:0] struct_tracklet_b,   // all inner stub, outer stub, and crossing data to define a tracklet
	output [`STRUCT_TRACKLET_DATA_BITS-1:0] struct_tracklet_c,   // all inner stub, outer stub, and crossing data to define a tracklet
	input tracklet_rd_en_a, // the next stage want to read a piece of data from the tracklet fifo
	input tracklet_rd_en_b, // the next stage want to read a piece of data from the tracklet fifo
	input tracklet_rd_en_c, // the next stage want to read a piece of data from the tracklet fifo
	output [`STRUCT_TRACKLET_CNT_BITS-1:0] struct_tracklet_cnt,   // amount of data from all module pairs
	output tracklet_cnt_fifo_empty, // if not empty, then a set of tracklets is read for the next stage
	input tracklet_cnt_fifo_rd_en, // the next stage want to read from the tracklet count fifo
	// simulation outputs
	output [15:0] testbus,
	output signed [`STUB_X_PHY_BITS-1:0] math_x_phy_dat,
	output signed [`WINDOW_X_DAT_BITS-1:0] math_x_win_minus_dat,
	output signed [`STUB_X_PHY_BITS-1:0] comp_win_minus_phy_dat,
	output signed [`STUB_X_PHY_BITS-1:0] comp_out_x_phy_dat,
	output signed [`STUB_X_PHY_BITS-1:0] tracklet_in_x_phy,
	output signed [`STUB_X_PHY_BITS-1:0] tracklet_out_x_phy,

	// move the counters to the next step
	output [`TRACKLET_CNT_BITS-1:0] num_tracklets_a, 
	output [`TRACKLET_CNT_BITS-1:0] num_tracklets_b, 
	output [`TRACKLET_CNT_BITS-1:0] num_tracklets_c
	
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Unpack incoming structures
	// unpack 'struct_stub_cnt'
	wire [`STUB_CNT_BITS-1:0] num_in_stubs;     // number of inner layer stubs for this crossing
	wire [`STUB_CNT_BITS-1:0] num_out_stubs_a;  // number of outer layer stubs for this crossing for module 'a'
	wire [`STUB_CNT_BITS-1:0] num_out_stubs_b;  // number of outer layer stubs for this crossing for module 'b'
	wire [`STUB_CNT_BITS-1:0] num_out_stubs_c;  // number of outer layer stubs for this crossing for module 'c'
	wire [`CROSSING_NUMBER_BITS-1:0] crossing_num;    // tells which crossing number to process
	assign num_in_stubs = struct_stub_cnt[`STUB_CNT_IN_MSB:`STUB_CNT_IN_LSB];
	assign num_out_stubs_a = struct_stub_cnt[`STUB_CNT_OUT_A_MSB:`STUB_CNT_OUT_A_LSB];
	assign num_out_stubs_b = struct_stub_cnt[`STUB_CNT_OUT_B_MSB:`STUB_CNT_OUT_B_LSB];
	assign num_out_stubs_c = struct_stub_cnt[`STUB_CNT_OUT_C_MSB:`STUB_CNT_OUT_C_LSB];
	assign crossing_num = struct_stub_cnt[`CROSSING_NUM_MSB:`CROSSING_NUM_LSB];
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// internal busses
	// connections to the window look-up tables
	wire signed [`WINDOW_X_DAT_BITS-1:0] x_win_plus_dat;       // the data of the 'plus' (x) window boundary
	wire signed [`WINDOW_X_DAT_BITS-1:0] x_win_minus_dat;      // the data of the 'minus' (x) window boundary
	wire signed [`WINDOW_Z_DAT_BITS-1:0] z_win_high_dat;       // the data of the 'high' (z) window boundary
	wire signed [`WINDOW_Z_DAT_BITS-1:0] z_win_low_dat;        // the data of the 'low' (z) window boundary

	// connections to the math blocks that compute the search window boundaries
	wire signed [`STUB_X_PHY_BITS-1:0] x_lim_plus;
	wire signed [`STUB_X_PHY_BITS-1:0] x_lim_minus;
	wire signed [`STUB_Z_PHY_BITS-1:0] z_lim_high;
	wire signed [`STUB_Z_PHY_BITS-1:0] z_lim_low;

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// internal control wires
	// connections to the stub counters and stub address counters
	wire in_stub_adr_ld_en;
	wire out_stub_adr_ld_en;
	wire in_stub_adr_cnt_en;
	wire out_stub_adr_cnt_en;
	
	wire in_stub_cntr_ld_en;
	wire out_stub_cntr_ld_en;
	wire in_stub_cntr_cnt_en;
	wire out_stub_cntr_cnt_en;
	wire in_stub_cnt_is_zero;	
	wire out_stub_cnt_is_zero_a;
	wire out_stub_cnt_is_zero_b;
	wire out_stub_cnt_is_zero_c;
	
	wire en_comp_a;
	wire en_comp_b;
	wire en_comp_c;
	wire pass_z_a;
	wire pass_x_a;
	wire pass_z_b;
	wire pass_x_b;
	wire pass_z_c;
	wire pass_x_c;
	wire tracklet_cnt_fifo_wr_en;
		
	wire cross_proc_busy;		// if busy, a crossing is being processed

	// connection for configuration programming
	wire [31:0] o_x_lut_dat, o_z_lut_dat;               // programming i/o data read from lookup tables

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// pipeline registers to pass stub data to the next stage
	// relevant parts will be extracted at each stage
	// stage 1
	reg [`STRUCT_STUB_BITS-1:0] struct_in_stub_1dly;
	reg [`STRUCT_STUB_BITS-1:0] struct_out_stub_a_1dly;
	reg [`STRUCT_STUB_BITS-1:0] struct_out_stub_b_1dly;
	reg [`STRUCT_STUB_BITS-1:0] struct_out_stub_c_1dly;
	reg [`CROSSING_NUMBER_BITS-1:0] crossing_num_1dly;
	reg en_comp_a_1dly, en_comp_b_1dly, en_comp_c_1dly;
	// stage 2
	reg [`STRUCT_STUB_BITS-1:0] struct_in_stub_2dly;
	reg [`STRUCT_STUB_BITS-1:0] struct_out_stub_a_2dly;
	reg [`STRUCT_STUB_BITS-1:0] struct_out_stub_b_2dly;
	reg [`STRUCT_STUB_BITS-1:0] struct_out_stub_c_2dly;
	reg [`CROSSING_NUMBER_BITS-1:0] crossing_num_2dly; 
	reg en_comp_a_2dly, en_comp_b_2dly, en_comp_c_2dly;
	// stage 3
	reg [`STRUCT_STUB_BITS-1:0] struct_in_stub_3dly;
	reg [`STRUCT_STUB_BITS-1:0] struct_out_stub_a_3dly;
	reg [`STRUCT_STUB_BITS-1:0] struct_out_stub_b_3dly;
	reg [`STRUCT_STUB_BITS-1:0] struct_out_stub_c_3dly;
	reg [`CROSSING_NUMBER_BITS-1:0] crossing_num_3dly;
	reg en_comp_a_3dly, en_comp_b_3dly, en_comp_c_3dly;
	// stage 4
	reg [`STRUCT_STUB_BITS-1:0] struct_in_stub_4dly;
	//reg [`STRUCT_STUB_BITS-1:0] struct_out_stub_a_4dly;
	//reg [`STRUCT_STUB_BITS-1:0] struct_out_stub_b_4dly;
	//reg [`STRUCT_STUB_BITS-1:0] struct_out_stub_c_4dly;
	reg [`CROSSING_NUMBER_BITS-1:0] crossing_num_4dly;
	reg en_comp_a_4dly, en_comp_b_4dly, en_comp_c_4dly;

	always @(posedge proc_clk) begin
		// stage 1
		struct_in_stub_1dly <= struct_in_stub;
		struct_out_stub_a_1dly <= struct_out_stub_a;
		struct_out_stub_b_1dly <= struct_out_stub_b;
		struct_out_stub_c_1dly <= struct_out_stub_c;
		crossing_num_1dly <= crossing_num;
		en_comp_a_1dly <= en_comp_a;
		en_comp_b_1dly <= en_comp_b;
		en_comp_c_1dly <= en_comp_c;
		// stage 2
		struct_in_stub_2dly <= struct_in_stub_1dly;
		struct_out_stub_a_2dly <= struct_out_stub_a_1dly;
		struct_out_stub_b_2dly <= struct_out_stub_b_1dly;
		struct_out_stub_c_2dly <= struct_out_stub_c_1dly;
		crossing_num_2dly <= crossing_num_1dly;
		en_comp_a_2dly <= en_comp_a_1dly;
		en_comp_b_2dly <= en_comp_b_1dly;
		en_comp_c_2dly <= en_comp_c_1dly;
		// stage 3
		struct_in_stub_3dly <= struct_in_stub_2dly;
		struct_out_stub_a_3dly <= struct_out_stub_a_2dly;
		struct_out_stub_b_3dly <= struct_out_stub_b_2dly;
		struct_out_stub_c_3dly <= struct_out_stub_c_2dly;
		crossing_num_3dly <= crossing_num_2dly;
		en_comp_a_3dly <= en_comp_a_2dly;
		en_comp_b_3dly <= en_comp_b_2dly;
		en_comp_c_3dly <= en_comp_c_2dly;
		// stage 4
		struct_in_stub_4dly <= struct_in_stub_3dly;
		//struct_out_stub_a_4dly <= struct_out_stub_a_3dly;
		//struct_out_stub_b_4dly <= struct_out_stub_b_3dly;
		//struct_out_stub_c_4dly <= struct_out_stub_c_3dly;
		crossing_num_4dly <= crossing_num_3dly;
		en_comp_a_4dly <= en_comp_a_3dly;
		en_comp_b_4dly <= en_comp_b_3dly;
		en_comp_c_4dly <= en_comp_c_3dly;

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// pipeline delay for various control signals
	reg [8:1] tracklet_cnt_clr_dly;
	always @(posedge proc_clk) begin
		tracklet_cnt_clr_dly[1] <= tracklet_cnt_clr;
		tracklet_cnt_clr_dly[8:2] <= tracklet_cnt_clr_dly[7:1];
	end
	reg [2:1] tracklet_cnt_fifo_wr_en_dly;
	always @(posedge proc_clk) begin
		tracklet_cnt_fifo_wr_en_dly[1] <= tracklet_cnt_fifo_wr_en;
		tracklet_cnt_fifo_wr_en_dly[2] <= tracklet_cnt_fifo_wr_en_dly[1];
	end
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// connect the programming interface
	// Extract the stub data that generates the window LUT addresses
	wire signed [`STUB_Z_IDX_BITS-1:0] in_stub_z_idx;       // inner layer z index
	wire signed [`STUB_X_IDX_BITS-1:0] in_stub_x_idx;       // inner layer x index
	assign in_stub_z_idx = struct_in_stub[`STUB_Z_IDX_MSB:`STUB_Z_IDX_LSB];
	assign in_stub_x_idx = struct_in_stub[`STUB_X_IDX_MSB:`STUB_X_IDX_LSB];
	TS_io_block io_block(
		// clocks and reset
		.reset(reset),						// active HI
		// programming interface
		.io_clk(io_clk),					// programming clock
		.io_sel(io_sel),					// this module is selected for an I/O operation
		.io_sync(io_sync),				// start the I/O operation
		.io_addr(io_addr[15:0]),		// memory address, top 16 bits alread consumed
		.io_rd_en(io_rd_en),				// this is a read operation, enable readback logic
		.io_wr_en(io_wr_en),				// this is a write operation
		.io_wr_data(io_wr_data[31:0]),// data to write for write operations
		// outputs
		.io_rd_data(io_rd_data),		// data returned for read operations
		.io_rd_ack(io_rd_ack),			// 'read' data from this module is ready
		// this function's access to memory and registers
		.proc_clk(proc_clk),
		.in_stub_x_idx(in_stub_x_idx), .x_win_plus_dat(x_win_plus_dat), .x_win_minus_dat(x_win_minus_dat),
		.in_stub_z_idx(in_stub_z_idx), .z_win_high_dat(z_win_high_dat), .z_win_low_dat(z_win_low_dat) );
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Connect counters that will generate addresses for the stub memory.
	// They will use part of the crossing number to initialize the upper bits of the address.
	// The lower bits will be initialized to zero.
	// All outer layer stub memories will use the same address. The validity of the data
	// depends on the stub count for that module.
	// Refer to the function code for port descriptions
	TS_stub_adr_cntr in_stub_adr_cntr (.clk(proc_clk), .cross_num(crossing_num[`CROSS_NUM_BUF_ADR_BITS-1:0]),
		.stub_adr(in_stub_adr), .ld_en(in_stub_adr_ld_en),  .cnt_en(in_stub_adr_cnt_en));
	TS_stub_adr_cntr out_stub_adr_cntr(.clk(proc_clk), .cross_num(crossing_num[`CROSS_NUM_BUF_ADR_BITS-1:0]),
		.stub_adr(out_stub_adr), .ld_en(out_stub_adr_ld_en), .cnt_en(out_stub_adr_cnt_en));

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Connect counters that will keep track of how many valid stubs for this crossing are left to look at.
	// The counters will count down to zero, and then stop there.
	// When all 'out_stub_cntr' reach zero, we move on to the next inner stub
	// When the 'in_stub_cntr' reaches zero, we are finishes with this crossing.
	// Refer to the function code for port descriptions
	TS_stub_cntr in_stub_cntr   (.clk(proc_clk), .init(num_in_stubs),    .is_zero(in_stub_cnt_is_zero),
		.ld_en(in_stub_cntr_ld_en),  .cnt_en(in_stub_cntr_cnt_en));
	TS_stub_cntr out_stub_cntr_a(.clk(proc_clk), .init(num_out_stubs_a), .is_zero(out_stub_cnt_is_zero_a),
		.ld_en(out_stub_cntr_ld_en), .cnt_en(out_stub_cntr_cnt_en));
	TS_stub_cntr out_stub_cntr_b(.clk(proc_clk), .init(num_out_stubs_b), .is_zero(out_stub_cnt_is_zero_b),
		.ld_en(out_stub_cntr_ld_en), .cnt_en(out_stub_cntr_cnt_en));
	TS_stub_cntr out_stub_cntr_c(.clk(proc_clk), .init(num_out_stubs_c), .is_zero(out_stub_cnt_is_zero_c),
		.ld_en(out_stub_cntr_ld_en), .cnt_en(out_stub_cntr_cnt_en));

	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Connect the math blocks that compute the search window boundaries
	// Math is 2's-complement addition.
	// The window boundaries are shared by all stub comparitors
	// The lookup tables have a 2-clock latency
	// Extract the delayed stub data that matches the window data
	wire signed [`STUB_X_PHY_BITS-1:0] in_stub_x_phy_2dly;       // inner layer x physical coordinate
	assign in_stub_x_phy_2dly = struct_in_stub_2dly[`STUB_X_PHY_MSB:`STUB_X_PHY_LSB];
	wire signed [`STUB_Z_PHY_BITS-1:0] in_stub_z_phy_2dly;       // inner layer z physical coordinate
	assign in_stub_z_phy_2dly = struct_in_stub_2dly[`STUB_Z_PHY_MSB:`STUB_Z_PHY_LSB];
	TS_window_x_math window_x_math_plus (.clk(proc_clk), .stub_dat(in_stub_x_phy_2dly), .x_offset(x_win_plus_dat),
		.out(x_lim_plus));
	TS_window_x_math window_x_math_minus(.clk(proc_clk), .stub_dat(in_stub_x_phy_2dly), .x_offset(x_win_minus_dat),
		.out(x_lim_minus));
	TS_window_z_math window_z_math_high (.clk(proc_clk), .stub_dat(in_stub_z_phy_2dly), .z_offset(z_win_high_dat),
		.out(z_lim_high));
	TS_window_z_math window_z_math_low  (.clk(proc_clk), .stub_dat(in_stub_z_phy_2dly), .z_offset(z_win_low_dat),
		.out(z_lim_low));
	// simulation
	assign math_x_phy_dat = in_stub_x_phy_2dly;
	assign math_x_win_minus_dat = x_win_minus_dat;

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// connect the comparitors that see if outer layer stubs are within the window
	// Need a set of comparitors for each outer layer module
	// Extract the delayed stub data that matches the math block output data
	wire signed [`STUB_X_PHY_BITS-1:0] out_stub_x_phy_a_2dly;       // outer layer 'a' x physical coordinate
	assign out_stub_x_phy_a_2dly = struct_out_stub_a_2dly[`STUB_X_PHY_MSB:`STUB_X_PHY_LSB];
	wire signed [`STUB_Z_PHY_BITS-1:0] out_stub_z_phy_a_2dly;       // outer layer 'a' z physical coordinate
	assign out_stub_z_phy_a_2dly = struct_out_stub_a_2dly[`STUB_Z_PHY_MSB:`STUB_Z_PHY_LSB];
	TS_out_stub_x_compare out_stub_x_compare_a(.clk(proc_clk), .valid(en_comp_a_4dly), .stub_dat(out_stub_x_phy_a_2dly),
		.x_lim_plus(x_lim_plus), .x_lim_minus(x_lim_minus), .match(pass_x_a) );
	TS_out_stub_z_compare out_stub_z_compare_a(.clk(proc_clk), .valid(en_comp_a_4dly), .stub_dat(out_stub_z_phy_a_2dly),
		.z_lim_high(z_lim_high), .z_lim_low(z_lim_low), .match(pass_z_a) );
	// simulation
	assign comp_win_minus_phy_dat = x_lim_minus;
	assign comp_out_x_phy_dat = out_stub_x_phy_a_2dly;

	wire signed [`STUB_X_PHY_BITS-1:0] out_stub_x_phy_b_2dly;       // outer layer 'b' x physical coordinate
	assign out_stub_x_phy_b_2dly = struct_out_stub_b_2dly[`STUB_X_PHY_MSB:`STUB_X_PHY_LSB];
	wire signed [`STUB_Z_PHY_BITS-1:0] out_stub_z_phy_b_2dly;       // outer layer 'b' z physical coordinate
	assign out_stub_z_phy_b_2dly = struct_out_stub_b_2dly[`STUB_Z_PHY_MSB:`STUB_Z_PHY_LSB];
	TS_out_stub_x_compare out_stub_x_compare_b(.clk(proc_clk), .valid(en_comp_b_4dly), .stub_dat(out_stub_x_phy_b_2dly),
		.x_lim_plus(x_lim_plus), .x_lim_minus(x_lim_minus), .match(pass_x_b) );
	TS_out_stub_z_compare out_stub_z_compare_b(.clk(proc_clk), .valid(en_comp_b_4dly), .stub_dat(out_stub_z_phy_b_2dly),
		.z_lim_high(z_lim_high), .z_lim_low(z_lim_low), .match(pass_z_b) );

	wire signed [`STUB_X_PHY_BITS-1:0] out_stub_x_phy_c_2dly;       // outer layer 'c' x physical coordinate
	assign out_stub_x_phy_c_2dly = struct_out_stub_c_2dly[`STUB_X_PHY_MSB:`STUB_X_PHY_LSB];
	wire signed [`STUB_Z_PHY_BITS-1:0] out_stub_z_phy_c_2dly;       // outer layer 'c' z physical coordinate
	assign out_stub_z_phy_c_2dly = struct_out_stub_c_2dly[`STUB_Z_PHY_MSB:`STUB_Z_PHY_LSB];
	TS_out_stub_x_compare out_stub_x_compare_c(.clk(proc_clk), .valid(en_comp_c_4dly), .stub_dat(out_stub_x_phy_c_2dly),
		.x_lim_plus(x_lim_plus), .x_lim_minus(x_lim_minus), .match(pass_x_c) );
	TS_out_stub_z_compare out_stub_z_compare_c(.clk(proc_clk), .valid(en_comp_c_4dly), .stub_dat(out_stub_z_phy_c_2dly),
		.z_lim_high(z_lim_high), .z_lim_low(z_lim_low), .match(pass_z_c) );

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Connect a set of output FIFOs that will hold everything needed to further process a tracklet
	// The data inputs come from pipeline delayed versions of the inputs to this module. 
	// The various input pieces are packet into a structure.
	// NOTE: We hope to reduce the amount of data that is passed to the next stage. For instance,
	// only the physical positions should be needed. The indexes should be able to be dropped.
	// unpack 'struct_in_stub'
	wire signed [`STUB_Z_IDX_BITS-1:0] in_stub_z_idx_4dly;       // inner layer z index
	wire signed [`STUB_Z_PHY_BITS-1:0] in_stub_z_phy_4dly;       // inner layer z physical coordinate
	wire signed [`STUB_X_IDX_BITS-1:0] in_stub_x_idx_4dly;       // inner layer x index
	wire signed [`STUB_X_PHY_BITS-1:0] in_stub_x_phy_4dly;       // inner layer x physical coordinate
	assign in_stub_z_idx_4dly = struct_in_stub_4dly[`STUB_Z_IDX_MSB:`STUB_Z_IDX_LSB];
	assign in_stub_z_phy_4dly = struct_in_stub_4dly[`STUB_Z_PHY_MSB:`STUB_Z_PHY_LSB];
	assign in_stub_x_idx_4dly = struct_in_stub_4dly[`STUB_X_IDX_MSB:`STUB_X_IDX_LSB];
	assign in_stub_x_phy_4dly = struct_in_stub_4dly[`STUB_X_PHY_MSB:`STUB_X_PHY_LSB];

	// unpack 'struct_out_stub_a'
	wire signed [`STUB_Z_IDX_BITS-1:0] out_stub_z_idx_a_3dly;       // outer layer z index
	wire signed [`STUB_Z_PHY_BITS-1:0] out_stub_z_phy_a_3dly;       // outer layer z physical coordinate
	wire signed [`STUB_X_IDX_BITS-1:0] out_stub_x_idx_a_3dly;       // outer layer x index
	wire signed [`STUB_X_PHY_BITS-1:0] out_stub_x_phy_a_3dly;       // outer layer x physical coordinate
	assign out_stub_z_idx_a_3dly = struct_out_stub_a_3dly[`STUB_Z_IDX_MSB:`STUB_Z_IDX_LSB];
	assign out_stub_z_phy_a_3dly = struct_out_stub_a_3dly[`STUB_Z_PHY_MSB:`STUB_Z_PHY_LSB];
	assign out_stub_x_idx_a_3dly = struct_out_stub_a_3dly[`STUB_X_IDX_MSB:`STUB_X_IDX_LSB];
	assign out_stub_x_phy_a_3dly = struct_out_stub_a_3dly[`STUB_X_PHY_MSB:`STUB_X_PHY_LSB];

	// unpack 'struct_out_stub_b'
	wire signed [`STUB_Z_IDX_BITS-1:0] out_stub_z_idx_b_3dly;       // outer layer z index
	wire signed [`STUB_Z_PHY_BITS-1:0] out_stub_z_phy_b_3dly;       // outer layer z physical coordinate
	wire signed [`STUB_X_IDX_BITS-1:0] out_stub_x_idx_b_3dly;       // outer layer x index
	wire signed [`STUB_X_PHY_BITS-1:0] out_stub_x_phy_b_3dly;       // outer layer x physical coordinate
	assign out_stub_z_idx_b_3dly = struct_out_stub_b_3dly[`STUB_Z_IDX_MSB:`STUB_Z_IDX_LSB];
	assign out_stub_z_phy_b_3dly = struct_out_stub_b_3dly[`STUB_Z_PHY_MSB:`STUB_Z_PHY_LSB];
	assign out_stub_x_idx_b_3dly = struct_out_stub_b_3dly[`STUB_X_IDX_MSB:`STUB_X_IDX_LSB];
	assign out_stub_x_phy_b_3dly = struct_out_stub_b_3dly[`STUB_X_PHY_MSB:`STUB_X_PHY_LSB];

	// unpack 'struct_out_stub_c'
	wire signed [`STUB_Z_IDX_BITS-1:0] out_stub_z_idx_c_3dly;       // outer layer z index
	wire signed [`STUB_Z_PHY_BITS-1:0] out_stub_z_phy_c_3dly;       // outer layer z physical coordinate
	wire signed [`STUB_X_IDX_BITS-1:0] out_stub_x_idx_c_3dly;       // outer layer x index
	wire signed [`STUB_X_PHY_BITS-1:0] out_stub_x_phy_c_3dly;       // outer layer x physical coordinate
	assign out_stub_z_idx_c_3dly = struct_out_stub_c_3dly[`STUB_Z_IDX_MSB:`STUB_Z_IDX_LSB];
	assign out_stub_z_phy_c_3dly = struct_out_stub_c_3dly[`STUB_Z_PHY_MSB:`STUB_Z_PHY_LSB];
	assign out_stub_x_idx_c_3dly = struct_out_stub_c_3dly[`STUB_X_IDX_MSB:`STUB_X_IDX_LSB];
	assign out_stub_x_phy_c_3dly = struct_out_stub_c_3dly[`STUB_X_PHY_MSB:`STUB_X_PHY_LSB];

	TS_tracklet_fifo tracklet_fifo_a(.wr_clk(proc_clk), .reset(reset), .z_valid(pass_z_a), .x_valid(pass_x_a),
		.crossing_num(crossing_num_4dly),
		.in_stub_z_phy(in_stub_z_phy_4dly), .in_stub_z_idx(in_stub_z_idx_4dly),
		.in_stub_x_phy(in_stub_x_phy_4dly), .in_stub_x_idx(in_stub_x_idx_4dly),
		.out_stub_z_phy(out_stub_z_phy_a_3dly), .out_stub_z_idx(out_stub_z_idx_a_3dly),
		.out_stub_x_phy(out_stub_x_phy_a_3dly), .out_stub_x_idx(out_stub_x_idx_a_3dly),
		.tracklet(struct_tracklet_a), .rd_clk(io_clk), .rd_en(tracklet_rd_en_a) );
	TS_tracklet_fifo tracklet_fifo_b(.wr_clk(proc_clk), .reset(reset), .z_valid(pass_z_b), .x_valid(pass_x_b),
		.crossing_num(crossing_num_4dly),
		.in_stub_z_phy(in_stub_z_phy_4dly), .in_stub_z_idx(in_stub_z_idx_4dly),
		.in_stub_x_phy(in_stub_x_phy_4dly), .in_stub_x_idx(in_stub_x_idx_4dly),
		.out_stub_z_phy(out_stub_z_phy_b_3dly), .out_stub_z_idx(out_stub_z_idx_b_3dly),
		.out_stub_x_phy(out_stub_x_phy_b_3dly), .out_stub_x_idx(out_stub_x_idx_b_3dly),
		.tracklet(struct_tracklet_b), .rd_clk(io_clk), .rd_en(tracklet_rd_en_b) );
	TS_tracklet_fifo tracklet_fifo_c(.wr_clk(proc_clk), .reset(reset), .z_valid(pass_z_c), .x_valid(pass_x_c),
		.crossing_num(crossing_num_4dly),
		.in_stub_z_phy(in_stub_z_phy_4dly), .in_stub_z_idx(in_stub_z_idx_4dly),
		.in_stub_x_phy(in_stub_x_phy_4dly), .in_stub_x_idx(in_stub_x_idx_4dly),
		.out_stub_z_phy(out_stub_z_phy_c_3dly), .out_stub_z_idx(out_stub_z_idx_c_3dly),
		.out_stub_x_phy(out_stub_x_phy_c_3dly), .out_stub_x_idx(out_stub_x_idx_c_3dly),
		.tracklet(struct_tracklet_c), .rd_clk(io_clk), .rd_en(tracklet_rd_en_c) );

	// simulation
	assign tracklet_in_x_phy = in_stub_x_phy_4dly;
	assign tracklet_out_x_phy = out_stub_x_phy_a_3dly;

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Connect a set of counters that will keep track of how many tracklets have been found for each module pair.
	TS_tracklet_cntr tracklet_cntr_a(.clk(proc_clk), .clr(tracklet_cnt_clr_dly[8]), .x_valid(pass_x_a), .z_valid(pass_z_a),
		.cnt(num_tracklets_a));
	TS_tracklet_cntr tracklet_cntr_b(.clk(proc_clk), .clr(tracklet_cnt_clr_dly[8]), .x_valid(pass_x_b), .z_valid(pass_z_b),
		.cnt(num_tracklets_b));
	TS_tracklet_cntr tracklet_cntr_c(.clk(proc_clk), .clr(tracklet_cnt_clr_dly[8]), .x_valid(pass_x_c), .z_valid(pass_z_c),
		.cnt(num_tracklets_c));

	// Connect a FIFO that will hold the final tracklet count from all module pairs for each crossing.
	TS_tracklet_cnt_fifo tracklet_cnt_fifo(.wr_clk(proc_clk), .reset(reset), .cnt_a(num_tracklets_a),
		.cnt_b(num_tracklets_b), .cnt_c(num_tracklets_c), .wr_en(tracklet_cnt_fifo_wr_en_dly[2]),
		.tracklet_cnt_fifo_empty(tracklet_cnt_fifo_empty), .struct_tracklet_cnt(struct_tracklet_cnt),
		.rd_clk(proc_clk), .rd_en(tracklet_cnt_fifo_rd_en)
	);
		
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// connect a controller that will process the data
	TS_controller controller(.clk(proc_clk), .reset(reset), .en_proc(en_proc),
		.stub_cnt_fifo_empty(stub_cnt_fifo_empty),
		.stub_cnt_fifo_rd_en(stub_cnt_fifo_rd_en),
		.in_stub_adr_ld_en(in_stub_adr_ld_en), .out_stub_adr_ld_en(out_stub_adr_ld_en),
		.in_stub_adr_cnt_en(in_stub_adr_cnt_en), .out_stub_adr_cnt_en(out_stub_adr_cnt_en),
		.in_stub_cntr_ld_en(in_stub_cntr_ld_en), .out_stub_cntr_ld_en(out_stub_cntr_ld_en),
		.in_stub_cntr_cnt_en(in_stub_cntr_cnt_en), .out_stub_cntr_cnt_en(out_stub_cntr_cnt_en),
		.in_stub_cnt_is_zero(in_stub_cnt_is_zero), .out_stub_cnt_is_zero_a(out_stub_cnt_is_zero_a),
		.out_stub_cnt_is_zero_b(out_stub_cnt_is_zero_b), .out_stub_cnt_is_zero_c(out_stub_cnt_is_zero_c),
		.en_comp_a(en_comp_a), .en_comp_b(en_comp_b), .en_comp_c(en_comp_c),
		.tracklet_cnt_clr(tracklet_cnt_clr), .tracklet_cnt_fifo_wr_en(tracklet_cnt_fifo_wr_en)
	);

	// connect signals to the testbus
	assign testbus[0] = in_stub_adr_ld_en;
	assign testbus[1] = out_stub_adr_ld_en;
	assign testbus[2] = in_stub_adr_cnt_en;
	assign testbus[3] = out_stub_adr_cnt_en;
	assign testbus[4] = in_stub_cntr_ld_en;
	assign testbus[5] = out_stub_cntr_ld_en;
	assign testbus[6] = in_stub_cntr_cnt_en;
	assign testbus[7] = out_stub_cntr_cnt_en;

	assign testbus[8] = en_comp_a_4dly;
	assign testbus[9] = tracklet_cnt_clr_dly[8];
	assign testbus[10] = tracklet_cnt_fifo_wr_en_dly[2];
	assign testbus[11] = pass_x_a;
	assign testbus[12] = pass_z_a;
	assign testbus[13] = tracklet_cnt_fifo_empty;
	assign testbus[14] = z_win_low_dat[0];
	assign testbus[15] = x_lim_minus[0];
	

endmodule

	
