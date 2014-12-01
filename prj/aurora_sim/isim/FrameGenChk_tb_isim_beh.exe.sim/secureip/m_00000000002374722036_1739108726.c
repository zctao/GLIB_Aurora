/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif



static void Gate_12677_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 3892U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1576U);
    t3 = *((char **)t2);
    t2 = (t0 + 1760U);
    t4 = *((char **)t2);
    t2 = (t0 + 7932);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    xsi_vlog_NandGate(t8, 2, t3, t4);
    t9 = (t0 + 7932);
    xsi_driver_vfirst_trans_delayed(t9, 0, 0, 1LL, 0);
    t10 = (t0 + 7688);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Gate_12678_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 4036U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1576U);
    t3 = *((char **)t2);
    t2 = (t0 + 1484U);
    t4 = *((char **)t2);
    t2 = (t0 + 7968);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    xsi_vlog_NandGate(t8, 2, t3, t4);
    t9 = (t0 + 7968);
    xsi_driver_vfirst_trans_delayed(t9, 0, 0, 1LL, 0);
    t10 = (t0 + 7696);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Gate_12679_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 4180U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 2036U);
    t3 = *((char **)t2);
    t2 = (t0 + 1760U);
    t4 = *((char **)t2);
    t2 = (t0 + 8004);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    xsi_vlog_NandGate(t8, 2, t3, t4);
    t9 = (t0 + 8004);
    xsi_driver_vfirst_trans_delayed(t9, 0, 0, 1LL, 0);
    t10 = (t0 + 7704);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Gate_12680_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 4324U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 2036U);
    t3 = *((char **)t2);
    t2 = (t0 + 1484U);
    t4 = *((char **)t2);
    t2 = (t0 + 8040);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    xsi_vlog_NandGate(t8, 2, t3, t4);
    t9 = (t0 + 8040);
    xsi_driver_vfirst_trans_delayed(t9, 0, 0, 1LL, 0);
    t10 = (t0 + 7712);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Gate_12681_4(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    t1 = (t0 + 4468U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1852U);
    t3 = *((char **)t2);
    t2 = (t0 + 8076);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 8076);
    xsi_driver_vfirst_trans_delayed(t8, 0, 0, 1LL, 0);
    t9 = (t0 + 7720);
    *((int *)t9) = 1;

LAB1:    return;
}

static void Gate_12682_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    t1 = (t0 + 4612U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1484U);
    t3 = *((char **)t2);
    t2 = (t0 + 8112);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 8112);
    xsi_driver_vfirst_trans_delayed(t8, 0, 0, 1LL, 0);
    t9 = (t0 + 7728);
    *((int *)t9) = 1;

LAB1:    return;
}

static void Gate_12683_6(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    t1 = (t0 + 4756U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1668U);
    t3 = *((char **)t2);
    t2 = (t0 + 8148);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 8148);
    xsi_driver_vfirst_trans_delayed(t8, 0, 0, 1LL, 0);
    t9 = (t0 + 7736);
    *((int *)t9) = 1;

LAB1:    return;
}

static void Gate_12684_7(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    t1 = (t0 + 4900U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1576U);
    t3 = *((char **)t2);
    t2 = (t0 + 8184);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 8184);
    xsi_driver_vfirst_trans_delayed(t8, 0, 0, 1LL, 0);
    t9 = (t0 + 7744);
    *((int *)t9) = 1;

LAB1:    return;
}

static void Gate_12685_8(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    t1 = (t0 + 5044U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t2 = (t0 + 8220);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 8220);
    xsi_driver_vfirst_trans_delayed(t8, 0, 0, 1LL, 0);
    t9 = (t0 + 7752);
    *((int *)t9) = 1;

LAB1:    return;
}

static void Gate_12686_9(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    t1 = (t0 + 5188U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1944U);
    t3 = *((char **)t2);
    t2 = (t0 + 8256);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 8256);
    xsi_driver_vfirst_trans_delayed(t8, 0, 0, 1LL, 0);
    t9 = (t0 + 7760);
    *((int *)t9) = 1;

LAB1:    return;
}

