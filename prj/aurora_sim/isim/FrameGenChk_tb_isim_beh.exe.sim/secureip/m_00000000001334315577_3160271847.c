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
static unsigned int ng0[] = {0U, 0U};



static void Gate_12782_0(char *t0)
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

LAB0:    t1 = (t0 + 2512U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng0)));
    t3 = (t0 + 1392U);
    t4 = *((char **)t3);
    t3 = (t0 + 3816);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    xsi_vlog_nmosSwitch(t8, t2, t4);
    t9 = (t0 + 3816);
    t10 = (t9 + 32U);
    xsi_vlog_switch_set_trans_strength(*((char **)t10), 0, 0, 0, 0);
    t11 = (t0 + 3816);
    xsi_driver_vfirst_trans_bufif_delayed(t11, 0, 0, 1LL, 0);
    t12 = (t0 + 3716);
    *((int *)t12) = 1;

LAB1:    return;
}

static void Gate_12783_1(char *t0)
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

LAB0:    t1 = (t0 + 2656U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1576U);
    t3 = *((char **)t2);
    t2 = (t0 + 1300U);
    t4 = *((char **)t2);
    t2 = (t0 + 3852);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1552U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 3852);
    t11 = (t10 + 32U);
    t12 = (t0 + 1552U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 3852);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 3724);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12784_2(char *t0)
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

LAB0:    t1 = (t0 + 2800U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1484U);
    t3 = *((char **)t2);
    t2 = (t0 + 1300U);
    t4 = *((char **)t2);
    t2 = (t0 + 3888);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1460U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 3888);
    t11 = (t10 + 32U);
    t12 = (t0 + 1460U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 3888);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 3732);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_12785_3(char *t0)
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

LAB0:    t1 = (t0 + 2944U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng0)));
    t3 = (t0 + 1668U);
    t4 = *((char **)t3);
    t3 = (t0 + 3924);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    xsi_vlog_nmosSwitch(t8, t2, t4);
    t9 = (t0 + 3924);
    t10 = (t9 + 32U);
    xsi_vlog_switch_set_trans_strength(*((char **)t10), 0, 0, 0, 0);
    t11 = (t0 + 3924);
    xsi_driver_vfirst_trans_bufif_delayed(t11, 0, 0, 1LL, 0);
    t12 = (t0 + 3740);
    *((int *)t12) = 1;

LAB1:    return;
}

static void Gate_12787_4(char *t0)
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

LAB0:    t1 = (t0 + 3088U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = (t0 + 3960);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 3960);
    xsi_driver_vfirst_trans_delayed(t8, 0, 0, 0LL, 0);
    t9 = (t0 + 3748);
    *((int *)t9) = 1;

LAB1:    return;
}

static void Gate_12788_5(char *t0)
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

LAB0:    t1 = (t0 + 3232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1116U);
    t3 = *((char **)t2);
    t2 = (t0 + 3996);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 3996);
    xsi_driver_vfirst_trans_delayed(t8, 0, 0, 1LL, 0);
    t9 = (t0 + 3756);
    *((int *)t9) = 1;

LAB1:    return;
}

static void Gate_12789_6(char *t0)
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

LAB0:    t1 = (t0 + 3376U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1116U);
    t3 = *((char **)t2);
    t2 = (t0 + 4032);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 4032);
    xsi_driver_vfirst_trans_delayed(t8, 0, 0, 1LL, 0);
    t9 = (t0 + 3764);
    *((int *)t9) = 1;

LAB1:    return;
}

static void Gate_12790_7(char *t0)
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

LAB0:    t1 = (t0 + 3520U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1392U);
    t3 = *((char **)t2);
    t2 = (t0 + 4068);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 4068);
    xsi_driver_vfirst_trans_delayed(t8, 0, 0, 0LL, 0);
    t9 = (t0 + 3772);
    *((int *)t9) = 1;

LAB1:    return;
}


extern void secureip_m_00000000001334315577_3160271847_init()
{
	static char *pe[] = {(void *)Gate_12782_0,(void *)Gate_12783_1,(void *)Gate_12784_2,(void *)Gate_12785_3,(void *)Gate_12787_4,(void *)Gate_12788_5,(void *)Gate_12789_6,(void *)Gate_12790_7};
	xsi_register_didat("secureip_m_00000000001334315577_3160271847", "isim/FrameGenChk_tb_isim_beh.exe.sim/secureip/m_00000000001334315577_3160271847.didat");
	xsi_register_executes(pe);
}
