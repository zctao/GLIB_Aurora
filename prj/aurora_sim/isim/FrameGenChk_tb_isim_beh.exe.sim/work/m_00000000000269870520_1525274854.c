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
static const char *ng0 = "D:/GLIB Firmware/branches/zttest/prj/Aurora/test7/ipcore_dir/aurora8b10b/src/aurora8b10b_hotplug.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {4U, 0U};



static void Always_177_0(char *t0)
{
    char t13[8];
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
    char *t14;
    char *t15;
    char *t16;
    int t17;

LAB0:    t1 = (t0 + 1904U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(177, ng0);
    t2 = (t0 + 2244);
    *((int *)t2) = 1;
    t3 = (t0 + 1932);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(178, ng0);

LAB5:    xsi_set_current_line(179, ng0);
    t4 = (t0 + 600U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(185, ng0);

LAB10:    xsi_set_current_line(186, ng0);
    t2 = (t0 + 784U);
    t3 = *((char **)t2);
    t2 = (t0 + 1196);
    t4 = (t0 + 1196);
    t5 = (t4 + 44U);
    t11 = *((char **)t5);
    t12 = (t0 + 1288);
    t14 = (t12 + 36U);
    t15 = *((char **)t14);
    xsi_vlog_generic_convert_bit_index(t13, t11, 2, t15, 3, 2);
    t16 = (t13 + 4);
    t6 = *((unsigned int *)t16);
    t17 = (!(t6));
    if (t17 == 1)
        goto LAB11;

LAB12:    xsi_set_current_line(187, ng0);
    t2 = (t0 + 1288);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 3, t4, 3, t5, 3);
    t11 = (t0 + 1288);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 3, 1000LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(180, ng0);

LAB9:    xsi_set_current_line(181, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 1196);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 1000LL);
    xsi_set_current_line(182, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 1000LL);
    goto LAB8;

LAB11:    xsi_vlogvar_wait_assign_value(t2, t3, 0, *((unsigned int *)t13), 1, 1000LL);
    goto LAB12;

}

static void Always_191_1(char *t0)
{
    char t13[8];
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
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    t1 = (t0 + 2048U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(191, ng0);
    t2 = (t0 + 2252);
    *((int *)t2) = 1;
    t3 = (t0 + 2076);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(192, ng0);

LAB5:    xsi_set_current_line(193, ng0);
    t4 = (t0 + 600U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(199, ng0);

LAB10:    xsi_set_current_line(200, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 3, t4, 3, t5, 3);
    t11 = (t0 + 1380);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 3, 1000LL);
    xsi_set_current_line(201, ng0);
    t2 = (t0 + 1196);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 1196);
    t11 = (t5 + 44U);
    t12 = *((char **)t11);
    t14 = (t0 + 1380);
    t15 = (t14 + 36U);
    t16 = *((char **)t15);
    xsi_vlog_generic_get_index_select_value(t13, 1, t4, t12, 2, t16, 3, 2);
    t17 = (t0 + 1104);
    xsi_vlogvar_wait_assign_value(t17, t13, 0, 0, 1, 1000LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(194, ng0);

LAB9:    xsi_set_current_line(195, ng0);
    t11 = ((char*)((ng3)));
    t12 = (t0 + 1380);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 3, 1000LL);
    xsi_set_current_line(196, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1104);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 1000LL);
    goto LAB8;

}


extern void work_m_00000000000269870520_1525274854_init()
{
	static char *pe[] = {(void *)Always_177_0,(void *)Always_191_1};
	xsi_register_didat("work_m_00000000000269870520_1525274854", "isim/FrameGenChk_tb_isim_beh.exe.sim/work/m_00000000000269870520_1525274854.didat");
	xsi_register_executes(pe);
}
