`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:18 09/26/2014 
// Design Name: 
// Module Name:    Memory 
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
module Memory(
    input CLK,
	 input WR_EN,
	 input [RAM_ADDR_BITS-1:0] WR_ADD,
	 input [RAM_WIDTH-1:0] IN,
	 input [RAM_ADDR_BITS-1:0] READ_ADD,
	 
	 output reg [RAM_WIDTH-1:0] OUT
	 
    );

	parameter RAM_WIDTH = 36;
   parameter RAM_ADDR_BITS = 9;
   parameter PRELOAD = "dump17.txt";

   (* RAM_STYLE="{AUTO | BLOCK |  BLOCK_POWER1 | BLOCK_POWER2}" *)
   reg [RAM_WIDTH-1:0] RAM [(2**RAM_ADDR_BITS)-1:0];

   //  The following code is only necessary if you wish to initialize the RAM 
   //  contents via an external file (use $readmemb for binary data)
   initial
      $readmemh(PRELOAD, RAM, 0, 2**RAM_ADDR_BITS-1);

   always @(posedge CLK) begin
      if (WR_EN)
         RAM[WR_ADD] <= IN;
      OUT <= RAM[READ_ADD];
   end
endmodule
