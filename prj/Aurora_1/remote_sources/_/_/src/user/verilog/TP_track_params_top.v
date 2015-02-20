`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////
// track_params_top.v
//
// This is the top level block for an implementation of "calculate track 
// parameters". 
//
// The inputs are integer representations of the (x,z) coordinates of a pair of
// stubs in a double stack. The (x) coordinate is in the same direction as the
// (phi) coordinate, but it relates to the 'flat' module, rather than the curved
// radius of a layer. The (z) coordinate is the longitudinal distance from the
// interaction point.  
//
// A processing stage prior to this block translated the (x, z,
// module_num, rod_num, layer_num) index that came from the detector
// into the physical (x,z) coordinates used here. This handled
// deviations of the actual physical values from the ideal values. The
// integer units are about 1/10th of the pixel size in each dimension,
// so units of (x) are about 0.00125 cm and units of (z) are about
// 0.0125 cm.
//
// The stubs have already passed a 'windowing' test that identifies them as a
// pair for further processing. 
//
// To specify the physical coordinates of any pixel in a sector using
// these units of measure, we need at least a 15-bit unsigned number
// for (z):

//         (27 modules * 10 cm z length) / 0.0125 = 21,600

// However, since (z) values can "go backwards" and cross the
// interaction point, we really need a 16-bit signed number.

// We also need at least a 15-bit signed number for (x):
//          (2 * pi * 102 cm) / 24 sectors / 0.00125 = 21,362 = +/- 10,681
// This is a signed number because (x) is relative to the middle of a sector.
// However, when we project a track, (x) can almost fully overlap the adjacent
// sectors on either side, so we really need +/-(3*10,681) which is a 16-bit
// signed number.
//
// There are a handful of 'constants' required by the calculations. These are
// related to physical attributes of the detector. They will be determined from
// measurements at assembly time and calibrations performed thereafter. They are
// based on three primitives:
//
//              Delta:  the distance between the inner layer and the outer layer of a stack.
//                                      It is in units of centimeters, and has a nominal value of 4 cm.
//                      QUESTION: Will it vary from module to module along a rod, or will it
//                                      be constant for a rod?
//
//              DX:             the size of the integer steps of the (x) position.
//                                      The nominal value is 0.00125 cm
//
//              R:                      the radius to the middle of the inner module of a stack.
//                                      It is in units of centimeters, with nominal values around 34 cm,
//                                      68 cm, and 102 cm.
//                      QUESTION: Will it vary from module to module along a rod, or will it
//                                      be constant for a rod?
//
//      The constants are:
//
//              DeltaOverR = (Delta / R) * BASE5 (where BASE5 = 32768 )
//                                      This is a 12-bit unsigned number with typical values (if Delta = 4 cm):
//                                              layer 1 @ 34 cm = 3855
//                                              layer 2 @ 68 cm = 1928
//                                              layer 3 @ 102 cm = 1285
// 
//              DeltaOverDX = round(Delta/DX)
//              This is a 12-bit unsigned number with typical values (if Delta = 4 cm):
//                round(4 cm / 0.00125 cm) = 3200
//                            NOTE: I changed the name from 'iDelta'. I don't like using case
//                                      to differentiate between variables, and we have 'idelta'
//
//              TwoOverOuterR = ((2.0 / (( R + Delta) * DX)) * BASE6
//                                      This is a 21-bit unsigned number with typical values:
//                                              layer 1 @ 34 cm = 1,379,705
//                                              layer 2 @ 68 cm = 728,178
//                                              layer 3 @ 102 cm = 494,611
//
//              DXOverR = (DX / R) * BASE7
//                                      This is a ??-bit unsigned number with typical values:
//                                              layer 1 @ 34 cm = ??
//                                              layer 2 @ 68 cm = ??
//                                              layer 3 @ 102 cm = ??
//              DXRsq = ((DX * DX * R * R) / 24) * BASE4
//                                      This is a ??-bit unsigned number with typical values:
//                                              layer 1 @ 34 cm = ??
//                                              layer 2 @ 68 cm = ??
//                                              layer 3 @ 102 cm = ??
//              ROverDX = R / DX
//                                      This is a ??-bit unsigned number with typical values:
//                                              layer 1 @ 34 cm = ??
//                                              layer 2 @ 68 cm = ??
//                                              layer 3 @ 102 cm = ??
// 
///////////////////////////////////////////////////////////////////////////////

`include "Constants.txt"
`include "Address.txt"

//`default_nettype none

