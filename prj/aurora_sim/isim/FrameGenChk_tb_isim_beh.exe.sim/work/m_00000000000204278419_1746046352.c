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
static const char *ng0 = "D:/GLIB Firmware/branches/zttest/prj/Aurora/test7/ipcore_dir/aurora8b10b/src/aurora8b10b_storage_switch_control.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {0, 0};
static int ng3[] = {4, 0};
static unsigned int ng4[] = {4U, 0U};
static unsigned int ng5[] = {6U, 0U};
static unsigned int ng6[] = {8U, 0U};
static unsigned int ng7[] = {9U, 0U};
static unsigned int ng8[] = {1U, 0U};
static unsigned int ng9[] = {10U, 0U};
static int ng10[] = {5, 0};
static int ng11[] = {9, 0};
static unsigned int ng12[] = {5U, 0U};



static void Cont_107_0(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;

LAB0:    t1 = (t0 + 2180U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 784U);
    t3 = *((char **)t2);
    t2 = (t0 + 876U);
    t4 = *((char **)t2);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t4);
    t8 = (t6 | t7);
    *((unsigned int *)t5) = t8;
    t2 = (t3 + 4);
    t9 = (t4 + 4);
    t10 = (t5 + 4);
    t11 = *((unsigned int *)t2);
    t12 = *((unsigned int *)t9);
    t13 = (t11 | t12);
    *((unsigned int *)t10) = t13;
    t14 = *((unsigned int *)t10);
    t15 = (t14 != 0);
    if (t15 == 1)
        goto LAB4;

LAB5:
LAB6:    t32 = (t0 + 2876);
    t33 = (t32 + 32U);
    t34 = *((char **)t33);
    t35 = (t34 + 40U);
    t36 = *((char **)t35);
    memset(t36, 0, 8);
    t37 = 1U;
    t38 = t37;
    t39 = (t5 + 4);
    t40 = *((unsigned int *)t5);
    t37 = (t37 & t40);
    t41 = *((unsigned int *)t39);
    t38 = (t38 & t41);
    t42 = (t36 + 4);
    t43 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t43 | t37);
    t44 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t44 | t38);
    xsi_driver_vfirst_trans(t32, 0, 0);
    t45 = (t0 + 2808);
    *((int *)t45) = 1;

LAB1:    return;
LAB4:    t16 = *((unsigned int *)t5);
    t17 = *((unsigned int *)t10);
    *((unsigned int *)t5) = (t16 | t17);
    t18 = (t3 + 4);
    t19 = (t4 + 4);
    t20 = *((unsigned int *)t18);
    t21 = (~(t20));
    t22 = *((unsigned int *)t3);
    t23 = (t22 & t21);
    t24 = *((unsigned int *)t19);
    t25 = (~(t24));
    t26 = *((unsigned int *)t4);
    t27 = (t26 & t25);
    t28 = (~(t23));
    t29 = (~(t27));
    t30 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t30 & t28);
    t31 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t31 & t29);
    goto LAB6;

}

static void Always_113_1(char *t0)
{
    char t13[8];
    char t14[8];
    char t15[8];
    char t38[8];
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
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    int t23;
    char *t24;
    unsigned int t25;
    int t26;
    int t27;
    char *t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    int t33;
    unsigned int t34;
    unsigned int t35;
    int t36;
    int t37;
    int t39;

LAB0:    t1 = (t0 + 2324U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(113, ng0);
    t2 = (t0 + 2816);
    *((int *)t2) = 1;
    t3 = (t0 + 2352);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(114, ng0);
    t4 = (t0 + 1060U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    t2 = (t0 + 600U);
    t4 = *((char **)t2);
    xsi_vlogtype_concat(t13, 4, 4, 2U, t4, 2, t3, 2);

LAB10:    t2 = ((char*)((ng4)));
    t23 = xsi_vlog_unsigned_case_compare(t13, 4, t2, 4);
    if (t23 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng5)));
    t23 = xsi_vlog_unsigned_case_compare(t13, 4, t2, 4);
    if (t23 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng6)));
    t23 = xsi_vlog_unsigned_case_compare(t13, 4, t2, 4);
    if (t23 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng7)));
    t23 = xsi_vlog_unsigned_case_compare(t13, 4, t2, 4);
    if (t23 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng9)));
    t23 = xsi_vlog_unsigned_case_compare(t13, 4, t2, 4);
    if (t23 == 1)
        goto LAB19;

