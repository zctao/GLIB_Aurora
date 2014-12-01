//                              -*- Mode: Verilog -*-
// Filename        : TP_lookup_memory.v
// Description     : lookup table for track parameter calculations
// Author          : Peter Wittich
// Created On      : Fri Jul  5 13:51:10 2013
// Last Modified By: .
// Last Modified On: .
// Update Count    : 0
// Status          : Unknown, Use with caution!
module TP_lookup_memory (/*AUTOARG*/
   // Outputs
   DO,
   // Inputs
   CLK, READ_A, WRITE_A, RD_EN, WR_EN, DI
   ) ;
   parameter RAM_WIDTH = 18;
   parameter RAM_ADDR_BITS = 5;
   parameter PRELOAD="dump17.txt";
   

   input CLK; // clock
   input READ_A; // read address
   input WRITE_A; // read address 
   input RD_EN; // read enable
   input WR_EN; // read enable
   input [RAM_WIDTH-1:0] DI;
   output [RAM_WIDTH-1:0] DO;
   
   

   //(* RAM_STYLE="{AUTO | BLOCK |  BLOCK_POWER1 | BLOCK_POWER2}" *)
   (* RAM_STYLE="{AUTO}" *)
   reg [RAM_WIDTH-1:0] RAM [(2**RAM_ADDR_BITS)-1:0];
   reg [RAM_WIDTH-1:0] DO;   

   wire [RAM_ADDR_BITS-1:0] READ_A, WRITE_A;
   
   wire [RAM_WIDTH-1:0] DI;

   //  The following code is only necessary if you wish to initialize the RAM 
   //  contents via an external file (use $readmemb for binary data)
   initial
     $readmemh(PRELOAD, RAM, 0, 2**RAM_ADDR_BITS-1);

   always @(posedge CLK) begin
      if (WR_EN)
         RAM[WRITE_A] <= DI;      
      DO <= RAM[READ_A];
   end
   
   
endmodule // TP_lookup_memory
