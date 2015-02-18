`timescale 1ns / 1ps
// TS_tracklet_fifo
//

`include "Constants.txt"

module TS_tracklet_fifo(
	//inputs
	input clk,      // fast processing clock
	input reset,
	input z_valid,
	input x_valid,
	input [`CROSSING_NUMBER_BITS-1:0] crossing_num,            // tells which crossing number to process
	input signed [`STUB_Z_PHY_BITS-1:0] in_stub_z_phy,   // inner layer z physical coordinate
	input signed [`STUB_Z_IDX_BITS-1:0] in_stub_z_idx,   // inner layer z index
	input signed [`STUB_X_PHY_BITS-1:0] in_stub_x_phy,   // inner layer x physical coordinate
	input signed [`STUB_X_IDX_BITS-1:0] in_stub_x_idx,   // inner layer x index
	input signed [`STUB_X_IDX_BITS-1:0] out_stub_x_idx,  // outer layer x index
	input signed [`STUB_X_PHY_BITS-1:0] out_stub_x_phy,  // outer layer x physical coordinate
	input signed [`STUB_Z_IDX_BITS-1:0] out_stub_z_idx,  // outer layer z index
	input signed [`STUB_Z_PHY_BITS-1:0] out_stub_z_phy,  // outer layer z physical coordinate
	input rd_en,

	// outputs
	output [`STRUCT_TRACKLET_DATA_BITS-1:0] tracklet     // all data to define a tracklet
);

	wire [`STRUCT_TRACKLET_DATA_BITS-1:0] in_dat;
	// Stub data is packed in a multi-bit word. Define the boundaries.
	assign in_dat[`TRACKLET_IN_STUB_X_IDX_MSB:`TRACKLET_IN_STUB_X_IDX_LSB] = in_stub_x_idx;
	assign in_dat[`TRACKLET_IN_STUB_X_PHY_MSB:`TRACKLET_IN_STUB_X_PHY_LSB] = in_stub_x_phy;
	assign in_dat[`TRACKLET_IN_STUB_Z_IDX_MSB:`TRACKLET_IN_STUB_Z_IDX_LSB] = in_stub_z_idx;
	assign in_dat[`TRACKLET_IN_STUB_Z_PHY_MSB:`TRACKLET_IN_STUB_Z_PHY_LSB] = in_stub_z_phy;

	assign in_dat[`TRACKLET_OUT_STUB_X_IDX_MSB:`TRACKLET_OUT_STUB_X_IDX_LSB] = out_stub_x_idx;
	assign in_dat[`TRACKLET_OUT_STUB_X_PHY_MSB:`TRACKLET_OUT_STUB_X_PHY_LSB] = out_stub_x_phy;
	assign in_dat[`TRACKLET_OUT_STUB_Z_IDX_MSB:`TRACKLET_OUT_STUB_Z_IDX_LSB] = out_stub_z_idx;
	assign in_dat[`TRACKLET_OUT_STUB_Z_PHY_MSB:`TRACKLET_OUT_STUB_Z_PHY_LSB] = out_stub_z_phy;
	
	assign in_dat[`TRACKLET_CROSSING_NUM_MSB:`TRACKLET_CROSSING_NUM_LSB] = crossing_num;

	TS_tracklet_fifo_core tracklet_fifo_core(.clk(clk), .rst(reset), .din(in_dat), .wr_en(x_valid && z_valid),
		.rd_en(rd_en), .dout(tracklet));

endmodule

