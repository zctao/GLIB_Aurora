@ECHO OFF
REM  -----------------------------------------------------------------------------
REM (c) Copyright 2008 Xilinx, Inc. All rights reserved.
REM
REM This file contains confidential and proprietary information
REM of Xilinx, Inc. and is protected under U.S. and
REM international copyright and other intellectual property
REM laws.
REM
REM DISCLAIMER
REM This disclaimer is not a license and does not grant any
REM rights to the materials distributed herewith. Except as
REM otherwise provided in a valid license issued to you by
REM Xilinx, and to the maximum extent permitted by applicable
REM law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
REM WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
REM AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
REM BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
REM INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
REM (2) Xilinx shall not be liable (whether in contract or tort,
REM including negligence, or under any other theory of
REM liability) for any loss or damage of any kind or nature
REM related to, arising under or in connection with these
REM materials, including for any direct, or any indirect,
REM special, incidental, or consequential loss or damage
REM (including loss of data, profits, goodwill, or any type of
REM loss or damage suffered as a result of any action brought
REM by a third party) even if such damage or loss was
REM reasonably foreseeable or Xilinx had been advised of the
REM possibility of the same.
REM
REM CRITICAL APPLICATIONS
REM Xilinx products are not designed or intended to be fail-
REM safe, or for use in any application requiring fail-safe
REM performance, such as life-support or safety devices or
REM systems, Class III medical devices, nuclear facilities,
REM applications related to the deployment of airbags, or any
REM other applications that could lead to death, personal
REM injury, or severe property or environmental damage
REM (individually and collectively, "Critical
REM Applications"). Customer assumes the sole risk and
REM liability of any use of Xilinx products in Critical
REM Applications, subject only to applicable laws and
REM regulations governing limitations on product liability.
REM
REM THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
REM PART OF THIS FILE AT ALL TIMES.
REM
REM
REM  -----------------------------------------------------------------------------
REM
REM  SIMULATE_NCSIM.BAT
REM
REM
REM  Description: A .bat file to run a simulation using the aurora8b10b_exdes module,
REM               an example design which instantiates aurora8b10b.
REM
REM               Ensure the follwoing:
REM               The library paths for UNISIMS_VER, SIMPRIMS_VER, XILINXCORELIB_VER,
REM               UNISIM, SIMPRIM, XILINXCORELIB are set correctly in the cds.lib and
REM               hdl.var files.
REM               Variables LMC_HOME and XILINX are set
REM               Define the mapping for the work library in cds.lib file.
REM               DEFINE work ./work
REM              
REM ############################################################################

REM Create and map a work directory
mkdir work
REM Compile common sourcesthe glbl module, used to simulate global powerup features of the FPGA
ncvlog -work work $XILINX\verilog\src\glbl.v;
REM Compile testbench source
ncvlog -work work ..\..\simulation\aurora8b10b_tb.v;
REM Compile the HDL for the Device Under Test
REM Hotplug Module
ncvlog -work work ..\..\src\aurora8b10b_hotplug.v;
REM AXI Shim modules
ncvlog -work work ..\..\src\aurora8b10b_axi_to_ll.v;
ncvlog -work work ..\..\src\aurora8b10b_ll_to_axi.v;
REM Aurora Lane Modules 
ncvlog -work work ..\..\src\aurora8b10b_chbond_count_dec_4byte.v;
ncvlog -work work ..\..\src\aurora8b10b_err_detect_4byte.v;
ncvlog -work work ..\..\src\aurora8b10b_lane_init_sm_4byte.v;
ncvlog -work work ..\..\src\aurora8b10b_sym_dec_4byte.v;
ncvlog -work work ..\..\src\aurora8b10b_sym_gen_4byte.v;
ncvlog -work work ..\..\src\aurora8b10b_aurora_lane_4byte.v;
REM Global Logic Modules
ncvlog -work work ..\..\src\aurora8b10b_channel_err_detect.v;
ncvlog -work work ..\..\src\aurora8b10b_channel_init_sm.v;
ncvlog -work work ..\..\src\aurora8b10b_idle_and_ver_gen.v;
ncvlog -work work ..\..\src\aurora8b10b_global_logic.v;
REM TX LocalLink User Interface modules
ncvlog -work work ..\..\src\aurora8b10b_tx_ll_control.v;
ncvlog -work work ..\..\src\aurora8b10b_tx_ll_datapath.v;
ncvlog -work work ..\..\src\aurora8b10b_tx_ll.v;
REM RX_LL Pdu Modules
ncvlog -work work ..\..\src\aurora8b10b_left_align_control.v;
ncvlog -work work ..\..\src\aurora8b10b_left_align_mux.v;
ncvlog -work work ..\..\src\aurora8b10b_output_mux.v;
ncvlog -work work ..\..\src\aurora8b10b_output_switch_control.v;
ncvlog -work work ..\..\src\aurora8b10b_rx_ll_deframer.v;
ncvlog -work work ..\..\src\aurora8b10b_sideband_output.v;
ncvlog -work work ..\..\src\aurora8b10b_storage_ce_control.v;
ncvlog -work work ..\..\src\aurora8b10b_storage_count_control.v;
ncvlog -work work ..\..\src\aurora8b10b_storage_mux.v;
ncvlog -work work ..\..\src\aurora8b10b_storage_switch_control.v;
ncvlog -work work ..\..\src\aurora8b10b_valid_data_counter.v;
ncvlog -work work ..\..\src\aurora8b10b_rx_ll_pdu_datapath.v;
REM RX_LL top level
ncvlog -work work ..\..\src\aurora8b10b_rx_ll.v;
REM Top Level Modules and wrappers
ncvlog -work work ..\..\example_design\clock_module\aurora8b10b_clock_module.v;
ncvlog -work work ..\..\example_design\cc_manager\aurora8b10b_standard_cc_module.v;
ncvlog -work work ..\..\example_design\gt\aurora8b10b_transceiver_wrapper.v;
ncvlog -work work ..\..\example_design\gt\aurora8b10b_gtx.v;
ncvlog -work work ..\..\..\aurora8b10b.v;
ncvlog -work work ..\..\example_design\traffic_gen_check\aurora8b10b_frame_check.v;
ncvlog -work work ..\..\example_design\traffic_gen_check\aurora8b10b_frame_gen.v;   
ncvlog -work work ..\..\example_design\aurora8b10b_reset_logic.v;
ncvlog -work work ..\..\example_design\aurora8b10b_exdes.v;
REM Elaborate Design
ncelab -TIMESCALE 1ns/1ps -ACCESS +rw work.aurora8b10b_TB work.glbl

REM Run simulation
ncsim work.aurora8b10b_TB -input @"simvision -input wave_ncsim.sv"
