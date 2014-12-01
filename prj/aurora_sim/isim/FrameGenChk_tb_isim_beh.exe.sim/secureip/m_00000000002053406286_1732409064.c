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



static void Gate_9168_0(char *t0)
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

LAB0:    t1 = (t0 + 1628U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 876U);
    t3 = *((char **)t2);
    t2 = (t0 + 968U);
    t4 = *((char **)t2);
    t2 = (t0 + 1868);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    xsi_vlog_NorGate(t8, 2, t3, t4);
    t9 = (t0 + 1868);
    xsi_driver_vfirst_trans(t9, 0, 0);
    t10 = (t0 + 1824);
    *((int *)t10) = 1;

LAB1:    return;
}


extern void secureip_m_00000000002053406286_1732409064_init()
{
	static char *pe[] = {(void *)Gate_9168_0};
	xsi_register_didat("secureip_m_00000000002053406286_1732409064", "isim/FrameGenChk_tb_isim_beh.exe.sim/secureip/m_00000000002053406286_1732409064.didat");
	xsi_register_executes(pe);
}
