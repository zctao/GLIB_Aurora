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
static const char *ng0 = "C:/Users/LabView User/Documents/ztaotest/GLIB_Aurora/prj/aurora_sim/ipcore_dir/aurora8b10b/src/aurora8b10b_tx_ll_datapath.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {3U, 0U};
static unsigned int ng4[] = {2U, 0U};
static int ng5[] = {0, 0};
static int ng6[] = {1, 0};



static void Cont_152_0(char *t0)
{
    char t3[8];
    char t11[8];
    char t23[8];
    char t32[8];
    char t40[8];
    char *t1;
    char *t2;
    char *t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t12;
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
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    int t64;
    int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    char *t73;
    char *t74;
    char *t75;
    char *t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    unsigned int t80;
    unsigned int t81;
    char *t82;
    unsigned int t83;
    unsigned int t84;
    char *t85;

LAB0:    t1 = (t0 + 3284U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(152, ng0);
    t2 = (t0 + 784U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t4 + 4);
    t5 = *((unsigned int *)t2);
    t6 = (~(t5));
    t7 = *((unsigned int *)t4);
    t8 = (t7 & t6);
    t9 = (t8 & 1U);
    if (t9 != 0)
        goto LAB7;

LAB5:    if (*((unsigned int *)t2) == 0)
        goto LAB4;

LAB6:    t10 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t10) = 1;

LAB7:    memset(t11, 0, 8);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (~(t13));
    t15 = *((unsigned int *)t3);
    t16 = (t15 & t14);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t12) != 0)
        goto LAB10;

LAB11:    t19 = (t11 + 4);
    t20 = *((unsigned int *)t11);
    t21 = *((unsigned int *)t19);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB12;

LAB13:    memcpy(t40, t11, 8);

LAB14:    t72 = (t0 + 5196);
    t73 = (t72 + 32U);
    t74 = *((char **)t73);
    t75 = (t74 + 40U);
    t76 = *((char **)t75);
    memset(t76, 0, 8);
    t77 = 1U;
    t78 = t77;
    t79 = (t40 + 4);
    t80 = *((unsigned int *)t40);
    t77 = (t77 & t80);
    t81 = *((unsigned int *)t79);
    t78 = (t78 & t81);
    t82 = (t76 + 4);
    t83 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t83 | t77);
    t84 = *((unsigned int *)t82);
    *((unsigned int *)t82) = (t84 | t78);
    xsi_driver_vfirst_trans(t72, 0, 0);
    t85 = (t0 + 5064);
    *((int *)t85) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t3) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t11) = 1;
    goto LAB11;

LAB10:    t18 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB11;

LAB12:    t24 = (t0 + 1152U);
    t25 = *((char **)t24);
    memset(t23, 0, 8);
    t24 = (t25 + 4);
    t26 = *((unsigned int *)t24);
    t27 = (~(t26));
    t28 = *((unsigned int *)t25);
    t29 = (t28 & t27);
    t30 = (t29 & 1U);
    if (t30 != 0)
        goto LAB18;

LAB16:    if (*((unsigned int *)t24) == 0)
        goto LAB15;

LAB17:    t31 = (t23 + 4);
    *((unsigned int *)t23) = 1;
    *((unsigned int *)t31) = 1;

LAB18:    memset(t32, 0, 8);
    t33 = (t23 + 4);
    t34 = *((unsigned int *)t33);
    t35 = (~(t34));
    t36 = *((unsigned int *)t23);
    t37 = (t36 & t35);
    t38 = (t37 & 1U);
    if (t38 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t33) != 0)
        goto LAB21;

LAB22:    t41 = *((unsigned int *)t11);
    t42 = *((unsigned int *)t32);
    t43 = (t41 & t42);
    *((unsigned int *)t40) = t43;
    t44 = (t11 + 4);
    t45 = (t32 + 4);
    t46 = (t40 + 4);
    t47 = *((unsigned int *)t44);
    t48 = *((unsigned int *)t45);
    t49 = (t47 | t48);
    *((unsigned int *)t46) = t49;
    t50 = *((unsigned int *)t46);
    t51 = (t50 != 0);
    if (t51 == 1)
        goto LAB23;

LAB24:
LAB25:    goto LAB14;

LAB15:    *((unsigned int *)t23) = 1;
    goto LAB18;

LAB19:    *((unsigned int *)t32) = 1;
    goto LAB22;

LAB21:    t39 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB22;

LAB23:    t52 = *((unsigned int *)t40);
    t53 = *((unsigned int *)t46);
    *((unsigned int *)t40) = (t52 | t53);
    t54 = (t11 + 4);
    t55 = (t32 + 4);
    t56 = *((unsigned int *)t11);
    t57 = (~(t56));
    t58 = *((unsigned int *)t54);
    t59 = (~(t58));
    t60 = *((unsigned int *)t32);
    t61 = (~(t60));
    t62 = *((unsigned int *)t55);
    t63 = (~(t62));
    t64 = (t57 & t59);
    t65 = (t61 & t63);
    t66 = (~(t64));
    t67 = (~(t65));
    t68 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t68 & t66);
    t69 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t69 & t67);
    t70 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t70 & t66);
    t71 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t71 & t67);
    goto LAB25;

}

