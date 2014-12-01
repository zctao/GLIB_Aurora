
// Created by fizzim.pl version 4.42 on 2013:06:07 at 10:40:32 (www.fizzim.com)

module TS_process_cross_sm (
  output reg comparitor_en,              // enable possible comparisons  and tracklet FIFO writing
  output reg cross_proc_sm_bsy,          // busy when processing a crossing
  output reg in_stub_adr_cnt_en,         // increment the stub memory address for the inner layer stubs
  output reg in_stub_cntr_cnt_en,        // decrement the stub counter for the inner layer stubs
  output reg out_stub_adr_cnt_en,        // increment the stub memory address for the outer layer stubs
  output reg out_stub_adr_ld_en,         // load the stub memory address of the first outer layer stub
  output reg out_stub_cntr_cnt_en,       // decrement the stub counters for the outer layer stubs
  output reg out_stub_cntr_ld_en,        // load the stub counters for the outer layer stubs
  output reg tracklet_cnt_fifo_wr_en,    // enable writing the final tracklet count data
  input wire all_out_stub_cnt_zero,      // there are no more stubs to look at for any outer layer
  input wire clk,                        // Pipeline clock
  input wire in_stub_cnt_is_zero,        // there are no more stubs to look at for the inner layer
  input wire res,                        // Reset
  input wire start_cross_proc_sm         // enable processing of this crossing
);
  
  // state bits
  parameter 
  IDLE          = 0, 
  CHANGE_IN_CNT = 1, 
  DONE          = 2, 
  LD_OUT_CNT    = 3, 
  RUN           = 4, 
  TST_IN_CNT    = 5; 
  
  reg [5:0] state;
  reg [5:0] nextstate;
  
  // comb always block
  always @* begin
    nextstate = 6'b000000;
    comparitor_en = 0; // default
    cross_proc_sm_bsy = 1; // default
    in_stub_adr_cnt_en = 0; // default
    in_stub_cntr_cnt_en = 0; // default
    out_stub_adr_cnt_en = 0; // default
    out_stub_adr_ld_en = 0; // default
    out_stub_cntr_cnt_en = 0; // default
    out_stub_cntr_ld_en = 0; // default
    tracklet_cnt_fifo_wr_en = 0; // default
    case (1'b1) // synopsys parallel_case full_case
      state[IDLE]         : begin // Wait for data from a new crossing
        cross_proc_sm_bsy = 0;
        if (start_cross_proc_sm) begin
          nextstate[TST_IN_CNT] = 1'b1;
        end
        else if (!start_cross_proc_sm) begin
          nextstate[IDLE] = 1'b1;
        end
        else begin
          nextstate[IDLE] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[CHANGE_IN_CNT]: begin
        in_stub_adr_cnt_en = 1;
        in_stub_cntr_cnt_en = 1;
        begin
          nextstate[TST_IN_CNT] = 1'b1;
        end
      end
      state[DONE]         : begin
        tracklet_cnt_fifo_wr_en = 1;
        begin
          nextstate[IDLE] = 1'b1;
        end
      end
      state[LD_OUT_CNT]   : begin
        out_stub_adr_ld_en = 1;
        out_stub_cntr_ld_en = 1;
        begin
          nextstate[RUN] = 1'b1;
        end
      end
      state[RUN]          : begin
        comparitor_en = 1;
        out_stub_adr_cnt_en = 1;
        out_stub_cntr_cnt_en = 1;
        if (all_out_stub_cnt_zero) begin
          nextstate[CHANGE_IN_CNT] = 1'b1;
        end
        else if (!all_out_stub_cnt_zero) begin
          nextstate[RUN] = 1'b1;
        end
        else begin
          nextstate[RUN] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[TST_IN_CNT]   : begin
        if (in_stub_cnt_is_zero) begin
          nextstate[DONE] = 1'b1;
        end
        else if (!in_stub_cnt_is_zero) begin
          nextstate[LD_OUT_CNT] = 1'b1;
        end
        else begin
          nextstate[TST_IN_CNT] = 1'b1; // Added because implied_loopback is true
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
  reg [103:0] statename;
  always @* begin
    case (1'b1)
      state[IDLE]         :
        statename = "IDLE";
      state[CHANGE_IN_CNT]:
        statename = "CHANGE_IN_CNT";
      state[DONE]         :
        statename = "DONE";
      state[LD_OUT_CNT]   :
        statename = "LD_OUT_CNT";
      state[RUN]          :
        statename = "RUN";
      state[TST_IN_CNT]   :
        statename = "TST_IN_CNT";
      default      :
        statename = "XXXXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

