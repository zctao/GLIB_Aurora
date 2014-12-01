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


IF NOT EXIST "%XILINX%" (
   ECHO  XILINX environment variable has not been set.  This variable
   ECHO  points to your Xilinx ISE tools, and is required to run Aurora
   ECHO  scripts.  Consult the user guide to find out how to edit and run
   EXIT /b
)

REM -----------------------------------------------------------------------------
REM Read command line arguments

REM Clean results directory
REM Create results directory      
REM Change current directory to results
ECHO WARNING: Removing existing results directory
RMDIR /S /Q results
MKDIR results
COPY synplify.prj .\results\
COPY ..\example_design\v6_vio.ngc   .\results\
COPY ..\example_design\v6_icon.ngc  .\results\
REM -----------------------------------------------------------------------------
REM Run Synthesis

ECHO ### Running Synplify Pro
synplify_pro -batch synplify.prj

COPY aurora8b10b_exdes.edf .\results\

ECHO Copying files from example design directory to the results directory
COPY ..\example_design\aurora8b10b_exdes.ucf .\results\
CD results


REM -----------------------------------------------------------------------------
REM Run ngdbuild

ngdbuild aurora8b10b_exdes

REM  -----------------------------------------------------------------------------
REM-------------------------------Run map-------------------------------------------

ECHO 'Running map'
map -detail aurora8b10b_exdes -o mapped.ncd

   
REM -----------------------------------------------------------------------------
REM Run par

ECHO 'Running par'
par mapped.ncd routed.ncd mapped.pcf
   
REM -----------------------------------------------------------------------------
REM Report par results

ECHO 'Running design through bitgen'
bitgen routed.ncd routed.bit mapped.pcf

REM -----------------------------------------------------------------------------
REM Trace Report

ECHO 'Running trce'
trce -e 10 routed -o routed mapped.pcf
  
REM -----------------------------------------------------------------------------
REM Run netgen


ECHO 'Running netgen to create gate level Verilog model'
netgen -ofmt verilog -sdf_anno false routed.ncd routed.v

REM Change directory to implement

CD ..

ECHO INFO:Implementation is complete for aurora8b10b_exdes
ECHO INFO:Refer to results directory for implementation results
