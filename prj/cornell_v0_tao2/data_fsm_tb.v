`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:48:40 11/12/2014
// Design Name:   Data_FSM
// Module Name:   C:/Users/LabView User/Documents/ztaotest/Aurora/zttest/prj/cornell_v0_tao2/data_fsm_tb.v
// Project Name:  cornell_v0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Data_FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module data_fsm_tb;

	// Inputs
	reg reset;
	reg clk;
	reg en;
	reg [31:0] data_1;
	reg [31:0] data_2;
	reg [31:0] data_3;

	// Outputs
	wire [31:0] data;
	wire last;
	wire valid;
	wire [3:0] keep;

	// Instantiate the Unit Under Test (UUT)
	Data_FSM uut (
		.data(data), 
		.last(last), 
		.reset(reset), 
		.valid(valid),
		.keep(keep),
		.clk(clk), 
		.en(go), 
		.data_1(data_1), 
		.data_2(data_2), 
		.data_3(data_3)
	);

	reg go;
	reg gone;

	initial begin
		// Initialize Inputs
		reset <= 0;
		clk <= 0;
		en <= 0;
		go <= 0;
		gone <= 0;
		data_1 <= 32'hdeadbeef;
		data_2 <= 32'hcafebabe;
		data_3 <= 32'h19900614;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 1'b1;
		#10
		reset = 1'b0;
		#100
		data_1 <= 32'hdeadbeef;
		data_2 <= 32'hcafebabe;
		data_3 <= 32'h19900614;
		#10
		en = 1'b1;
		#50
		en = 1'b0;
		
		#100
		data_1 <= 32'h12345678;
		data_2 <= 32'h98765432;
		data_3 <= 32'habcdef01;
		
		#10 
		en = 1'b1;
		#10
		en = 1'b0;
	end
	
	always 
			#4 clk = !clk;
			
	always @(posedge clk) begin
		if (en) begin
			if (gone ~^ go) begin
				go = !go;
				gone = 1'b1;
			end 
		end else begin
			go <= 0;
			gone <= 0;
		end
	end
	
      
endmodule