LAB20:
LAB22:
LAB21:    xsi_set_current_line(122, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1656);
    t4 = (t0 + 1656);
    t5 = (t4 + 44U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng2)));
    t16 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t14, t15, t38, ((int*)(t11)), 2, t12, 32, 1, t16, 32, 1);
    t17 = (t14 + 4);
    t6 = *((unsigned int *)t17);
    t23 = (!(t6));
    t18 = (t15 + 4);
    t7 = *((unsigned int *)t18);
    t26 = (!(t7));
    t27 = (t23 && t26);
    t19 = (t38 + 4);
    t8 = *((unsigned int *)t19);
    t30 = (!(t8));
    t31 = (t27 && t30);
    if (t31 == 1)
        goto LAB34;

LAB35:
LAB23:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(114, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 1656);
    t16 = (t0 + 1656);
    t17 = (t16 + 44U);
    t18 = *((char **)t17);
    t19 = ((char*)((ng2)));
    t20 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t13, t14, t15, ((int*)(t18)), 2, t19, 32, 1, t20, 32, 1);
    t21 = (t13 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (!(t22));
    t24 = (t14 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (!(t25));
    t27 = (t23 && t26);
    t28 = (t15 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (!(t29));
    t31 = (t27 && t30);
    if (t31 == 1)
        goto LAB8;

LAB9:    goto LAB7;

LAB8:    t32 = *((unsigned int *)t15);
    t33 = (t32 + 0);
    t34 = *((unsigned int *)t13);
    t35 = *((unsigned int *)t14);
    t36 = (t34 - t35);
    t37 = (t36 + 1);
    xsi_vlogvar_assign_value(t12, t11, t33, *((unsigned int *)t14), t37);
    goto LAB9;

LAB11:    xsi_set_current_line(117, ng0);
    t5 = ((char*)((ng1)));
    t11 = (t0 + 1656);
    t12 = (t0 + 1656);
    t16 = (t12 + 44U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng2)));
    t19 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t14, t15, t38, ((int*)(t17)), 2, t18, 32, 1, t19, 32, 1);
    t20 = (t14 + 4);
    t6 = *((unsigned int *)t20);
    t26 = (!(t6));
    t21 = (t15 + 4);
    t7 = *((unsigned int *)t21);
    t27 = (!(t7));
    t30 = (t26 && t27);
    t24 = (t38 + 4);
    t8 = *((unsigned int *)t24);
    t31 = (!(t8));
    t33 = (t30 && t31);
    if (t33 == 1)
        goto LAB24;

LAB25:    goto LAB23;

LAB13:    xsi_set_current_line(118, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1656);
    t5 = (t0 + 1656);
    t11 = (t5 + 44U);
    t12 = *((char **)t11);
    t16 = ((char*)((ng2)));
    t17 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t14, t15, t38, ((int*)(t12)), 2, t16, 32, 1, t17, 32, 1);
    t18 = (t14 + 4);
    t6 = *((unsigned int *)t18);
    t26 = (!(t6));
    t19 = (t15 + 4);
    t7 = *((unsigned int *)t19);
    t27 = (!(t7));
    t30 = (t26 && t27);
    t20 = (t38 + 4);
    t8 = *((unsigned int *)t20);
    t31 = (!(t8));
    t33 = (t30 && t31);
    if (t33 == 1)
        goto LAB26;

LAB27:    goto LAB23;

