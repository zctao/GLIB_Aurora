module Loop_Buf 
(	
   input  RESET,
	input  USER_CLK,
	
	//Frame Gen Ports
	input         AXI4_S_IP_TREADY,
	output [0:31] AXI4_S_OP_TDATA,
	output [0:3]  AXI4_S_OP_TKEEP,
	output        AXI4_S_OP_TLAST,
	output        AXI4_S_OP_TVALID,
	
	//Frame Check Ports
	input  [0:31] AXI4_S_IP_TX_TDATA,
	input  [0:3]  AXI4_S_IP_TX_TKEEP,
	input         AXI4_S_IP_TX_TLAST,
	input         AXI4_S_IP_TX_TVALID
);

	//register declaration
	reg [0:31] TDATA;
	reg [0:3]  TKEEP;
	reg        TLAST;
	reg        TVALID;
	
   always @ (posedge USER_CLK)
   begin
		if (RESET) begin
			TDATA  <= 0;
			TKEEP  <= 0;
			TLAST  <= 0;
			TVALID <= 0;
		end
	
		if (AXI4_S_IP_TREADY) begin
			TDATA  <= AXI4_S_IP_TX_TDATA;
			TKEEP  <= AXI4_S_IP_TX_TKEEP;
			TLAST  <= AXI4_S_IP_TX_TLAST;
			TVALID <= AXI4_S_IP_TX_TVALID;
		end
	end
	
	assign AXI4_S_OP_TDATA = TDATA;
	assign AXI4_S_OP_TKEEP = TKEEP;
	assign AXI4_S_OP_TLAST = TLAST;
	assign AXI4_S_OP_TVALID = TVALID;
	 
endmodule