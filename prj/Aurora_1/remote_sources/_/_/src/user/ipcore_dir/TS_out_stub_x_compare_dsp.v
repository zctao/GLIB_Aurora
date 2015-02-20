////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.49d
//  \   \         Application: netgen
//  /   /         Filename: TS_out_stub_x_compare_dsp.v
// /___/   /\     Timestamp: Fri Apr 19 16:04:08 2013
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/USER_LOCAL/crs/CMS_trigger/Xilinx/CMS_trig1/ipcore_dir/tmp/_cg/TS_out_stub_x_compare_dsp.ngc C:/USER_LOCAL/crs/CMS_trigger/Xilinx/CMS_trig1/ipcore_dir/tmp/_cg/TS_out_stub_x_compare_dsp.v 
// Device	: 7v2000tflg1925-2
// Input file	: C:/USER_LOCAL/crs/CMS_trigger/Xilinx/CMS_trig1/ipcore_dir/tmp/_cg/TS_out_stub_x_compare_dsp.ngc
// Output file	: C:/USER_LOCAL/crs/CMS_trigger/Xilinx/CMS_trig1/ipcore_dir/tmp/_cg/TS_out_stub_x_compare_dsp.v
// # of Modules	: 1
// Design Name	: TS_out_stub_x_compare_dsp
// Xilinx        : C:\Xilinx14.4\14.4\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module TS_out_stub_x_compare_dsp (
  clk, carryout, a, d, p
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  output carryout;
  input [7 : 0] a;
  input [15 : 0] d;
  output [15 : 0] p;
  
  // synthesis translate_off
  
  wire \blk00000001/sig000000f8 ;
  wire \blk00000001/sig000000f7 ;
  wire \blk00000001/sig000000f6 ;
  wire \blk00000001/sig000000f5 ;
  wire \blk00000001/sig000000f4 ;
  wire \blk00000001/sig000000f3 ;
  wire \blk00000001/sig000000f2 ;
  wire \blk00000001/sig000000f1 ;
  wire \blk00000001/sig000000f0 ;
  wire \blk00000001/sig000000ef ;
  wire \blk00000001/sig000000ee ;
  wire \blk00000001/sig000000ed ;
  wire \blk00000001/sig000000ec ;
  wire \blk00000001/sig000000eb ;
  wire \blk00000001/sig000000ea ;
  wire \blk00000001/sig000000e9 ;
  wire \blk00000001/sig000000e8 ;
  wire \blk00000001/sig000000e7 ;
  wire \blk00000001/sig000000e6 ;
  wire \blk00000001/sig000000e5 ;
  wire \blk00000001/sig000000e4 ;
  wire \blk00000001/sig000000e3 ;
  wire \blk00000001/sig000000e2 ;
  wire \blk00000001/sig000000e1 ;
  wire \blk00000001/sig000000e0 ;
  wire \blk00000001/sig000000df ;
  wire \blk00000001/sig000000de ;
  wire \blk00000001/sig000000dd ;
  wire \blk00000001/sig000000dc ;
  wire \blk00000001/sig000000db ;
  wire \blk00000001/sig000000da ;
  wire \blk00000001/sig000000d9 ;
  wire \blk00000001/sig000000d8 ;
  wire \blk00000001/sig000000d7 ;
  wire \blk00000001/sig000000d6 ;
  wire \blk00000001/sig000000d5 ;
  wire \blk00000001/sig000000d4 ;
  wire \blk00000001/sig000000d3 ;
  wire \blk00000001/sig000000d2 ;
  wire \blk00000001/sig000000d1 ;
  wire \blk00000001/sig000000d0 ;
  wire \blk00000001/sig000000cf ;
  wire \blk00000001/sig000000ce ;
  wire \blk00000001/sig000000cd ;
  wire \blk00000001/sig000000cc ;
  wire \blk00000001/sig000000cb ;
  wire \blk00000001/sig000000ca ;
  wire \blk00000001/sig000000c9 ;
  wire \blk00000001/sig000000c8 ;
  wire \blk00000001/sig000000c7 ;
  wire \blk00000001/sig000000c6 ;
  wire \blk00000001/sig000000c5 ;
  wire \blk00000001/sig000000c4 ;
  wire \blk00000001/sig000000c3 ;
  wire \blk00000001/sig000000c2 ;
  wire \blk00000001/sig000000c1 ;
  wire \blk00000001/sig000000c0 ;
  wire \blk00000001/sig000000bf ;
  wire \blk00000001/sig000000be ;
  wire \blk00000001/sig000000bd ;
  wire \blk00000001/sig000000bc ;
  wire \blk00000001/sig000000bb ;
  wire \blk00000001/sig000000ba ;
  wire \blk00000001/sig000000b9 ;
  wire \blk00000001/sig000000b8 ;
  wire \blk00000001/sig000000b7 ;
  wire \blk00000001/sig000000b6 ;
  wire \blk00000001/sig000000b5 ;
  wire \blk00000001/sig000000b4 ;
  wire \blk00000001/sig000000b3 ;
  wire \blk00000001/sig000000b2 ;
  wire \blk00000001/sig000000b1 ;
  wire \blk00000001/sig000000b0 ;
  wire \blk00000001/sig000000af ;
  wire \blk00000001/sig000000ae ;
  wire \blk00000001/sig000000ad ;
  wire \blk00000001/sig000000ac ;
  wire \blk00000001/sig000000ab ;
  wire \blk00000001/sig000000aa ;
  wire \blk00000001/sig000000a9 ;
  wire \blk00000001/sig000000a8 ;
  wire \blk00000001/sig000000a7 ;
  wire \blk00000001/sig000000a6 ;
  wire \blk00000001/sig000000a5 ;
  wire \blk00000001/sig000000a4 ;
  wire \blk00000001/sig000000a3 ;
  wire \blk00000001/sig000000a2 ;
  wire \blk00000001/sig000000a1 ;
  wire \blk00000001/sig000000a0 ;
  wire \blk00000001/sig0000009f ;
  wire \blk00000001/sig0000009e ;
  wire \blk00000001/sig0000009d ;
  wire \blk00000001/sig0000009c ;
  wire \blk00000001/sig0000009b ;
  wire \blk00000001/sig0000009a ;
  wire \blk00000001/sig00000099 ;
  wire \blk00000001/sig00000098 ;
  wire \blk00000001/sig00000097 ;
  wire \blk00000001/sig00000096 ;
  wire \blk00000001/sig00000095 ;
  wire \blk00000001/sig00000094 ;
  wire \blk00000001/sig00000093 ;
  wire \blk00000001/sig00000092 ;
  wire \blk00000001/sig00000091 ;
  wire \blk00000001/sig00000090 ;
  wire \blk00000001/sig0000008f ;
  wire \blk00000001/sig0000008e ;
  wire \blk00000001/sig0000008d ;
  wire \blk00000001/sig0000008c ;
  wire \blk00000001/sig0000008b ;
  wire \blk00000001/sig00000079 ;
  wire \blk00000001/sig00000078 ;
  wire \blk00000001/sig00000077 ;
  wire \blk00000001/sig00000076 ;
  wire \blk00000001/sig00000075 ;
  wire \blk00000001/sig00000074 ;
  wire \blk00000001/sig00000073 ;
  wire \blk00000001/sig00000072 ;
  wire \blk00000001/sig00000071 ;
  wire \blk00000001/sig00000070 ;
  wire \blk00000001/sig0000006f ;
  wire \blk00000001/sig0000006e ;
  wire \blk00000001/sig0000006d ;
  wire \blk00000001/sig0000006c ;
  wire \blk00000001/sig0000006b ;
  wire \blk00000001/sig0000006a ;
  wire \blk00000001/sig00000069 ;
  wire \blk00000001/sig00000068 ;
  wire \blk00000001/sig00000067 ;
  wire \blk00000001/sig00000066 ;
  wire \blk00000001/sig00000065 ;
  wire \blk00000001/sig00000064 ;
  wire \blk00000001/sig00000063 ;
  wire \blk00000001/sig00000062 ;
  wire \blk00000001/sig00000061 ;
  wire \blk00000001/sig00000060 ;
  wire \blk00000001/sig0000005f ;
  wire \blk00000001/sig0000005e ;
  wire \blk00000001/sig0000005d ;
  wire \blk00000001/sig0000005c ;
  wire \blk00000001/sig0000005b ;
  wire \blk00000001/sig0000005a ;
  wire \blk00000001/sig00000059 ;
  wire \blk00000001/sig00000058 ;
  wire \blk00000001/sig00000057 ;
  wire \blk00000001/sig00000056 ;
  wire \blk00000001/sig00000055 ;
  wire \blk00000001/sig00000054 ;
  wire \blk00000001/sig00000053 ;
  wire \blk00000001/sig00000052 ;
  wire \blk00000001/sig00000051 ;
  wire \blk00000001/sig00000050 ;
  wire \blk00000001/sig0000004f ;
  wire \blk00000001/sig0000004e ;
  wire \blk00000001/sig0000004d ;
  wire \blk00000001/sig0000004c ;
  wire \blk00000001/sig0000004b ;
  wire \blk00000001/sig0000004a ;
  wire \blk00000001/sig00000049 ;
  wire \blk00000001/sig00000048 ;
  wire \blk00000001/sig00000047 ;
  wire \blk00000001/sig00000046 ;
  wire \blk00000001/sig00000045 ;
  wire \blk00000001/sig00000044 ;
  wire \blk00000001/sig00000043 ;
  wire \blk00000001/sig00000042 ;
  wire \blk00000001/sig00000041 ;
  wire \blk00000001/sig00000040 ;
  wire \blk00000001/sig0000003f ;
  wire \blk00000001/sig0000003e ;
  wire \blk00000001/sig0000003d ;
  wire \blk00000001/sig0000003c ;
  wire \blk00000001/sig0000003b ;
  wire \blk00000001/sig0000003a ;
  wire \blk00000001/sig00000039 ;
  wire \blk00000001/sig00000038 ;
  wire \blk00000001/sig00000037 ;
  wire \blk00000001/sig00000036 ;
  wire \blk00000001/sig00000035 ;
  wire \blk00000001/sig00000034 ;
  wire \blk00000001/sig00000033 ;
  wire \blk00000001/sig00000032 ;
  wire \blk00000001/sig00000031 ;
  wire \blk00000001/sig00000030 ;
  wire \blk00000001/sig0000002f ;
  wire \blk00000001/sig0000002e ;
  wire \blk00000001/sig0000002d ;
  wire \blk00000001/sig0000002c ;
  wire \blk00000001/sig0000002b ;
  wire \blk00000001/sig0000002a ;
  wire \blk00000001/sig00000029 ;
  wire \blk00000001/sig00000028 ;
  wire \blk00000001/sig00000027 ;
  wire \blk00000001/sig00000026 ;
  wire \blk00000001/sig00000025 ;
  wire \blk00000001/sig00000024 ;
  wire \blk00000001/sig00000023 ;
  wire \blk00000001/sig00000022 ;
  wire \blk00000001/sig00000021 ;
  wire \blk00000001/sig00000020 ;
  wire \blk00000001/sig0000001f ;
  wire \blk00000001/sig0000001e ;
  wire \blk00000001/sig0000001d ;
  wire \blk00000001/sig0000001c ;
  wire \blk00000001/sig0000001b ;
  wire \blk00000001/sig0000001a ;
  wire \NLW_blk00000001/blk0000006e_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_UNDERFLOW_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_OVERFLOW_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<47>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<46>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<45>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<44>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<43>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<42>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<41>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<40>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<39>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<38>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<37>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<36>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<35>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<34>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<33>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<32>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<31>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<30>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<24>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<23>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<22>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<21>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<20>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<19>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<18>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000006e_P<16>_UNCONNECTED ;
  LUT2 #(
    .INIT ( 4'h8 ))
  \blk00000001/blk0000006f  (
    .I0(\blk00000001/sig000000ab ),
    .I1(\blk00000001/sig0000008f ),
    .O(\blk00000001/sig0000008d )
  );
  DSP48E1 #(
    .ACASCREG ( 2 ),
    .ADREG ( 1 ),
    .ALUMODEREG ( 1 ),
    .AREG ( 2 ),
    .AUTORESET_PATDET ( "NO_RESET" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 2 ),
    .BREG ( 2 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 1 ),
    .CARRYINSELREG ( 1 ),
    .CREG ( 1 ),
    .DREG ( 1 ),
    .INMODEREG ( 1 ),
    .MASK ( 48'h3FFFFFFFFFFF ),
    .MREG ( 1 ),
    .OPMODEREG ( 1 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 1 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .USE_DPORT ( "TRUE" ),
    .USE_MULT ( "MULTIPLY" ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .USE_SIMD ( "ONE48" ))
  \blk00000001/blk0000006e  (
    .PATTERNBDETECT(\NLW_blk00000001/blk0000006e_PATTERNBDETECT_UNCONNECTED ),
    .RSTC(\blk00000001/sig000000d8 ),
    .CEB1(\blk00000001/sig0000008c ),
    .CEAD(\blk00000001/sig0000008c ),
    .MULTSIGNOUT(\NLW_blk00000001/blk0000006e_MULTSIGNOUT_UNCONNECTED ),
    .CEC(\blk00000001/sig0000008c ),
    .RSTM(\blk00000001/sig000000d8 ),
    .MULTSIGNIN(\blk00000001/sig000000d8 ),
    .CEB2(\blk00000001/sig0000008c ),
    .RSTCTRL(\blk00000001/sig000000d8 ),
    .CEP(\blk00000001/sig0000008c ),
    .CARRYCASCOUT(\blk00000001/sig0000008b ),
    .RSTA(\blk00000001/sig000000d8 ),
    .CECARRYIN(\blk00000001/sig0000008c ),
    .UNDERFLOW(\NLW_blk00000001/blk0000006e_UNDERFLOW_UNCONNECTED ),
    .PATTERNDETECT(\NLW_blk00000001/blk0000006e_PATTERNDETECT_UNCONNECTED ),
    .RSTALUMODE(\blk00000001/sig000000d8 ),
    .RSTALLCARRYIN(\blk00000001/sig000000d8 ),
    .CED(\blk00000001/sig0000008c ),
    .RSTD(\blk00000001/sig000000d8 ),
    .CEALUMODE(\blk00000001/sig0000008c ),
    .CEA2(\blk00000001/sig0000008c ),
    .CLK(clk),
    .CEA1(\blk00000001/sig0000008c ),
    .RSTB(\blk00000001/sig000000d8 ),
    .OVERFLOW(\NLW_blk00000001/blk0000006e_OVERFLOW_UNCONNECTED ),
    .CECTRL(\blk00000001/sig0000008c ),
    .CEM(\blk00000001/sig0000008c ),
    .CARRYIN(\blk00000001/sig0000008e ),
    .CARRYCASCIN(\blk00000001/sig000000d8 ),
    .RSTINMODE(\blk00000001/sig000000d8 ),
    .CEINMODE(\blk00000001/sig0000008c ),
    .RSTP(\blk00000001/sig000000d8 ),
    .ACOUT({\blk00000001/sig0000001a , \blk00000001/sig0000001b , \blk00000001/sig0000001c , \blk00000001/sig0000001d , \blk00000001/sig0000001e , 
\blk00000001/sig0000001f , \blk00000001/sig00000020 , \blk00000001/sig00000021 , \blk00000001/sig00000022 , \blk00000001/sig00000023 , 
\blk00000001/sig00000024 , \blk00000001/sig00000025 , \blk00000001/sig00000026 , \blk00000001/sig00000027 , \blk00000001/sig00000028 , 
\blk00000001/sig00000029 , \blk00000001/sig0000002a , \blk00000001/sig0000002b , \blk00000001/sig0000002c , \blk00000001/sig0000002d , 
\blk00000001/sig0000002e , \blk00000001/sig0000002f , \blk00000001/sig00000030 , \blk00000001/sig00000031 , \blk00000001/sig00000032 , 
\blk00000001/sig00000033 , \blk00000001/sig00000034 , \blk00000001/sig00000035 , \blk00000001/sig00000036 , \blk00000001/sig00000037 }),
    .OPMODE({\blk00000001/sig0000009a , \blk00000001/sig00000099 , \blk00000001/sig00000098 , \blk00000001/sig00000097 , \blk00000001/sig00000096 , 
\blk00000001/sig00000095 , \blk00000001/sig00000094 }),
    .PCIN({\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 }),
    .ALUMODE({\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig0000009b , \blk00000001/sig0000009b }),
    .C({\blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , 
\blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , 
\blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , 
\blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , 
\blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , 
\blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , 
\blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , 
\blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , 
\blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c , 
\blk00000001/sig0000008c , \blk00000001/sig0000008c , \blk00000001/sig0000008c }),
    .CARRYOUT({carryout, \NLW_blk00000001/blk0000006e_CARRYOUT<2>_UNCONNECTED , \NLW_blk00000001/blk0000006e_CARRYOUT<1>_UNCONNECTED , 
\NLW_blk00000001/blk0000006e_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({\blk00000001/sig000000b4 , \blk00000001/sig000000b3 , \blk00000001/sig000000b2 , \blk00000001/sig000000b1 , \blk00000001/sig000000b0 }),
    .BCIN({\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 }),
    .B({\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d7 }),
    .BCOUT({\blk00000001/sig00000038 , \blk00000001/sig00000039 , \blk00000001/sig0000003a , \blk00000001/sig0000003b , \blk00000001/sig0000003c , 
\blk00000001/sig0000003d , \blk00000001/sig0000003e , \blk00000001/sig0000003f , \blk00000001/sig00000040 , \blk00000001/sig00000041 , 
\blk00000001/sig00000042 , \blk00000001/sig00000043 , \blk00000001/sig00000044 , \blk00000001/sig00000045 , \blk00000001/sig00000046 , 
\blk00000001/sig00000047 , \blk00000001/sig00000048 , \blk00000001/sig00000049 }),
    .D({\blk00000001/sig000000d6 , \blk00000001/sig000000d6 , \blk00000001/sig000000d6 , \blk00000001/sig000000d6 , \blk00000001/sig000000d6 , 
\blk00000001/sig000000d6 , \blk00000001/sig000000d6 , \blk00000001/sig000000d6 , \blk00000001/sig000000d6 , \blk00000001/sig000000d6 , 
\blk00000001/sig000000d5 , \blk00000001/sig000000d4 , \blk00000001/sig000000d3 , \blk00000001/sig000000d2 , \blk00000001/sig000000d1 , 
\blk00000001/sig000000d0 , \blk00000001/sig000000cf , \blk00000001/sig000000ce , \blk00000001/sig000000cd , \blk00000001/sig000000cc , 
\blk00000001/sig000000cb , \blk00000001/sig000000ca , \blk00000001/sig000000c9 , \blk00000001/sig000000c8 , \blk00000001/sig000000c7 }),
    .P({\NLW_blk00000001/blk0000006e_P<47>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<46>_UNCONNECTED , 
\NLW_blk00000001/blk0000006e_P<45>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<44>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<43>_UNCONNECTED , 
\NLW_blk00000001/blk0000006e_P<42>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<41>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<40>_UNCONNECTED , 
\NLW_blk00000001/blk0000006e_P<39>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<38>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<37>_UNCONNECTED , 
\NLW_blk00000001/blk0000006e_P<36>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<35>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<34>_UNCONNECTED , 
\NLW_blk00000001/blk0000006e_P<33>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<32>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<31>_UNCONNECTED , 
\NLW_blk00000001/blk0000006e_P<30>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<29>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<28>_UNCONNECTED , 
\NLW_blk00000001/blk0000006e_P<27>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<26>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<25>_UNCONNECTED , 
\NLW_blk00000001/blk0000006e_P<24>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<23>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<22>_UNCONNECTED , 
\NLW_blk00000001/blk0000006e_P<21>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<20>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<19>_UNCONNECTED , 
\NLW_blk00000001/blk0000006e_P<18>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<17>_UNCONNECTED , \NLW_blk00000001/blk0000006e_P<16>_UNCONNECTED , 
p[15], p[14], p[13], p[12], p[11], p[10], p[9], p[8], p[7], p[6], p[5], p[4], p[3], p[2], p[1], p[0]}),
    .A({\blk00000001/sig000000e0 , \blk00000001/sig000000e0 , \blk00000001/sig000000e0 , \blk00000001/sig000000e0 , \blk00000001/sig000000e0 , 
\blk00000001/sig000000e0 , \blk00000001/sig000000e0 , \blk00000001/sig000000e0 , \blk00000001/sig000000e0 , \blk00000001/sig000000e0 , 
\blk00000001/sig000000e0 , \blk00000001/sig000000e0 , \blk00000001/sig000000e0 , \blk00000001/sig000000e0 , \blk00000001/sig000000e0 , 
\blk00000001/sig000000e0 , \blk00000001/sig000000e0 , \blk00000001/sig000000e0 , \blk00000001/sig000000e0 , \blk00000001/sig000000e0 , 
\blk00000001/sig000000e0 , \blk00000001/sig000000e0 , \blk00000001/sig000000e0 , \blk00000001/sig000000df , \blk00000001/sig000000de , 
\blk00000001/sig000000dd , \blk00000001/sig000000dc , \blk00000001/sig000000db , \blk00000001/sig000000da , \blk00000001/sig000000d9 }),
    .PCOUT({\blk00000001/sig0000004a , \blk00000001/sig0000004b , \blk00000001/sig0000004c , \blk00000001/sig0000004d , \blk00000001/sig0000004e , 
\blk00000001/sig0000004f , \blk00000001/sig00000050 , \blk00000001/sig00000051 , \blk00000001/sig00000052 , \blk00000001/sig00000053 , 
\blk00000001/sig00000054 , \blk00000001/sig00000055 , \blk00000001/sig00000056 , \blk00000001/sig00000057 , \blk00000001/sig00000058 , 
\blk00000001/sig00000059 , \blk00000001/sig0000005a , \blk00000001/sig0000005b , \blk00000001/sig0000005c , \blk00000001/sig0000005d , 
\blk00000001/sig0000005e , \blk00000001/sig0000005f , \blk00000001/sig00000060 , \blk00000001/sig00000061 , \blk00000001/sig00000062 , 
\blk00000001/sig00000063 , \blk00000001/sig00000064 , \blk00000001/sig00000065 , \blk00000001/sig00000066 , \blk00000001/sig00000067 , 
\blk00000001/sig00000068 , \blk00000001/sig00000069 , \blk00000001/sig0000006a , \blk00000001/sig0000006b , \blk00000001/sig0000006c , 
\blk00000001/sig0000006d , \blk00000001/sig0000006e , \blk00000001/sig0000006f , \blk00000001/sig00000070 , \blk00000001/sig00000071 , 
\blk00000001/sig00000072 , \blk00000001/sig00000073 , \blk00000001/sig00000074 , \blk00000001/sig00000075 , \blk00000001/sig00000076 , 
\blk00000001/sig00000077 , \blk00000001/sig00000078 , \blk00000001/sig00000079 }),
    .ACIN({\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 , \blk00000001/sig000000d8 }),
    .CARRYINSEL({\blk00000001/sig00000093 , \blk00000001/sig00000092 , \blk00000001/sig00000091 })
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006d  (
    .C(clk),
    .D(\blk00000001/sig000000d8 ),
    .Q(\blk00000001/sig00000090 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006c  (
    .C(clk),
    .D(\blk00000001/sig00000090 ),
    .Q(\blk00000001/sig0000008f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006b  (
    .C(clk),
    .D(\blk00000001/sig0000008d ),
    .Q(\blk00000001/sig0000008e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006a  (
    .C(clk),
    .D(\blk00000001/sig0000008c ),
    .Q(\blk00000001/sig000000c6 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000069  (
    .C(clk),
    .D(\blk00000001/sig0000008c ),
    .Q(\blk00000001/sig000000c2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000068  (
    .C(clk),
    .D(\blk00000001/sig0000008c ),
    .Q(\blk00000001/sig000000c3 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000067  (
    .C(clk),
    .D(\blk00000001/sig0000008c ),
    .Q(\blk00000001/sig000000c4 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000066  (
    .C(clk),
    .D(\blk00000001/sig0000008c ),
    .Q(\blk00000001/sig000000c5 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000065  (
    .C(clk),
    .D(\blk00000001/sig000000c6 ),
    .Q(\blk00000001/sig000000af )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000064  (
    .C(clk),
    .D(\blk00000001/sig000000d8 ),
    .Q(\blk00000001/sig000000b0 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000063  (
    .C(clk),
    .D(\blk00000001/sig000000d8 ),
    .Q(\blk00000001/sig000000b1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000062  (
    .C(clk),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000b2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000061  (
    .C(clk),
    .D(\blk00000001/sig000000c3 ),
    .Q(\blk00000001/sig000000b3 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000060  (
    .C(clk),
    .D(\blk00000001/sig000000d8 ),
    .Q(\blk00000001/sig000000b4 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005f  (
    .C(clk),
    .D(\blk00000001/sig000000d8 ),
    .Q(\blk00000001/sig000000b5 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005e  (
    .C(clk),
    .D(\blk00000001/sig000000c4 ),
    .Q(\blk00000001/sig000000b6 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005d  (
    .C(clk),
    .D(\blk00000001/sig000000d8 ),
    .Q(\blk00000001/sig000000b7 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005c  (
    .C(clk),
    .D(\blk00000001/sig000000c5 ),
    .Q(\blk00000001/sig000000b8 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005b  (
    .C(clk),
    .D(\blk00000001/sig000000d8 ),
    .Q(\blk00000001/sig000000b9 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005a  (
    .C(clk),
    .D(\blk00000001/sig000000d8 ),
    .Q(\blk00000001/sig000000ba )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000059  (
    .C(clk),
    .D(\blk00000001/sig000000d8 ),
    .Q(\blk00000001/sig000000bb )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000058  (
    .C(clk),
    .D(\blk00000001/sig000000d8 ),
    .Q(\blk00000001/sig000000bc )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000057  (
    .C(clk),
    .D(\blk00000001/sig000000d8 ),
    .Q(\blk00000001/sig000000bd )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000056  (
    .C(clk),
    .D(\blk00000001/sig000000d8 ),
    .Q(\blk00000001/sig000000be )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000055  (
    .C(clk),
    .D(\blk00000001/sig000000d8 ),
    .Q(\blk00000001/sig000000bf )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000054  (
    .C(clk),
    .D(\blk00000001/sig000000d8 ),
    .Q(\blk00000001/sig000000c0 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000053  (
    .C(clk),
    .D(\blk00000001/sig000000d8 ),
    .Q(\blk00000001/sig000000c1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000052  (
    .C(clk),
    .D(\blk00000001/sig000000af ),
    .Q(\blk00000001/sig0000009c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000051  (
    .C(clk),
    .D(\blk00000001/sig000000b0 ),
    .Q(\blk00000001/sig0000009d )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000050  (
    .C(clk),
    .D(\blk00000001/sig000000b1 ),
    .Q(\blk00000001/sig0000009e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004f  (
    .C(clk),
    .D(\blk00000001/sig000000b2 ),
    .Q(\blk00000001/sig0000009f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004e  (
    .C(clk),
    .D(\blk00000001/sig000000b3 ),
    .Q(\blk00000001/sig000000a0 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004d  (
    .C(clk),
    .D(\blk00000001/sig000000b4 ),
    .Q(\blk00000001/sig000000a1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004c  (
    .C(clk),
    .D(\blk00000001/sig000000b5 ),
    .Q(\blk00000001/sig000000a2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004b  (
    .C(clk),
    .D(\blk00000001/sig000000b6 ),
    .Q(\blk00000001/sig000000a3 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004a  (
    .C(clk),
    .D(\blk00000001/sig000000b7 ),
    .Q(\blk00000001/sig000000a4 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000049  (
    .C(clk),
    .D(\blk00000001/sig000000b8 ),
    .Q(\blk00000001/sig000000a5 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000048  (
    .C(clk),
    .D(\blk00000001/sig000000b9 ),
    .Q(\blk00000001/sig000000a6 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000047  (
    .C(clk),
    .D(\blk00000001/sig000000ba ),
    .Q(\blk00000001/sig000000a7 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000046  (
    .C(clk),
    .D(\blk00000001/sig000000bb ),
    .Q(\blk00000001/sig000000a8 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000045  (
    .C(clk),
    .D(\blk00000001/sig000000bc ),
    .Q(\blk00000001/sig000000a9 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000044  (
    .C(clk),
    .D(\blk00000001/sig000000bd ),
    .Q(\blk00000001/sig000000aa )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000043  (
    .C(clk),
    .D(\blk00000001/sig000000be ),
    .Q(\blk00000001/sig000000ab )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000042  (
    .C(clk),
    .D(\blk00000001/sig000000bf ),
    .Q(\blk00000001/sig000000ac )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000041  (
    .C(clk),
    .D(\blk00000001/sig000000c0 ),
    .Q(\blk00000001/sig000000ad )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000040  (
    .C(clk),
    .D(\blk00000001/sig000000c1 ),
    .Q(\blk00000001/sig000000ae )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003f  (
    .C(clk),
    .D(\blk00000001/sig0000009c ),
    .Q(\blk00000001/sig000000f1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003e  (
    .C(clk),
    .D(\blk00000001/sig0000009d ),
    .Q(\blk00000001/sig000000f2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003d  (
    .C(clk),
    .D(\blk00000001/sig0000009e ),
    .Q(\blk00000001/sig000000f3 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003c  (
    .C(clk),
    .D(\blk00000001/sig0000009f ),
    .Q(\blk00000001/sig000000f4 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003b  (
    .C(clk),
    .D(\blk00000001/sig000000a0 ),
    .Q(\blk00000001/sig000000f5 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003a  (
    .C(clk),
    .D(\blk00000001/sig000000a1 ),
    .Q(\blk00000001/sig000000f6 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000039  (
    .C(clk),
    .D(\blk00000001/sig000000a2 ),
    .Q(\blk00000001/sig000000f7 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000038  (
    .C(clk),
    .D(\blk00000001/sig000000a3 ),
    .Q(\blk00000001/sig00000094 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000037  (
    .C(clk),
    .D(\blk00000001/sig000000a4 ),
    .Q(\blk00000001/sig00000095 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000036  (
    .C(clk),
    .D(\blk00000001/sig000000a5 ),
    .Q(\blk00000001/sig00000096 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000035  (
    .C(clk),
    .D(\blk00000001/sig000000a6 ),
    .Q(\blk00000001/sig00000097 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000034  (
    .C(clk),
    .D(\blk00000001/sig000000a7 ),
    .Q(\blk00000001/sig00000098 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000033  (
    .C(clk),
    .D(\blk00000001/sig000000a8 ),
    .Q(\blk00000001/sig00000099 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000032  (
    .C(clk),
    .D(\blk00000001/sig000000a9 ),
    .Q(\blk00000001/sig0000009a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000031  (
    .C(clk),
    .D(\blk00000001/sig000000aa ),
    .Q(\blk00000001/sig0000009b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000030  (
    .C(clk),
    .D(\blk00000001/sig000000ab ),
    .Q(\blk00000001/sig000000f8 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002f  (
    .C(clk),
    .D(\blk00000001/sig000000ac ),
    .Q(\blk00000001/sig00000091 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002e  (
    .C(clk),
    .D(\blk00000001/sig000000ad ),
    .Q(\blk00000001/sig00000092 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002d  (
    .C(clk),
    .D(\blk00000001/sig000000ae ),
    .Q(\blk00000001/sig00000093 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002c  (
    .C(clk),
    .D(\blk00000001/sig000000c6 ),
    .Q(\blk00000001/sig000000d7 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002b  (
    .C(clk),
    .D(d[0]),
    .Q(\blk00000001/sig000000e1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002a  (
    .C(clk),
    .D(d[1]),
    .Q(\blk00000001/sig000000e2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000029  (
    .C(clk),
    .D(d[2]),
    .Q(\blk00000001/sig000000e3 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000028  (
    .C(clk),
    .D(d[3]),
    .Q(\blk00000001/sig000000e4 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000027  (
    .C(clk),
    .D(d[4]),
    .Q(\blk00000001/sig000000e5 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000026  (
    .C(clk),
    .D(d[5]),
    .Q(\blk00000001/sig000000e6 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000025  (
    .C(clk),
    .D(d[6]),
    .Q(\blk00000001/sig000000e7 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000024  (
    .C(clk),
    .D(d[7]),
    .Q(\blk00000001/sig000000e8 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000023  (
    .C(clk),
    .D(d[8]),
    .Q(\blk00000001/sig000000e9 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000022  (
    .C(clk),
    .D(d[9]),
    .Q(\blk00000001/sig000000ea )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000021  (
    .C(clk),
    .D(d[10]),
    .Q(\blk00000001/sig000000eb )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000020  (
    .C(clk),
    .D(d[11]),
    .Q(\blk00000001/sig000000ec )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001f  (
    .C(clk),
    .D(d[12]),
    .Q(\blk00000001/sig000000ed )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001e  (
    .C(clk),
    .D(d[13]),
    .Q(\blk00000001/sig000000ee )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001d  (
    .C(clk),
    .D(d[14]),
    .Q(\blk00000001/sig000000ef )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001c  (
    .C(clk),
    .D(d[15]),
    .Q(\blk00000001/sig000000f0 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001b  (
    .C(clk),
    .D(\blk00000001/sig000000e1 ),
    .Q(\blk00000001/sig000000c7 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001a  (
    .C(clk),
    .D(\blk00000001/sig000000e2 ),
    .Q(\blk00000001/sig000000c8 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000019  (
    .C(clk),
    .D(\blk00000001/sig000000e3 ),
    .Q(\blk00000001/sig000000c9 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000018  (
    .C(clk),
    .D(\blk00000001/sig000000e4 ),
    .Q(\blk00000001/sig000000ca )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000017  (
    .C(clk),
    .D(\blk00000001/sig000000e5 ),
    .Q(\blk00000001/sig000000cb )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000016  (
    .C(clk),
    .D(\blk00000001/sig000000e6 ),
    .Q(\blk00000001/sig000000cc )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000015  (
    .C(clk),
    .D(\blk00000001/sig000000e7 ),
    .Q(\blk00000001/sig000000cd )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000014  (
    .C(clk),
    .D(\blk00000001/sig000000e8 ),
    .Q(\blk00000001/sig000000ce )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000013  (
    .C(clk),
    .D(\blk00000001/sig000000e9 ),
    .Q(\blk00000001/sig000000cf )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000012  (
    .C(clk),
    .D(\blk00000001/sig000000ea ),
    .Q(\blk00000001/sig000000d0 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000011  (
    .C(clk),
    .D(\blk00000001/sig000000eb ),
    .Q(\blk00000001/sig000000d1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000010  (
    .C(clk),
    .D(\blk00000001/sig000000ec ),
    .Q(\blk00000001/sig000000d2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000f  (
    .C(clk),
    .D(\blk00000001/sig000000ed ),
    .Q(\blk00000001/sig000000d3 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000e  (
    .C(clk),
    .D(\blk00000001/sig000000ee ),
    .Q(\blk00000001/sig000000d4 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000d  (
    .C(clk),
    .D(\blk00000001/sig000000ef ),
    .Q(\blk00000001/sig000000d5 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000c  (
    .C(clk),
    .D(\blk00000001/sig000000f0 ),
    .Q(\blk00000001/sig000000d6 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000b  (
    .C(clk),
    .D(a[0]),
    .Q(\blk00000001/sig000000d9 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000a  (
    .C(clk),
    .D(a[1]),
    .Q(\blk00000001/sig000000da )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000009  (
    .C(clk),
    .D(a[2]),
    .Q(\blk00000001/sig000000db )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000008  (
    .C(clk),
    .D(a[3]),
    .Q(\blk00000001/sig000000dc )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000007  (
    .C(clk),
    .D(a[4]),
    .Q(\blk00000001/sig000000dd )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000006  (
    .C(clk),
    .D(a[5]),
    .Q(\blk00000001/sig000000de )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000005  (
    .C(clk),
    .D(a[6]),
    .Q(\blk00000001/sig000000df )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000004  (
    .C(clk),
    .D(a[7]),
    .Q(\blk00000001/sig000000e0 )
  );
  GND   \blk00000001/blk00000003  (
    .G(\blk00000001/sig000000d8 )
  );
  VCC   \blk00000001/blk00000002  (
    .P(\blk00000001/sig0000008c )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
