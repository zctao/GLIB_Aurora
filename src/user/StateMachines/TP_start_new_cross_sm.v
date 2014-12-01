
// Created by fizzim.pl version 4.42 on 2013:05:23 at 09:22:01 (www.fizzim.com)

module TP_start_new_cross_sm (
  output reg cntr_ld_en,    // Load tracklet counters
  output reg fifo_rd_en,    // Read tracklet counts from the input FIFO
  output reg start_proc,    // Start processing this crossing
  input wire clk,           // Pipeline clock
  input wire new_cross,     // Tracklets from a new crossing are ready
  input wire proc_bsy,      // The current crossing is still being processed
  input wire res            // Reset
);
  
  // state bits
  parameter 
  IDLE     = 0, 
  DLY1     = 1, 
  DLY2     = 2, 
  LD_CNTR  = 3, 
  RD_FIFO  = 4, 
  TST_BSY  = 5; 
  
  reg [5:0] state;
  reg [5:0] nextstate;
  
  // comb always block
  always @* begin
    nextstate = 6'b000000;
    cntr_ld_en = 0; // default
    fifo_rd_en = 0; // default
    start_proc = 0; // default
    case (1'b1) // synopsys parallel_case full_case
      state[IDLE]    : begin // Wait for data from a new crossing
        if (new_cross) begin
          nextstate[TST_BSY] = 1'b1;
        end
        else begin
          nextstate[IDLE] = 1'b1;
        end
      end
      state[DLY1]    : begin
        begin
          nextstate[LD_CNTR ] = 1'b1;
        end
      end
      state[DLY2]    : begin
        begin
          nextstate[IDLE] = 1'b1;
        end
      end
      state[LD_CNTR ]: begin
        cntr_ld_en = 1;
        start_proc = 1;
        begin
          nextstate[DLY2] = 1'b1;
        end
      end
      state[RD_FIFO] : begin
        fifo_rd_en = 1;
        begin
          nextstate[DLY1] = 1'b1;
        end
      end
      state[TST_BSY] : begin
        if (!proc_bsy) begin
          nextstate[RD_FIFO] = 1'b1;
        end
        else begin
          nextstate[TST_BSY] = 1'b1;
        end
      end
    endcase
  end
  
  // sequential always block
  always @(posedge clk) begin
    if (res)
      state <= 6'b000001 << IDLE;
    else
      state <= nextstate;
  end
  
  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [63:0] statename;
  always @* begin
    case (1'b1)
      state[IDLE]    :
        statename = "IDLE";
      state[DLY1]    :
        statename = "DLY1";
      state[DLY2]    :
        statename = "DLY2";
      state[LD_CNTR ]:
        statename = "LD_CNTR ";
      state[RD_FIFO] :
        statename = "RD_FIFO";
      state[TST_BSY] :
        statename = "TST_BSY";
      default :
        statename = "XXXXXXXX";
    endcase
  end
  `endif

endmodule

