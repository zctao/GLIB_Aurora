`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:18:34 09/26/2014 
// Design Name: 
// Module Name:    Projection_Calculation 
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
module Projection_Calculation(
    input clk,
	 input [53:0] tracklet,
	 output reg [8:0] read_tracklet,
	 output reg [8:0] write_projection,
	 output reg wr_en,
	 output reg [53:0] projection_calc
    );

	parameter NUM_TKL = 9'd2;
	parameter rproj = 16'sd2154;
	parameter rprojover2 = 16'sd1077;
	parameter layer = 1'b1;
	parameter PHI_BITS = 14;
	parameter Z_BITS = 12;
	parameter PHID_BITS = 9;
	parameter ZD_BITS = 9;
	
	reg signed [13:0] proj_phi;
	reg signed [11:0] proj_z;
	reg signed [8:0] proj_phider;
	reg signed [8:0] proj_zder;
	
	reg signed [29:0] it1;
	reg signed [30:0] it2;
	reg signed [21:0] it3;
	reg signed [27:0] it4;
	reg signed [25:0] it5;
	reg signed [30:0] it6;
	
	reg signed [20:0] it2tmp;
	reg signed [30:0] it3tmp;
	reg signed [21:0] it4tmp1;
	reg signed [11:0] it4tmp2;
	reg signed [17:0] proj_phi_tmp;
	reg signed [12:0] tmpphider;
	reg signed [12:0] tmpphider2;
	reg signed [18:0] it6tmp;
	
	wire signed [13:0] irinv;
	wire signed [17:0] iphi0;
	wire signed [9:0] iz0;
	wire signed [12:0] it;
	
	assign irinv = tracklet[53:40];
	assign iphi0 = {0,tracklet[39:23]};
	assign iz0 = tracklet[22:13];
	assign it = tracklet[12:0];
	
	//pipeline reg
	reg signed [12:0] it_1;
	reg signed [12:0] it_2;
	reg signed [12:0] it_3;
	reg signed [12:0] it_4;
	reg signed [12:0] it_5;
	reg signed [12:0] it_6;
	reg signed [12:0] it_7;
	reg signed [12:0] it_8;

	reg signed [29:0] it1_2;
	reg signed [29:0] it1_3;
	reg signed [29:0] it1_4;
	reg signed [29:0] it1_5;
		
	reg signed [17:0] iphi0_1;
	reg signed [17:0] iphi0_2;
	reg signed [17:0] iphi0_3;
	reg signed [17:0] iphi0_4;
	reg signed [17:0] iphi0_5;
	reg signed [17:0] iphi0_6;
	reg signed [17:0] iphi0_7;
		
	reg signed [9:0] iz0_1;
	reg signed [9:0] iz0_2; 
	reg signed [9:0] iz0_3; 
	reg signed [9:0] iz0_4; 
	reg signed [9:0] iz0_5; 
	reg signed [9:0] iz0_6; 
	reg signed [9:0] iz0_7; 
	reg signed [9:0] iz0_8; 
	
	reg signed [18:0] it6tmp_8;
	
	reg signed [12:0] tmpphider2_3;
	reg signed [12:0] tmpphider2_4;
	reg signed [12:0] tmpphider2_5;
	reg signed [12:0] tmpphider2_6;
	reg signed [12:0] tmpphider2_7;
	reg signed [12:0] tmpphider2_8;
	
	//reg [8:0] write_dly1;
	//reg [8:0] write_dly2;
	//reg [8:0] write_dly3;
	//reg [8:0] write_dly4;
	//reg [8:0] write_dly5;
	//reg [8:0] write_dly6;
	//reg [8:0] write_dly7;
	//reg [8:0] write_dly8;
	//reg [8:0] write_dly9;
	//reg [8:0] write_dly10;
	//reg [8:0] write_dly11;


	initial begin
		//write_dly1 <= 9'b000000000;
		//write_dly2 <= 9'b000000000;
		//write_dly3 <= 9'b000000000;
		//write_dly4 <= 9'b000000000;
		//write_dly5 <= 9'b000000000;
		//write_dly6 <= 9'b000000000;
		//write_dly7 <= 9'b000000000;
		//write_dly8 <= 9'b000000000;
		//write_dly9 <= 9'b000000000;
		//write_dly10 <= 9'b000000000;
		//write_dly11 <= 9'b000000000;
		write_projection <= 9'b000000000;
		read_tracklet <= 9'b000000000; 
	end
	
	always @(posedge clk) begin
	
		if (read_tracklet < NUM_TKL) begin
			read_tracklet <= read_tracklet + 9'b000000001;
		end
		
		/*
		if (write_projection < NUM_TKL) begin
			write_dly1 <= write_dly1 + 9'b000000001;
			write_dly2 <= write_dly1;
			write_dly3 <= write_dly2;
			write_dly4 <= write_dly3;
			write_dly5 <= write_dly4;
			write_dly6 <= write_dly5;
			write_dly7 <= write_dly6;
			write_dly8 <= write_dly7;
			write_dly9 <= write_dly8;
			write_dly10 <= write_dly9;
			write_dly11 <= write_dly10;
			write_projection <= write_dly11;
		//write_projection <= write_projection + 9'b000000001;
		end
		*/
		
		if (write_projection < NUM_TKL && projection_calc > 0) begin
			//write_dly1 <= write_dly1 + 9'b000000001;
			//write_projection <= write_dly1;
			write_projection <= write_projection + 9'b000000001;
		end else begin
			write_projection <= write_projection;
		end
		
		if (proj_phi > 0 || proj_phi <=0) begin 
			wr_en <= 1'b1;
		end else begin
			wr_en <= 1'b0;
		end 
		
		//pipelining
		it_1 <= it;
		it_2 <= it_1;
		it_3 <= it_2;
		it_4 <= it_3;
		it_5 <= it_4;
		it_6 <= it_5;
		it_7 <= it_6;
		it_8 <= it_7;
		
		it1_2 <= it1;
		it1_3 <= it1_2;
		it1_4 <= it1_3;
		it1_5 <= it1_4;
		
		iphi0_1 <= iphi0;
		iphi0_2 <= iphi0_1;
		iphi0_3 <= iphi0_2;
		iphi0_4 <= iphi0_3;
		iphi0_5 <= iphi0_4;
		iphi0_6 <= iphi0_5;
		iphi0_7 <= iphi0_6;
		
		iz0_1 <= iz0;
		iz0_2 <= iz0_1;
		iz0_3 <= iz0_2;
		iz0_4 <= iz0_3;
		iz0_5 <= iz0_4;
		iz0_6 <= iz0_5;
		iz0_7 <= iz0_6;
		iz0_8 <= iz0_7;
		
		it6tmp_8 <= it6tmp;

		tmpphider2_3 <=  tmpphider2;
		tmpphider2_4 <=  tmpphider2_3;
      tmpphider2_5 <=  tmpphider2_4;
		tmpphider2_6 <=  tmpphider2_5;
		tmpphider2_7 <=  tmpphider2_6;
		tmpphider2_8 <=  tmpphider2_7;
		

		//Step 1
		it1 <= rprojover2*irinv;
		tmpphider <= irinv/2;
		
		//Step 2
		it2tmp <= it1>>>9;
		tmpphider2 <= -tmpphider;
		
		//Step 3
		it2 <= it2tmp*it2tmp;
		
		//Step 4
		it3tmp <= (it2*488)>>25;
		
		//Step 5
		it3 <= (1<<<20)+it3tmp;
		it5 <= rproj* it_4;
	
		//Step 6
		it6 <= (it5>>>9)*(it3>>>9);
		it4tmp2 <= it3>>>10;
		it4tmp1 <= it1_5>>>8; 
		
		//Step 7
		it4 <= it4tmp1*it4tmp2;
		it6tmp <= it6>>>12;
		
		//Step 8
		proj_phi_tmp <= iphi0_7-(it4>>>10);
		
		//Step 9
		proj_phi <= proj_phi_tmp>>2;  //Need to carry iphi0
		proj_z <= iz0_8+it6tmp_8;
		proj_phider <= tmpphider2_8[12:4];  //proj phi der
		proj_zder <= it_8[12:4];  //proj z der
		
		//Step 10
		projection_calc <= {10'b0000000000,proj_phi,proj_z,proj_phider,proj_zder};
		
		//projection_calc[53:44] 	<= 10'b1111111111;
		//projection_calc[43:30] <= proj_phi;
		//projection_calc[29:18] <= proj_z;  //proj Z
		//projection_calc[17:9] <= proj_phider;
		//projection_calc[8:0] <= proj_zder;


	end

	
		
		

endmodule
