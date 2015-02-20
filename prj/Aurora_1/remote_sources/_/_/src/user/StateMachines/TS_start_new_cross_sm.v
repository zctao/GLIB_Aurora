
// Created by fizzim.pl version 4.42 on 2013:06:13 at 13:22:50 (www.fizzim.com)

module TS_start_new_cross_sm (
  output reg fifo_rd_en,             // Read stub counts from the input FIFO
  output reg start_proc,             // Start processing this crossing
  output reg stub_adr_ld_en,         // Load address of first stub
  output reg stub_cntr_ld_en,        // Load stub counters
  output reg tracklet_cnt_clr,       // Clear the accumulated counts from the last crossing
  input wire clk,                    // Pipeline clock
  input wire proc_sm_bsy,            // The current crossing is still being processed
  input wire res,                    // Reset
  input wire stub_cnt_fifo_empty     // Stubs from a new crossing are ready
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
    fifo_rd_en = 0; // default
    start_proc = 0; // default
    stub_adr_ld_en = 0; // default
    stub_cntr_ld_en = 0; // default
    tracklet_cnt_clr = 0; // default
    case (1'b1) // synopsys parallel_case full_case
      state[IDLE]    : begin // Wait for data from a new crossing
        if (stub_cnt_fifo_empty) begin
          nextstate[IDLE] = 1'b1;
        end
        else if (!stub_cnt_fifo_empty) begin
          nextstate[TST_BSY] = 1'b1;
        end
        else begin
          nextstate[IDLE] = 1'b1; // Added because implied_loopback is true
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
        start_proc = 1;
        stub_adr_ld_en = 1;
        stub_cntr_ld_en = 1;
        begin
          nextstate[DLY2] = 1'b1;
        end
      end
      state[RD_FIFO] : begin
        fifo_rd_en = 1;
        tracklet_cnt_clr = 1;
        begin
          nextstate[DLY1] = 1'b1;
        end
      end
      state[TST_BSY] : begin
        if (!proc_sm_bsy) begin
          nextstate[RD_FIFO] = 1'b1;
        end
        else if (proc_sm_bsy) begin
          nextstate[TST_BSY] = 1'b1;
        end
        else begin
          nextstate[TST_BSY] = 1'b1; // Added because implied_loopback is true
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

