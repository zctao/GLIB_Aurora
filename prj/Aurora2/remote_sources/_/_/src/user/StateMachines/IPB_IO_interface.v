
// Created by fizzim.pl version 4.42 on 2013:07:05 at 10:42:38 (www.fizzim.com)

module IPB_IO_interface (
  output reg io_rd_en,      // full operation long read enable
  output reg io_sync,       // An operation is in progress
  output reg io_wr_en,      // one cycle long write enable
  output reg ipb_ack,       // one cycle long ack back to IPbus
  input wire clk,           // IPbus clock
  input wire io_rd_ack,     // verilog ack
  input wire ipb_strobe,    // IPbus strobe
  input wire ipb_write,     // IPbus write
  input wire res            // Global reset
);
  
  // state bits
  parameter 
  IDLE         = 0, 
  READ_ACK     = 1, 
  READ_DLY1    = 2, 
  READ_DLY2    = 3, 
  READ_START   = 4, 
  READ_WAIT    = 5, 
  WRITE_ACK    = 6, 
  WRITE_ENABLE = 7, 
  WRITE_START  = 8; 
  
  reg [8:0] state;
  reg [8:0] nextstate;
  
  // comb always block
  always @* begin
    nextstate = 9'b000000000;
    io_rd_en = 0; // default
    io_sync = 1; // default
    io_wr_en = 0; // default
    ipb_ack = 0; // default
    case (1'b1) // synopsys parallel_case full_case
      state[IDLE]        : begin // Wait for data from a new crossing
        io_sync = 0;
        // Warning P3: State IDLE has multiple exit transitions, and transition trans10 has no defined priority 
        // Warning P3: State IDLE has multiple exit transitions, and transition trans11 has no defined priority 
        if (ipb_strobe & !ipb_write) begin
          nextstate[READ_START] = 1'b1;
        end
        else if (ipb_strobe & ipb_write) begin
          nextstate[WRITE_START] = 1'b1;
        end
        else begin
          nextstate[IDLE] = 1'b1;
        end
      end
      state[READ_ACK]    : begin
        io_rd_en = 1;
        ipb_ack = 1;
        begin
          nextstate[IDLE] = 1'b1;
        end
      end
      state[READ_DLY1]   : begin
        io_rd_en = 1;
        begin
          nextstate[READ_DLY2] = 1'b1;
        end
      end
      state[READ_DLY2]   : begin
        io_rd_en = 1;
        begin
          nextstate[READ_ACK] = 1'b1;
        end
      end
      state[READ_START]  : begin
        io_rd_en = 1;
        begin
          nextstate[READ_WAIT] = 1'b1;
        end
      end
      state[READ_WAIT]   : begin
        io_rd_en = 1;
        if (io_rd_ack) begin
          nextstate[READ_DLY1] = 1'b1;
        end
        else begin
          nextstate[READ_WAIT] = 1'b1;
        end
      end
      state[WRITE_ACK]   : begin
        ipb_ack = 1;
        begin
          nextstate[IDLE] = 1'b1;
        end
      end
      state[WRITE_ENABLE]: begin
        io_wr_en = 1;
        begin
          nextstate[WRITE_ACK] = 1'b1;
        end
      end
      state[WRITE_START] : begin
        begin
          nextstate[WRITE_ENABLE] = 1'b1;
        end
      end
    endcase
  end
  
  // sequential always block
  always @(posedge clk) begin
    if (res)
      state <= 9'b000000001 << IDLE;
    else
      state <= nextstate;
  end
  
  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [95:0] statename;
  always @* begin
    case (1'b1)
      state[IDLE]        :
        statename = "IDLE";
      state[READ_ACK]    :
        statename = "READ_ACK";
      state[READ_DLY1]   :
        statename = "READ_DLY1";
      state[READ_DLY2]   :
        statename = "READ_DLY2";
      state[READ_START]  :
        statename = "READ_START";
      state[READ_WAIT]   :
        statename = "READ_WAIT";
      state[WRITE_ACK]   :
        statename = "WRITE_ACK";
      state[WRITE_ENABLE]:
        statename = "WRITE_ENABLE";
      state[WRITE_START] :
        statename = "WRITE_START";
      default     :
        statename = "XXXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

