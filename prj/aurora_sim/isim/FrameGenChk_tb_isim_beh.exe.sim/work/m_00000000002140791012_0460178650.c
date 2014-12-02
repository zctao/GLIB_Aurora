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
static const char *ng0 = "C:/Users/LabView User/Documents/ztaotest/GLIB_Aurora/prj/aurora_sim/ipcore_dir/aurora8b10b/src/aurora8b10b_valid_data_counter.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static unsigned int ng3[] = {0U, 0U};



static void Always_113_0(char *t0)
{
    char t6[8];
    char t12[8];
    char t16[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t13;
    char *t14;
    char *t15;
    char *t17;

LAB0:    t1 = (t0 + 1628U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(113, ng0);
    t2 = (t0 + 1968);
    *((int *)t2) = 1;
    t3 = (t0 + 1656);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(114, ng0);
    t4 = (t0 + 600U);
    t5 = *((char **)t4);
    t4 = (t0 + 576U);
    t7 = (t4 + 44U);
    t8 = *((char **)t7);
    t9 = ((char*)((ng1)));
    xsi_vlog_generic_get_index_select_value(t6, 2, t5, t8, 2, t9, 32, 1);
    t10 = (t0 + 600U);
    t11 = *((char **)t10);
    t10 = (t0 + 576U);
    t13 = (t10 + 44U);
    t14 = *((char **)t13);
    t15 = ((char*)((ng2)));
    xsi_vlog_generic_get_index_select_value(t12, 2, t11, t14, 2, t15, 32, 1);
    memset(t16, 0, 8);
    xsi_vlog_unsigned_add(t16, 2, t6, 2, t12, 2);
    t17 = (t0 + 1104);
    xsi_vlogvar_assign_value(t17, t16, 0, 0, 2);
    goto LAB2;

}

static void Always_119_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 1772U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(119, ng0);
    t2 = (t0 + 1976);
    *((int *)t2) = 1;
    t3 = (t0 + 1800);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(120, ng0);
    t4 = (t0 + 784U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(121, ng0);
    t2 = (t0 + 1104);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 1000LL);

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(120, ng0);
    t11 = ((char*)((ng3)));
    t12 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 2, 1000LL);
    goto LAB7;

}


extern void work_m_00000000002140791012_0460178650_init()
{
	static char *pe[] = {(void *)Always_113_0,(void *)Always_119_1};
	xsi_register_didat("work_m_00000000002140791012_0460178650", "isim/FrameGenChk_tb_isim_beh.exe.sim/work/m_00000000002140791012_0460178650.didat");
	xsi_register_executes(pe);
}
