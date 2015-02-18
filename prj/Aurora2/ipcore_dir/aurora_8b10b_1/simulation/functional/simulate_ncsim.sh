#!/bin/sh
##############################################################################
## (c) Copyright 2008 Xilinx, Inc. All rights reserved.
##
## This file contains confidential and proprietary information
## of Xilinx, Inc. and is protected under U.S. and
## international copyright and other intellectual property
## laws.
##
## DISCLAIMER
## This disclaimer is not a license and does not grant any
## rights to the materials distributed herewith. Except as
## otherwise provided in a valid license issued to you by
## Xilinx, and to the maximum extent permitted by applicable
## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
## WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
## (2) Xilinx shall not be liable (whether in contract or tort,
## including negligence, or under any other theory of
## liability) for any loss or damage of any kind or nature
## related to, arising under or in connection with these
## materials, including for any direct, or any indirect,
## special, incidental, or consequential loss or damage
## (including loss of data, profits, goodwill, or any type of
## loss or damage suffered as a result of any action brought
## by a third party) even if such damage or loss was
## reasonably foreseeable or Xilinx had been advised of the
## possibility of the same.
##
## CRITICAL APPLICATIONS
## Xilinx products are not designed or intended to be fail-
## safe, or for use in any application requiring fail-safe
## performance, such as life-support or safety devices or
## systems, Class III medical devices, nuclear facilities,
## applications related to the deployment of airbags, or any
## other applications that could lead to death, personal
## injury, or severe property or environmental damage
## (individually and collectively, "Critical
## Applications"). Customer assumes the sole risk and
## liability of any use of Xilinx products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
##
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES.
##
##
##############################################################################
##
## SIMULATE_NCSIM.SH
##
##
## Description: A .sh file to run a simulation using the aurora_8b10b_1_exdes module,
##              an example design which instantiates aurora_8b10b_1.
##
##              Ensure the follwoing:
##              The library paths for UNISIMS_VER, SIMPRIMS_VER, XILINXCORELIB_VER,
##              UNISIM, SIMPRIM, XILINXCORELIB are set correctly in the cds.lib and
##              hdl.var files.
##              Variables LMC_HOME and XILINX are set
##              Define the mapping for the work library in cds.lib file.
##              DEFINE work ./work
##             
##############################################################################

# Create and map a work directory
mkdir work
# Compile the Aurora package in the work directory
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_aurora_pkg.vhd;
# Compile testbench source
ncvhdl -RELAX -V93 -work work ../../simulation/aurora_8b10b_1_tb.vhd;
# Compile the HDL for the Device Under Test
# Hotplug Module
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_hotplug.vhd;
# AXI Shim modules
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_axi_to_ll.vhd;
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_ll_to_axi.vhd;
# Aurora Lane Modules 
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_chbond_count_dec.vhd;
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_err_detect.vhd;
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_lane_init_sm.vhd;
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_sym_dec.vhd;
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_sym_gen.vhd;
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_aurora_lane.vhd;
# Global Logic Modules
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_channel_err_detect.vhd;
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_channel_init_sm.vhd;
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_idle_and_ver_gen.vhd;
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_global_logic.vhd;
# TX LocalLink User Interface modules
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_tx_ll_control.vhd;
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_tx_ll_datapath.vhd;
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_tx_ll.vhd;
# RX_LL Pdu Modules
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_rx_ll_pdu_datapath.vhd;
# RX_LL top level
ncvhdl -RELAX -V93 -work work ../../src/aurora_8b10b_1_rx_ll.vhd;
# Top Level Modules and wrappers
ncvhdl -RELAX -V93 -work work ../../example_design/clock_module/aurora_8b10b_1_clock_module.vhd;
ncvhdl -RELAX -V93 -work work ../../example_design/cc_manager/aurora_8b10b_1_standard_cc_module.vhd;
ncvhdl -RELAX -V93 -work work ../../example_design/gt/aurora_8b10b_1_transceiver_wrapper.vhd;
ncvhdl -RELAX -V93 -work work ../../example_design/gt/aurora_8b10b_1_gtx.vhd;
ncvhdl -RELAX -V93 -work work ../../../aurora_8b10b_1.vhd;
ncvhdl -RELAX -V93 -work work ../../example_design/traffic_gen_check/aurora_8b10b_1_frame_check.vhd;
ncvhdl -RELAX -V93 -work work ../../example_design/traffic_gen_check/aurora_8b10b_1_frame_gen.vhd;   
ncvhdl -RELAX -V93 -work work ../../example_design/aurora_8b10b_1_reset_logic.vhd;
ncvhdl -RELAX -V93 -work work ../../example_design/aurora_8b10b_1_exdes.vhd;
##Elaborate Design
ncelab -relax -TIMESCALE 1ns/1ps -ACCESS +rwc work.aurora_8b10b_1_TB

##Run simulation
ncsim +access+rw work.aurora_8b10b_1_TB -input @"simvision -input wave_ncsim.sv"
