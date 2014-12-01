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



static void Gate_12649_0(char *t0)
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

LAB0:    t1 = (t0 + 2420U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1300U);
    t3 = *((char **)t2);
    t2 = (t0 + 3876);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 3876);
    xsi_driver_vfirst_trans_delayed(t8, 0, 0, 1LL, 0);
    t9 = (t0 + 3768);
    *((int *)t9) = 1;

LAB1:    return;
}

static void Gate_12650_1(char *t0)
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

LAB0:    t1 = (t0 + 2564U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1484U);
    t3 = *((char **)t2);
    t2 = (t0 + 1392U);
    t4 = *((char **)t2);
    t2 = (t0 + 3912);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1460U);
    xsi_vlog_pmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 3912);
    t11 = (t10 + 32U);
    t12 = (t0 + 1460U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 3912);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 3776);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12651_2(char *t0)
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

LAB0:    t1 = (t0 + 2708U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = (t0 + 1024U);
    t4 = *((char **)t2);
    t2 = (t0 + 3948);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1184U);
    xsi_vlog_pmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 3948);
    t11 = (t10 + 32U);
    t12 = (t0 + 1184U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 3948);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 3784);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12652_3(char *t0)
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

LAB0:    t1 = (t0 + 2852U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = (t0 + 932U);
    t4 = *((char **)t2);
    t2 = (t0 + 3984);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1184U);
    xsi_vlog_pmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 3984);
    t11 = (t10 + 32U);
    t12 = (t0 + 1184U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 3984);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 3792);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12653_4(char *t0)
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

LAB0:    t1 = (t0 + 2996U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1576U);
    t3 = *((char **)t2);
    t2 = (t0 + 1300U);
    t4 = *((char **)t2);
    t2 = (t0 + 4020);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1552U);
    xsi_vlog_pmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 4020);
    t11 = (t10 + 32U);
    t12 = (t0 + 1552U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 4020);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 3800);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12654_5(char *t0)
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

LAB0:    t1 = (t0 + 3140U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1116U);
    t3 = *((char **)t2);
    t2 = (t0 + 1024U);
    t4 = *((char **)t2);
    t2 = (t0 + 4056);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1092U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 4056);
    t11 = (t10 + 32U);
    t12 = (t0 + 1092U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 4056);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 3808);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12655_6(char *t0)
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

LAB0:    t1 = (t0 + 3284U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1668U);
    t3 = *((char **)t2);
    t2 = (t0 + 1300U);
    t4 = *((char **)t2);
    t2 = (t0 + 4092);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1644U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 4092);
    t11 = (t10 + 32U);
    t12 = (t0 + 1644U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 4092);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 3816);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12656_7(char *t0)
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

LAB0:    t1 = (t0 + 3428U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1116U);
    t3 = *((char **)t2);
    t2 = (t0 + 932U);
    t4 = *((char **)t2);
    t2 = (t0 + 4128);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1092U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 4128);
    t11 = (t10 + 32U);
    t12 = (t0 + 1092U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 4128);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 3824);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12657_8(char *t0)
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

LAB0:    t1 = (t0 + 3572U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1760U);
    t3 = *((char **)t2);
    t2 = (t0 + 1392U);
    t4 = *((char **)t2);
    t2 = (t0 + 4164);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1736U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 4164);
    t11 = (t10 + 32U);
    t12 = (t0 + 1736U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 4164);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 3832);
    *((int *)t14) = 1;

LAB1:    return;
}


extern void secureip_m_00000000000532924557_1366944399_init()
{
	static char *pe[] = {(void *)Gate_12649_0,(void *)Gate_12650_1,(void *)Gate_12651_2,(void *)Gate_12652_3,(void *)Gate_12653_4,(void *)Gate_12654_5,(void *)Gate_12655_6,(void *)Gate_12656_7,(void *)Gate_12657_8};
	xsi_register_didat("secureip_m_00000000000532924557_1366944399", "isim/FrameGenChk_tb_isim_beh.exe.sim/secureip/m_00000000000532924557_1366944399.didat");
	xsi_register_executes(pe);
}