static void Always_157_1(char *t0)
{
    char t4[8];
    char t21[8];
    char t32[8];
    char t39[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    int t63;
    int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    char *t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;
    char *t78;

LAB0:    t1 = (t0 + 3428U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(157, ng0);
    t2 = (t0 + 5072);
    *((int *)t2) = 1;
    t3 = (t0 + 3456);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(158, ng0);
    t5 = (t0 + 1244U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t5) == 0)
        goto LAB5;

LAB7:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB8:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(159, ng0);
    t2 = (t0 + 1520U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB12;

LAB13:
LAB14:
LAB11:    goto LAB2;

LAB5:    *((unsigned int *)t4) = 1;
    goto LAB8;

LAB9:    xsi_set_current_line(158, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 2024);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 1, 1000LL);
    goto LAB11;

LAB12:    xsi_set_current_line(160, ng0);

LAB15:    xsi_set_current_line(161, ng0);
    t5 = (t0 + 876U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t14 = *((unsigned int *)t5);
    t15 = (~(t14));
    t16 = *((unsigned int *)t6);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB19;

LAB17:    if (*((unsigned int *)t5) == 0)
        goto LAB16;

LAB18:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB19:    memset(t21, 0, 8);
    t13 = (t4 + 4);
    t22 = *((unsigned int *)t13);
    t23 = (~(t22));
    t24 = *((unsigned int *)t4);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB20;

LAB21:    if (*((unsigned int *)t13) != 0)
        goto LAB22;

LAB23:    t20 = (t21 + 4);
    t27 = *((unsigned int *)t21);
    t28 = *((unsigned int *)t20);
    t29 = (t27 || t28);
    if (t29 > 0)
        goto LAB24;

LAB25:    memcpy(t39, t21, 8);

LAB26:    t71 = (t39 + 4);
    t72 = *((unsigned int *)t71);
    t73 = (~(t72));
    t74 = *((unsigned int *)t39);
    t75 = (t74 & t73);
    t76 = (t75 != 0);
    if (t76 > 0)
        goto LAB34;

LAB35:    xsi_set_current_line(162, ng0);
    t2 = (t0 + 968U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB40;

LAB38:    if (*((unsigned int *)t2) == 0)
        goto LAB37;

LAB39:    t5 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t5) = 1;

LAB40:    t6 = (t4 + 4);
    t14 = *((unsigned int *)t6);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB41;

LAB42:
LAB43:
LAB36:    goto LAB14;

LAB16:    *((unsigned int *)t4) = 1;
    goto LAB19;

LAB20:    *((unsigned int *)t21) = 1;
    goto LAB23;

LAB22:    t19 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB23;

LAB24:    t30 = (t0 + 968U);
    t31 = *((char **)t30);
    memset(t32, 0, 8);
    t30 = (t31 + 4);
    t33 = *((unsigned int *)t30);
    t34 = (~(t33));
    t35 = *((unsigned int *)t31);
    t36 = (t35 & t34);
    t37 = (t36 & 1U);
    if (t37 != 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t30) != 0)
        goto LAB29;

LAB30:    t40 = *((unsigned int *)t21);
    t41 = *((unsigned int *)t32);
    t42 = (t40 & t41);
    *((unsigned int *)t39) = t42;
    t43 = (t21 + 4);
    t44 = (t32 + 4);
    t45 = (t39 + 4);
    t46 = *((unsigned int *)t43);
    t47 = *((unsigned int *)t44);
    t48 = (t46 | t47);
    *((unsigned int *)t45) = t48;
    t49 = *((unsigned int *)t45);
    t50 = (t49 != 0);
    if (t50 == 1)
        goto LAB31;

LAB32:
LAB33:    goto LAB26;

LAB27:    *((unsigned int *)t32) = 1;
    goto LAB30;

LAB29:    t38 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB30;

LAB31:    t51 = *((unsigned int *)t39);
    t52 = *((unsigned int *)t45);
    *((unsigned int *)t39) = (t51 | t52);
    t53 = (t21 + 4);
    t54 = (t32 + 4);
    t55 = *((unsigned int *)t21);
    t56 = (~(t55));
    t57 = *((unsigned int *)t53);
    t58 = (~(t57));
    t59 = *((unsigned int *)t32);
    t60 = (~(t59));
    t61 = *((unsigned int *)t54);
    t62 = (~(t61));
    t63 = (t56 & t58);
    t64 = (t60 & t62);
    t65 = (~(t63));
    t66 = (~(t64));
    t67 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t67 & t65);
    t68 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t68 & t66);
    t69 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t69 & t65);
    t70 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t70 & t66);
    goto LAB33;

LAB34:    xsi_set_current_line(161, ng0);
    t77 = ((char*)((ng2)));
    t78 = (t0 + 2024);
    xsi_vlogvar_wait_assign_value(t78, t77, 0, 0, 1, 1000LL);
    goto LAB36;

LAB37:    *((unsigned int *)t4) = 1;
    goto LAB40;

LAB41:    xsi_set_current_line(162, ng0);
    t12 = ((char*)((ng1)));
    t13 = (t0 + 2024);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 1, 1000LL);
    goto LAB43;

}

static void Cont_166_2(char *t0)
{
    char t4[8];
    char t18[8];
    char t31[8];
    char t40[8];
    char t48[8];
    char t76[8];
    char t84[8];
    char *t1;
    char *t2;
    char *t3;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    char *t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    char *t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    char *t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    char *t83;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    char *t88;
    char *t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    int t108;
    int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    char *t116;
    char *t117;
    char *t118;
    char *t119;
    char *t120;
    unsigned int t121;
    unsigned int t122;
    char *t123;
    unsigned int t124;
    unsigned int t125;
    char *t126;
    unsigned int t127;
    unsigned int t128;
    char *t129;

LAB0:    t1 = (t0 + 3572U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(166, ng0);
    t2 = (t0 + 1520U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t3 + 4);
    t5 = *((unsigned int *)t2);
    t6 = (~(t5));
    t7 = *((unsigned int *)t3);
    t8 = (t7 & t6);
    t9 = (t8 & 1U);
    if (t9 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t11 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t11);
    t14 = (t12 || t13);
    if (t14 > 0)
        goto LAB8;

LAB9:    memcpy(t84, t4, 8);

LAB10:    t116 = (t0 + 5232);
    t117 = (t116 + 32U);
    t118 = *((char **)t117);
    t119 = (t118 + 40U);
    t120 = *((char **)t119);
    memset(t120, 0, 8);
    t121 = 1U;
    t122 = t121;
    t123 = (t84 + 4);
    t124 = *((unsigned int *)t84);
    t121 = (t121 & t124);
    t125 = *((unsigned int *)t123);
    t122 = (t122 & t125);
    t126 = (t120 + 4);
    t127 = *((unsigned int *)t120);
    *((unsigned int *)t120) = (t127 | t121);
    t128 = *((unsigned int *)t126);
    *((unsigned int *)t126) = (t128 | t122);
    xsi_driver_vfirst_trans(t116, 0, 0);
    t129 = (t0 + 5080);
    *((int *)t129) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t10 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB7;

LAB8:    t15 = (t0 + 2024);
    t16 = (t15 + 36U);
    t17 = *((char **)t16);
    memset(t18, 0, 8);
    t19 = (t17 + 4);
    t20 = *((unsigned int *)t19);
    t21 = (~(t20));
    t22 = *((unsigned int *)t17);
    t23 = (t22 & t21);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB11;

LAB12:    if (*((unsigned int *)t19) != 0)
        goto LAB13;

LAB14:    t26 = (t18 + 4);
    t27 = *((unsigned int *)t18);
    t28 = (!(t27));
    t29 = *((unsigned int *)t26);
    t30 = (t28 || t29);
    if (t30 > 0)
        goto LAB15;

LAB16:    memcpy(t48, t18, 8);

LAB17:    memset(t76, 0, 8);
    t77 = (t48 + 4);
    t78 = *((unsigned int *)t77);
    t79 = (~(t78));
    t80 = *((unsigned int *)t48);
    t81 = (t80 & t79);
    t82 = (t81 & 1U);
    if (t82 != 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t77) != 0)
        goto LAB31;

LAB32:    t85 = *((unsigned int *)t4);
    t86 = *((unsigned int *)t76);
    t87 = (t85 & t86);
    *((unsigned int *)t84) = t87;
    t88 = (t4 + 4);
    t89 = (t76 + 4);
    t90 = (t84 + 4);
    t91 = *((unsigned int *)t88);
    t92 = *((unsigned int *)t89);
    t93 = (t91 | t92);
    *((unsigned int *)t90) = t93;
    t94 = *((unsigned int *)t90);
    t95 = (t94 != 0);
    if (t95 == 1)
        goto LAB33;

LAB34:
LAB35:    goto LAB10;

LAB11:    *((unsigned int *)t18) = 1;
    goto LAB14;

LAB13:    t25 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB14;

LAB15:    t32 = (t0 + 876U);
    t33 = *((char **)t32);
    memset(t31, 0, 8);
    t32 = (t33 + 4);
    t34 = *((unsigned int *)t32);
    t35 = (~(t34));
    t36 = *((unsigned int *)t33);
    t37 = (t36 & t35);
    t38 = (t37 & 1U);
    if (t38 != 0)
        goto LAB21;

LAB19:    if (*((unsigned int *)t32) == 0)
        goto LAB18;

LAB20:    t39 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t39) = 1;