module TP_track_params_top(
        // clocks and reset
        input  reset,                                    // active HI 
        input  proc_clk, // processing clock at a multiple of the crossing clock
        // programming interface
        // inputs
        input  io_clk, // programming clock
        input  io_sel, // this module has been selected for an I/O operation
        input  io_sync, // start the I/O operation
        input  [15:0] io_addr, // slave address, memory or register. Top 16 bits already consumed.
        input  io_wr_en,                         // this is a write operation
        input  [31:0] io_wr_data,        // data to write for write operations
        // outputs
        output [31:0] io_rd_data,       // data returned for read operations
        output io_rd_ack,                               // 'read' data from this module is ready

        // interface to the tracklet count fifo in the TS block
        input  [`STRUCT_TRACKLET_CNT_BITS-1:0] struct_tracklet_cnt,   // amount of data from all module pairs
        input  tracklet_cnt_fifo_empty, // if not empty, then a set of tracklets is read for the next stage
        output tracklet_cnt_fifo_rd_en, // the next stage want to read from the tracklet count fifo

        // PW HACK START
        input   [6:0] fifo_trk_param_rd_en,
        input   [2:0] wren_to_lk,
        output  [6:0] fifo_trk_param_empty,
        output  [6:0] fifo_trk_param_full,
        // PW HACK END
        // interface to the tracklet data fifos in the TS block
        output  tracklet_rd_en_a,   // read a piece of data from the tracklet fifo
        output  tracklet_rd_en_b,   // read a piece of data from the tracklet fifo
        output  tracklet_rd_en_c,   // read a piece of data from the tracklet fifo
        input  [`STRUCT_TRACKLET_DATA_BITS-1:0] struct_tracklet_a, // all inner stub, outer stub, and crossing data to define a tracklet
        input  [`STRUCT_TRACKLET_DATA_BITS-1:0] struct_tracklet_b, // all inner stub, outer stub, and crossing data to define a tracklet
        input  [`STRUCT_TRACKLET_DATA_BITS-1:0] struct_tracklet_c  // all inner stub, outer stub, and crossing data to define a tracklet
);
   // PW HACK START
   // clocks and reset
   wire [2:0]                                  wren_to_lk;
   wire                                        reset; // active HI 
   wire                                        proc_clk; // processing clock at a multiple of the crossing clock
   // programming interface
   // wires
   wire                                        io_clk; // programming clock
   wire                                        io_sel; // this module has been selected for an I/O operation
   wire                                        io_sync; // start the I/O operation
   wire [15:0]                                 io_addr; // slave address; memory or register. Top 16 bits already consumed.
   wire                                        io_wr_en;                                // this is a write operation
   wire [31:0]                                 io_wr_data;      // data to write for write operations
   // wires
   wire [31:0]                                 io_rd_data;      // data returned for read operations
   wire                                        io_rd_ack;                               // 'read' data from this module is ready

   // interface to the tracklet count fifo in the TS block
   wire [`STRUCT_TRACKLET_CNT_BITS-1:0]        struct_tracklet_cnt;   // amount of data from all module pairs
   wire                                        tracklet_cnt_fifo_empty; // if not empty; then a set of tracklets is read for the next stage
   wire                                        tracklet_cnt_fifo_rd_en; // the next stage want to read from the tracklet count fifo

   wire [6:0]                                  fifo_trk_param_rd_en;
   wire [6:0]                                  fifo_trk_param_empty;
   // interface to the tracklet data fifos in the TS block
   wire                                        tracklet_rd_en_a;   // read a piece of data from the tracklet fifo
   wire                                        tracklet_rd_en_b;   // read a piece of data from the tracklet fifo
   wire                                        tracklet_rd_en_c;   // read a piece of data from the tracklet fifo
   wire [`STRUCT_TRACKLET_DATA_BITS-1:0]       struct_tracklet_a; // all inner stub; outer stub; and crossing data to define a tracklet
   wire [`STRUCT_TRACKLET_DATA_BITS-1:0]       struct_tracklet_b; // all inner stub; outer stub; and crossing data to define a tracklet
   wire [`STRUCT_TRACKLET_DATA_BITS-1:0]      struct_tracklet_c;  // all inner stub, outer stub, and crossing data to define a tracklet

   // PW HACK END
   parameter POWBASE   = 17;
   parameter POWBASE2  = 23;
   parameter POWBASE3  = 15;
   parameter POWBASE4  = 15;
   parameter POWBASE5  = 15;
   parameter POWBASE6  = 15;
   parameter POWBASE9  = 17;
   parameter POWBASE10 = 19;
   parameter POWBASE11 = 15;
   parameter POWBASE12 = 16;
   parameter POWBASE13 = 12;
   parameter POWBASE14 =  2;
   parameter POWBASE15 =  3;
   parameter POWBASE16 =  3;
   parameter POWBASE17 =  9;
   parameter POWBASE18 = 12;
   parameter POWBASE19 = 10;
   parameter POWBASE20 =  9;

   parameter POWBASE7  = 17;
   parameter BASE7     = (1 <<< POWBASE7);
   parameter POWBASE8  = 13;
   parameter BASE8     = (1 <<< POWBASE8);
   // Tracklet data from the fifo is packed in a multi-bit word. Define the boundaries.
   // Break up the tracklet into individual fields
   wire signed [`STUB_X_IDX_BITS-1:0]          in_stub_x_idx;
   assign in_stub_x_idx = tracklet[`TRACKLET_IN_STUB_X_IDX_MSB:`TRACKLET_IN_STUB_X_IDX_LSB];
   wire signed [`STUB_X_PHY_BITS-1:0]          in_stub_x_phy;
   assign in_stub_x_phy = tracklet[`TRACKLET_IN_STUB_X_PHY_MSB:`TRACKLET_IN_STUB_X_PHY_LSB];
   wire signed [`STUB_Z_IDX_BITS-1:0]          in_stub_z_idx;
   assign in_stub_z_idx = tracklet[`TRACKLET_IN_STUB_Z_IDX_MSB:`TRACKLET_IN_STUB_Z_IDX_LSB];
   wire signed [`STUB_Z_PHY_BITS-1:0]          in_stub_z_phy;
   assign in_stub_z_phy = tracklet[`TRACKLET_IN_STUB_Z_PHY_MSB:`TRACKLET_IN_STUB_Z_PHY_LSB];

   wire signed [`STUB_X_IDX_BITS-1:0]          out_stub_x_idx;
   assign out_stub_x_idx = tracklet[`TRACKLET_OUT_STUB_X_IDX_MSB:`TRACKLET_OUT_STUB_X_IDX_LSB];
   wire signed [`STUB_X_PHY_BITS-1:0]          out_stub_x_phy;
   assign out_stub_x_phy = tracklet[`TRACKLET_OUT_STUB_X_PHY_MSB:`TRACKLET_OUT_STUB_X_PHY_LSB];
   wire signed [`STUB_Z_IDX_BITS-1:0]          out_stub_z_idx;
   assign out_stub_z_idx = tracklet[`TRACKLET_OUT_STUB_Z_IDX_MSB:`TRACKLET_OUT_STUB_Z_IDX_LSB];
   wire signed [`STUB_Z_PHY_BITS-1:0]          out_stub_z_phy;
   assign out_stub_z_phy = tracklet[`TRACKLET_OUT_STUB_Z_PHY_MSB:`TRACKLET_OUT_STUB_Z_PHY_LSB];

   wire [`CROSSING_NUMBER_BITS-1:0]            crossing_num;
   assign crossing_num = tracklet[`TRACKLET_CROSSING_NUM_MSB:`TRACKLET_CROSSING_NUM_LSB];

   // Tracklet counts from the fifo are packed in a multi-bit word. Extract for local use.

   // programmable constants from the database for a module or rod
   wire signed [`DeltaOverR_BITS-1:0]          DeltaOverR_a, DeltaOverR_b, DeltaOverR_c; 
   reg signed [`DeltaOverR_BITS-1:0]           DeltaOverR; 
   wire signed [`DeltaOverDX_BITS-1:0]         DeltaOverDX_a, DeltaOverDX_b, DeltaOverDX_c; 
   reg signed [`DeltaOverDX_BITS-1:0]          DeltaOverDX; 
   wire signed [`TwoOverOuterR_BITS-1:0]       TwoOverOuterR_a, TwoOverOuterR_b, TwoOverOuterR_c; 
   reg signed [`TwoOverOuterR_BITS-1:0]        TwoOverOuterR; 
   wire signed [`DXOverR_BITS-1:0]             DXOverR_a, DXOverR_b, DXOverR_c; 
   reg signed [`DXOverR_BITS-1:0]              DXOverR; 
   wire signed [`DXrsq_BITS-1:0]               DXrsq_a, DXrsq_b, DXrsq_c; 
   reg signed [`DXrsq_BITS-1:0]                DXrsq; 
   wire signed [`ROverDX_BITS-1:0]             ROverDX_a, ROverDX_b, ROverDX_c; 
   reg signed [`ROverDX_BITS-1:0]              ROverDX; 

        // Connect the block that holds the programmable constants registers
 /*  TP_io_block io_block(
                // clocks and reset
                .reset(reset),                  // active HI
                // programming interface
                .io_clk(io_clk),               // programming clock
                .io_sel(io_sel), // this module is selected for an I/O operation
                .io_sync(io_sync), // start the I/O operation
                .io_addr(io_addr[15:0]), // memory address, top 16 bits alread consumed
                .io_wr_en(io_wr_en), // this is a write operation
                .io_wr_data(io_wr_data[31:0]),// data to write for write operations
                // outputs
                .io_rd_data(io_rd_data), // data returned for read operations
                .io_rd_ack(io_rd_ack), // 'read' data from this module is ready
                // constant outputs from the database for a module or rod
                .DeltaOverR_a(DeltaOverR_a), .DeltaOverR_b(DeltaOverR_b), 
                        .DeltaOverR_c(DeltaOverR_c), 
                .DeltaOverDX_a(DeltaOverDX_a), .DeltaOverDX_b(DeltaOverDX_b),
                        .DeltaOverDX_c(DeltaOverDX_c),
                .TwoOverOuterR_a(TwoOverOuterR_a), .TwoOverOuterR_b(TwoOverOuterR_b),
                        .TwoOverOuterR_c(TwoOverOuterR_c), 
                .DXOverR_a(DXOverR_a), .DXOverR_b(DXOverR_b), .DXOverR_c(DXOverR_c), 
                .DXrsq_a(DXrsq_a), .DXrsq_b(DXrsq_b), .DXrsq_c(DXrsq_c), 
                .ROverDX_a(ROverDX_a), .ROverDX_b(ROverDX_b), .ROverDX_c(ROverDX_c) 
        );
        */
   // We will sequentially process the data from the tracklet fifos.
   // This requires a mux to select the appropriate input and associated constants
   reg [`STRUCT_TRACKLET_DATA_BITS-1:0]        tracklet;
   //wire                                      stuct_traclet_a;
  always @(posedge proc_clk) begin
     tracklet <= struct_tracklet_a;
     DeltaOverR <= 18'd2682; // signed?
     DeltaOverDX <= 18'd3199; // signed?
     TwoOverOuterR <= 21'sd992308;
     DXOverR <= 18'sd3;
     DXrsq <= 18'sd5;
     ROverDX <= 18'sd39069;
  end
   
   
   /*
  always @(posedge proc_clk) begin
      if (!zero_a) begin 
         tracklet <= struct_tracklet_a;
         DeltaOverR <= DeltaOverR_a;
         DeltaOverDX <= DeltaOverDX_a;
         TwoOverOuterR <= TwoOverOuterR_a;
         DXOverR <= DXOverR_a;
         DXrsq <= DXrsq_a;
         ROverDX <= ROverDX_a;
      end
     else if (!zero_b) begin
         tracklet <= struct_tracklet_b;
         DeltaOverR <= DeltaOverR_b;
         DeltaOverDX <= DeltaOverDX_b;
         TwoOverOuterR <= TwoOverOuterR_b;
         DXOverR <= DXOverR_b;
         DXrsq <= DXrsq_b;
         ROverDX <= ROverDX_b;
      end
      else begin
         tracklet <= struct_tracklet_c;
         DeltaOverR <= DeltaOverR_c;
         DeltaOverDX <= DeltaOverDX_c;
         TwoOverOuterR <= TwoOverOuterR_c;
         DXOverR <= DXOverR_c;
         DXrsq <= DXrsq_c;
         ROverDX <= ROverDX_c;
      end
   end
*/
///////////////////////////////////////////////////////////////////////////////////
// HERE ARE THOUGHTS ABOUT THE PIPELINE

