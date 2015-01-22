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
static const char *ng0 = "C:/Users/LabView User/Documents/ztaotest/GLIB_Aurora/prj/Aurora_1/Data_IO.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static int ng4[] = {0, 0};
static unsigned int ng5[] = {15U, 0U};
static unsigned int ng6[] = {3U, 0U};
static unsigned int ng7[] = {4U, 0U};



static void Always_47_0(char *t0)
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

LAB0:    t1 = (t0 + 2672U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 3012);
    *((int *)t2) = 1;
    t3 = (t0 + 2700);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(47, ng0);

LAB5:    xsi_set_current_line(48, ng0);
    t4 = (t0 + 1092U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 2148);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 2056);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 3, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(48, ng0);

LAB9:    xsi_set_current_line(49, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2056);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 3, 0LL);
    goto LAB8;

}

static void Always_55_1(char *t0)
{
    char t14[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;

LAB0:    t1 = (t0 + 2816U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 3020);
    *((int *)t2) = 1;
    t3 = (t0 + 2844);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(55, ng0);

LAB5:    xsi_set_current_line(56, ng0);
    t4 = (t0 + 2056);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t7 = (t0 + 2148);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 3);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 2056);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);

LAB6:    t5 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 3, t5, 3);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t8 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t8 == 1)
        goto LAB15;

LAB16:
LAB17:    goto LAB2;

LAB7:    xsi_set_current_line(58, ng0);

LAB18:    xsi_set_current_line(59, ng0);
    t6 = ((char*)((ng1)));
    t7 = (t0 + 1688);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 32);
    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1780);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(61, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1872);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(62, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1964);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1000U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t3);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(65, ng0);

LAB23:    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2148);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);

LAB21:    goto LAB17;

LAB9:    xsi_set_current_line(69, ng0);

LAB24:    xsi_set_current_line(70, ng0);
    t3 = ((char*)((ng3)));
    t5 = (t0 + 2148);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 3);
    xsi_set_current_line(71, ng0);
    t2 = (t0 + 1276U);
    t3 = *((char **)t2);
    t2 = (t0 + 1688);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 32);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1780);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 1688);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng4)));
    memset(t14, 0, 8);
    t7 = (t5 + 4);
    t15 = (t6 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t6);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t15);
    t16 = (t12 ^ t13);
    t17 = (t11 | t16);
    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t15);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB26;

LAB25:    if (t20 != 0)
        goto LAB27;

LAB28:    t24 = (t14 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t14);
    t28 = (t27 & t26);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB29;

LAB30:    xsi_set_current_line(75, ng0);

LAB33:    xsi_set_current_line(76, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1872);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB31:    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1964);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    goto LAB17;

LAB11:    xsi_set_current_line(80, ng0);

LAB34:    xsi_set_current_line(81, ng0);
    t3 = ((char*)((ng6)));
    t5 = (t0 + 2148);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 3);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 1688);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 32);
    xsi_set_current_line(83, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1780);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 1688);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng4)));
    memset(t14, 0, 8);
    t7 = (t5 + 4);
    t15 = (t6 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t6);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t15);
    t16 = (t12 ^ t13);
    t17 = (t11 | t16);
    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t15);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB36;

LAB35:    if (t20 != 0)
        goto LAB37;

LAB38:    t24 = (t14 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t14);
    t28 = (t27 & t26);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB39;

LAB40:    xsi_set_current_line(86, ng0);

LAB43:    xsi_set_current_line(87, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1872);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB41:    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1964);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    goto LAB17;

LAB13:    xsi_set_current_line(91, ng0);

LAB44:    xsi_set_current_line(92, ng0);
    t3 = ((char*)((ng7)));
    t5 = (t0 + 2148);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 3);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 1460U);
    t3 = *((char **)t2);
    t2 = (t0 + 1688);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 32);
    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1780);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 1688);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng4)));
    memset(t14, 0, 8);
    t7 = (t5 + 4);
    t15 = (t6 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t6);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t15);
    t16 = (t12 ^ t13);
    t17 = (t11 | t16);
    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t15);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB46;

LAB45:    if (t20 != 0)
        goto LAB47;

LAB48:    t24 = (t14 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t14);
    t28 = (t27 & t26);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB49;

LAB50:    xsi_set_current_line(97, ng0);

LAB53:    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1872);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB51:    xsi_set_current_line(100, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1964);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    goto LAB17;

LAB15:    xsi_set_current_line(102, ng0);

LAB54:    xsi_set_current_line(103, ng0);
    t3 = ((char*)((ng7)));
    t5 = (t0 + 2148);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 3);
    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1688);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(105, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1780);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(106, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1872);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(107, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1964);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    goto LAB17;

LAB19:    xsi_set_current_line(63, ng0);

LAB22:    xsi_set_current_line(64, ng0);
    t5 = ((char*)((ng2)));
    t6 = (t0 + 2148);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 3);
    goto LAB21;

LAB26:    *((unsigned int *)t14) = 1;
    goto LAB28;

LAB27:    t23 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB28;

LAB29:    xsi_set_current_line(73, ng0);

LAB32:    xsi_set_current_line(74, ng0);
    t30 = ((char*)((ng2)));
    t31 = (t0 + 1872);
    xsi_vlogvar_assign_value(t31, t30, 0, 0, 1);
    goto LAB31;

LAB36:    *((unsigned int *)t14) = 1;
    goto LAB38;

LAB37:    t23 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB38;

LAB39:    xsi_set_current_line(84, ng0);

LAB42:    xsi_set_current_line(85, ng0);
    t30 = ((char*)((ng2)));
    t31 = (t0 + 1872);
    xsi_vlogvar_assign_value(t31, t30, 0, 0, 1);
    goto LAB41;

LAB46:    *((unsigned int *)t14) = 1;
    goto LAB48;

LAB47:    t23 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB48;

LAB49:    xsi_set_current_line(95, ng0);

LAB52:    xsi_set_current_line(96, ng0);
    t30 = ((char*)((ng2)));
    t31 = (t0 + 1872);
    xsi_vlogvar_assign_value(t31, t30, 0, 0, 1);
    goto LAB51;

}


extern void work_m_00000000003109190383_0428891365_init()
{
	static char *pe[] = {(void *)Always_47_0,(void *)Always_55_1};
	xsi_register_didat("work_m_00000000003109190383_0428891365", "isim/data_fsm_tb_isim_beh.exe.sim/work/m_00000000003109190383_0428891365.didat");
	xsi_register_executes(pe);
}