static void Gate_12687_10(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 5332U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 2588U);
    t3 = *((char **)t2);
    t2 = (t0 + 1852U);
    t4 = *((char **)t2);
    t2 = (t0 + 8292);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 2564U);
    xsi_vlog_pmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 8292);
    t11 = (t10 + 32U);
    t12 = (t0 + 2564U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 8292);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 7768);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12688_11(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 5476U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1392U);
    t3 = *((char **)t2);
    t2 = (t0 + 1208U);
    t4 = *((char **)t2);
    t2 = (t0 + 8328);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1368U);
    xsi_vlog_pmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 8328);
    t11 = (t10 + 32U);
    t12 = (t0 + 1368U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 8328);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 7776);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12689_12(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 5620U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1392U);
    t3 = *((char **)t2);
    t2 = (t0 + 1116U);
    t4 = *((char **)t2);
    t2 = (t0 + 8364);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1368U);
    xsi_vlog_pmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 8364);
    t11 = (t10 + 32U);
    t12 = (t0 + 1368U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 8364);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 7784);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12690_13(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 5764U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 2680U);
    t3 = *((char **)t2);
    t2 = (t0 + 1668U);
    t4 = *((char **)t2);
    t2 = (t0 + 8400);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 2656U);
    xsi_vlog_pmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 8400);
    t11 = (t10 + 32U);
    t12 = (t0 + 2656U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 8400);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 7792);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12691_14(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 5908U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 2772U);
    t3 = *((char **)t2);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t2 = (t0 + 8436);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 2748U);
    xsi_vlog_pmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 8436);
    t11 = (t10 + 32U);
    t12 = (t0 + 2748U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 8436);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 7800);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12692_15(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 6052U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1392U);
    t3 = *((char **)t2);
    t2 = (t0 + 1024U);
    t4 = *((char **)t2);
    t2 = (t0 + 8472);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1368U);
    xsi_vlog_pmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 8472);
    t11 = (t10 + 32U);
    t12 = (t0 + 1368U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 8472);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 7808);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12693_16(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 6196U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1392U);
    t3 = *((char **)t2);
    t2 = (t0 + 932U);
    t4 = *((char **)t2);
    t2 = (t0 + 8508);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1368U);
    xsi_vlog_pmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 8508);
    t11 = (t10 + 32U);
    t12 = (t0 + 1368U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 8508);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 7816);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12694_17(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 6340U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 2864U);
    t3 = *((char **)t2);
    t2 = (t0 + 1944U);
    t4 = *((char **)t2);
    t2 = (t0 + 8544);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 2840U);
    xsi_vlog_pmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 8544);
    t11 = (t10 + 32U);
    t12 = (t0 + 2840U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 8544);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 7824);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12695_18(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 6484U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1300U);
    t3 = *((char **)t2);
    t2 = (t0 + 1208U);
    t4 = *((char **)t2);
    t2 = (t0 + 8580);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1276U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 8580);
    t11 = (t10 + 32U);
    t12 = (t0 + 1276U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 8580);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 7832);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12696_19(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 6628U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 2956U);
    t3 = *((char **)t2);
    t2 = (t0 + 2220U);
    t4 = *((char **)t2);
    t2 = (t0 + 8616);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 2932U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 8616);
    t11 = (t10 + 32U);
    t12 = (t0 + 2932U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 8616);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 7840);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12697_20(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 6772U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1300U);
    t3 = *((char **)t2);
    t2 = (t0 + 1116U);
    t4 = *((char **)t2);
    t2 = (t0 + 8652);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1276U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 8652);
    t11 = (t10 + 32U);
    t12 = (t0 + 1276U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 8652);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 7848);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12698_21(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 6916U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 3048U);
    t3 = *((char **)t2);
    t2 = (t0 + 2312U);
    t4 = *((char **)t2);
    t2 = (t0 + 8688);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 3024U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 8688);
    t11 = (t10 + 32U);
    t12 = (t0 + 3024U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 8688);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 7856);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12699_22(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 7060U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1300U);
    t3 = *((char **)t2);
    t2 = (t0 + 1024U);
    t4 = *((char **)t2);
    t2 = (t0 + 8724);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1276U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 8724);
    t11 = (t10 + 32U);
    t12 = (t0 + 1276U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 8724);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 7864);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12700_23(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 7204U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 3140U);
    t3 = *((char **)t2);
    t2 = (t0 + 2404U);
    t4 = *((char **)t2);
    t2 = (t0 + 8760);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 3116U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 8760);
    t11 = (t10 + 32U);
    t12 = (t0 + 3116U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 8760);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 7872);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12701_24(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 7348U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1300U);
    t3 = *((char **)t2);
    t2 = (t0 + 932U);
    t4 = *((char **)t2);
    t2 = (t0 + 8796);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1276U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 8796);
    t11 = (t10 + 32U);
    t12 = (t0 + 1276U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 8796);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 7880);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12702_25(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 7492U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 3232U);
    t3 = *((char **)t2);
    t2 = (t0 + 2496U);
    t4 = *((char **)t2);
    t2 = (t0 + 8832);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 3208U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 8832);
    t11 = (t10 + 32U);
    t12 = (t0 + 3208U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 8832);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 7888);
    *((int *)t14) = 1;

LAB1:    return;
}


extern void secureip_m_00000000002374722036_1739108726_init()
{
	static char *pe[] = {(void *)Gate_12677_0,(void *)Gate_12678_1,(void *)Gate_12679_2,(void *)Gate_12680_3,(void *)Gate_12681_4,(void *)Gate_12682_5,(void *)Gate_12683_6,(void *)Gate_12684_7,(void *)Gate_12685_8,(void *)Gate_12686_9,(void *)Gate_12687_10,(void *)Gate_12688_11,(void *)Gate_12689_12,(void *)Gate_12690_13,(void *)Gate_12691_14,(void *)Gate_12692_15,(void *)Gate_12693_16,(void *)Gate_12694_17,(void *)Gate_12695_18,(void *)Gate_12696_19,(void *)Gate_12697_20,(void *)Gate_12698_21,(void *)Gate_12699_22,(void *)Gate_12700_23,(void *)Gate_12701_24,(void *)Gate_12702_25};
	xsi_register_didat("secureip_m_00000000002374722036_1739108726", "isim/FrameGenChk_tb_isim_beh.exe.sim/secureip/m_00000000002374722036_1739108726.didat");
	xsi_register_executes(pe);
}