// This is a fully pipelined design that feeds results to a set of FIFOs.
//   1) A numeral at the end of a variable name indicates the stage in the pipeline.
//   2) Any results from a step that are needed in a later step need to pass
//      through a chain of registers.
//   3) Any results that are part of the output record are written to a FIFO
//      as soon as they are available and valid. There is a separate FIFO for
//      each variable. After the last step, the full output record will be aligned
//      in the FIFOs. An output record consists of:
//          in_x0, out_x0, in_z0, out_z0, crossing_num
//          i_phi_zero, i_rinv, i_t, i_z_zero
   // wires just for name-change - set initial conditions
   wire signed [15:0] out_x0, in_x0;
   assign out_x0 = out_stub_x_phy;
   assign in_x0  =  in_stub_x_phy;

   wire signed [15:0] out_z0, in_z0;
   assign out_z0 = out_stub_z_phy;
   assign  in_z0 =  in_stub_z_phy;

   wire valid0;
   assign valid0 = ~ tracklet_cnt_fifo_empty;

///////////////////////////////////////////////////////////////////////////////
// Step: 1
// Create:
//    delta_x1 = out_x0 - in_x0
//    delta_z1 = out_z0 - in_z0
// Write to FIFO if valid:
//    out_x0
//    out_z0
//    crossing_num
// Pass:
//    in_x0 -> in_x1
//    in_z0 -> in_z1
//    valid0 -> valid1
// Drop:
//    out_x0
//    out_z0
//    crossing_num

   // pipeline registers to pass data to the next stage
   reg signed [15:0] in_x1;
   reg signed [15:0] in_z1;
   reg valid1;
   
   // new registers for calculation results
   //
   // delta_x is limited by the minimum radius of curvature. For a 1.5 GeV/c track
   // the radius 'rho' is 1.3 m, and at the outer layer the difference in phi is:
   //    dphi = arcsin(r2/(2*rho)) - arcsin(r1/(2*rho))
   //         = arcsin(1.06m/(2*1.3m)) - arcsin(1.02m/(2*1.3m)) = 0.96 degrees
   // The circumference in units of DX is:
   //    cir = 2*pi*1.06m / 0.0000125m = 532,814
   // The distance spanned by a 1.5 GeV/c track is:
   //    delta_x = 532814 * (0.96/360) = 1420 = +/-710
   // A 9-bit signed number is sufficient for delta_x
   //
   // delta_z is limited at the lowest 'eta' value to the length of 2 modules
   //    delta_z = (2 * 10 cm) / 0.0125 cm = 1600
   // An 11-bit unsigned number is sufficient for delta_z, but because of the need
   // to handle 'backwards' tracks, we need a 12-bit signed number.
   // PW: this is not consistent with Anders' simulation. We need the full 17 bits.
   reg signed [16:0]  delta_x1;  // need 17-bits if inputs are 16-bits
   reg signed [16:0]  delta_z1;  // need 17-bits if inputs are 16-bits
        
   always @ (posedge proc_clk) begin
      // pipeline
      in_x1 <= in_x0;
      in_z1 <= in_z0;
      valid1 <= valid0;
      // calculate
      delta_x1 <= out_x0 - in_x0;
      delta_z1 <= out_z0 - in_z0;
   end

   

   // assign outputs to variable-width FIFOs
   wire fifo_full_x0;
   wire fifo_empty_x0;
   wire fifo_full_z0;
   wire fifo_empty_z0;
   wire fifo_full_cn;
   wire fifo_empty_cn;

   // outputs to top level (?)
   wire signed [17:0] dout_x0;
   wire signed [17:0] dout_z0;
   wire signed [`CROSSING_NUMBER_BITS-1:0] dout_cn;
   wire x0_rd_en, z0_rd_en, cn_rd_en;

   // 2 fill bits = 16 + 2
   TP_trackparam_fifo #(18) trackparam_fifo_x0(.CLK(proc_clk),
                                              .RESET(reset), 
                                              .DI({2'b00,out_x0}),  // out_x0
                                              .DO(dout_x0), .WREN(valid1), 
                                              .RDEN(x0_rd_en),
                                              .EMPTY(fifo_empty_x0), 
                                              .FULL(fifo_full_x0));
   // this width is 12 + 6 empties = total of 18
   // unless I do 9 bits + 4 parity bits
   TP_trackparam_fifo #(18) trackparam_fifo_z0(.CLK(proc_clk), 
                                               .RESET(reset), 
                                               .DI({2'b0,out_z0}), // out_z0
                                               .DO(dout_z0),
                                               .WREN(valid1), 
                                               .RDEN(z0_rd_en),
                                               .EMPTY(fifo_empty_z0), 
                                               .FULL(fifo_full_z0));
   // CROSSING_NUMBER_BITS is 8
   // one empty bit
   TP_trackparam_fifo 
     #(9) trackparam_fifo_cn(.CLK(proc_clk), 
                             .RESET(reset), 
                             .DI({1'b0,crossing_num}), // crossing number
                             .DO(dout_cn), 
                             .WREN(valid1), 
                             .RDEN(cn_rd_en),
                             .EMPTY(fifo_empty_cn), 
                             .FULL(fifo_full_cn));
   
        
///////////////////////////////////////////////////////////////////////////////
// Step: 2
// Create:
//    [eq.1] i_s_one2 = lookup_i_s(delta_x1)       // some 'tag' info may be needed
//    [eq.2] i_a2 = in_x1 * DXOverR 
//    [eq.6] i_t_one2 = in_x1 * DeltaOverR / BASE5 
// Write to FIFO if valid:
//    (nothing)
// Pass:
//    in_x1 -> in_x2
//    in_z1 -> in_z2
//    delta_x1 -> delta_x2
//    delta_z1 -> delta_z2
//    valid1 -> valid2
// Drop:
//    (nothing)

   // pipeline registers to pass data to the next stage
   reg signed [15:0] in_x2;
   reg signed [15:0] in_z2;
   reg signed [12:0] delta_x2;
   reg signed [16:0] delta_z2;
   reg valid2;

   // lookup
   `define LOOKUP1_BITS 13
   wire signed [`LOOKUP1_BITS-1:0] i_s_one2;
   

   // calculations
   reg signed [15:0]               i_a2 ;
   //reg signed [43:0]               full_i_a2 ;
   //wire signed [15:0]              i_a2 ;
   reg signed [29:0]               full_i_t_one2;
   wire signed [9:0]               i_t_one2;

   // wire up the lookup table
   
   

   // this needs to somehow get the module address too
   // i.e. delta_x1 -> {mod[1:0], delta_x1}
   // need to drop sign, lookup, and re-add sign
   wire signed [16:0]              addr;
   assign addr = delta_x1>0?delta_x1:-delta_x1;
   
   TP_lookup_memory #(`LOOKUP1_BITS, 9, "is1.txt") lookup_1(.CLK(proc_clk), 
                                      .READ_A(addr[8:0]), 
                                      .RD_EN(valid1), 
                                      .WRITE_A(io_addr[`LOOKUP1_BITS-1:0]),
                                      .DI(io_wr_data[`LOOKUP1_BITS-1:0]), 
                                      .WR_EN(wren_to_lk[0]),
                                      .DO(i_s_one2));

   always @ (posedge proc_clk) begin
      // pipeline
      in_x2 <= in_x1;
      in_z2 <= in_z1;
      delta_x2 <= delta_x1;
      delta_z2 <= delta_z1;
      valid2 <= valid1;
      // lookup
      // see above
      // calculate
      full_i_t_one2 <= in_x1 * DeltaOverR;
      i_a2 <= in_x1 * DXOverR; // checked
   end

   assign i_t_one2 = full_i_t_one2 >>> POWBASE5; // checked
   
   
        
///////////////////////////////////////////////////////////////////////////////
// Step: 3
// Create:
//    [eq.3] i_b3 = i_a2 * i_a2 / BASE7
//    [eq.7] i_t_two3 = delta_x2 - i_t_one2
//    [eq.13] i_t3 = delta_z2 * i_s_one2 / (BASE2/BASE3)
// Write to FIFO if valid:
//    (nothing)
// Pass:
//    in_x2 -> in_x3
//    in_z2 -> in_z3
//    i_s_one2 -> i_s_one3
//    valid2 -> valid3
// Drop:
//    i_a2
//    i_t_one2
//    delta_z2
//    delta_x2
   // pass
   reg signed [15:0] in_x3;
   reg signed [15:0] in_z3;
   reg signed [`LOOKUP1_BITS-1:0] i_s_one3;
   reg valid3;
   // calculate
   reg signed [31:0] full_i_b3;
   reg signed [42:0] full_i_t3;
   wire signed [13:0] i_b3; // shift by BASE7, 17 bits
   reg signed [15:0] i_t_two3; // actual value is more like 9 bits
   wire signed [16:0] i_t3;
   always @(posedge proc_clk) begin
      // pipeline
      in_x3 <= in_x2;
      in_z3 <= in_z2;
      i_s_one3 <= i_s_one2;
      
      valid3 <= valid2;
      // calculate
      full_i_b3 <= i_a2 * i_a2;
      i_t_two3  <= delta_x2 - i_t_one2; // checked
      full_i_t3 <= delta_z2 * i_s_one2;
   end // always @ (posedge proc_clk)
   // delta_x2 - 13 bits
   // i_t_one2: 10 bits
   assign i_b3 = full_i_b3 >>> POWBASE7; // checked
   assign i_t3 = full_i_t3 >>> (POWBASE2-POWBASE3); // this is tan theta // checked
   
        
///////////////////////////////////////////////////////////////////////////////
// Step: 4
// Create:
//    [eq.4] i_c4 = BASE7 - i_b3
//    [eq.8] i_t_three4 = i_t_two3 * TwoOverOuterR / BASE6
//    [eq.16] i_t_sixp4 = BASE8 + i_b3
//    [eq.18] i_t_seven4 = i_t3 * ROverDX / BASE3
// Write to FIFO if valid:
//    i_t3
// Pass:
//    in_x3 -> in_x4
//    in_z3 -> in_z4
//    i_s_one3 -> i_s_one4
//    i_t3 -> i_t4
//    valid3 -> valid4
// Drop:
//    i_b3
//    i_t_two3
   reg valid4;
   reg signed [15:0] in_x4;
   reg signed [15:0] in_z4;
   reg signed [`LOOKUP1_BITS-1:0] i_s_one4;
   //reg signed [16:0]              i_t4;
   reg signed [17:0] i_c4; 

   reg signed [42:0] full_i_t_three4;
   reg signed [42:0] full_i_t_seven4;
   reg signed [14:0] i_t_sixp4;
   wire [12:0]       i_t_three4;
   wire [16:0]       i_t_seven4;
   
   

   // output fifo
   // needs to be 18 bits
   wire fifo_full_it;
   wire fifo_empty_it;
   wire it_rd_en;
   wire signed [17:0] dout_it;
   
   // 17 + 1 empty
   TP_trackparam_fifo #(18) trackparam_fifo_it(.CLK(proc_clk), 
                                               .RESET(reset), 
                                               .DI({1'b0,i_t3}), // tan theta
                                               .DO(dout_it), .WREN(valid4), 
                                               .RDEN(it_rd_en),
                                               .EMPTY(fifo_empty_it),
                                               .FULL(fifo_full_it));
   always @(posedge proc_clk ) begin
      // pipeline
      valid4 <= valid3;
      in_x4 <= in_x3;
      in_z4 <= in_z3;
      i_s_one4 <= i_s_one3;
      //i_t4 <= i_t3; // unused
      // calculate
      i_c4 = BASE7 - i_b3;
      full_i_t_three4 = i_t_two3 * TwoOverOuterR ;
      i_t_sixp4 = BASE8 + (i_b3>>>(1+POWBASE7-POWBASE8)); // checked
      full_i_t_seven4 = i_t3* ROverDX;
   end // always @ (posedge proc_clk )

   assign i_t_three4 = full_i_t_three4>>> POWBASE6; // checked
   assign i_t_seven4 = full_i_t_seven4>>> POWBASE3; // checked
   
   
        
///////////////////////////////////////////////////////////////////////////////
// Step: 5
// Create:
//    [eq.5] i_s_two5 = i_s_one4 * i_c4 / BASE7
// Write to FIFO if valid:
//    (nothing)
// Pass:
//    in_x4 -> in_x5
//    in_z4 -> in_z5
//    valid4 -> valid5
//    i_t_seven4 -> i_t_seven5
//    i_t_three4 -> i_t_three5
//    i_t4 -> i_t5
//    i_t_sixp4 -> i_t_sixp5
// Drop:
//    i_c4
//    i_s_one4
   reg valid5;
   reg signed [15:0] in_x5;
   reg signed [15:0] in_z5;
   //reg signed [16:0] i_t5;
   reg signed [12:0] i_t_three5;
   reg signed [16:0] i_t_seven5;

   reg signed [43:0] full_i_s_two5;
   wire signed [12:0] i_s_two5;
   reg signed [14:0]  i_t_sixp5;
   
   
   always @(posedge proc_clk ) begin
      // pipeline
      valid5 <= valid4;
      in_x5 <= in_x4;
      in_z5 <= in_z4;
      // i_t5 <= i_t4; unused
      i_t_sixp5 <= i_t_sixp4;
      i_t_seven5 <= i_t_seven4 ;
      i_t_three5 <= i_t_three4;


      // calculate
      full_i_s_two5 = i_s_one4 * i_c4 ;
      
   end
   assign i_s_two5 = full_i_s_two5 >>> POWBASE7; // checked with simulation
   
   
   
///////////////////////////////////////////////////////////////////////////////
// Step: 6
// Create:
//    [eq.9] i_rinv6 = i_s_two5 * i_t_three5 / (BASE2/BASE3)
// Write to FIFO if valid:
//    (nothing)
// Pass:
//    in_x5 -> in_x6
//    in_z5 -> in_z6
//    valid5 -> valid6
//    i_t_seven5 -> i_t_seven6
//    i_t_sixp5 -> i_t_sixp6
// Drop:
//    i_t_three5
//    i_s_two5
   reg valid6;
   reg signed [15:0] in_x6;
   reg signed [15:0] in_z6;
   reg signed [16:0] i_t_seven6;
   reg signed [14:0] i_t_sixp6;

   reg signed [42:0] full_i_rinv6;
   wire signed [15:0] i_rinv6;

   always @(posedge proc_clk) begin
      valid6 <= valid5;
      in_x6 <= in_x5;
      in_z6 <= in_z5;
      i_t_seven6 <= i_t_seven5;
      i_t_sixp6 <= i_t_sixp5;
      full_i_rinv6 = i_s_two5 * i_t_three5;
   end

   assign i_rinv6 = full_i_rinv6 >>> (POWBASE2-POWBASE3);// checked
   

///////////////////////////////////////////////////////////////////////////////
// Step: 7
// Create:
//    [eq.10] i_alpha7 = lookup_alpha(in_x6)          // some 'tag' info may be needed
//    [eq.11] i_beta7 = lookup_beta(i_rinv6, in_x6)   // some 'tag' info may be needed
//    [eq.14] i_t_four7 = i_rinv6 * i_rinv6 / (BASE3*BASE3/BASE2)
// Write to FIFO if valid:
//    i_rinv6
// Pass:
//    in_z6 -> in_z7
//    valid6 -> valid7
//    i_t_seven6 -> i_t_seven7
//    i_t_sixp6 -> i_t_sixp7
// Drop:
//    in_x6
//    i_rinv6
   reg signed [15:0] in_z7;
   reg valid7;
   reg signed [16:0] i_t_seven7;
   reg signed [14:0] i_t_sixp7;
   wire fifo_full_irinv;
   wire fifo_empty_irinv;
   wire signed [13:0] i_beta7;
   wire signed [15:0] i_alpha7;
   

   wire signed [23:0] i_t_four7;
   reg signed [42:0]  full_i_t_four7;
   
   wire signed [17:0] dout_irinv;
   wire               irinv_rd_en;
   
   // 1/r
   // 16 bits + 2 empty
   TP_trackparam_fifo #(18) trackparam_fifo_irinv(.CLK(proc_clk), 
                                                  .RESET(reset), 
                                                  .DI({2'b0,i_rinv6}), // 1/r
                                                  .DO(dout_irinv), 
                                                  .WREN(valid7), 
                                                  .RDEN(irinv_rd_en),
                                                  .EMPTY(fifo_empty_irinv),
                                                  .FULL(fifo_full_irinv));

   `define LOOKUP2_BITS 16
   
   // need to add module addressing
   TP_lookup_memory #(`LOOKUP2_BITS, `LOOKUP2_BITS) 
                         lookup_2(.CLK(proc_clk), .READ_A(in_x6), 
                                  .RD_EN(valid6), 
                                  .WRITE_A(io_addr[`LOOKUP2_BITS-1:0]),
                                  .DI(io_wr_data[`LOOKUP2_BITS-1:0]), 
                                  .WR_EN(wren_to_lk[1]),
                                  .DO(i_alpha7));

   `define LOOKUP3_BITS 14
   // need to add module addressing
   TP_lookup_memory #(`LOOKUP3_BITS, `LOOKUP3_BITS)
                              lookup_3(.CLK(proc_clk), 
                                       .READ_A({2'b00,i_rinv6}), 
                                       .RD_EN(valid6), 
                                       .WRITE_A(io_addr[`LOOKUP3_BITS-1:0]),
                                       .DI(io_wr_data[`LOOKUP3_BITS-1:0]), 
                                       .WR_EN(wren_to_lk[2]),
                                       .DO(i_beta7));

   
   always @(posedge proc_clk) begin
      // pipeline
      valid7 <= valid6;
      in_z7 <= in_z6;
      i_t_seven7 <= i_t_seven6 ;
      i_t_sixp7 <= i_t_sixp6;
      // calculations
      //i_alpha7 = lookup_alpha(in_x6); // 16 bits
      //i_beta7 = lookup_beta(i_rinv6); // 14 bits
      full_i_t_four7 = i_rinv6 * i_rinv6;// 43 bits
   end // always @ (posedge proc_clk)

   assign i_t_four7 = full_i_t_four7 >>> (2*POWBASE3-POWBASE2); // checked - rounding errors?
   

///////////////////////////////////////////////////////////////////////////////
// Step: 8
// Create:
//    [eq.12] i_phi_zero8 = i_beta7 - i_alpha7
//    [eq.15] i_t_five8 =  i_t_four7 * DXRsq /(BASE4*(BASE2/BASE8));
// Write to FIFO if valid:
//    (nothing)
// Pass:
//    in_z7 -> in_z8
//    valid7 -> valid8
//    i_t_seven7 -> i_t_seven8
//    i_t_sixp7 -> i_t_sixp8
/// Drop:
//    i_alpha7
//    i_beta7
//    i_t_four7

   // pipeline
   reg signed [15:0] in_z8;
   reg valid8;
   reg signed [16:0] i_t_seven8;
   reg signed [14:0] i_t_sixp8;
   // calculations
   reg signed [42:0] full_i_t_five8;
   wire signed [2:0] i_t_five8;
   reg signed [20:0] i_phi_zero8;
   
   always @(posedge proc_clk) begin
      // pipeline
      valid8 <= valid7;
      in_z8 <= in_z7;
      i_t_seven8 <= i_t_seven7 ;
      i_t_sixp8 <= i_t_sixp7;
      // calculations
      i_phi_zero8 <= i_beta7 - i_alpha7;
      full_i_t_five8 <= i_t_four7 * DXrsq;
   end

   assign i_t_five8 = full_i_t_five8 >>> (POWBASE4+POWBASE2-POWBASE8); // ??? checked but this is mainly zero...
   

///////////////////////////////////////////////////////////////////////////////
// Step: 9
// Create:
//    [eq.17] i_t_six9 = i_t_sixp8 + i_t_five8 
// Write to FIFO if valid:
//    i_phi_zero8
// Pass:
//    in_z8 -> in_z9
//    valid8 -> valid9
//    i_t_seven8 -> i_t_seven9
/// Drop:
//    i_t_sixp8
//    i_t_five8
//    i_phi_zero8

   wire fifo_full_iphi0;
   wire fifo_empty_iphi0;
   wire iphi0_rd_en;
   wire signed [35:0] dout_iphi0;
   reg valid9;

   // 20 + 16 bits of dummy ... is this right way to do it? 
   TP_trackparam_fifo #(36,"FIFO18_36") trackparam_fifo_phi0(.CLK(proc_clk),
                                                 .RESET(reset),
                                                 // phi0
                                                 .DI({15'b0,i_phi_zero8}),
                                                 .DO(dout_iphi0),
                                                 .WREN(valid8), 
                                                 .RDEN(iphi0_rd_en),
                                                 .EMPTY(fifo_empty_iphi0), 
                                                 .FULL(fifo_full_iphi0));
   
   // pipeline
   reg signed [15:0] in_z9;
   reg signed [16:0] i_t_seven9;

   // calculations
   reg signed [15:0] i_t_six9;

   always @(posedge proc_clk) begin
      // pipeline
      valid9 <= valid8;
      in_z9 <= in_z8;
      i_t_seven9 <= i_t_seven8 ;
      // calculations
      i_t_six9 = i_t_sixp8 + i_t_five8; // checked - but it6p is ~0 always...
   end
   
   

///////////////////////////////////////////////////////////////////////////////
// Step: 10
// Create:
//    [eq.19] i_t_eight10 = i_t_six9 * i_t_seven9 /BASE8
// Write to FIFO if valid:
//    (nothing)
// Pass:
//    in_z9 -> in_z10
//    valid8 -> valid9
/// Drop:
//    i_t_six9
//    i_t_seven9

   // pipeline
   reg signed [15:0] in_z10;
   reg valid10;

   // calculations
   reg signed [42:0] full_i_t_eight10;
   wire signed [15:0] i_t_eight10;
   

   always @(posedge proc_clk) begin
      // pipeline
      valid10 <= valid9;
      in_z10 <= in_z9;
      // calculations
      full_i_t_eight10 <= i_t_six9 * i_t_seven9;
   end
   // 17 bits
   assign i_t_eight10 = full_i_t_eight10 >>> POWBASE8; // checked
   

///////////////////////////////////////////////////////////////////////////////
// Step: 11
// Create:
//    [eq.20] i_z_zero11 = in_z10 - i_t_eight10
// Write to FIFO if valid:
//    (nothing)
// Pass:
//    valid11 -> valid12
// Drop:
//    in_z10
//    i_t_eight10
   reg valid11;
   reg signed [15:0] i_z_zero11;
   
   
   always @(posedge proc_clk) begin
      // pipeline
      valid11 <= valid10;
      // calculate
      i_z_zero11 <= in_z10 - i_t_eight10; // ~checked
   end //

 
   

///////////////////////////////////////////////////////////////////////////////
// Step: 12
// Create:
//    (nothing)
// Write to FIFO if valid:
//    i_z_zero11
// Pass:
//    valid12 -> signal next stage that a new record is available
// Drop:
//    i_z_zero11
   reg valid_final;
   wire valid12;
   assign valid12 = valid_final;

   wire fifo_full_iz0;
   wire fifo_empty_iz0;
   wire iz0_rd_en;
   wire signed [17:0] dout_iz0;

   // 11 + 7 dummy
   TP_trackparam_fifo #(18) trackparam_fifo_iz0(.CLK(proc_clk),
                                                 .RESET(reset), 
                                                 .DI({7'b0,i_z_zero11}), // z0
                                                 .DO(dout_iz0), .WREN(valid12), 
                                                 .RDEN(iz0_rd_en),
                                                 .EMPTY(fifo_empty_iz0), 
                                                 .FULL(fifo_full_iz0));
   
   
   always @(posedge proc_clk) begin
     valid_final <= valid11;
   end
   
   assign iz0_rd_en = fifo_trk_param_rd_en[0];
   assign x0_rd_en = fifo_trk_param_rd_en[1];
   assign z0_rd_en = fifo_trk_param_rd_en[2];
   assign cn_rd_en = fifo_trk_param_rd_en[3];
   assign it_rd_en = fifo_trk_param_rd_en[4];
   assign irinv_rd_en = fifo_trk_param_rd_en[5];
   assign iphi0_rd_en = fifo_trk_param_rd_en[6];

   assign fifo_trk_param_empty = {fifo_empty_iz0,fifo_empty_x0, 
                                  fifo_empty_z0,fifo_empty_cn, 
                                  fifo_empty_it, fifo_empty_irinv,
                                  fifo_empty_iphi0};

   assign fifo_trk_param_full = {fifo_full_iz0,fifo_full_x0, 
                                 fifo_full_z0,fifo_full_cn, 
                                 fifo_full_it, fifo_full_irinv,
                                 fifo_full_iphi0};
   


/////////////////////////////////////////////////////////////////////////////////

endmodule
