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
static const char *ng0 = "C:/Users/LabView User/Documents/ztaotest/GLIB_Aurora/prj/aurora_sim/FrameGenChk_top.v";



static void Always_201_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;

LAB0:    t1 = (t0 + 9344U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(201, ng0);
    t2 = (t0 + 9684);
    *((int *)t2) = 1;
    t3 = (t0 + 9372);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(202, ng0);

LAB5:    xsi_set_current_line(203, ng0);
    t4 = (t0 + 2152U);
    t5 = *((char **)t4);
    t4 = (t0 + 7440);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(204, ng0);
    t2 = (t0 + 2244U);
    t3 = *((char **)t2);
    t2 = (t0 + 7532);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(205, ng0);
    t2 = (t0 + 2336U);
    t3 = *((char **)t2);
    t2 = (t0 + 7624);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(206, ng0);
    t2 = (t0 + 3072U);
    t3 = *((char **)t2);
    t2 = (t0 + 7716);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);
    xsi_set_current_line(207, ng0);
    t2 = (t0 + 2520U);
    t3 = *((char **)t2);
    t2 = (t0 + 8176);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(208, ng0);
    t2 = (t0 + 2428U);
    t3 = *((char **)t2);
    t2 = (t0 + 8268);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    goto LAB2;

}

static void Always_211_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;

LAB0:    t1 = (t0 + 9488U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(211, ng0);
    t2 = (t0 + 9692);
    *((int *)t2) = 1;
    t3 = (t0 + 9516);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(212, ng0);

LAB5:    xsi_set_current_line(213, ng0);
    t4 = (t0 + 4728U);
    t5 = *((char **)t4);
    t4 = (t0 + 7808);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(214, ng0);
    t2 = (t0 + 4820U);
    t3 = *((char **)t2);
    t2 = (t0 + 7900);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(215, ng0);
    t2 = (t0 + 4912U);
    t3 = *((char **)t2);
    t2 = (t0 + 7992);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(216, ng0);
    t2 = (t0 + 5648U);
    t3 = *((char **)t2);
    t2 = (t0 + 8084);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);
    xsi_set_current_line(217, ng0);
    t2 = (t0 + 5096U);
    t3 = *((char **)t2);
    t2 = (t0 + 8360);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(218, ng0);
    t2 = (t0 + 5004U);
    t3 = *((char **)t2);
    t2 = (t0 + 8452);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    goto LAB2;

}


extern void work_m_00000000002739069274_1362122917_init()
{
	static char *pe[] = {(void *)Always_201_0,(void *)Always_211_1};
	xsi_register_didat("work_m_00000000002739069274_1362122917", "isim/FrameGenChk_tb_isim_beh.exe.sim/work/m_00000000002739069274_1362122917.didat");
	xsi_register_executes(pe);
}
