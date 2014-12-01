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
static unsigned int ng1[] = {1U, 0U};



static void Gate_11446_0(char *t0)
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

LAB0:    t1 = (t0 + 1960U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1116U);
    t3 = *((char **)t2);
    t2 = (t0 + 932U);
    t4 = *((char **)t2);
    t2 = (t0 + 2960);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1092U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 2960);
    t11 = (t10 + 32U);
    t12 = (t0 + 1092U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 2960);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 0LL, 0);
    t14 = (t0 + 2876);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_11447_1(char *t0)
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

LAB0:    t1 = (t0 + 2104U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1024U);
    t3 = *((char **)t2);
    t2 = (t0 + 932U);
    t4 = *((char **)t2);
    t2 = (t0 + 2996);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1000U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 2996);
    t11 = (t10 + 32U);
    t12 = (t0 + 1000U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 2996);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 2884);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_11448_2(char *t0)
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

LAB0:    t1 = (t0 + 2248U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng0)));
    t3 = (t0 + 932U);
    t4 = *((char **)t3);
    t3 = (t0 + 3032);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    xsi_vlog_nmosSwitch(t8, t2, t4);
    t9 = (t0 + 3032);
    t10 = (t9 + 32U);
    xsi_vlog_switch_set_trans_strength(*((char **)t10), 0, 0, 0, 0);
    t11 = (t0 + 3032);
    xsi_driver_vfirst_trans_bufif_delayed(t11, 0, 0, 0LL, 0);
    t12 = (t0 + 2892);
    *((int *)t12) = 1;

LAB1:    return;
}

static void Gate_11449_3(char *t0)
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

LAB0:    t1 = (t0 + 2392U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = (t0 + 932U);
    t4 = *((char **)t2);
    t2 = (t0 + 3068);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1184U);
    xsi_vlog_pmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 3068);
    t11 = (t10 + 32U);
    t12 = (t0 + 1184U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 3068);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 1LL, 0);
    t14 = (t0 + 2900);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_11450_4(char *t0)
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

LAB0:    t1 = (t0 + 2536U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng1)));
    t3 = (t0 + 932U);
    t4 = *((char **)t3);
    t3 = (t0 + 3104);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    xsi_vlog_pmosSwitch(t8, t2, t4);
    t9 = (t0 + 3104);
    t10 = (t9 + 32U);
    xsi_vlog_switch_set_trans_strength(*((char **)t10), 0, 0, 0, 0);
    t11 = (t0 + 3104);
    xsi_driver_vfirst_trans_bufif_delayed(t11, 0, 0, 0LL, 0);
    t12 = (t0 + 2908);
    *((int *)t12) = 1;

LAB1:    return;
}

static void Gate_11451_5(char *t0)
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

LAB0:    t1 = (t0 + 2680U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1300U);
    t3 = *((char **)t2);
    t2 = (t0 + 932U);
    t4 = *((char **)t2);
    t2 = (t0 + 3140);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 1276U);
    xsi_vlog_pmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 3140);
    t11 = (t10 + 32U);
    t12 = (t0 + 1276U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 3140);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, 0LL, 0);
    t14 = (t0 + 2916);
    *((int *)t14) = 1;

LAB1:    return;
}


extern void secureip_m_00000000001483329584_3860713646_init()
{
	static char *pe[] = {(void *)Gate_11446_0,(void *)Gate_11447_1,(void *)Gate_11448_2,(void *)Gate_11449_3,(void *)Gate_11450_4,(void *)Gate_11451_5};
	xsi_register_didat("secureip_m_00000000001483329584_3860713646", "isim/FrameGenChk_tb_isim_beh.exe.sim/secureip/m_00000000001483329584_3860713646.didat");
	xsi_register_executes(pe);
}
