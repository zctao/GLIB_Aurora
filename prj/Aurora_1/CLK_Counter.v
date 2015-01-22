`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:53:58 11/19/2014 
// Design Name: 
// Module Name:    CLK_Counter 
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
module CLK_Timer(
    input wire clk,
    input wire reset,
    input wire signal1,
	 input wire signal2,
    output reg [31:0] out
    );

	reg start;
	
	always @ (posedge clk) begin
		if (reset) begin
			out <= 8'b0;
			start <= 0;
		end else begin
			if (signal1 == 1'b0 && signal2 == 1'b0) start <= start;
			if (signal1 == 1'b0 && signal2 == 1'b1) start <= 0;
			if (signal1 == 1'b1 && signal2 == 1'b0) start <= 1;
			if (signal1 == 1'b1 && signal2 == 1'b1) start <= 0;
			if (start) out <= out + 1;
		end
	end

endmodule
