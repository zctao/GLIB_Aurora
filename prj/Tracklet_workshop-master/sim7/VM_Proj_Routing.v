`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:12 09/26/2014 
// Design Name: 
// Module Name:    VM_Proj_Routing 
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
module VM_Proj_Routing(
    input clk,
	 input [53:0] projection,
	 output reg [8:0] read_projection,
	 
	 output reg wr_en_phi1z1,
	 output reg wr_en_phi1z2,
	 output reg wr_en_phi2z1,
	 output reg wr_en_phi2z2,
	 output reg wr_en_phi3z1,
	 output reg wr_en_phi3z2,
	 
	 output reg [8:0] wr_add_phi1z1,
	 output reg [8:0] wr_add_phi1z2,
	 output reg [8:0] wr_add_phi2z1,
	 output reg [8:0] wr_add_phi2z2,
	 output reg [8:0] wr_add_phi3z1,
	 output reg [8:0] wr_add_phi3z2,
	 
	 output reg [12:0] vm_projection
	 
    );

	parameter NUM_PROJ = 9'd2;
	parameter zbit = 29;

	
	reg [3:0] vm_sel;
	//delays
	//reg [8:0] read_projection_delay;
	//reg [8:0] read_projection_delay2;
	reg [12:0] vm_projection_delay;
	//reg [12:0] vm_projection_delay2;
	reg [8:0] wr_add_phi1z1_delay;
	reg [8:0] wr_add_phi1z2_delay;
	reg [8:0] wr_add_phi2z1_delay;
	reg [8:0] wr_add_phi2z2_delay;
	reg [8:0] wr_add_phi3z1_delay;
	reg [8:0] wr_add_phi3z2_delay;

	reg [5:0] index;

	
	initial begin
		//read_projection_delay <= 9'b000000000;
		read_projection <= 9'b000000000;
		wr_add_phi1z1_delay <= 9'b000000000;
		wr_add_phi1z2_delay <= 9'b000000000;
		wr_add_phi2z1_delay <= 9'b000000000;
		wr_add_phi2z2_delay <= 9'b000000000;
		wr_add_phi3z1_delay <= 9'b000000000;
		wr_add_phi3z2_delay <= 9'b000000000;
		vm_sel <= 4'b0000;
	end
	

	
	always @(posedge clk) begin
	
		vm_projection_delay <= {index,projection[40:38],projection[26:23]};    //{index,phi[40:38],z[26:23]}
		//vm_projection_delay2 <= vm_projection_delay;
		vm_projection <= vm_projection_delay;
		index <= read_projection[5:0];
	
		vm_sel <= {projection[43:41],projection[27]};  //use top 3 bits [42:41] of phi
		
		if (projection > 0 || vm_sel >0) begin

			if (!(read_projection >0)) begin
				vm_sel <= 0;
			end
		
			if (read_projection < NUM_PROJ) begin
				//read_projection_delay <= read_projection_delay + 9'b000000001;
				read_projection <= read_projection + 9'b000000001;
				//read_projection <= read_projection_delay;
			end
		
			if (vm_sel == 4'b0010 || vm_sel == 4'b0100) begin
				wr_en_phi1z1 <= 1'b1;
				wr_add_phi1z1_delay <= wr_add_phi1z1_delay + 1'b1;
				wr_add_phi1z1 <= wr_add_phi1z1_delay;
			end else begin
				wr_en_phi1z1 <= 1'b0;
			end
		
			if (vm_sel == 4'b0011 || vm_sel == 4'b0101) begin
				wr_en_phi1z2 <= 1'b1;
				wr_add_phi1z2_delay <= wr_add_phi1z2_delay + 1'b1;
				wr_add_phi1z2 <= wr_add_phi1z2_delay;
			end else begin
				wr_en_phi1z2 <= 1'b0;
			end
			
			if (vm_sel == 4'b0110 || vm_sel == 4'b1000) begin
				wr_en_phi2z1 <= 1'b1;
				wr_add_phi2z1_delay <= wr_add_phi2z1_delay + 1'b1;
				wr_add_phi2z1 <= wr_add_phi2z1_delay;
			end else begin
				wr_en_phi2z1 <= 1'b0;
			end
		
			if (vm_sel == 4'b0111 || vm_sel == 4'b1001) begin
				wr_en_phi2z2 <= 1'b1;
				wr_add_phi2z2_delay <= wr_add_phi2z2_delay + 1'b1;
				wr_add_phi2z2 <= wr_add_phi2z2_delay;
			end else begin
				wr_en_phi2z2 <= 1'b0;
			end
		
			if (vm_sel == 4'b1010 || vm_sel == 4'b1100) begin
				wr_en_phi3z1 <= 1'b1;
				wr_add_phi3z1_delay <= wr_add_phi3z1_delay + 1'b1;
				wr_add_phi3z1 <= wr_add_phi3z1_delay;
			end else begin
				wr_en_phi3z1 <= 1'b0;
			end
		
			if (vm_sel == 4'b1011 || vm_sel == 4'b1101) begin
				wr_en_phi3z2 <= 1'b1;
				wr_add_phi3z2_delay <= wr_add_phi3z2_delay + 1'b1;
				wr_add_phi3z2 <= wr_add_phi3z2_delay;
			end else begin
				wr_en_phi3z2 <= 1'b0;
			end
		
		end else begin
			wr_en_phi1z1 <= 1'b0;
			wr_en_phi1z2 <= 1'b0;
			wr_en_phi2z1 <= 1'b0;
			wr_en_phi2z2 <= 1'b0;
			wr_en_phi3z1 <= 1'b0;
			wr_en_phi3z2 <= 1'b0;
		end
		
		if (read_projection < 9'b000000011) begin
			//read_projection <= 9'b000000000;
			wr_add_phi1z1_delay <= 9'b000000000;
			wr_add_phi1z2_delay <= 9'b000000000;
			wr_add_phi2z1_delay <= 9'b000000000;
			wr_add_phi2z2_delay <= 9'b000000000;
			wr_add_phi3z1_delay <= 9'b000000000;
			wr_add_phi3z2_delay <= 9'b000000000;
			//vm_sel <= 4'b0000;
		end

	end



endmodule