LAB15:    xsi_set_current_line(119, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1656);
    t5 = (t0 + 1656);
    t11 = (t5 + 44U);
    t12 = *((char **)t11);
    t16 = ((char*)((ng2)));
    t17 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t14, t15, t38, ((int*)(t12)), 2, t16, 32, 1, t17, 32, 1);
    t18 = (t14 + 4);
    t6 = *((unsigned int *)t18);
    t26 = (!(t6));
    t19 = (t15 + 4);
    t7 = *((unsigned int *)t19);
    t27 = (!(t7));
    t30 = (t26 && t27);
    t20 = (t38 + 4);
    t8 = *((unsigned int *)t20);
    t31 = (!(t8));
    t33 = (t30 && t31);
    if (t33 == 1)
        goto LAB28;

LAB29:    goto LAB23;

LAB17:    xsi_set_current_line(120, ng0);
    t3 = ((char*)((ng8)));
    t4 = (t0 + 1656);
    t5 = (t0 + 1656);
    t11 = (t5 + 44U);
    t12 = *((char **)t11);
    t16 = ((char*)((ng2)));
    t17 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t14, t15, t38, ((int*)(t12)), 2, t16, 32, 1, t17, 32, 1);
    t18 = (t14 + 4);
    t6 = *((unsigned int *)t18);
    t26 = (!(t6));
    t19 = (t15 + 4);
    t7 = *((unsigned int *)t19);
    t27 = (!(t7));
    t30 = (t26 && t27);
    t20 = (t38 + 4);
    t8 = *((unsigned int *)t20);
    t31 = (!(t8));
    t33 = (t30 && t31);
    if (t33 == 1)
        goto LAB30;

LAB31:    goto LAB23;

LAB19:    xsi_set_current_line(121, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1656);
    t5 = (t0 + 1656);
    t11 = (t5 + 44U);
    t12 = *((char **)t11);
    t16 = ((char*)((ng2)));
    t17 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t14, t15, t38, ((int*)(t12)), 2, t16, 32, 1, t17, 32, 1);
    t18 = (t14 + 4);
    t6 = *((unsigned int *)t18);
    t26 = (!(t6));
    t19 = (t15 + 4);
    t7 = *((unsigned int *)t19);
    t27 = (!(t7));
    t30 = (t26 && t27);
    t20 = (t38 + 4);
    t8 = *((unsigned int *)t20);
    t31 = (!(t8));
    t33 = (t30 && t31);
    if (t33 == 1)
        goto LAB32;

LAB33:    goto LAB23;

LAB24:    t9 = *((unsigned int *)t38);
    t36 = (t9 + 0);
    t10 = *((unsigned int *)t14);
    t22 = *((unsigned int *)t15);
    t37 = (t10 - t22);
    t39 = (t37 + 1);
    xsi_vlogvar_assign_value(t11, t5, t36, *((unsigned int *)t15), t39);
    goto LAB25;

LAB26:    t9 = *((unsigned int *)t38);
    t36 = (t9 + 0);
    t10 = *((unsigned int *)t14);
    t22 = *((unsigned int *)t15);
    t37 = (t10 - t22);
    t39 = (t37 + 1);
    xsi_vlogvar_assign_value(t4, t3, t36, *((unsigned int *)t15), t39);
    goto LAB27;

LAB28:    t9 = *((unsigned int *)t38);
    t36 = (t9 + 0);
    t10 = *((unsigned int *)t14);
    t22 = *((unsigned int *)t15);
    t37 = (t10 - t22);
    t39 = (t37 + 1);
    xsi_vlogvar_assign_value(t4, t3, t36, *((unsigned int *)t15), t39);
    goto LAB29;

LAB30:    t9 = *((unsigned int *)t38);
    t36 = (t9 + 0);
    t10 = *((unsigned int *)t14);
    t22 = *((unsigned int *)t15);
    t37 = (t10 - t22);
    t39 = (t37 + 1);
    xsi_vlogvar_assign_value(t4, t3, t36, *((unsigned int *)t15), t39);
    goto LAB31;

