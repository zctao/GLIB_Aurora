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
REM  Description: A .bat file to run a simulation using the aurora8b10b_2_exdes module,
REM               an example design which instantiates aurora8b10b_2.
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
REM Compile the Aurora package in the work directory
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_aurora_pkg.vhd;
REM Compile testbench source
ncvhdl -RELAX -V93 -work work ..\..\simulation\aurora8b10b_2_tb.vhd;
REM Compile the HDL for the Device Under Test
REM Hotplug Module
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_hotplug.vhd;
REM AXI Shim modules
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_axi_to_ll.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_ll_to_axi.vhd;
REM Aurora Lane Modules 
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_chbond_count_dec_4byte.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_err_detect_4byte.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_lane_init_sm_4byte.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_sym_dec_4byte.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_sym_gen_4byte.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_aurora_lane_4byte.vhd;
REM Global Logic Modules
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_channel_err_detect.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_channel_init_sm.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_idle_and_ver_gen.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_global_logic.vhd;
REM TX LocalLink User Interface modules
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_tx_ll_control.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_tx_ll_datapath.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_tx_ll.vhd;
REM RX_LL Pdu Modules
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_left_align_control.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_left_align_mux.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_output_mux.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_output_switch_control.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_rx_ll_deframer.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_sideband_output.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_storage_ce_control.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_storage_count_control.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_storage_mux.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_storage_switch_control.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_valid_data_counter.vhd;
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_rx_ll_pdu_datapath.vhd;
REM RX_LL top level
ncvhdl -RELAX -V93 -work work ..\..\src\aurora8b10b_2_rx_ll.vhd;
REM Top Level Modules and wrappers
ncvhdl -RELAX -V93 -work work ..\..\example_design\clock_module\aurora8b10b_2_clock_module.vhd;
ncvhdl -RELAX -V93 -work work ..\..\example_design\cc_manager\aurora8b10b_2_standard_cc_module.vhd;
ncvhdl -RELAX -V93 -work work ..\..\example_design\gt\aurora8b10b_2_transceiver_wrapper.vhd;
ncvhdl -RELAX -V93 -work work ..\..\example_design\gt\aurora8b10b_2_gtx.vhd;
ncvhdl -RELAX -V93 -work work ..\..\..\aurora8b10b_2.vhd;
ncvhdl -RELAX -V93 -work work ..\..\example_design\traffic_gen_check\aurora8b10b_2_frame_check.vhd;
ncvhdl -RELAX -V93 -work work ..\..\example_design\traffic_gen_check\aurora8b10b_2_frame_gen.vhd;   
ncvhdl -RELAX -V93 -work work ..\..\example_design\aurora8b10b_2_reset_logic.vhd;
ncvhdl -RELAX -V93 -work work ..\..\example_design\aurora8b10b_2_exdes.vhd;
REM Elaborate Design
ncelab -relax -TIMESCALE 1ns/1ps -ACCESS +rwc work.aurora8b10b_2_TB

REM Run simulation
ncsim +access+rw work.aurora8b10b_2_TB -input @"simvision -input wave_ncsim.sv"
