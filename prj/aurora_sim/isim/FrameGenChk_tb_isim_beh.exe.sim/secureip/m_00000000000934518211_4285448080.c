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



static void Gate_12755_0(char *t0)
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

LAB0:    t1 = (t0 + 2696U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1760U);
    t3 = *((char **)t2);
    t2 = (t0 + 3240);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 3240);
    xsi_driver_vfirst_trans_delayed(t8, 0, 0, 1LL, 0);
    t9 = (t0 + 3180);
    *((int *)t9) = 1;

LAB1:    return;
}

static void Gate_12756_1(char *t0)
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

LAB0:    t1 = (t0 + 2840U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1944U);
    t3 = *((char **)t2);
    t2 = (t0 + 3276);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 3276);
    xsi_driver_vfirst_trans_delayed(t8, 0, 0, 1LL, 0);
    t9 = (t0 + 3188);
    *((int *)t9) = 1;

LAB1:    return;
}

static void Gate_12757_2(char *t0)
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

LAB0:    t1 = (t0 + 2984U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 2036U);
    t3 = *((char **)t2);
    t2 = (t0 + 3312);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 3312);
    xsi_driver_vfirst_trans_delayed(t8, 0, 0, 1LL, 0);
    t9 = (t0 + 3196);
    *((int *)t9) = 1;

LAB1:    return;
}


extern void secureip_m_00000000000934518211_4285448080_init()
{
	static char *pe[] = {(void *)Gate_12755_0,(void *)Gate_12756_1,(void *)Gate_12757_2};
	xsi_register_didat("secureip_m_00000000000934518211_4285448080", "isim/FrameGenChk_tb_isim_beh.exe.sim/secureip/m_00000000000934518211_4285448080.didat");
	xsi_register_executes(pe);
}
