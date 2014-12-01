`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:13 11/12/2014 
// Design Name: 
// Module Name:    Data_IO 
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
module Data_FSM(
	output reg [31:0] data,
	output reg last,
	output reg valid,
	output reg [3:0] keep,
	input wire en,
	input wire reset,
	input wire clk,
	input wire [31:0] data_1,
	input wire [31:0] data_2,
	input wire [31:0] data_3
    );

	 
	// State Encoding
	localparam IDLE0 = 2'b00,
				  DATA1 = 2'b01,
				  DATA2 = 2'b10,
				  DATA3 = 2'b11;
	
	// State reg Declaration
	reg [1:0] state;
	reg [1:0] nextstate;
	
	// sequential always block
   always @(posedge clk) begin
		if (reset) begin
			state <= IDLE0;
		end else
			state <= nextstate;
	end
	
	// comb always block
	always @* begin
		nextstate = state;
		case (state)
			IDLE0: begin
				data = 32'b0;
				last = 1'b0;
				valid = 1'b0;
				keep = 4'b0000;
				if (en) begin
					nextstate = DATA1;
				end else begin
					nextstate = IDLE0;
				end
			end
			DATA1: begin
				nextstate = DATA2;
				data = data_1;
				last = 1'b0;
				if (data != 0) begin
					valid = 1'b1;
				end else begin
					valid = 1'b0;
				end
				keep = 4'b1111;
			end
			DATA2: begin
				nextstate = DATA3;
				data = data_2;
				last = 1'b0;
				if (data != 0) begin
					valid = 1'b1;
				end else begin
					valid = 1'b0;
				end
				keep = 4'b1111;
			end
			DATA3: begin
				nextstate = IDLE0;
				data = data_3;
				last = 1'b1;
				if (data != 0) begin
					valid = 1'b1;
				end else begin
					valid = 1'b0;
				end
				keep = 4'b1111;
			end
		endcase
				
	end

endmodule