LAB21:    memset(t40, 0, 8);
    t41 = (t31 + 4);
    t42 = *((unsigned int *)t41);
    t43 = (~(t42));
    t44 = *((unsigned int *)t31);
    t45 = (t44 & t43);
    t46 = (t45 & 1U);
    if (t46 != 0)
        goto LAB22;

LAB23:    if (*((unsigned int *)t41) != 0)
        goto LAB24;

LAB25:    t49 = *((unsigned int *)t18);
    t50 = *((unsigned int *)t40);
    t51 = (t49 | t50);
    *((unsigned int *)t48) = t51;
    t52 = (t18 + 4);
    t53 = (t40 + 4);
    t54 = (t48 + 4);
    t55 = *((unsigned int *)t52);
    t56 = *((unsigned int *)t53);
    t57 = (t55 | t56);
    *((unsigned int *)t54) = t57;
    t58 = *((unsigned int *)t54);
    t59 = (t58 != 0);
    if (t59 == 1)
        goto LAB26;

LAB27:
LAB28:    goto LAB17;

LAB18:    *((unsigned int *)t31) = 1;
    goto LAB21;

LAB22:    *((unsigned int *)t40) = 1;
    goto LAB25;

LAB24:    t47 = (t40 + 4);
    *((unsigned int *)t40) = 1;
    *((unsigned int *)t47) = 1;
    goto LAB25;

LAB26:    t60 = *((unsigned int *)t48);
    t61 = *((unsigned int *)t54);
    *((unsigned int *)t48) = (t60 | t61);
    t62 = (t18 + 4);
    t63 = (t40 + 4);
    t64 = *((unsigned int *)t62);
    t65 = (~(t64));
    t66 = *((unsigned int *)t18);
    t67 = (t66 & t65);
    t68 = *((unsigned int *)t63);
    t69 = (~(t68));
    t70 = *((unsigned int *)t40);
    t71 = (t70 & t69);
    t72 = (~(t67));
    t73 = (~(t71));
    t74 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t74 & t72);
    t75 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t75 & t73);
    goto LAB28;

LAB29:    *((unsigned int *)t76) = 1;
    goto LAB32;

LAB31:    t83 = (t76 + 4);
    *((unsigned int *)t76) = 1;
    *((unsigned int *)t83) = 1;
    goto LAB32;

LAB33:    t96 = *((unsigned int *)t84);
    t97 = *((unsigned int *)t90);
    *((unsigned int *)t84) = (t96 | t97);
    t98 = (t4 + 4);
    t99 = (t76 + 4);
    t100 = *((unsigned int *)t4);
    t101 = (~(t100));
    t102 = *((unsigned int *)t98);
    t103 = (~(t102));
    t104 = *((unsigned int *)t76);
    t105 = (~(t104));
    t106 = *((unsigned int *)t99);
    t107 = (~(t106));
    t108 = (t101 & t103);
    t109 = (t105 & t107);
    t110 = (~(t108));
    t111 = (~(t109));
    t112 = *((unsigned int *)t90);
    *((unsigned int *)t90) = (t112 & t110);
    t113 = *((unsigned int *)t90);
    *((unsigned int *)t90) = (t113 & t111);
    t114 = *((unsigned int *)t84);
    *((unsigned int *)t84) = (t114 & t110);
    t115 = *((unsigned int *)t84);
    *((unsigned int *)t84) = (t115 & t111);
    goto LAB35;

}

static void Always_175_3(char *t0)
{
    char t4[8];
    char t19[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;

LAB0:    t1 = (t0 + 3716U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(175, ng0);
    t2 = (t0 + 5088);
    *((int *)t2) = 1;
    t3 = (t0 + 3744);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(176, ng0);
    t5 = (t0 + 1060U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t5) == 0)
        goto LAB5;

LAB7:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB8:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB9;

LAB10:
LAB11:    goto LAB2;

LAB5:    *((unsigned int *)t4) = 1;
    goto LAB8;

LAB9:    xsi_set_current_line(177, ng0);
    t20 = (t0 + 600U);
    t21 = *((char **)t20);
    memset(t19, 0, 8);
    t20 = (t19 + 4);
    t22 = (t21 + 4);
    t23 = *((unsigned int *)t21);
    t24 = (t23 >> 0);
    *((unsigned int *)t19) = t24;
    t25 = *((unsigned int *)t22);
    t26 = (t25 >> 0);
    *((unsigned int *)t20) = t26;
    t27 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t27 & 65535U);
    t28 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t28 & 65535U);
    t29 = (t0 + 2116);
    xsi_vlogvar_wait_assign_value(t29, t19, 0, 0, 16, 1000LL);
    goto LAB11;

}

static void Always_184_4(char *t0)
{
    char t4[8];
    char t19[8];
    char t20[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;

LAB0:    t1 = (t0 + 3860U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(184, ng0);
    t2 = (t0 + 5096);
    *((int *)t2) = 1;
    t3 = (t0 + 3888);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(185, ng0);
    t5 = (t0 + 1060U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t5) == 0)
        goto LAB5;

LAB7:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB8:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB9;

LAB10:
LAB11:    goto LAB2;

LAB5:    *((unsigned int *)t4) = 1;
    goto LAB8;

LAB9:    xsi_set_current_line(186, ng0);
    t21 = (t0 + 600U);
    t22 = *((char **)t21);
    memset(t20, 0, 8);
    t21 = (t20 + 4);
    t23 = (t22 + 4);
    t24 = *((unsigned int *)t22);
    t25 = (t24 >> 16);
    *((unsigned int *)t20) = t25;
    t26 = *((unsigned int *)t23);
    t27 = (t26 >> 16);
    *((unsigned int *)t21) = t27;
    t28 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t28 & 65535U);
    t29 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t29 & 65535U);
    t30 = (t0 + 2116);
    t31 = (t30 + 36U);
    t32 = *((char **)t31);
    xsi_vlogtype_concat(t19, 32, 32, 2U, t32, 16, t20, 16);
    t33 = (t0 + 2392);
    xsi_vlogvar_wait_assign_value(t33, t19, 0, 0, 32, 1000LL);
    goto LAB11;

}

