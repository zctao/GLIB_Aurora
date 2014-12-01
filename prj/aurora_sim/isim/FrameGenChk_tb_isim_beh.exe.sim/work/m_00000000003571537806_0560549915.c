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
static const char *ng0 = "D:/GLIB Firmware/branches/zttest/prj/Aurora/test7/ipcore_dir/aurora8b10b/src/aurora8b10b_storage_mux.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {0, 0};
static int ng3[] = {15, 0};
static unsigned int ng4[] = {1U, 0U};
static int ng5[] = {16, 0};
static int ng6[] = {31, 0};



static void Always_109_0(char *t0)
{
    char t4[8];
    char t16[8];
    char t27[8];
    char t28[8];
    char t29[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    int t15;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    unsigned int t36;
    int t37;
    char *t38;
    unsigned int t39;
    int t40;
    int t41;
    char *t42;
    unsigned int t43;
    int t44;
    int t45;
    unsigned int t46;
    int t47;
    unsigned int t48;
    unsigned int t49;
    int t50;
    int t51;

LAB0:    t1 = (t0 + 1720U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 2204);
    *((int *)t2) = 1;
    t3 = (t0 + 1748);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(110, ng0);
    t5 = (t0 + 692U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t4 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 5);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 5);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 31U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 31U);

LAB5:    t14 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 5, t14, 5);
    if (t15 == 1)
        goto LAB6;

LAB7:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t15 == 1)
        goto LAB8;

LAB9:
LAB11:
LAB10:    xsi_set_current_line(114, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    t5 = (t0 + 1196);
    t6 = (t5 + 44U);
    t7 = *((char **)t6);
    t14 = ((char*)((ng2)));
    t17 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t16, t27, t28, ((int*)(t7)), 2, t14, 32, 1, t17, 32, 1);
    t18 = (t16 + 4);
    t8 = *((unsigned int *)t18);
    t15 = (!(t8));
    t19 = (t27 + 4);
    t9 = *((unsigned int *)t19);
    t37 = (!(t9));
    t40 = (t15 && t37);
    t26 = (t28 + 4);
    t10 = *((unsigned int *)t26);
    t41 = (!(t10));
    t44 = (t40 && t41);
    if (t44 == 1)
        goto LAB17;

LAB18:
LAB12:    goto LAB2;

LAB6:    xsi_set_current_line(111, ng0);
    t17 = (t0 + 600U);
    t18 = *((char **)t17);
    memset(t16, 0, 8);
    t17 = (t16 + 4);
    t19 = (t18 + 4);
    t20 = *((unsigned int *)t18);
    t21 = (t20 >> 16);
    *((unsigned int *)t16) = t21;
    t22 = *((unsigned int *)t19);
    t23 = (t22 >> 16);
    *((unsigned int *)t17) = t23;
    t24 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t24 & 65535U);
    t25 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t25 & 65535U);
    t26 = (t0 + 1196);
    t30 = (t0 + 1196);
    t31 = (t30 + 44U);
    t32 = *((char **)t31);
    t33 = ((char*)((ng2)));
    t34 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t27, t28, t29, ((int*)(t32)), 2, t33, 32, 1, t34, 32, 1);
    t35 = (t27 + 4);
    t36 = *((unsigned int *)t35);
    t37 = (!(t36));
    t38 = (t28 + 4);
    t39 = *((unsigned int *)t38);
    t40 = (!(t39));
    t41 = (t37 && t40);
    t42 = (t29 + 4);
    t43 = *((unsigned int *)t42);
    t44 = (!(t43));
    t45 = (t41 && t44);
    if (t45 == 1)
        goto LAB13;

LAB14:    goto LAB12;

LAB8:    xsi_set_current_line(112, ng0);
    t3 = (t0 + 600U);
    t5 = *((char **)t3);
    memset(t16, 0, 8);
    t3 = (t16 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t16) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 0);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t12 & 65535U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 65535U);
    t7 = (t0 + 1196);
    t14 = (t0 + 1196);
    t17 = (t14 + 44U);
    t18 = *((char **)t17);
    t19 = ((char*)((ng2)));
    t26 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t27, t28, t29, ((int*)(t18)), 2, t19, 32, 1, t26, 32, 1);
    t30 = (t27 + 4);
    t20 = *((unsigned int *)t30);
    t37 = (!(t20));
    t31 = (t28 + 4);
    t21 = *((unsigned int *)t31);
    t40 = (!(t21));
    t41 = (t37 && t40);
    t32 = (t29 + 4);
    t22 = *((unsigned int *)t32);
    t44 = (!(t22));
    t45 = (t41 && t44);
    if (t45 == 1)
        goto LAB15;