LAB32:    t9 = *((unsigned int *)t38);
    t36 = (t9 + 0);
    t10 = *((unsigned int *)t14);
    t22 = *((unsigned int *)t15);
    t37 = (t10 - t22);
    t39 = (t37 + 1);
    xsi_vlogvar_assign_value(t4, t3, t36, *((unsigned int *)t15), t39);
    goto LAB33;

LAB34:    t9 = *((unsigned int *)t38);
    t33 = (t9 + 0);
    t10 = *((unsigned int *)t14);
    t22 = *((unsigned int *)t15);
    t36 = (t10 - t22);
    t37 = (t36 + 1);
    xsi_vlogvar_assign_value(t3, t2, t33, *((unsigned int *)t15), t37);
    goto LAB35;

}

static void Always_125_2(char *t0)
{
    char t13[8];
    char t14[8];
    char t15[8];
    char t38[8];
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
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    int t23;
    char *t24;
    unsigned int t25;
    int t26;
    int t27;
    char *t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    int t33;
    unsigned int t34;
    unsigned int t35;
    int t36;
    int t37;
    int t39;

LAB0:    t1 = (t0 + 2468U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(125, ng0);
    t2 = (t0 + 2824);
    *((int *)t2) = 1;
    t3 = (t0 + 2496);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(126, ng0);
    t4 = (t0 + 1060U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(128, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    t2 = (t0 + 600U);
    t4 = *((char **)t2);
    xsi_vlogtype_concat(t13, 4, 4, 2U, t4, 2, t3, 2);

LAB10:    t2 = ((char*)((ng4)));
    t23 = xsi_vlog_unsigned_case_compare(t13, 4, t2, 4);
    if (t23 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng12)));
    t23 = xsi_vlog_unsigned_case_compare(t13, 4, t2, 4);
    if (t23 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng5)));
    t23 = xsi_vlog_unsigned_case_compare(t13, 4, t2, 4);
    if (t23 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng6)));
    t23 = xsi_vlog_unsigned_case_compare(t13, 4, t2, 4);
    if (t23 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng9)));
    t23 = xsi_vlog_unsigned_case_compare(t13, 4, t2, 4);
    if (t23 == 1)
        goto LAB19;

LAB20:
LAB22:
LAB21:    xsi_set_current_line(134, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1656);
    t4 = (t0 + 1656);
    t5 = (t4 + 44U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng10)));
    t16 = ((char*)((ng11)));
    xsi_vlog_convert_partindices(t14, t15, t38, ((int*)(t11)), 2, t12, 32, 1, t16, 32, 1);
    t17 = (t14 + 4);
    t6 = *((unsigned int *)t17);
    t23 = (!(t6));
    t18 = (t15 + 4);
    t7 = *((unsigned int *)t18);
    t26 = (!(t7));
    t27 = (t23 && t26);
    t19 = (t38 + 4);
    t8 = *((unsigned int *)t19);
    t30 = (!(t8));
    t31 = (t27 && t30);
    if (t31 == 1)
        goto LAB34;