static void Always_191_5(char *t0)
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
    unsigned int t14;
    int t15;

LAB0:    t1 = (t0 + 4004U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(191, ng0);
    t2 = (t0 + 5104);
    *((int *)t2) = 1;
    t3 = (t0 + 4032);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(192, ng0);
    t4 = (t0 + 968U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(194, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t13 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 0);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t10 & 3U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 3U);

LAB8:    t5 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 2, t5, 2);
    if (t15 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 2, t2, 2);
    if (t15 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 2, t2, 2);
    if (t15 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 2, t2, 2);
    if (t15 == 1)
        goto LAB15;

LAB16:
LAB18:
LAB17:    xsi_set_current_line(199, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2484);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB19:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(192, ng0);
    t11 = ((char*)((ng3)));
    t12 = (t0 + 2484);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 2);
    goto LAB7;

LAB9:    xsi_set_current_line(195, ng0);
    t11 = ((char*)((ng4)));
    t12 = (t0 + 2484);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 2);
    goto LAB19;

LAB11:    xsi_set_current_line(196, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 2484);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 2);
    goto LAB19;

LAB13:    xsi_set_current_line(197, ng0);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 2484);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 2);
    goto LAB19;

LAB15:    xsi_set_current_line(198, ng0);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 2484);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 2);
    goto LAB19;

}

static void Always_208_6(char *t0)
{
    char t4[8];
    char t22[8];
    char t31[8];
    char t45[8];
    char t52[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t44;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    int t76;
    int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;

LAB0:    t1 = (t0 + 4148U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(208, ng0);
    t2 = (t0 + 5112);
    *((int *)t2) = 1;
    t3 = (t0 + 4176);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(209, ng0);
    t5 = (t0 + 1060U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t5) == 0)
        goto LAB5;

LAB7:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB8:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB9;

LAB10:
LAB11:    goto LAB2;

LAB5:    *((unsigned int *)t4) = 1;
    goto LAB8;

LAB9:    xsi_set_current_line(209, ng0);
    t19 = (t0 + 2484);
    t20 = (t19 + 36U);
    t21 = *((char **)t20);
    memset(t22, 0, 8);
    t23 = (t22 + 4);
    t24 = (t21 + 4);
    t25 = *((unsigned int *)t21);
    t26 = (t25 >> 0);
    t27 = (t26 & 1);
    *((unsigned int *)t22) = t27;
    t28 = *((unsigned int *)t24);
    t29 = (t28 >> 0);
    t30 = (t29 & 1);
    *((unsigned int *)t23) = t30;
    memset(t31, 0, 8);
    t32 = (t22 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t22);
    t36 = (t35 & t34);
    t37 = (t36 & 1U);
    if (t37 != 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t32) != 0)
        goto LAB14;

LAB15:    t39 = (t31 + 4);
    t40 = *((unsigned int *)t31);
    t41 = *((unsigned int *)t39);
    t42 = (t40 || t41);
    if (t42 > 0)
        goto LAB16;

LAB17:    memcpy(t52, t31, 8);

LAB18:    t84 = (t0 + 2208);
    xsi_vlogvar_wait_assign_value(t84, t52, 0, 0, 1, 1000LL);
    goto LAB11;

LAB12:    *((unsigned int *)t31) = 1;
    goto LAB15;

LAB14:    t38 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB15;

LAB16:    t43 = (t0 + 1428U);
    t44 = *((char **)t43);
    memset(t45, 0, 8);
    t43 = (t44 + 4);
    t46 = *((unsigned int *)t43);
    t47 = (~(t46));
    t48 = *((unsigned int *)t44);
    t49 = (t48 & t47);
    t50 = (t49 & 1U);
    if (t50 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t43) != 0)
        goto LAB21;

LAB22:    t53 = *((unsigned int *)t31);
    t54 = *((unsigned int *)t45);
    t55 = (t53 & t54);
    *((unsigned int *)t52) = t55;
    t56 = (t31 + 4);
    t57 = (t45 + 4);
    t58 = (t52 + 4);
    t59 = *((unsigned int *)t56);
    t60 = *((unsigned int *)t57);
    t61 = (t59 | t60);
    *((unsigned int *)t58) = t61;
    t62 = *((unsigned int *)t58);
    t63 = (t62 != 0);
    if (t63 == 1)
        goto LAB23;

LAB24:
LAB25:    goto LAB18;

LAB19:    *((unsigned int *)t45) = 1;
    goto LAB22;

LAB21:    t51 = (t45 + 4);
    *((unsigned int *)t45) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB22;

LAB23:    t64 = *((unsigned int *)t52);
    t65 = *((unsigned int *)t58);
    *((unsigned int *)t52) = (t64 | t65);
    t66 = (t31 + 4);
    t67 = (t45 + 4);
    t68 = *((unsigned int *)t31);
    t69 = (~(t68));
    t70 = *((unsigned int *)t66);
    t71 = (~(t70));
    t72 = *((unsigned int *)t45);
    t73 = (~(t72));
    t74 = *((unsigned int *)t67);
    t75 = (~(t74));
    t76 = (t69 & t71);
    t77 = (t73 & t75);
    t78 = (~(t76));
    t79 = (~(t77));
    t80 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t80 & t78);
    t81 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t81 & t79);
    t82 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t82 & t78);
    t83 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t83 & t79);
    goto LAB25;

}