LAB16:    goto LAB12;

LAB13:    t46 = *((unsigned int *)t29);
    t47 = (t46 + 0);
    t48 = *((unsigned int *)t27);
    t49 = *((unsigned int *)t28);
    t50 = (t48 - t49);
    t51 = (t50 + 1);
    xsi_vlogvar_assign_value(t26, t16, t47, *((unsigned int *)t28), t51);
    goto LAB14;

LAB15:    t23 = *((unsigned int *)t29);
    t47 = (t23 + 0);
    t24 = *((unsigned int *)t27);
    t25 = *((unsigned int *)t28);
    t50 = (t24 - t25);
    t51 = (t50 + 1);
    xsi_vlogvar_assign_value(t7, t16, t47, *((unsigned int *)t28), t51);
    goto LAB16;

LAB17:    t11 = *((unsigned int *)t28);
    t45 = (t11 + 0);
    t12 = *((unsigned int *)t16);
    t13 = *((unsigned int *)t27);
    t47 = (t12 - t13);
    t50 = (t47 + 1);
    xsi_vlogvar_assign_value(t3, t2, t45, *((unsigned int *)t27), t50);
    goto LAB18;

}

static void Always_118_1(char *t0)
{
    char t4[8];
    char t16[8];
    char t27[8];
    char t28[8];
    char t29[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    int t15;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    unsigned int t36;
    int t37;
    char *t38;
    unsigned int t39;
    int t40;
    int t41;
    char *t42;
    unsigned int t43;
    int t44;
    int t45;
    unsigned int t46;
    int t47;
    unsigned int t48;
    unsigned int t49;
    int t50;
    int t51;

LAB0:    t1 = (t0 + 1864U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(118, ng0);
    t2 = (t0 + 2212);
    *((int *)t2) = 1;
    t3 = (t0 + 1892);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(119, ng0);
    t5 = (t0 + 692U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t4 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 0);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 31U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 31U);

LAB5:    t14 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 5, t14, 5);
    if (t15 == 1)
        goto LAB6;

LAB7:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t15 == 1)
        goto LAB8;

LAB9:
LAB11:
LAB10:    xsi_set_current_line(123, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    t5 = (t0 + 1196);
    t6 = (t5 + 44U);
    t7 = *((char **)t6);
    t14 = ((char*)((ng5)));
    t17 = ((char*)((ng6)));
    xsi_vlog_convert_partindices(t16, t27, t28, ((int*)(t7)), 2, t14, 32, 1, t17, 32, 1);
    t18 = (t16 + 4);
    t8 = *((unsigned int *)t18);
    t15 = (!(t8));
    t19 = (t27 + 4);
    t9 = *((unsigned int *)t19);
    t37 = (!(t9));
    t40 = (t15 && t37);
    t26 = (t28 + 4);
    t10 = *((unsigned int *)t26);
    t41 = (!(t10));
    t44 = (t40 && t41);
    if (t44 == 1)
        goto LAB17;

LAB18:
LAB12:    goto LAB2;

LAB6:    xsi_set_current_line(120, ng0);
    t17 = (t0 + 600U);
    t18 = *((char **)t17);
    memset(t16, 0, 8);
    t17 = (t16 + 4);
    t19 = (t18 + 4);
    t20 = *((unsigned int *)t18);
    t21 = (t20 >> 16);
    *((unsigned int *)t16) = t21;
    t22 = *((unsigned int *)t19);
    t23 = (t22 >> 16);
    *((unsigned int *)t17) = t23;
    t24 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t24 & 65535U);
    t25 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t25 & 65535U);
    t26 = (t0 + 1196);
    t30 = (t0 + 1196);
    t31 = (t30 + 44U);
    t32 = *((char **)t31);
    t33 = ((char*)((ng5)));
    t34 = ((char*)((ng6)));
    xsi_vlog_convert_partindices(t27, t28, t29, ((int*)(t32)), 2, t33, 32, 1, t34, 32, 1);
    t35 = (t27 + 4);
    t36 = *((unsigned int *)t35);
    t37 = (!(t36));
    t38 = (t28 + 4);
    t39 = *((unsigned int *)t38);
    t40 = (!(t39));
    t41 = (t37 && t40);
    t42 = (t29 + 4);
    t43 = *((unsigned int *)t42);
    t44 = (!(t43));
    t45 = (t41 && t44);
    if (t45 == 1)
        goto LAB13;

