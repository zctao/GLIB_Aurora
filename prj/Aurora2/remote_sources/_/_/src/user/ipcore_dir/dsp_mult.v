////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.49d
//  \   \         Application: netgen
//  /   /         Filename: dsp_mult.v
// /___/   /\     Timestamp: Wed May 29 10:55:23 2013
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/USER_LOCAL/crs/CMS_trigger/Xilinx/CMS_trig1/ipcore_dir/tmp/_cg/dsp_mult.ngc C:/USER_LOCAL/crs/CMS_trigger/Xilinx/CMS_trig1/ipcore_dir/tmp/_cg/dsp_mult.v 
// Device	: 7vx690tffg1157-3
// Input file	: C:/USER_LOCAL/crs/CMS_trigger/Xilinx/CMS_trig1/ipcore_dir/tmp/_cg/dsp_mult.ngc
// Output file	: C:/USER_LOCAL/crs/CMS_trigger/Xilinx/CMS_trig1/ipcore_dir/tmp/_cg/dsp_mult.v
// # of Modules	: 1
// Design Name	: dsp_mult
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

module dsp_mult (
  clk, cea3, cea4, ceb3, ceb4, cem, cep, a, b, p
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input cea3;
  input cea4;
  input ceb3;
  input ceb4;
  input cem;
  input cep;
  input [24 : 0] a;
  input [17 : 0] b;
  output [42 : 0] p;
  
  // synthesis translate_off
  
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
  wire \blk00000001/sig00000092 ;
  wire \blk00000001/sig00000091 ;
  wire \blk00000001/sig00000090 ;
  wire \blk00000001/sig0000008f ;
  wire \blk00000001/sig0000008e ;
  wire \blk00000001/sig0000008d ;
  wire \blk00000001/sig0000008c ;
  wire \blk00000001/sig0000008b ;
  wire \blk00000001/sig0000008a ;
  wire \blk00000001/sig00000089 ;
  wire \blk00000001/sig00000088 ;
  wire \blk00000001/sig00000087 ;
  wire \blk00000001/sig00000086 ;
  wire \blk00000001/sig00000085 ;
  wire \blk00000001/sig00000084 ;
  wire \blk00000001/sig00000083 ;
  wire \blk00000001/sig00000082 ;
  wire \blk00000001/sig00000081 ;
  wire \blk00000001/sig00000080 ;
  wire \blk00000001/sig0000007f ;
  wire \blk00000001/sig0000007e ;
  wire \blk00000001/sig0000007d ;
  wire \blk00000001/sig0000007c ;
  wire \blk00000001/sig0000007b ;
  wire \blk00000001/sig0000007a ;
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
  wire \NLW_blk00000001/blk0000001a_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001a_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001a_UNDERFLOW_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001a_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001a_OVERFLOW_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001a_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001a_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001a_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001a_P<47>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001a_P<46>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001a_P<45>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001a_P<44>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001a_P<43>_UNCONNECTED ;
  DSP48E1 #(
    .ACASCREG ( 2 ),
    .ADREG ( 0 ),
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
    .DREG ( 0 ),
    .INMODEREG ( 1 ),
    .MASK ( 48'h3FFFFFFFFFFF ),
    .MREG ( 1 ),
    .OPMODEREG ( 1 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 1 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .USE_DPORT ( "FALSE" ),
    .USE_MULT ( "MULTIPLY" ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .USE_SIMD ( "ONE48" ))
  \blk00000001/blk0000001a  (
    .PATTERNBDETECT(\NLW_blk00000001/blk0000001a_PATTERNBDETECT_UNCONNECTED ),
    .RSTC(\blk00000001/sig000000c2 ),
    .CEB1(ceb3),
    .CEAD(\blk00000001/sig000000c2 ),
    .MULTSIGNOUT(\NLW_blk00000001/blk0000001a_MULTSIGNOUT_UNCONNECTED ),
    .CEC(\blk00000001/sig000000c0 ),
    .RSTM(\blk00000001/sig000000c2 ),
    .MULTSIGNIN(\blk00000001/sig000000c2 ),
    .CEB2(ceb4),
    .RSTCTRL(\blk00000001/sig000000c2 ),
    .CEP(cep),
    .CARRYCASCOUT(\blk00000001/sig000000bf ),
    .RSTA(\blk00000001/sig000000c2 ),
    .CECARRYIN(\blk00000001/sig000000c0 ),
    .UNDERFLOW(\NLW_blk00000001/blk0000001a_UNDERFLOW_UNCONNECTED ),
    .PATTERNDETECT(\NLW_blk00000001/blk0000001a_PATTERNDETECT_UNCONNECTED ),
    .RSTALUMODE(\blk00000001/sig000000c2 ),
    .RSTALLCARRYIN(\blk00000001/sig000000c2 ),
    .CED(\blk00000001/sig000000c2 ),
    .RSTD(\blk00000001/sig000000c2 ),
    .CEALUMODE(\blk00000001/sig000000c0 ),
    .CEA2(cea4),
    .CLK(clk),
    .CEA1(cea3),
    .RSTB(\blk00000001/sig000000c2 ),
    .OVERFLOW(\NLW_blk00000001/blk0000001a_OVERFLOW_UNCONNECTED ),
    .CECTRL(\blk00000001/sig000000c0 ),
    .CEM(cem),
    .CARRYIN(\blk00000001/sig000000c1 ),
    .CARRYCASCIN(\blk00000001/sig000000c2 ),
    .RSTINMODE(\blk00000001/sig000000c2 ),
    .CEINMODE(\blk00000001/sig000000c0 ),
    .RSTP(\blk00000001/sig000000c2 ),
    .ACOUT({\blk00000001/sig00000033 , \blk00000001/sig00000034 , \blk00000001/sig00000035 , \blk00000001/sig00000036 , \blk00000001/sig00000037 , 
\blk00000001/sig00000038 , \blk00000001/sig00000039 , \blk00000001/sig0000003a , \blk00000001/sig0000003b , \blk00000001/sig0000003c , 
\blk00000001/sig0000003d , \blk00000001/sig0000003e , \blk00000001/sig0000003f , \blk00000001/sig00000040 , \blk00000001/sig00000041 , 
\blk00000001/sig00000042 , \blk00000001/sig00000043 , \blk00000001/sig00000044 , \blk00000001/sig00000045 , \blk00000001/sig00000046 , 
\blk00000001/sig00000047 , \blk00000001/sig00000048 , \blk00000001/sig00000049 , \blk00000001/sig0000004a , \blk00000001/sig0000004b , 
\blk00000001/sig0000004c , \blk00000001/sig0000004d , \blk00000001/sig0000004e , \blk00000001/sig0000004f , \blk00000001/sig00000050 }),
    .OPMODE({\blk00000001/sig000000cc , \blk00000001/sig000000cb , \blk00000001/sig000000ca , \blk00000001/sig000000c9 , \blk00000001/sig000000c8 , 
\blk00000001/sig000000c7 , \blk00000001/sig000000c6 }),
    .PCIN({\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , 
\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , 
\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , 
\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , 
\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , 
\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , 
\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , 
\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , 
\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , 
\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 }),
    .ALUMODE({\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000cd , \blk00000001/sig000000cd }),
    .C({\blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , 
\blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , 
\blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , 
\blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , 
\blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , 
\blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , 
\blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , 
\blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , 
\blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , 
\blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 }),
    .CARRYOUT({\blk00000001/sig000000be , \NLW_blk00000001/blk0000001a_CARRYOUT<2>_UNCONNECTED , \NLW_blk00000001/blk0000001a_CARRYOUT<1>_UNCONNECTED 
, \NLW_blk00000001/blk0000001a_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 }),
    .BCIN({\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , 
\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , 
\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , 
\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 }),
    .B({b[17], b[16], b[15], b[14], b[13], b[12], b[11], b[10], b[9], b[8], b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0]}),
    .BCOUT({\blk00000001/sig00000051 , \blk00000001/sig00000052 , \blk00000001/sig00000053 , \blk00000001/sig00000054 , \blk00000001/sig00000055 , 
\blk00000001/sig00000056 , \blk00000001/sig00000057 , \blk00000001/sig00000058 , \blk00000001/sig00000059 , \blk00000001/sig0000005a , 
\blk00000001/sig0000005b , \blk00000001/sig0000005c , \blk00000001/sig0000005d , \blk00000001/sig0000005e , \blk00000001/sig0000005f , 
\blk00000001/sig00000060 , \blk00000001/sig00000061 , \blk00000001/sig00000062 }),
    .D({\blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , 
\blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , 
\blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , 
\blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , 
\blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 , \blk00000001/sig000000c0 }),
    .P({\NLW_blk00000001/blk0000001a_P<47>_UNCONNECTED , \NLW_blk00000001/blk0000001a_P<46>_UNCONNECTED , 
\NLW_blk00000001/blk0000001a_P<45>_UNCONNECTED , \NLW_blk00000001/blk0000001a_P<44>_UNCONNECTED , \NLW_blk00000001/blk0000001a_P<43>_UNCONNECTED , 
p[42], p[41], p[40], p[39], p[38], p[37], p[36], p[35], p[34], p[33], p[32], p[31], p[30], p[29], p[28], p[27], p[26], p[25], p[24], p[23], p[22], 
p[21], p[20], p[19], p[18], p[17], p[16], p[15], p[14], p[13], p[12], p[11], p[10], p[9], p[8], p[7], p[6], p[5], p[4], p[3], p[2], p[1], p[0]}),
    .A({a[24], a[24], a[24], a[24], a[24], a[24], a[23], a[22], a[21], a[20], a[19], a[18], a[17], a[16], a[15], a[14], a[13], a[12], a[11], a[10], 
a[9], a[8], a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0]}),
    .PCOUT({\blk00000001/sig00000063 , \blk00000001/sig00000064 , \blk00000001/sig00000065 , \blk00000001/sig00000066 , \blk00000001/sig00000067 , 
\blk00000001/sig00000068 , \blk00000001/sig00000069 , \blk00000001/sig0000006a , \blk00000001/sig0000006b , \blk00000001/sig0000006c , 
\blk00000001/sig0000006d , \blk00000001/sig0000006e , \blk00000001/sig0000006f , \blk00000001/sig00000070 , \blk00000001/sig00000071 , 
\blk00000001/sig00000072 , \blk00000001/sig00000073 , \blk00000001/sig00000074 , \blk00000001/sig00000075 , \blk00000001/sig00000076 , 
\blk00000001/sig00000077 , \blk00000001/sig00000078 , \blk00000001/sig00000079 , \blk00000001/sig0000007a , \blk00000001/sig0000007b , 
\blk00000001/sig0000007c , \blk00000001/sig0000007d , \blk00000001/sig0000007e , \blk00000001/sig0000007f , \blk00000001/sig00000080 , 
\blk00000001/sig00000081 , \blk00000001/sig00000082 , \blk00000001/sig00000083 , \blk00000001/sig00000084 , \blk00000001/sig00000085 , 
\blk00000001/sig00000086 , \blk00000001/sig00000087 , \blk00000001/sig00000088 , \blk00000001/sig00000089 , \blk00000001/sig0000008a , 
\blk00000001/sig0000008b , \blk00000001/sig0000008c , \blk00000001/sig0000008d , \blk00000001/sig0000008e , \blk00000001/sig0000008f , 
\blk00000001/sig00000090 , \blk00000001/sig00000091 , \blk00000001/sig00000092 }),
    .ACIN({\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , 
\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , 
\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , 
\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , 
\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , 
\blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 , \blk00000001/sig000000c2 }),
    .CARRYINSEL({\blk00000001/sig000000c5 , \blk00000001/sig000000c4 , \blk00000001/sig000000c3 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000019  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000c1 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000018  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c0 ),
    .Q(\blk00000001/sig000000ce )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000017  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c0 ),
    .Q(\blk00000001/sig000000cf )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000016  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000d0 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000015  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000d1 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000014  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000d2 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000013  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000d3 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000012  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000d4 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000011  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000d5 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000010  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000d6 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000f  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000ce ),
    .Q(\blk00000001/sig000000c6 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000e  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000c7 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000d  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000cf ),
    .Q(\blk00000001/sig000000c8 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000c  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000c9 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000b  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000ca )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000a  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000cb )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000009  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000cc )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000008  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000cd )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000007  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000d7 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000006  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000c3 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000005  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000c4 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000004  (
    .C(clk),
    .CE(\blk00000001/sig000000c0 ),
    .D(\blk00000001/sig000000c2 ),
    .Q(\blk00000001/sig000000c5 )
  );
  GND   \blk00000001/blk00000003  (
    .G(\blk00000001/sig000000c2 )
  );
  VCC   \blk00000001/blk00000002  (
    .P(\blk00000001/sig000000c0 )
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