static void Always_222_7(char *t0)
{
    char t4[8];
    char t23[8];
    char t34[8];
    char t40[8];
    char t68[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned int t29;
    int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    char *t69;
    char *t70;
    char *t71;
    char *t72;
    char *t73;
    unsigned int t74;
    int t75;

LAB0:    t1 = (t0 + 4292U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(222, ng0);
    t2 = (t0 + 5120);
    *((int *)t2) = 1;
    t3 = (t0 + 4320);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(223, ng0);
    t5 = (t0 + 1060U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t5) == 0)
        goto LAB5;

LAB7:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB8:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB9;

LAB10:
LAB11:    goto LAB2;

LAB5:    *((unsigned int *)t4) = 1;
    goto LAB8;

LAB9:    xsi_set_current_line(224, ng0);

LAB12:    xsi_set_current_line(225, ng0);
    t19 = (t0 + 2208);
    t20 = (t19 + 36U);
    t21 = *((char **)t20);
    t22 = (t0 + 2576);
    t24 = (t0 + 2576);
    t25 = (t24 + 44U);
    t26 = *((char **)t25);
    t27 = ((char*)((ng5)));
    xsi_vlog_generic_convert_bit_index(t23, t26, 2, t27, 32, 1);
    t28 = (t23 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (!(t29));
    if (t30 == 1)
        goto LAB13;

LAB14:    xsi_set_current_line(226, ng0);
    t2 = (t0 + 2484);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 1);
    t9 = (t8 & 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 1);
    t14 = (t11 & 1);
    *((unsigned int *)t6) = t14;
    memset(t23, 0, 8);
    t13 = (t4 + 4);
    t15 = *((unsigned int *)t13);
    t16 = (~(t15));
    t17 = *((unsigned int *)t4);
    t18 = (t17 & t16);
    t29 = (t18 & 1U);
    if (t29 != 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t13) != 0)
        goto LAB17;

LAB18:    t20 = (t23 + 4);
    t31 = *((unsigned int *)t23);
    t32 = *((unsigned int *)t20);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB19;

LAB20:    memcpy(t40, t23, 8);

LAB21:    t67 = (t0 + 2576);
    t69 = (t0 + 2576);
    t70 = (t69 + 44U);
    t71 = *((char **)t70);
    t72 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t68, t71, 2, t72, 32, 1);
    t73 = (t68 + 4);
    t74 = *((unsigned int *)t73);
    t75 = (!(t74));
    if (t75 == 1)
        goto LAB29;

LAB30:    goto LAB11;

LAB13:    xsi_vlogvar_wait_assign_value(t22, t21, 0, *((unsigned int *)t23), 1, 1000LL);
    goto LAB14;

LAB15:    *((unsigned int *)t23) = 1;
    goto LAB18;

LAB17:    t19 = (t23 + 4);
    *((unsigned int *)t23) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB18;

LAB19:    t21 = (t0 + 1428U);
    t22 = *((char **)t21);
    memset(t34, 0, 8);
    t21 = (t22 + 4);
    t35 = *((unsigned int *)t21);
    t36 = (~(t35));
    t37 = *((unsigned int *)t22);
    t38 = (t37 & t36);
    t39 = (t38 & 1U);
    if (t39 != 0)
        goto LAB22;

LAB23:    if (*((unsigned int *)t21) != 0)
        goto LAB24;

LAB25:    t41 = *((unsigned int *)t23);
    t42 = *((unsigned int *)t34);
    t43 = (t41 & t42);
    *((unsigned int *)t40) = t43;
    t25 = (t23 + 4);
    t26 = (t34 + 4);
    t27 = (t40 + 4);
    t44 = *((unsigned int *)t25);
    t45 = *((unsigned int *)t26);
    t46 = (t44 | t45);
    *((unsigned int *)t27) = t46;
    t47 = *((unsigned int *)t27);
    t48 = (t47 != 0);
    if (t48 == 1)
        goto LAB26;

LAB27:
LAB28:    goto LAB21;

LAB22:    *((unsigned int *)t34) = 1;
    goto LAB25;

LAB24:    t24 = (t34 + 4);
    *((unsigned int *)t34) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB25;

LAB26:    t49 = *((unsigned int *)t40);
    t50 = *((unsigned int *)t27);
    *((unsigned int *)t40) = (t49 | t50);
    t28 = (t23 + 4);
    t51 = (t34 + 4);
    t52 = *((unsigned int *)t23);
    t53 = (~(t52));
    t54 = *((unsigned int *)t28);
    t55 = (~(t54));
    t56 = *((unsigned int *)t34);
    t57 = (~(t56));
    t58 = *((unsigned int *)t51);
    t59 = (~(t58));
    t30 = (t53 & t55);
    t60 = (t57 & t59);
    t61 = (~(t30));
    t62 = (~(t60));
    t63 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t63 & t61);
    t64 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t64 & t62);
    t65 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t65 & t61);
    t66 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t66 & t62);
    goto LAB28;

LAB29:    xsi_vlogvar_wait_assign_value(t67, t40, 0, *((unsigned int *)t68), 1, 1000LL);
    goto LAB30;

}

static void Always_234_8(char *t0)
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
    unsigned int t14;
    int t15;

LAB0:    t1 = (t0 + 4436U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(234, ng0);
    t2 = (t0 + 5128);
    *((int *)t2) = 1;
    t3 = (t0 + 4464);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(235, ng0);
    t4 = (t0 + 968U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(237, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t13 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 0);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t10 & 3U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 3U);

LAB8:    t5 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 2, t5, 2);
    if (t15 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 2, t2, 2);
    if (t15 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 2, t2, 2);
    if (t15 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 2, t2, 2);
    if (t15 == 1)
        goto LAB15;

LAB16:
LAB18:
LAB17:    xsi_set_current_line(242, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2668);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB19:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(235, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2668);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 2);
    goto LAB7;

LAB9:    xsi_set_current_line(238, ng0);
    t11 = ((char*)((ng4)));
    t12 = (t0 + 2668);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 2);
    goto LAB19;

LAB11:    xsi_set_current_line(239, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2668);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 2);
    goto LAB19;

LAB13:    xsi_set_current_line(240, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 2668);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 2);
    goto LAB19;

LAB15:    xsi_set_current_line(241, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2668);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 2);
    goto LAB19;

}

static void Always_247_9(char *t0)
{
    char t4[8];
    char t22[8];
    char t31[8];
    char t45[8];
    char t52[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t44;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    int t76;
    int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;

LAB0:    t1 = (t0 + 4580U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(247, ng0);
    t2 = (t0 + 5136);
    *((int *)t2) = 1;
    t3 = (t0 + 4608);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(248, ng0);
    t5 = (t0 + 1060U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t5) == 0)
        goto LAB5;

LAB7:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB8:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB9;

LAB10:
LAB11:    goto LAB2;

LAB5:    *((unsigned int *)t4) = 1;
    goto LAB8;

LAB9:    xsi_set_current_line(249, ng0);
    t19 = (t0 + 2668);
    t20 = (t19 + 36U);
    t21 = *((char **)t20);
    memset(t22, 0, 8);
    t23 = (t22 + 4);
    t24 = (t21 + 4);
    t25 = *((unsigned int *)t21);
    t26 = (t25 >> 0);
    t27 = (t26 & 1);
    *((unsigned int *)t22) = t27;
    t28 = *((unsigned int *)t24);
    t29 = (t28 >> 0);
    t30 = (t29 & 1);
    *((unsigned int *)t23) = t30;
    memset(t31, 0, 8);
    t32 = (t22 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t22);
    t36 = (t35 & t34);
    t37 = (t36 & 1U);
    if (t37 != 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t32) != 0)
        goto LAB14;

LAB15:    t39 = (t31 + 4);
    t40 = *((unsigned int *)t31);
    t41 = *((unsigned int *)t39);
    t42 = (t40 || t41);
    if (t42 > 0)
        goto LAB16;

LAB17:    memcpy(t52, t31, 8);

LAB18:    t84 = (t0 + 2300);
    xsi_vlogvar_wait_assign_value(t84, t52, 0, 0, 1, 1000LL);
    goto LAB11;

LAB12:    *((unsigned int *)t31) = 1;
    goto LAB15;

LAB14:    t38 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB15;

LAB16:    t43 = (t0 + 1428U);
    t44 = *((char **)t43);
    memset(t45, 0, 8);
    t43 = (t44 + 4);
    t46 = *((unsigned int *)t43);
    t47 = (~(t46));
    t48 = *((unsigned int *)t44);
    t49 = (t48 & t47);
    t50 = (t49 & 1U);
    if (t50 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t43) != 0)
        goto LAB21;