LAB35:
LAB23:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(126, ng0);
    t11 = ((char*)((ng8)));
    t12 = (t0 + 1656);
    t16 = (t0 + 1656);
    t17 = (t16 + 44U);
    t18 = *((char **)t17);
    t19 = ((char*)((ng10)));
    t20 = ((char*)((ng11)));
    xsi_vlog_convert_partindices(t13, t14, t15, ((int*)(t18)), 2, t19, 32, 1, t20, 32, 1);
    t21 = (t13 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (!(t22));
    t24 = (t14 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (!(t25));
    t27 = (t23 && t26);
    t28 = (t15 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (!(t29));
    t31 = (t27 && t30);
    if (t31 == 1)
        goto LAB8;

LAB9:    goto LAB7;

LAB8:    t32 = *((unsigned int *)t15);
    t33 = (t32 + 0);
    t34 = *((unsigned int *)t13);
    t35 = *((unsigned int *)t14);
    t36 = (t34 - t35);
    t37 = (t36 + 1);
    xsi_vlogvar_assign_value(t12, t11, t33, *((unsigned int *)t14), t37);
    goto LAB9;

LAB11:    xsi_set_current_line(129, ng0);
    t5 = ((char*)((ng8)));
    t11 = (t0 + 1656);
    t12 = (t0 + 1656);
    t16 = (t12 + 44U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng10)));
    t19 = ((char*)((ng11)));
    xsi_vlog_convert_partindices(t14, t15, t38, ((int*)(t17)), 2, t18, 32, 1, t19, 32, 1);
    t20 = (t14 + 4);
    t6 = *((unsigned int *)t20);
    t26 = (!(t6));
    t21 = (t15 + 4);
    t7 = *((unsigned int *)t21);
    t27 = (!(t7));
    t30 = (t26 && t27);
    t24 = (t38 + 4);
    t8 = *((unsigned int *)t24);
    t31 = (!(t8));
    t33 = (t30 && t31);
    if (t33 == 1)
        goto LAB24;

LAB25:    goto LAB23;

LAB13:    xsi_set_current_line(130, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1656);
    t5 = (t0 + 1656);
    t11 = (t5 + 44U);
    t12 = *((char **)t11);
    t16 = ((char*)((ng10)));
    t17 = ((char*)((ng11)));
    xsi_vlog_convert_partindices(t14, t15, t38, ((int*)(t12)), 2, t16, 32, 1, t17, 32, 1);
    t18 = (t14 + 4);
    t6 = *((unsigned int *)t18);
    t26 = (!(t6));
    t19 = (t15 + 4);
    t7 = *((unsigned int *)t19);
    t27 = (!(t7));
    t30 = (t26 && t27);
    t20 = (t38 + 4);
    t8 = *((unsigned int *)t20);
    t31 = (!(t8));
    t33 = (t30 && t31);
    if (t33 == 1)
        goto LAB26;

LAB27:    goto LAB23;

LAB15:    xsi_set_current_line(131, ng0);
    t3 = ((char*)((ng8)));
    t4 = (t0 + 1656);
    t5 = (t0 + 1656);
    t11 = (t5 + 44U);
    t12 = *((char **)t11);
    t16 = ((char*)((ng10)));
    t17 = ((char*)((ng11)));
    xsi_vlog_convert_partindices(t14, t15, t38, ((int*)(t12)), 2, t16, 32, 1, t17, 32, 1);
    t18 = (t14 + 4);
    t6 = *((unsigned int *)t18);
    t26 = (!(t6));
    t19 = (t15 + 4);
    t7 = *((unsigned int *)t19);
    t27 = (!(t7));
    t30 = (t26 && t27);
    t20 = (t38 + 4);
    t8 = *((unsigned int *)t20);
    t31 = (!(t8));
    t33 = (t30 && t31);
    if (t33 == 1)
        goto LAB28;

LAB29:    goto LAB23;

LAB17:    xsi_set_current_line(132, ng0);
    t3 = ((char*)((ng8)));
    t4 = (t0 + 1656);
    t5 = (t0 + 1656);
    t11 = (t5 + 44U);
    t12 = *((char **)t11);
    t16 = ((char*)((ng10)));
    t17 = ((char*)((ng11)));
    xsi_vlog_convert_partindices(t14, t15, t38, ((int*)(t12)), 2, t16, 32, 1, t17, 32, 1);
    t18 = (t14 + 4);
    t6 = *((unsigned int *)t18);
    t26 = (!(t6));
    t19 = (t15 + 4);
    t7 = *((unsigned int *)t19);
    t27 = (!(t7));
    t30 = (t26 && t27);
    t20 = (t38 + 4);
    t8 = *((unsigned int *)t20);
    t31 = (!(t8));
    t33 = (t30 && t31);
    if (t33 == 1)
        goto LAB30;

LAB31:    goto LAB23;

LAB19:    xsi_set_current_line(133, ng0);
    t3 = ((char*)((ng8)));
    t4 = (t0 + 1656);
    t5 = (t0 + 1656);
    t11 = (t5 + 44U);
    t12 = *((char **)t11);
    t16 = ((char*)((ng10)));
    t17 = ((char*)((ng11)));
    xsi_vlog_convert_partindices(t14, t15, t38, ((int*)(t12)), 2, t16, 32, 1, t17, 32, 1);
    t18 = (t14 + 4);
    t6 = *((unsigned int *)t18);
    t26 = (!(t6));
    t19 = (t15 + 4);
    t7 = *((unsigned int *)t19);
    t27 = (!(t7));
    t30 = (t26 && t27);
    t20 = (t38 + 4);
    t8 = *((unsigned int *)t20);
    t31 = (!(t8));
    t33 = (t30 && t31);
    if (t33 == 1)
        goto LAB32;

LAB33:    goto LAB23;

LAB24:    t9 = *((unsigned int *)t38);
    t36 = (t9 + 0);
    t10 = *((unsigned int *)t14);
    t22 = *((unsigned int *)t15);
    t37 = (t10 - t22);
    t39 = (t37 + 1);
    xsi_vlogvar_assign_value(t11, t5, t36, *((unsigned int *)t15), t39);
    goto LAB25;

LAB26:    t9 = *((unsigned int *)t38);
    t36 = (t9 + 0);
    t10 = *((unsigned int *)t14);
    t22 = *((unsigned int *)t15);
    t37 = (t10 - t22);
    t39 = (t37 + 1);
    xsi_vlogvar_assign_value(t4, t3, t36, *((unsigned int *)t15), t39);
    goto LAB27;

LAB28:    t9 = *((unsigned int *)t38);
    t36 = (t9 + 0);
    t10 = *((unsigned int *)t14);
    t22 = *((unsigned int *)t15);
    t37 = (t10 - t22);
    t39 = (t37 + 1);
    xsi_vlogvar_assign_value(t4, t3, t36, *((unsigned int *)t15), t39);
    goto LAB29;

LAB30:    t9 = *((unsigned int *)t38);
    t36 = (t9 + 0);
    t10 = *((unsigned int *)t14);
    t22 = *((unsigned int *)t15);
    t37 = (t10 - t22);
    t39 = (t37 + 1);
    xsi_vlogvar_assign_value(t4, t3, t36, *((unsigned int *)t15), t39);
    goto LAB31;

LAB32:    t9 = *((unsigned int *)t38);
    t36 = (t9 + 0);
    t10 = *((unsigned int *)t14);
    t22 = *((unsigned int *)t15);
    t37 = (t10 - t22);
    t39 = (t37 + 1);
    xsi_vlogvar_assign_value(t4, t3, t36, *((unsigned int *)t15), t39);
    goto LAB33;

LAB34:    t9 = *((unsigned int *)t38);
    t33 = (t9 + 0);
    t10 = *((unsigned int *)t14);
    t22 = *((unsigned int *)t15);
    t36 = (t10 - t22);
    t37 = (t36 + 1);
    xsi_vlogvar_assign_value(t3, t2, t33, *((unsigned int *)t15), t37);
    goto LAB35;

}

static void Always_140_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 2612U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(140, ng0);
    t2 = (t0 + 2832);
    *((int *)t2) = 1;
    t3 = (t0 + 2640);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(141, ng0);
    t4 = (t0 + 1656);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t7 = (t0 + 1288);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 10, 1000LL);
    goto LAB2;

}


extern void work_m_00000000000204278419_1746046352_init()
{
	static char *pe[] = {(void *)Cont_107_0,(void *)Always_113_1,(void *)Always_125_2,(void *)Always_140_3};
	xsi_register_didat("work_m_00000000000204278419_1746046352", "isim/FrameGenChk_tb_isim_beh.exe.sim/work/m_00000000000204278419_1746046352.didat");
	xsi_register_executes(pe);
}