LAB14:    goto LAB12;

LAB8:    xsi_set_current_line(121, ng0);
    t3 = (t0 + 600U);
    t5 = *((char **)t3);
    memset(t16, 0, 8);
    t3 = (t16 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t16) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 0);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t12 & 65535U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 65535U);
    t7 = (t0 + 1196);
    t14 = (t0 + 1196);
    t17 = (t14 + 44U);
    t18 = *((char **)t17);
    t19 = ((char*)((ng5)));
    t26 = ((char*)((ng6)));
    xsi_vlog_convert_partindices(t27, t28, t29, ((int*)(t18)), 2, t19, 32, 1, t26, 32, 1);
    t30 = (t27 + 4);
    t20 = *((unsigned int *)t30);
    t37 = (!(t20));
    t31 = (t28 + 4);
    t21 = *((unsigned int *)t31);
    t40 = (!(t21));
    t41 = (t37 && t40);
    t32 = (t29 + 4);
    t22 = *((unsigned int *)t32);
    t44 = (!(t22));
    t45 = (t41 && t44);
    if (t45 == 1)
        goto LAB15;

LAB16:    goto LAB12;

LAB13:    t46 = *((unsigned int *)t29);
    t47 = (t46 + 0);
    t48 = *((unsigned int *)t27);
    t49 = *((unsigned int *)t28);
    t50 = (t48 - t49);
    t51 = (t50 + 1);
    xsi_vlogvar_assign_value(t26, t16, t47, *((unsigned int *)t28), t51);
    goto LAB14;

LAB15:    t23 = *((unsigned int *)t29);
    t47 = (t23 + 0);
    t24 = *((unsigned int *)t27);
    t25 = *((unsigned int *)t28);
    t50 = (t24 - t25);
    t51 = (t50 + 1);
    xsi_vlogvar_assign_value(t7, t16, t47, *((unsigned int *)t28), t51);
    goto LAB16;

LAB17:    t11 = *((unsigned int *)t28);
    t45 = (t11 + 0);
    t12 = *((unsigned int *)t16);
    t13 = *((unsigned int *)t27);
    t47 = (t12 - t13);
    t50 = (t47 + 1);
    xsi_vlogvar_assign_value(t3, t2, t45, *((unsigned int *)t27), t50);
    goto LAB18;

}

static void Always_129_2(char *t0)
{
    char t6[8];
    char t20[8];
    char t33[8];
    char t34[8];
    char t35[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    unsigned int t42;
    int t43;
    char *t44;
    unsigned int t45;
    int t46;
    int t47;
    char *t48;
    unsigned int t49;
    int t50;
    int t51;
    unsigned int t52;
    int t53;
    unsigned int t54;
    unsigned int t55;
    int t56;
    int t57;

LAB0:    t1 = (t0 + 2008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(129, ng0);
    t2 = (t0 + 2220);
    *((int *)t2) = 1;
    t3 = (t0 + 2036);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(130, ng0);

LAB5:    xsi_set_current_line(132, ng0);
    t4 = (t0 + 784U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t6 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 1);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 1);
    t13 = (t12 & 1);
    *((unsigned int *)t4) = t13;
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t14);
    t16 = (~(t15));
    t17 = *((unsigned int *)t6);
    t18 = (t17 & t16);
    t19 = (t18 != 0);
    if (t19 > 0)
        goto LAB6;

LAB7:
LAB8:    xsi_set_current_line(134, ng0);
    t2 = (t0 + 784U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 0);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 0);
    t13 = (t12 & 1);
    *((unsigned int *)t2) = t13;
    t5 = (t6 + 4);
    t15 = *((unsigned int *)t5);
    t16 = (~(t15));
    t17 = *((unsigned int *)t6);
    t18 = (t17 & t16);
    t19 = (t18 != 0);
    if (t19 > 0)
        goto LAB11;