LAB22:    t53 = *((unsigned int *)t31);
    t54 = *((unsigned int *)t45);
    t55 = (t53 & t54);
    *((unsigned int *)t52) = t55;
    t56 = (t31 + 4);
    t57 = (t45 + 4);
    t58 = (t52 + 4);
    t59 = *((unsigned int *)t56);
    t60 = *((unsigned int *)t57);
    t61 = (t59 | t60);
    *((unsigned int *)t58) = t61;
    t62 = *((unsigned int *)t58);
    t63 = (t62 != 0);
    if (t63 == 1)
        goto LAB23;

LAB24:
LAB25:    goto LAB18;

LAB19:    *((unsigned int *)t45) = 1;
    goto LAB22;

LAB21:    t51 = (t45 + 4);
    *((unsigned int *)t45) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB22;

LAB23:    t64 = *((unsigned int *)t52);
    t65 = *((unsigned int *)t58);
    *((unsigned int *)t52) = (t64 | t65);
    t66 = (t31 + 4);
    t67 = (t45 + 4);
    t68 = *((unsigned int *)t31);
    t69 = (~(t68));
    t70 = *((unsigned int *)t66);
    t71 = (~(t70));
    t72 = *((unsigned int *)t45);
    t73 = (~(t72));
    t74 = *((unsigned int *)t67);
    t75 = (~(t74));
    t76 = (t69 & t71);
    t77 = (t73 & t75);
    t78 = (~(t76));
    t79 = (~(t77));
    t80 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t80 & t78);
    t81 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t81 & t79);
    t82 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t82 & t78);
    t83 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t83 & t79);
    goto LAB25;

}

static void Always_253_10(char *t0)
{
    char t4[8];
    char t23[8];
    char t34[8];
    char t40[8];
    char t68[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned int t29;
    int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    char *t69;
    char *t70;
    char *t71;
    char *t72;
    char *t73;
    unsigned int t74;
    int t75;

LAB0:    t1 = (t0 + 4724U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(253, ng0);
    t2 = (t0 + 5144);
    *((int *)t2) = 1;
    t3 = (t0 + 4752);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(254, ng0);
    t5 = (t0 + 1060U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t5) == 0)
        goto LAB5;

LAB7:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB8:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB9;

LAB10:
LAB11:    goto LAB2;

LAB5:    *((unsigned int *)t4) = 1;
    goto LAB8;

LAB9:    xsi_set_current_line(255, ng0);

LAB12:    xsi_set_current_line(256, ng0);
    t19 = (t0 + 2300);
    t20 = (t19 + 36U);
    t21 = *((char **)t20);
    t22 = (t0 + 2760);
    t24 = (t0 + 2760);
    t25 = (t24 + 44U);
    t26 = *((char **)t25);
    t27 = ((char*)((ng5)));
    xsi_vlog_generic_convert_bit_index(t23, t26, 2, t27, 32, 1);
    t28 = (t23 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (!(t29));
    if (t30 == 1)
        goto LAB13;

LAB14:    xsi_set_current_line(257, ng0);
    t2 = (t0 + 2668);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 1);
    t9 = (t8 & 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 1);
    t14 = (t11 & 1);
    *((unsigned int *)t6) = t14;
    memset(t23, 0, 8);
    t13 = (t4 + 4);
    t15 = *((unsigned int *)t13);
    t16 = (~(t15));
    t17 = *((unsigned int *)t4);
    t18 = (t17 & t16);
    t29 = (t18 & 1U);
    if (t29 != 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t13) != 0)
        goto LAB17;

LAB18:    t20 = (t23 + 4);
    t31 = *((unsigned int *)t23);
    t32 = *((unsigned int *)t20);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB19;

LAB20:    memcpy(t40, t23, 8);

LAB21:    t67 = (t0 + 2760);
    t69 = (t0 + 2760);
    t70 = (t69 + 44U);
    t71 = *((char **)t70);
    t72 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t68, t71, 2, t72, 32, 1);
    t73 = (t68 + 4);
    t74 = *((unsigned int *)t73);
    t75 = (!(t74));
    if (t75 == 1)
        goto LAB29;

LAB30:    goto LAB11;

LAB13:    xsi_vlogvar_wait_assign_value(t22, t21, 0, *((unsigned int *)t23), 1, 1000LL);
    goto LAB14;

LAB15:    *((unsigned int *)t23) = 1;
    goto LAB18;

LAB17:    t19 = (t23 + 4);
    *((unsigned int *)t23) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB18;

LAB19:    t21 = (t0 + 1428U);
    t22 = *((char **)t21);
    memset(t34, 0, 8);
    t21 = (t22 + 4);
    t35 = *((unsigned int *)t21);
    t36 = (~(t35));
    t37 = *((unsigned int *)t22);
    t38 = (t37 & t36);
    t39 = (t38 & 1U);
    if (t39 != 0)
        goto LAB22;

LAB23:    if (*((unsigned int *)t21) != 0)
        goto LAB24;

LAB25:    t41 = *((unsigned int *)t23);
    t42 = *((unsigned int *)t34);
    t43 = (t41 & t42);
    *((unsigned int *)t40) = t43;
    t25 = (t23 + 4);
    t26 = (t34 + 4);
    t27 = (t40 + 4);
    t44 = *((unsigned int *)t25);
    t45 = *((unsigned int *)t26);
    t46 = (t44 | t45);
    *((unsigned int *)t27) = t46;
    t47 = *((unsigned int *)t27);
    t48 = (t47 != 0);
    if (t48 == 1)
        goto LAB26;

LAB27:
LAB28:    goto LAB21;

LAB22:    *((unsigned int *)t34) = 1;
    goto LAB25;

LAB24:    t24 = (t34 + 4);
    *((unsigned int *)t34) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB25;

