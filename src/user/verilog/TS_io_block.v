`timescale 1ns / 1ps
// TS_io_block
//
// This module provides the programmable I/O interface for the 'TS' function.
//
// This module provides a pair of lookup tables to hold the search window parameters.
// It uses a dual-port memory. One side is the read/write programming portion.
// The other side is the read-only processing portion.
// The data is packed with both the plus/minus limits for (x) or the high/low
// limits for (z).
// The address comes from the stub's index on a module, rather than the stub's
// physical location. The data, however, is a physical offset.
//
// The latency is 2 clock periods

`include "Constants.txt"
`include "Address.txt"

module TS_io_block(
	// clocks and reset
	input reset,					// active HI
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

	// this function's access to memory and registers
	input proc_clk,
	input [`WINDOW_X_ADR_BITS-1:0] in_stub_x_idx,
	output signed [`WINDOW_X_DAT_BITS-1:0] x_win_plus_dat,
	output signed [`WINDOW_X_DAT_BITS-1:0] x_win_minus_dat,
	input [`WINDOW_Z_ADR_BITS-1:0] in_stub_z_idx,
	output signed [`WINDOW_Z_DAT_BITS-1:0] z_win_high_dat,
	output signed [`WINDOW_Z_DAT_BITS-1:0] z_win_low_dat

);

	wire [31:0] x_packed_out;      // both window limits packed in one data word
	wire [31:0] z_packed_out;      // both window limits packed in one data word
	wire [31:0] x_rdbk_dat;        // I/O port A readback
	wire [31:0] z_rdbk_dat;        // I/O port A readback

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// some common address decoding assignments
	assign mem_space    = (io_addr[15]  == 1'b0);
	assign io_x_lut_adr = (io_addr[14:12] == 3'b000);
	assign io_z_lut_adr = (io_addr[14:12] == 3'b001);
	
	// decode chip selects for each memory table.
	assign io_x_lut_sel = io_sel && mem_space && io_x_lut_adr;
	assign io_z_lut_sel = io_sel && mem_space && io_z_lut_adr;

	// write enable for everything, qualified by chip selects
	assign mem_wr_en  = io_sync & io_wr_en;
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Connect the window parameter lookup tables
	// Create a 'corgen' dual-port memory. The 'A' port will provide the programmable
	// interface for setting up the tables. The 'B' port will be used by the processing
	// logic.
	TS_window_x_lut_memory TS_window_x_lut_memory(
		// programming interface
		.clka(io_clk),
		.ena(io_x_lut_sel),
		.wea(mem_wr_en),
		.addra(io_addr[`WINDOW_X_ADR_BITS-1:0]),
		.dina(io_wr_data),
		.douta(x_rdbk_dat),
		// processing interface
		.clkb(proc_clk),
		.web(1'b0),  // unused, we only read from port 'b'
		.addrb(in_stub_x_idx),
		.dinb(32'b0), // unused, we only read from port 'b'
		.doutb(x_packed_out)
	);
	// unpack the data
	assign x_win_minus_dat[`WINDOW_X_DAT_BITS-1:0] = x_packed_out[`WINDOW_X_DAT_BITS-1:0];    // from low 16 bits
	assign x_win_plus_dat[`WINDOW_X_DAT_BITS-1:0] = x_packed_out[`WINDOW_X_DAT_BITS-1+16:16]; // from high 16 bits

	// Create a 'corgen' dual-port memory. The 'A' port will provide the programmable
	// interface for setting up the tables. The 'B' port will be used by the processing
	// logic.
	TS_window_z_lut_memory TS_window_z_lut_memory(
		// programming interface
		.clka(io_clk),
		.ena(io_z_lut_sel),
		.wea(mem_wr_en),
		.addra(io_addr[`WINDOW_Z_ADR_BITS-1:0]),
		.dina(io_wr_data),
		.douta(z_rdbk_dat),
		// processing interface
		.clkb(proc_clk),
		.web(1'b0),  // unused, we only read from port 'b'
		.addrb(in_stub_z_idx),
		.dinb(32'b0), // unused, we only read from port 'b'
		.doutb(z_packed_out)
	);
	// unpack the data
	assign z_win_low_dat[`WINDOW_Z_DAT_BITS-1:0] = z_packed_out[`WINDOW_Z_DAT_BITS-1:0];    // from low 16 bits
	assign z_win_high_dat[`WINDOW_Z_DAT_BITS-1:0] = z_packed_out[`WINDOW_Z_DAT_BITS-1+16:16]; // from high 16 bits

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// readback mux
	// If a particular register or memory is addressed, connect that register's or memory's signals
	// to the 'io_rd_data' output. At the same time, assert 'io_rd_ack' to tell downstream muxes to
	// use the 'io_rd_data' from this module as their source of data.
	reg [31:0] io_rd_data_reg;
	assign io_rd_data[31:0] = io_rd_data_reg[31:0];
	// Assert 'io_rd_ack' if chip select for this module is asserted during a 'read' operation.
	reg io_rd_ack_reg;
	assign io_rd_ack = io_rd_ack_reg;
	always @(posedge io_clk) begin
		io_rd_ack_reg <= io_sync & io_sel & io_rd_en;
	end
	// Route the selected memory to the 'rdbk' output.
	always @(posedge io_clk) begin
		if (io_rd_en & io_x_lut_sel) io_rd_data_reg[31:0] <= x_rdbk_dat;
		if (io_rd_en & io_z_lut_sel) io_rd_data_reg[31:0] <= z_rdbk_dat;
	end

endmodule