LAB12:
LAB13:    goto LAB2;

LAB6:    xsi_set_current_line(132, ng0);
    t21 = (t0 + 1196);
    t22 = (t21 + 36U);
    t23 = *((char **)t22);
    memset(t20, 0, 8);
    t24 = (t20 + 4);
    t25 = (t23 + 4);
    t26 = *((unsigned int *)t23);
    t27 = (t26 >> 16);
    *((unsigned int *)t20) = t27;
    t28 = *((unsigned int *)t25);
    t29 = (t28 >> 16);
    *((unsigned int *)t24) = t29;
    t30 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t30 & 65535U);
    t31 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t31 & 65535U);
    t32 = (t0 + 1104);
    t36 = (t0 + 1104);
    t37 = (t36 + 44U);
    t38 = *((char **)t37);
    t39 = ((char*)((ng2)));
    t40 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t33, t34, t35, ((int*)(t38)), 2, t39, 32, 1, t40, 32, 1);
    t41 = (t33 + 4);
    t42 = *((unsigned int *)t41);
    t43 = (!(t42));
    t44 = (t34 + 4);
    t45 = *((unsigned int *)t44);
    t46 = (!(t45));
    t47 = (t43 && t46);
    t48 = (t35 + 4);
    t49 = *((unsigned int *)t48);
    t50 = (!(t49));
    t51 = (t47 && t50);
    if (t51 == 1)
        goto LAB9;

LAB10:    goto LAB8;

LAB9:    t52 = *((unsigned int *)t35);
    t53 = (t52 + 0);
    t54 = *((unsigned int *)t33);
    t55 = *((unsigned int *)t34);
    t56 = (t54 - t55);
    t57 = (t56 + 1);
    xsi_vlogvar_wait_assign_value(t32, t20, t53, *((unsigned int *)t34), t57, 1000LL);
    goto LAB10;

LAB11:    xsi_set_current_line(134, ng0);
    t7 = (t0 + 1196);
    t14 = (t7 + 36U);
    t21 = *((char **)t14);
    memset(t20, 0, 8);
    t22 = (t20 + 4);
    t23 = (t21 + 4);
    t26 = *((unsigned int *)t21);
    t27 = (t26 >> 0);
    *((unsigned int *)t20) = t27;
    t28 = *((unsigned int *)t23);
    t29 = (t28 >> 0);
    *((unsigned int *)t22) = t29;
    t30 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t30 & 65535U);
    t31 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t31 & 65535U);
    t24 = (t0 + 1104);
    t25 = (t0 + 1104);
    t32 = (t25 + 44U);
    t36 = *((char **)t32);
    t37 = ((char*)((ng5)));
    t38 = ((char*)((ng6)));
    xsi_vlog_convert_partindices(t33, t34, t35, ((int*)(t36)), 2, t37, 32, 1, t38, 32, 1);
    t39 = (t33 + 4);
    t42 = *((unsigned int *)t39);
    t43 = (!(t42));
    t40 = (t34 + 4);
    t45 = *((unsigned int *)t40);
    t46 = (!(t45));
    t47 = (t43 && t46);
    t41 = (t35 + 4);
    t49 = *((unsigned int *)t41);
    t50 = (!(t49));
    t51 = (t47 && t50);
    if (t51 == 1)
        goto LAB14;

LAB15:    goto LAB13;

LAB14:    t52 = *((unsigned int *)t35);
    t53 = (t52 + 0);
    t54 = *((unsigned int *)t33);
    t55 = *((unsigned int *)t34);
    t56 = (t54 - t55);
    t57 = (t56 + 1);
    xsi_vlogvar_wait_assign_value(t24, t20, t53, *((unsigned int *)t34), t57, 1000LL);
    goto LAB15;

}


extern void work_m_00000000003571537806_0560549915_init()
{
	static char *pe[] = {(void *)Always_109_0,(void *)Always_118_1,(void *)Always_129_2};
	xsi_register_didat("work_m_00000000003571537806_0560549915", "isim/FrameGenChk_tb_isim_beh.exe.sim/work/m_00000000003571537806_0560549915.didat");
	xsi_register_executes(pe);
}