LAB26:    t49 = *((unsigned int *)t40);
    t50 = *((unsigned int *)t27);
    *((unsigned int *)t40) = (t49 | t50);
    t28 = (t23 + 4);
    t51 = (t34 + 4);
    t52 = *((unsigned int *)t23);
    t53 = (~(t52));
    t54 = *((unsigned int *)t28);
    t55 = (~(t54));
    t56 = *((unsigned int *)t34);
    t57 = (~(t56));
    t58 = *((unsigned int *)t51);
    t59 = (~(t58));
    t30 = (t53 & t55);
    t60 = (t57 & t59);
    t61 = (~(t30));
    t62 = (~(t60));
    t63 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t63 & t61);
    t64 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t64 & t62);
    t65 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t65 & t61);
    t66 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t66 & t62);
    goto LAB28;

LAB29:    xsi_vlogvar_wait_assign_value(t67, t40, 0, *((unsigned int *)t68), 1, 1000LL);
    goto LAB30;

}

static void Always_264_11(char *t0)
{
    char t8[8];
    char t15[8];
    char t23[8];
    char t56[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    int t47;
    int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t55;
    char *t57;
    char *t58;
    char *t59;
    char *t60;
    char *t61;
    unsigned int t62;
    int t63;

LAB0:    t1 = (t0 + 4868U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(264, ng0);
    t2 = (t0 + 5152);
    *((int *)t2) = 1;
    t3 = (t0 + 4896);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(265, ng0);

LAB5:    xsi_set_current_line(266, ng0);
    t4 = (t0 + 2392);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t7 = (t0 + 1932);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 32, 1000LL);
    xsi_set_current_line(267, ng0);
    t2 = (t0 + 2576);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 1);
    t11 = (t10 & 1);
    *((unsigned int *)t8) = t11;
    t12 = *((unsigned int *)t6);
    t13 = (t12 >> 1);
    t14 = (t13 & 1);
    *((unsigned int *)t5) = t14;
    t7 = (t0 + 1060U);
    t16 = *((char **)t7);
    memset(t15, 0, 8);
    t7 = (t16 + 4);
    t17 = *((unsigned int *)t7);
    t18 = (~(t17));
    t19 = *((unsigned int *)t16);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t7) == 0)
        goto LAB6;

LAB8:    t22 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t22) = 1;

LAB9:    t24 = *((unsigned int *)t8);
    t25 = *((unsigned int *)t15);
    t26 = (t24 & t25);
    *((unsigned int *)t23) = t26;
    t27 = (t8 + 4);
    t28 = (t15 + 4);
    t29 = (t23 + 4);
    t30 = *((unsigned int *)t27);
    t31 = *((unsigned int *)t28);
    t32 = (t30 | t31);
    *((unsigned int *)t29) = t32;
    t33 = *((unsigned int *)t29);
    t34 = (t33 != 0);
    if (t34 == 1)
        goto LAB10;

LAB11:
LAB12:    t55 = (t0 + 1748);
    t57 = (t0 + 1748);
    t58 = (t57 + 44U);
    t59 = *((char **)t58);
    t60 = ((char*)((ng5)));
    xsi_vlog_generic_convert_bit_index(t56, t59, 2, t60, 32, 1);
    t61 = (t56 + 4);
    t62 = *((unsigned int *)t61);
    t63 = (!(t62));
    if (t63 == 1)
        goto LAB13;

LAB14:    xsi_set_current_line(268, ng0);
    t2 = (t0 + 2576);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 0);
    t11 = (t10 & 1);
    *((unsigned int *)t8) = t11;
    t12 = *((unsigned int *)t6);
    t13 = (t12 >> 0);
    t14 = (t13 & 1);
    *((unsigned int *)t5) = t14;
    t7 = (t0 + 1060U);
    t16 = *((char **)t7);
    memset(t15, 0, 8);
    t7 = (t16 + 4);
    t17 = *((unsigned int *)t7);
    t18 = (~(t17));
    t19 = *((unsigned int *)t16);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB18;

LAB16:    if (*((unsigned int *)t7) == 0)
        goto LAB15;

LAB17:    t22 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t22) = 1;

LAB18:    t24 = *((unsigned int *)t8);
    t25 = *((unsigned int *)t15);
    t26 = (t24 & t25);
    *((unsigned int *)t23) = t26;
    t27 = (t8 + 4);
    t28 = (t15 + 4);
    t29 = (t23 + 4);
    t30 = *((unsigned int *)t27);
    t31 = *((unsigned int *)t28);
    t32 = (t30 | t31);
    *((unsigned int *)t29) = t32;
    t33 = *((unsigned int *)t29);
    t34 = (t33 != 0);
    if (t34 == 1)
        goto LAB19;

LAB20:
LAB21:    t55 = (t0 + 1748);
    t57 = (t0 + 1748);
    t58 = (t57 + 44U);
    t59 = *((char **)t58);
    t60 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t56, t59, 2, t60, 32, 1);
    t61 = (t56 + 4);
    t62 = *((unsigned int *)t61);
    t63 = (!(t62));
    if (t63 == 1)
        goto LAB22;

LAB23:    xsi_set_current_line(269, ng0);
    t2 = (t0 + 2760);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 1);
    t11 = (t10 & 1);
    *((unsigned int *)t8) = t11;
    t12 = *((unsigned int *)t6);
    t13 = (t12 >> 1);
    t14 = (t13 & 1);
    *((unsigned int *)t5) = t14;
    t7 = (t0 + 1060U);
    t16 = *((char **)t7);
    memset(t15, 0, 8);
    t7 = (t16 + 4);
    t17 = *((unsigned int *)t7);
    t18 = (~(t17));
    t19 = *((unsigned int *)t16);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB27;

LAB25:    if (*((unsigned int *)t7) == 0)
        goto LAB24;

LAB26:    t22 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t22) = 1;

LAB27:    t24 = *((unsigned int *)t8);
    t25 = *((unsigned int *)t15);
    t26 = (t24 & t25);
    *((unsigned int *)t23) = t26;
    t27 = (t8 + 4);
    t28 = (t15 + 4);
    t29 = (t23 + 4);
    t30 = *((unsigned int *)t27);
    t31 = *((unsigned int *)t28);
    t32 = (t30 | t31);
    *((unsigned int *)t29) = t32;
    t33 = *((unsigned int *)t29);
    t34 = (t33 != 0);
    if (t34 == 1)
        goto LAB28;

LAB29:
LAB30:    t55 = (t0 + 1840);
    t57 = (t0 + 1840);
    t58 = (t57 + 44U);
    t59 = *((char **)t58);
    t60 = ((char*)((ng5)));
    xsi_vlog_generic_convert_bit_index(t56, t59, 2, t60, 32, 1);
    t61 = (t56 + 4);
    t62 = *((unsigned int *)t61);
    t63 = (!(t62));
    if (t63 == 1)
        goto LAB31;

