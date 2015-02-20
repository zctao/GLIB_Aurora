`timescale 1ns / 1ps
// TP_io_block
//
// This module provides the programmable I/O interface for the 'TP' function.
//

`include "Constants.txt"
`include "Address.txt"

module TP_io_block(
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
	// constant outputs from the database for a module or rod
	output signed [`DeltaOverR_BITS-1:0]    DeltaOverR_a, DeltaOverR_b, DeltaOverR_c,           // 
	output signed [`DeltaOverDX_BITS-1:0]   DeltaOverDX_a, DeltaOverDX_b, DeltaOverDX_c,        // 
	output signed [`TwoOverOuterR_BITS-1:0] TwoOverOuterR_a, TwoOverOuterR_b, TwoOverOuterR_c,  // 
	output signed [`DXOverR_BITS-1:0]       DXOverR_a, DXOverR_b, DXOverR_c,                    // 
	output signed [`DXrsq_BITS-1:0]         DXrsq_a, DXrsq_b, DXrsq_c,                          // 
	output signed [`ROverDX_BITS-1:0]       ROverDX_a, ROverDX_b, ROverDX_c                     // 
);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// some common address decoding assignments
	assign reg_space = (io_addr[15]  == 1'b1);
	assign set_a_sel     = (io_addr[4:3] == 2'b00);
	assign set_b_sel     = (io_addr[4:3] == 2'b01);
	assign set_c_sel     = (io_addr[4:3] == 2'b10);
	assign reg_wr_en  = io_sync & io_wr_en;
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Connect the 'a' registers with "set_a_sel = io_adr[4:3] == 00"
	assign DeltaOverR_a_sel    = io_sel && reg_space && set_a_sel && (io_addr[2:0] == 3'b000);
	assign DeltaOverDX_a_sel   = io_sel && reg_space && set_a_sel && (io_addr[2:0] == 3'b001);
	assign TwoOverOuterR_a_sel = io_sel && reg_space && set_a_sel && (io_addr[2:0] == 3'b010);
	assign DXOverR_a_sel       = io_sel && reg_space && set_a_sel && (io_addr[2:0] == 3'b011);
	assign DXrsq_a_sel         = io_sel && reg_space && set_a_sel && (io_addr[2:0] == 3'b100);
	assign ROverDX_a_sel       = io_sel && reg_space && set_a_sel && (io_addr[2:0] == 3'b101);
	
	reg18_ce2 DeltaOverR_reg_a(.in(io_wr_data[17:0]), .reset(io_reset), .out(DeltaOverR_a), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(DeltaOverR_a_sel));
	reg18_ce2 DeltaOverDX_reg_a(.in(io_wr_data[17:0]), .reset(io_reset), .out(DeltaOverDX_a), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(DeltaOverDX_a_sel));
	reg18_ce2 TwoOverOuterR_reg_a(.in(io_wr_data[17:0]), .reset(io_reset), .out(TwoOverOuterR_a), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(TwoOverOuterR_a_sel));
	reg18_ce2 DXOverR_reg_a(.in(io_wr_data[17:0]), .reset(io_reset), .out(DXOverR_a), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(DXOverR_a_sel));
	reg18_ce2 DXrsq_reg_a(.in(io_wr_data[17:0]), .reset(io_reset), .out(DXrsq_a), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(DXrsq_a_sel));
	reg18_ce2 ROverDX_reg_a(.in(io_wr_data[17:0]), .reset(io_reset), .out(ROverDX_a), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(ROverDX_a_sel));
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Connect the 'b' registers with "set_b_sel = io_adr[4:3] == 01"
	assign DeltaOverR_b_sel    = io_sel && reg_space && set_b_sel && (io_addr[2:0] == 3'b000);
	assign DeltaOverDX_b_sel   = io_sel && reg_space && set_b_sel && (io_addr[2:0] == 3'b001);
	assign TwoOverOuterR_b_sel = io_sel && reg_space && set_b_sel && (io_addr[2:0] == 3'b010);
	assign DXOverR_b_sel       = io_sel && reg_space && set_b_sel && (io_addr[2:0] == 3'b011);
	assign DXrsq_b_sel         = io_sel && reg_space && set_b_sel && (io_addr[2:0] == 3'b100);
	assign ROverDX_b_sel       = io_sel && reg_space && set_b_sel && (io_addr[2:0] == 3'b101);
	
	reg18_ce2 DeltaOverR_reg_b(.in(io_wr_data[17:0]), .reset(io_reset), .out(DeltaOverR_b), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(DeltaOverR_b_sel));
	reg18_ce2 DeltaOverDX_reg_b(.in(io_wr_data[17:0]), .reset(io_reset), .out(DeltaOverDX_b), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(DeltaOverDX_b_sel));
	reg18_ce2 TwoOverOuterR_reg_b(.in(io_wr_data[17:0]), .reset(io_reset), .out(TwoOverOuterR_b), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(TwoOverOuterR_b_sel));
	reg18_ce2 DXOverR_reg_b(.in(io_wr_data[17:0]), .reset(io_reset), .out(DXOverR_b), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(DXOverR_b_sel));
	reg18_ce2 DXrsq_reg_b(.in(io_wr_data[17:0]), .reset(io_reset), .out(DXrsq_b), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(DXrsq_b_sel));
	reg18_ce2 ROverDX_reg_b(.in(io_wr_data[17:0]), .reset(io_reset), .out(ROverDX_b), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(ROverDX_b_sel));

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Connect the 'c' registers with "set_c_sel = io_adr[4:3] == 10"
	assign DeltaOverR_c_sel    = io_sel && reg_space && set_c_sel && (io_addr[2:0] == 3'b000);
	assign DeltaOverDX_c_sel   = io_sel && reg_space && set_c_sel && (io_addr[2:0] == 3'b001);
	assign TwoOverOuterR_c_sel = io_sel && reg_space && set_c_sel && (io_addr[2:0] == 3'b010);
	assign DXOverR_c_sel       = io_sel && reg_space && set_c_sel && (io_addr[2:0] == 3'b011);
	assign DXrsq_c_sel         = io_sel && reg_space && set_c_sel && (io_addr[2:0] == 3'b100);
	assign ROverDX_c_sel       = io_sel && reg_space && set_c_sel && (io_addr[2:0] == 3'b101);
	
	reg18_ce2 DeltaOverR_reg_c(.in(io_wr_data[17:0]), .reset(io_reset), .out(DeltaOverR_c), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(DeltaOverR_c_sel));
	reg18_ce2 DeltaOverDX_reg_c(.in(io_wr_data[17:0]), .reset(io_reset), .out(DeltaOverDX_c), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(DeltaOverDX_c_sel));
	reg18_ce2 TwoOverOuterR_reg_c(.in(io_wr_data[17:0]), .reset(io_reset), .out(TwoOverOuterR_c), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(TwoOverOuterR_c_sel));
	reg18_ce2 DXOverR_reg_c(.in(io_wr_data[17:0]), .reset(io_reset), .out(DXOverR_c), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(DXOverR_c_sel));
	reg18_ce2 DXrsq_reg_c(.in(io_wr_data[17:0]), .reset(io_reset), .out(DXrsq_c), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(DXrsq_c_sel));
	reg18_ce2 ROverDX_reg_c(.in(io_wr_data[17:0]), .reset(io_reset), .out(ROverDX_c), .clk(io_clk),
				.clk_en1(reg_wr_en), .clk_en2(ROverDX_c_sel));

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
	// Route the selected register to the 'io_rd_data' output.
	always @(posedge io_clk) begin
		// set 'a'
		if (DeltaOverR_a_sel) begin
			io_rd_data_reg[17:0] <= DeltaOverR_a;
			io_rd_data_reg[31:18] <= (DeltaOverR_a[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	
		if (DeltaOverDX_a_sel) begin
			io_rd_data_reg[17:0] <= DeltaOverDX_a;
			io_rd_data_reg[31:18] <= (DeltaOverDX_a[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	
		if (TwoOverOuterR_a_sel) begin
			io_rd_data_reg[17:0] <= TwoOverOuterR_a;
			io_rd_data_reg[31:18] <= (TwoOverOuterR_a[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	
		if (DXOverR_a_sel) begin
			io_rd_data_reg[17:0] <= DXOverR_a;
			io_rd_data_reg[31:18] <= (DXOverR_a[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	
		if (DXrsq_a_sel) begin
			io_rd_data_reg[17:0] <= DXrsq_a;
			io_rd_data_reg[31:18] <= (DXrsq_a[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	
		if (ROverDX_a_sel) begin
			io_rd_data_reg[17:0] <= ROverDX_a;
			io_rd_data_reg[31:18] <= (ROverDX_a[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	

		// set 'b'
		if (DeltaOverR_b_sel) begin
			io_rd_data_reg[17:0] <= DeltaOverR_b;
			io_rd_data_reg[31:18] <= (DeltaOverR_b[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	
		if (DeltaOverDX_b_sel) begin
			io_rd_data_reg[17:0] <= DeltaOverDX_b;
			io_rd_data_reg[31:18] <= (DeltaOverDX_b[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	
		if (TwoOverOuterR_b_sel) begin
			io_rd_data_reg[17:0] <= TwoOverOuterR_b;
			io_rd_data_reg[31:18] <= (TwoOverOuterR_b[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	
		if (DXOverR_b_sel) begin
			io_rd_data_reg[17:0] <= DXOverR_b;
			io_rd_data_reg[31:18] <= (DXOverR_b[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	
		if (DXrsq_b_sel) begin
			io_rd_data_reg[17:0] <= DXrsq_b;
			io_rd_data_reg[31:18] <= (DXrsq_b[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	
		if (ROverDX_b_sel) begin
			io_rd_data_reg[17:0] <= ROverDX_b;
			io_rd_data_reg[31:18] <= (ROverDX_b[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	

		// set 'c'
		if (DeltaOverR_c_sel) begin
			io_rd_data_reg[17:0] <= DeltaOverR_c;
			io_rd_data_reg[31:18] <= (DeltaOverR_c[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	
		if (DeltaOverDX_c_sel) begin
			io_rd_data_reg[17:0] <= DeltaOverDX_c;
			io_rd_data_reg[31:18] <= (DeltaOverDX_c[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	
		if (TwoOverOuterR_c_sel) begin
			io_rd_data_reg[17:0] <= TwoOverOuterR_c;
			io_rd_data_reg[31:18] <= (TwoOverOuterR_c[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	
		if (DXOverR_c_sel) begin
			io_rd_data_reg[17:0] <= DXOverR_c;
			io_rd_data_reg[31:18] <= (DXOverR_c[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	
		if (DXrsq_c_sel) begin
			io_rd_data_reg[17:0] <= DXrsq_c;
			io_rd_data_reg[31:18] <= (DXrsq_c[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	
		if (ROverDX_c_sel) begin
			io_rd_data_reg[17:0] <= ROverDX_c;
			io_rd_data_reg[31:18] <= (ROverDX_c[17]) ? 14'hffff : 14'h0000; // Sign Extension for 2's complement.
		end	
	end


endmodule

