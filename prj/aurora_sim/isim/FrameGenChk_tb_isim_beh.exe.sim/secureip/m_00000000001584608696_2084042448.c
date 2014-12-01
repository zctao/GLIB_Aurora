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



static void Gate_8683_0(char *t0)
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
    char *t15;
    double t16;
    double t17;

LAB0:    t1 = (t0 + 1616U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 772U);
    t3 = *((char **)t2);
    t2 = (t0 + 864U);
    t4 = *((char **)t2);
    t2 = (t0 + 2008);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 748U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 2008);
    t11 = (t10 + 32U);
    t12 = (t0 + 748U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 2008);
    t14 = (t0 + 264);
    t15 = *((char **)t14);
    t16 = xsi_vlog_convert_to_real(t15, 32, 1);
    t17 = (t16 < 0.00000000000000000);
    if (t17 == 1)
        goto LAB4;

LAB5:    t16 = (t16 + 0.50000000000000000);
    t16 = ((int64)(t16));

LAB6:    t16 = (t16 * 1.0000000000000000);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, t16, 0);
    t14 = (t0 + 1956);
    *((int *)t14) = 1;

LAB1:    return;
LAB4:    t16 = 0.00000000000000000;
    goto LAB6;

}

static void Gate_8684_1(char *t0)
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
    char *t15;
    double t16;
    double t17;

LAB0:    t1 = (t0 + 1760U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 772U);
    t3 = *((char **)t2);
    t2 = (t0 + 956U);
    t4 = *((char **)t2);
    t2 = (t0 + 2044);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 748U);
    xsi_vlog_pmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 2044);
    t11 = (t10 + 32U);
    t12 = (t0 + 748U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 2044);
    t14 = (t0 + 264);
    t15 = *((char **)t14);
    t16 = xsi_vlog_convert_to_real(t15, 32, 1);
    t17 = (t16 < 0.00000000000000000);
    if (t17 == 1)
        goto LAB4;

LAB5:    t16 = (t16 + 0.50000000000000000);
    t16 = ((int64)(t16));

LAB6:    t16 = (t16 * 1.0000000000000000);
    xsi_driver_vfirst_trans_bufif_delayed(t13, 0, 0, t16, 0);
    t14 = (t0 + 1964);
    *((int *)t14) = 1;

LAB1:    return;
LAB4:    t16 = 0.00000000000000000;
    goto LAB6;

}


extern void secureip_m_00000000001584608696_2084042448_init()
{
	static char *pe[] = {(void *)Gate_8683_0,(void *)Gate_8684_1};
	xsi_register_didat("secureip_m_00000000001584608696_2084042448", "isim/FrameGenChk_tb_isim_beh.exe.sim/secureip/m_00000000001584608696_2084042448.didat");
	xsi_register_executes(pe);
}
