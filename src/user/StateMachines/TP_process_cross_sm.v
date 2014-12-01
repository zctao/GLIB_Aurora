
// Created by fizzim.pl version 4.42 on 2013:05:23 at 09:18:57 (www.fizzim.com)

module TP_process_cross_sm (
  output reg cnt_en_a,      // Enable counter A
  output reg cnt_en_b,      // Enable counter B
  output reg cnt_en_c,      // Enable counter C
  output reg pipe_in,       // Inject a 1 into the pipeline
  output reg proc_bsy,      // Actively processing a crossing, asserted in all except IDLE
  input wire clk,           // Pipeline clock
  input wire res,           // Reset
  input wire start_proc,    // Start processing tracklets
  input wire zero_a,        // No more tracklets in block A
  input wire zero_b,        // No more tracklets in block B
  input wire zero_c         // No more tracklets in block C
);
  
  // state bits
  parameter 
  IDLE   = 0, 
  RUN_A  = 1, 
  RUN_B  = 2, 
  RUN_C  = 3, 
  TST_A  = 4, 
  TST_B  = 5, 
  TST_C  = 6; 
  
  reg [6:0] state;
  reg [6:0] nextstate;
  
  // comb always block
  always @* begin
    nextstate = 7'b0000000;
    cnt_en_a = 0; // default
    cnt_en_b = 0; // default
    cnt_en_c = 0; // default
    pipe_in = 0; // default
    proc_bsy = 1; // default
    case (1'b1) // synopsys parallel_case full_case
      state[IDLE]  : begin // Wait for data from a new crossing
        proc_bsy = 0;
        if (start_proc) begin
          nextstate[TST_A] = 1'b1;
        end
        else begin
          nextstate[IDLE] = 1'b1;
        end
      end
      state[RUN_A] : begin
        cnt_en_a = 1;
        pipe_in = 1;
        if (zero_a) begin
          nextstate[TST_B] = 1'b1;
        end
        else if (!zero_a) begin
          nextstate[RUN_A] = 1'b1;
        end
        else begin
          nextstate[RUN_A] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[RUN_B ]: begin
        cnt_en_b = 1;
        pipe_in = 1;
        if (zero_b) begin
          nextstate[TST_C] = 1'b1;
        end
        else if (!zero_b) begin
          nextstate[RUN_B ] = 1'b1;
        end
        else begin
          nextstate[RUN_B ] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[RUN_C] : begin
        cnt_en_c = 1;
        pipe_in = 1;
        if (zero_c) begin
          nextstate[IDLE] = 1'b1;
        end
        else if (!zero_c) begin
          nextstate[RUN_C] = 1'b1;
        end
        else begin
          nextstate[RUN_C] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[TST_A] : begin
        if (!zero_a) begin
          nextstate[RUN_A] = 1'b1;
        end
        else if (zero_a) begin
          nextstate[TST_B] = 1'b1;
        end
        else begin
          nextstate[TST_A] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[TST_B] : begin
        if (zero_b) begin
          nextstate[TST_C] = 1'b1;
        end
        else if (!zero_b) begin
          nextstate[RUN_B ] = 1'b1;
        end
        else begin
          nextstate[TST_B] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[TST_C] : begin
        if (zero_c) begin
          nextstate[IDLE] = 1'b1;
        end
        else if (!zero_c) begin
          nextstate[RUN_C] = 1'b1;
        end
        else begin
          nextstate[TST_C] = 1'b1; // Added because implied_loopback is true
        end
      end
    endcase
  end
  
  // sequential always block
  always @(posedge clk) begin
    if (res)
      state <= 7'b0000001 << IDLE;
    else
      state <= nextstate;
  end
  
  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [47:0] statename;
  always @* begin
    case (1'b1)
      state[IDLE]  :
        statename = "IDLE";
      state[RUN_A] :
        statename = "RUN_A";
      state[RUN_B ]:
        statename = "RUN_B ";
      state[RUN_C] :
        statename = "RUN_C";
      state[TST_A] :
        statename = "TST_A";
      state[TST_B] :
        statename = "TST_B";
      state[TST_C] :
        statename = "TST_C";
      default:
        statename = "XXXXXX";
    endcase
  end
  `endif

endmodule