LAB32:    xsi_set_current_line(270, ng0);
    t2 = (t0 + 2760);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 0);
    t11 = (t10 & 1);
    *((unsigned int *)t8) = t11;
    t12 = *((unsigned int *)t6);
    t13 = (t12 >> 0);
    t14 = (t13 & 1);
    *((unsigned int *)t5) = t14;
    t7 = (t0 + 1060U);
    t16 = *((char **)t7);
    memset(t15, 0, 8);
    t7 = (t16 + 4);
    t17 = *((unsigned int *)t7);
    t18 = (~(t17));
    t19 = *((unsigned int *)t16);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB36;

LAB34:    if (*((unsigned int *)t7) == 0)
        goto LAB33;

LAB35:    t22 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t22) = 1;

LAB36:    t24 = *((unsigned int *)t8);
    t25 = *((unsigned int *)t15);
    t26 = (t24 & t25);
    *((unsigned int *)t23) = t26;
    t27 = (t8 + 4);
    t28 = (t15 + 4);
    t29 = (t23 + 4);
    t30 = *((unsigned int *)t27);
    t31 = *((unsigned int *)t28);
    t32 = (t30 | t31);
    *((unsigned int *)t29) = t32;
    t33 = *((unsigned int *)t29);
    t34 = (t33 != 0);
    if (t34 == 1)
        goto LAB37;

LAB38:
LAB39:    t55 = (t0 + 1840);
    t57 = (t0 + 1840);
    t58 = (t57 + 44U);
    t59 = *((char **)t58);
    t60 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t56, t59, 2, t60, 32, 1);
    t61 = (t56 + 4);
    t62 = *((unsigned int *)t61);
    t63 = (!(t62));
    if (t63 == 1)
        goto LAB40;

LAB41:    goto LAB2;

LAB6:    *((unsigned int *)t15) = 1;
    goto LAB9;

LAB10:    t35 = *((unsigned int *)t23);
    t36 = *((unsigned int *)t29);
    *((unsigned int *)t23) = (t35 | t36);
    t37 = (t8 + 4);
    t38 = (t15 + 4);
    t39 = *((unsigned int *)t8);
    t40 = (~(t39));
    t41 = *((unsigned int *)t37);
    t42 = (~(t41));
    t43 = *((unsigned int *)t15);
    t44 = (~(t43));
    t45 = *((unsigned int *)t38);
    t46 = (~(t45));
    t47 = (t40 & t42);
    t48 = (t44 & t46);
    t49 = (~(t47));
    t50 = (~(t48));
    t51 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t51 & t49);
    t52 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t52 & t50);
    t53 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t53 & t49);
    t54 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t54 & t50);
    goto LAB12;

LAB13:    xsi_vlogvar_wait_assign_value(t55, t23, 0, *((unsigned int *)t56), 1, 1000LL);
    goto LAB14;

LAB15:    *((unsigned int *)t15) = 1;
    goto LAB18;

LAB19:    t35 = *((unsigned int *)t23);
    t36 = *((unsigned int *)t29);
    *((unsigned int *)t23) = (t35 | t36);
    t37 = (t8 + 4);
    t38 = (t15 + 4);
    t39 = *((unsigned int *)t8);
    t40 = (~(t39));
    t41 = *((unsigned int *)t37);
    t42 = (~(t41));
    t43 = *((unsigned int *)t15);
    t44 = (~(t43));
    t45 = *((unsigned int *)t38);
    t46 = (~(t45));
    t47 = (t40 & t42);
    t48 = (t44 & t46);
    t49 = (~(t47));
    t50 = (~(t48));
    t51 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t51 & t49);
    t52 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t52 & t50);
    t53 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t53 & t49);
    t54 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t54 & t50);
    goto LAB21;

LAB22:    xsi_vlogvar_wait_assign_value(t55, t23, 0, *((unsigned int *)t56), 1, 1000LL);
    goto LAB23;

LAB24:    *((unsigned int *)t15) = 1;
    goto LAB27;

LAB28:    t35 = *((unsigned int *)t23);
    t36 = *((unsigned int *)t29);
    *((unsigned int *)t23) = (t35 | t36);
    t37 = (t8 + 4);
    t38 = (t15 + 4);
    t39 = *((unsigned int *)t8);
    t40 = (~(t39));
    t41 = *((unsigned int *)t37);
    t42 = (~(t41));
    t43 = *((unsigned int *)t15);
    t44 = (~(t43));
    t45 = *((unsigned int *)t38);
    t46 = (~(t45));
    t47 = (t40 & t42);
    t48 = (t44 & t46);
    t49 = (~(t47));
    t50 = (~(t48));
    t51 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t51 & t49);
    t52 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t52 & t50);
    t53 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t53 & t49);
    t54 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t54 & t50);
    goto LAB30;

LAB31:    xsi_vlogvar_wait_assign_value(t55, t23, 0, *((unsigned int *)t56), 1, 1000LL);
    goto LAB32;

LAB33:    *((unsigned int *)t15) = 1;
    goto LAB36;

LAB37:    t35 = *((unsigned int *)t23);
    t36 = *((unsigned int *)t29);
    *((unsigned int *)t23) = (t35 | t36);
    t37 = (t8 + 4);
    t38 = (t15 + 4);
    t39 = *((unsigned int *)t8);
    t40 = (~(t39));
    t41 = *((unsigned int *)t37);
    t42 = (~(t41));
    t43 = *((unsigned int *)t15);
    t44 = (~(t43));
    t45 = *((unsigned int *)t38);
    t46 = (~(t45));
    t47 = (t40 & t42);
    t48 = (t44 & t46);
    t49 = (~(t47));
    t50 = (~(t48));
    t51 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t51 & t49);
    t52 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t52 & t50);
    t53 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t53 & t49);
    t54 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t54 & t50);
    goto LAB39;

LAB40:    xsi_vlogvar_wait_assign_value(t55, t23, 0, *((unsigned int *)t56), 1, 1000LL);
    goto LAB41;

}


extern void work_m_00000000002893777638_3015816392_init()
{
	static char *pe[] = {(void *)Cont_152_0,(void *)Always_157_1,(void *)Cont_166_2,(void *)Always_175_3,(void *)Always_184_4,(void *)Always_191_5,(void *)Always_208_6,(void *)Always_222_7,(void *)Always_234_8,(void *)Always_247_9,(void *)Always_253_10,(void *)Always_264_11};
	xsi_register_didat("work_m_00000000002893777638_3015816392", "isim/FrameGenChk_tb_isim_beh.exe.sim/work/m_00000000002893777638_3015816392.didat");
	xsi_register_executes(pe);
}
