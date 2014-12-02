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
static const char *ng0 = "C:/Users/LabView User/Documents/ztaotest/GLIB_Aurora/prj/aurora_sim/aurora_frame_check.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {3588675046U, 0U};
static unsigned int ng6[] = {54758U, 0U};
static int ng7[] = {2, 0};
static int ng8[] = {1, 0};



static void Cont_131_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;

LAB0:    t1 = (t0 + 3652U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(131, ng0);
    t2 = (t0 + 1152U);
    t3 = *((char **)t2);
    t2 = (t0 + 5868);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t3 + 4);
    t11 = *((unsigned int *)t3);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t2, 0, 0);
    t16 = (t0 + 5720);
    *((int *)t16) = 1;

LAB1:    return;
}

static void Always_135_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;

LAB0:    t1 = (t0 + 3796U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(135, ng0);
    t2 = (t0 + 5728);
    *((int *)t2) = 1;
    t3 = (t0 + 3824);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(136, ng0);

LAB5:    xsi_set_current_line(137, ng0);
    t4 = (t0 + 600U);
    t5 = *((char **)t4);
    t4 = (t0 + 2024);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 32, 1000LL);
    xsi_set_current_line(138, ng0);
    t2 = (t0 + 968U);
    t3 = *((char **)t2);
    t2 = (t0 + 2484);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 1000LL);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    t2 = (t0 + 2116);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 1000LL);
    xsi_set_current_line(140, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    t2 = (t0 + 2208);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 1000LL);
    xsi_set_current_line(141, ng0);
    t2 = (t0 + 784U);
    t3 = *((char **)t2);
    t2 = (t0 + 2300);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 1000LL);
    xsi_set_current_line(142, ng0);
    t2 = (t0 + 876U);
    t3 = *((char **)t2);
    t2 = (t0 + 2392);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 1000LL);
    goto LAB2;

}

static void Cont_147_2(char *t0)
{
    char t4[8];
    char t15[8];
    char t26[8];
    char t34[8];
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
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    int t58;
    int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    char *t67;
    char *t68;
    char *t69;
    char *t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    char *t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;

LAB0:    t1 = (t0 + 3940U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(147, ng0);
    t2 = (t0 + 1704U);
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

LAB9:    memcpy(t34, t4, 8);

LAB10:    t66 = (t0 + 5904);
    t67 = (t66 + 32U);
    t68 = *((char **)t67);
    t69 = (t68 + 40U);
    t70 = *((char **)t69);
    memset(t70, 0, 8);
    t71 = 1U;
    t72 = t71;
    t73 = (t34 + 4);
    t74 = *((unsigned int *)t34);
    t71 = (t71 & t74);
    t75 = *((unsigned int *)t73);
    t72 = (t72 & t75);
    t76 = (t70 + 4);
    t77 = *((unsigned int *)t70);
    *((unsigned int *)t70) = (t77 | t71);
    t78 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t78 | t72);
    xsi_driver_vfirst_trans(t66, 0, 0);
    t79 = (t0 + 5736);
    *((int *)t79) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t10 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 2484);
    t17 = (t16 + 36U);
    t18 = *((char **)t17);
    memset(t15, 0, 8);
    t19 = (t18 + 4);
    t20 = *((unsigned int *)t19);
    t21 = (~(t20));
    t22 = *((unsigned int *)t18);
    t23 = (t22 & t21);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB14;

LAB12:    if (*((unsigned int *)t19) == 0)
        goto LAB11;

LAB13:    t25 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t25) = 1;

LAB14:    memset(t26, 0, 8);
    t27 = (t15 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t15);
    t31 = (t30 & t29);
    t32 = (t31 & 1U);
    if (t32 != 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t27) != 0)
        goto LAB17;

LAB18:    t35 = *((unsigned int *)t4);
    t36 = *((unsigned int *)t26);
    t37 = (t35 & t36);
    *((unsigned int *)t34) = t37;
    t38 = (t4 + 4);
    t39 = (t26 + 4);
    t40 = (t34 + 4);
    t41 = *((unsigned int *)t38);
    t42 = *((unsigned int *)t39);
    t43 = (t41 | t42);
    *((unsigned int *)t40) = t43;
    t44 = *((unsigned int *)t40);
    t45 = (t44 != 0);
    if (t45 == 1)
        goto LAB19;

LAB20:
LAB21:    goto LAB10;

LAB11:    *((unsigned int *)t15) = 1;
    goto LAB14;

LAB15:    *((unsigned int *)t26) = 1;
    goto LAB18;

LAB17:    t33 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t33) = 1;
    goto LAB18;

LAB19:    t46 = *((unsigned int *)t34);
    t47 = *((unsigned int *)t40);
    *((unsigned int *)t34) = (t46 | t47);
    t48 = (t4 + 4);
    t49 = (t26 + 4);
    t50 = *((unsigned int *)t4);
    t51 = (~(t50));
    t52 = *((unsigned int *)t48);
    t53 = (~(t52));
    t54 = *((unsigned int *)t26);
    t55 = (~(t54));
    t56 = *((unsigned int *)t49);
    t57 = (~(t56));
    t58 = (t51 & t53);
    t59 = (t55 & t57);
    t60 = (~(t58));
    t61 = (~(t59));
    t62 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t62 & t60);
    t63 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t63 & t61);
    t64 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t64 & t60);
    t65 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t65 & t61);
    goto LAB21;

}

static void Cont_150_3(char *t0)
{
    char t5[8];
    char t18[8];
    char t29[8];
    char t41[8];
    char t52[8];
    char t60[8];
    char t92[8];
    char t100[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
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
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    int t84;
    int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    char *t104;
    char *t105;
    char *t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    char *t114;
    char *t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    char *t128;
    char *t129;
    char *t130;
    char *t131;
    char *t132;
    unsigned int t133;
    unsigned int t134;
    char *t135;
    unsigned int t136;
    unsigned int t137;
    char *t138;
    unsigned int t139;
    unsigned int t140;
    char *t141;

LAB0:    t1 = (t0 + 4084U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(150, ng0);
    t2 = (t0 + 2668);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t5, 0, 8);
    t6 = (t4 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t4);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t6) != 0)
        goto LAB6;

LAB7:    t13 = (t5 + 4);
    t14 = *((unsigned int *)t5);
    t15 = (!(t14));
    t16 = *((unsigned int *)t13);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB8;

LAB9:    memcpy(t100, t5, 8);

LAB10:    t128 = (t0 + 5940);
    t129 = (t128 + 32U);
    t130 = *((char **)t129);
    t131 = (t130 + 40U);
    t132 = *((char **)t131);
    memset(t132, 0, 8);
    t133 = 1U;
    t134 = t133;
    t135 = (t100 + 4);
    t136 = *((unsigned int *)t100);
    t133 = (t133 & t136);
    t137 = *((unsigned int *)t135);
    t134 = (t134 & t137);
    t138 = (t132 + 4);
    t139 = *((unsigned int *)t132);
    *((unsigned int *)t132) = (t139 | t133);
    t140 = *((unsigned int *)t138);
    *((unsigned int *)t138) = (t140 | t134);
    xsi_driver_vfirst_trans(t128, 0, 0);
    t141 = (t0 + 5744);
    *((int *)t141) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t5) = 1;
    goto LAB7;

LAB6:    t12 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB7;

LAB8:    t19 = (t0 + 2484);
    t20 = (t19 + 36U);
    t21 = *((char **)t20);
    memset(t18, 0, 8);
    t22 = (t21 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t21);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB14;

LAB12:    if (*((unsigned int *)t22) == 0)
        goto LAB11;

LAB13:    t28 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t28) = 1;

LAB14:    memset(t29, 0, 8);
    t30 = (t18 + 4);
    t31 = *((unsigned int *)t30);
    t32 = (~(t31));
    t33 = *((unsigned int *)t18);
    t34 = (t33 & t32);
    t35 = (t34 & 1U);
    if (t35 != 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t30) != 0)
        goto LAB17;

LAB18:    t37 = (t29 + 4);
    t38 = *((unsigned int *)t29);
    t39 = *((unsigned int *)t37);
    t40 = (t38 || t39);
    if (t40 > 0)
        goto LAB19;

LAB20:    memcpy(t60, t29, 8);

LAB21:    memset(t92, 0, 8);
    t93 = (t60 + 4);
    t94 = *((unsigned int *)t93);
    t95 = (~(t94));
    t96 = *((unsigned int *)t60);
    t97 = (t96 & t95);
    t98 = (t97 & 1U);
    if (t98 != 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t93) != 0)
        goto LAB35;

LAB36:    t101 = *((unsigned int *)t5);
    t102 = *((unsigned int *)t92);
    t103 = (t101 | t102);
    *((unsigned int *)t100) = t103;
    t104 = (t5 + 4);
    t105 = (t92 + 4);
    t106 = (t100 + 4);
    t107 = *((unsigned int *)t104);
    t108 = *((unsigned int *)t105);
    t109 = (t107 | t108);
    *((unsigned int *)t106) = t109;
    t110 = *((unsigned int *)t106);
    t111 = (t110 != 0);
    if (t111 == 1)
        goto LAB37;

LAB38:
LAB39:    goto LAB10;

LAB11:    *((unsigned int *)t18) = 1;
    goto LAB14;

LAB15:    *((unsigned int *)t29) = 1;
    goto LAB18;

LAB17:    t36 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t36) = 1;
    goto LAB18;

LAB19:    t42 = (t0 + 2300);
    t43 = (t42 + 36U);
    t44 = *((char **)t43);
    memset(t41, 0, 8);
    t45 = (t44 + 4);
    t46 = *((unsigned int *)t45);
    t47 = (~(t46));
    t48 = *((unsigned int *)t44);
    t49 = (t48 & t47);
    t50 = (t49 & 1U);
    if (t50 != 0)
        goto LAB25;

LAB23:    if (*((unsigned int *)t45) == 0)
        goto LAB22;

LAB24:    t51 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t51) = 1;

LAB25:    memset(t52, 0, 8);
    t53 = (t41 + 4);
    t54 = *((unsigned int *)t53);
    t55 = (~(t54));
    t56 = *((unsigned int *)t41);
    t57 = (t56 & t55);
    t58 = (t57 & 1U);
    if (t58 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t53) != 0)
        goto LAB28;

LAB29:    t61 = *((unsigned int *)t29);
    t62 = *((unsigned int *)t52);
    t63 = (t61 & t62);
    *((unsigned int *)t60) = t63;
    t64 = (t29 + 4);
    t65 = (t52 + 4);
    t66 = (t60 + 4);
    t67 = *((unsigned int *)t64);
    t68 = *((unsigned int *)t65);
    t69 = (t67 | t68);
    *((unsigned int *)t66) = t69;
    t70 = *((unsigned int *)t66);
    t71 = (t70 != 0);
    if (t71 == 1)
        goto LAB30;

LAB31:
LAB32:    goto LAB21;

LAB22:    *((unsigned int *)t41) = 1;
    goto LAB25;

LAB26:    *((unsigned int *)t52) = 1;
    goto LAB29;

LAB28:    t59 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB29;

LAB30:    t72 = *((unsigned int *)t60);
    t73 = *((unsigned int *)t66);
    *((unsigned int *)t60) = (t72 | t73);
    t74 = (t29 + 4);
    t75 = (t52 + 4);
    t76 = *((unsigned int *)t29);
    t77 = (~(t76));
    t78 = *((unsigned int *)t74);
    t79 = (~(t78));
    t80 = *((unsigned int *)t52);
    t81 = (~(t80));
    t82 = *((unsigned int *)t75);
    t83 = (~(t82));
    t84 = (t77 & t79);
    t85 = (t81 & t83);
    t86 = (~(t84));
    t87 = (~(t85));
    t88 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t88 & t86);
    t89 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t89 & t87);
    t90 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t90 & t86);
    t91 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t91 & t87);
    goto LAB32;

LAB33:    *((unsigned int *)t92) = 1;
    goto LAB36;

LAB35:    t99 = (t92 + 4);
    *((unsigned int *)t92) = 1;
    *((unsigned int *)t99) = 1;
    goto LAB36;

LAB37:    t112 = *((unsigned int *)t100);
    t113 = *((unsigned int *)t106);
    *((unsigned int *)t100) = (t112 | t113);
    t114 = (t5 + 4);
    t115 = (t92 + 4);
    t116 = *((unsigned int *)t114);
    t117 = (~(t116));
    t118 = *((unsigned int *)t5);
    t119 = (t118 & t117);
    t120 = *((unsigned int *)t115);
    t121 = (~(t120));
    t122 = *((unsigned int *)t92);
    t123 = (t122 & t121);
    t124 = (~(t119));
    t125 = (~(t123));
    t126 = *((unsigned int *)t106);
    *((unsigned int *)t106) = (t126 & t124);
    t127 = *((unsigned int *)t106);
    *((unsigned int *)t106) = (t127 & t125);
    goto LAB39;

}

static void Always_154_4(char *t0)
{
    char t13[8];
    char t22[8];
    char t31[8];
    char t39[8];
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
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t32;
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

LAB0:    t1 = (t0 + 4228U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(154, ng0);
    t2 = (t0 + 5752);
    *((int *)t2) = 1;
    t3 = (t0 + 4256);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(155, ng0);
    t4 = (t0 + 1428U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(157, ng0);
    t2 = (t0 + 1244U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB8;

LAB9:    xsi_set_current_line(160, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2760);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 1000LL);

LAB10:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(156, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2760);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 1000LL);
    goto LAB7;

LAB8:    xsi_set_current_line(158, ng0);
    t4 = (t0 + 1612U);
    t5 = *((char **)t4);
    memset(t13, 0, 8);
    t4 = (t5 + 4);
    t14 = *((unsigned int *)t4);
    t15 = (~(t14));
    t16 = *((unsigned int *)t5);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB11;

LAB12:    if (*((unsigned int *)t4) != 0)
        goto LAB13;

LAB14:    t12 = (t13 + 4);
    t19 = *((unsigned int *)t13);
    t20 = *((unsigned int *)t12);
    t21 = (t19 || t20);
    if (t21 > 0)
        goto LAB15;

LAB16:    memcpy(t39, t13, 8);

LAB17:    t71 = (t0 + 2760);
    xsi_vlogvar_wait_assign_value(t71, t39, 0, 0, 1, 1000LL);
    goto LAB10;

LAB11:    *((unsigned int *)t13) = 1;
    goto LAB14;

LAB13:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB14;

LAB15:    t23 = (t0 + 1796U);
    t24 = *((char **)t23);
    memset(t22, 0, 8);
    t23 = (t24 + 4);
    t25 = *((unsigned int *)t23);
    t26 = (~(t25));
    t27 = *((unsigned int *)t24);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB21;

LAB19:    if (*((unsigned int *)t23) == 0)
        goto LAB18;

LAB20:    t30 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t30) = 1;

LAB21:    memset(t31, 0, 8);
    t32 = (t22 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t22);
    t36 = (t35 & t34);
    t37 = (t36 & 1U);
    if (t37 != 0)
        goto LAB22;

LAB23:    if (*((unsigned int *)t32) != 0)
        goto LAB24;

LAB25:    t40 = *((unsigned int *)t13);
    t41 = *((unsigned int *)t31);
    t42 = (t40 & t41);
    *((unsigned int *)t39) = t42;
    t43 = (t13 + 4);
    t44 = (t31 + 4);
    t45 = (t39 + 4);
    t46 = *((unsigned int *)t43);
    t47 = *((unsigned int *)t44);
    t48 = (t46 | t47);
    *((unsigned int *)t45) = t48;
    t49 = *((unsigned int *)t45);
    t50 = (t49 != 0);
    if (t50 == 1)
        goto LAB26;

LAB27:
LAB28:    goto LAB17;

LAB18:    *((unsigned int *)t22) = 1;
    goto LAB21;

LAB22:    *((unsigned int *)t31) = 1;
    goto LAB25;

LAB24:    t38 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB25;

LAB26:    t51 = *((unsigned int *)t39);
    t52 = *((unsigned int *)t45);
    *((unsigned int *)t39) = (t51 | t52);
    t53 = (t13 + 4);
    t54 = (t31 + 4);
    t55 = *((unsigned int *)t13);
    t56 = (~(t55));
    t57 = *((unsigned int *)t53);
    t58 = (~(t57));
    t59 = *((unsigned int *)t31);
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
    goto LAB28;

}

static void Always_164_5(char *t0)
{
    char t13[8];
    char t20[8];
    char t32[8];
    char t43[8];
    char t51[8];
    char t83[8];
    char t95[8];
    char t106[8];
    char t114[8];
    char t146[8];
    char t161[8];
    char t169[8];
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
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t55;
    char *t56;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    int t75;
    int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    char *t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    char *t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    char *t96;
    char *t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    char *t105;
    char *t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    char *t113;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    char *t118;
    char *t119;
    char *t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    char *t128;
    char *t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    int t138;
    int t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    unsigned int t145;
    char *t147;
    unsigned int t148;
    unsigned int t149;
    unsigned int t150;
    unsigned int t151;
    unsigned int t152;
    char *t153;
    char *t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    char *t158;
    char *t159;
    char *t160;
    char *t162;
    unsigned int t163;
    unsigned int t164;
    unsigned int t165;
    unsigned int t166;
    unsigned int t167;
    char *t168;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    char *t173;
    char *t174;
    char *t175;
    unsigned int t176;
    unsigned int t177;
    unsigned int t178;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    unsigned int t182;
    char *t183;
    char *t184;
    unsigned int t185;
    unsigned int t186;
    unsigned int t187;
    unsigned int t188;
    unsigned int t189;
    unsigned int t190;
    unsigned int t191;
    unsigned int t192;
    int t193;
    int t194;
    unsigned int t195;
    unsigned int t196;
    unsigned int t197;
    unsigned int t198;
    unsigned int t199;
    unsigned int t200;
    char *t201;
    unsigned int t202;
    unsigned int t203;
    unsigned int t204;
    unsigned int t205;
    unsigned int t206;
    char *t207;
    char *t208;

LAB0:    t1 = (t0 + 4372U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(164, ng0);
    t2 = (t0 + 5760);
    *((int *)t2) = 1;
    t3 = (t0 + 4400);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(165, ng0);
    t4 = (t0 + 1428U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(167, ng0);
    t2 = (t0 + 1244U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB8;

LAB9:
LAB10:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(166, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2668);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 1000LL);
    goto LAB7;

LAB8:    xsi_set_current_line(168, ng0);

LAB11:    xsi_set_current_line(169, ng0);
    t4 = (t0 + 2668);
    t5 = (t4 + 36U);
    t11 = *((char **)t5);
    memset(t13, 0, 8);
    t12 = (t11 + 4);
    t14 = *((unsigned int *)t12);
    t15 = (~(t14));
    t16 = *((unsigned int *)t11);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB15;

LAB13:    if (*((unsigned int *)t12) == 0)
        goto LAB12;

LAB14:    t19 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t19) = 1;

LAB15:    memset(t20, 0, 8);
    t21 = (t13 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t13);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t21) != 0)
        goto LAB18;

LAB19:    t28 = (t20 + 4);
    t29 = *((unsigned int *)t20);
    t30 = *((unsigned int *)t28);
    t31 = (t29 || t30);
    if (t31 > 0)
        goto LAB20;

LAB21:    memcpy(t51, t20, 8);

LAB22:    memset(t83, 0, 8);
    t84 = (t51 + 4);
    t85 = *((unsigned int *)t84);
    t86 = (~(t85));
    t87 = *((unsigned int *)t51);
    t88 = (t87 & t86);
    t89 = (t88 & 1U);
    if (t89 != 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t84) != 0)
        goto LAB36;

LAB37:    t91 = (t83 + 4);
    t92 = *((unsigned int *)t83);
    t93 = *((unsigned int *)t91);
    t94 = (t92 || t93);
    if (t94 > 0)
        goto LAB38;

LAB39:    memcpy(t114, t83, 8);

LAB40:    memset(t146, 0, 8);
    t147 = (t114 + 4);
    t148 = *((unsigned int *)t147);
    t149 = (~(t148));
    t150 = *((unsigned int *)t114);
    t151 = (t150 & t149);
    t152 = (t151 & 1U);
    if (t152 != 0)
        goto LAB52;

LAB53:    if (*((unsigned int *)t147) != 0)
        goto LAB54;

LAB55:    t154 = (t146 + 4);
    t155 = *((unsigned int *)t146);
    t156 = *((unsigned int *)t154);
    t157 = (t155 || t156);
    if (t157 > 0)
        goto LAB56;

LAB57:    memcpy(t169, t146, 8);

LAB58:    t201 = (t169 + 4);
    t202 = *((unsigned int *)t201);
    t203 = (~(t202));
    t204 = *((unsigned int *)t169);
    t205 = (t204 & t203);
    t206 = (t205 != 0);
    if (t206 > 0)
        goto LAB66;

LAB67:    xsi_set_current_line(171, ng0);
    t2 = (t0 + 2668);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB69;

LAB70:    if (*((unsigned int *)t5) != 0)
        goto LAB71;

LAB72:    t12 = (t13 + 4);
    t14 = *((unsigned int *)t13);
    t15 = *((unsigned int *)t12);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB73;

LAB74:    memcpy(t43, t13, 8);

LAB75:    memset(t51, 0, 8);
    t56 = (t43 + 4);
    t71 = *((unsigned int *)t56);
    t72 = (~(t71));
    t73 = *((unsigned int *)t43);
    t74 = (t73 & t72);
    t77 = (t74 & 1U);
    if (t77 != 0)
        goto LAB87;

LAB88:    if (*((unsigned int *)t56) != 0)
        goto LAB89;

LAB90:    t65 = (t51 + 4);
    t78 = *((unsigned int *)t51);
    t79 = *((unsigned int *)t65);
    t80 = (t78 || t79);
    if (t80 > 0)
        goto LAB91;

LAB92:    memcpy(t106, t51, 8);

LAB93:    t119 = (t106 + 4);
    t134 = *((unsigned int *)t119);
    t135 = (~(t134));
    t136 = *((unsigned int *)t106);
    t137 = (t136 & t135);
    t140 = (t137 != 0);
    if (t140 > 0)
        goto LAB105;

LAB106:
LAB107:
LAB68:    goto LAB10;

LAB12:    *((unsigned int *)t13) = 1;
    goto LAB15;

LAB16:    *((unsigned int *)t20) = 1;
    goto LAB19;

LAB18:    t27 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB19;

LAB20:    t33 = (t0 + 2300);
    t34 = (t33 + 36U);
    t35 = *((char **)t34);
    memset(t32, 0, 8);
    t36 = (t35 + 4);
    t37 = *((unsigned int *)t36);
    t38 = (~(t37));
    t39 = *((unsigned int *)t35);
    t40 = (t39 & t38);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB26;

LAB24:    if (*((unsigned int *)t36) == 0)
        goto LAB23;

LAB25:    t42 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t42) = 1;

LAB26:    memset(t43, 0, 8);
    t44 = (t32 + 4);
    t45 = *((unsigned int *)t44);
    t46 = (~(t45));
    t47 = *((unsigned int *)t32);
    t48 = (t47 & t46);
    t49 = (t48 & 1U);
    if (t49 != 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t44) != 0)
        goto LAB29;

LAB30:    t52 = *((unsigned int *)t20);
    t53 = *((unsigned int *)t43);
    t54 = (t52 & t53);
    *((unsigned int *)t51) = t54;
    t55 = (t20 + 4);
    t56 = (t43 + 4);
    t57 = (t51 + 4);
    t58 = *((unsigned int *)t55);
    t59 = *((unsigned int *)t56);
    t60 = (t58 | t59);
    *((unsigned int *)t57) = t60;
    t61 = *((unsigned int *)t57);
    t62 = (t61 != 0);
    if (t62 == 1)
        goto LAB31;

LAB32:
LAB33:    goto LAB22;

LAB23:    *((unsigned int *)t32) = 1;
    goto LAB26;

LAB27:    *((unsigned int *)t43) = 1;
    goto LAB30;

LAB29:    t50 = (t43 + 4);
    *((unsigned int *)t43) = 1;
    *((unsigned int *)t50) = 1;
    goto LAB30;

LAB31:    t63 = *((unsigned int *)t51);
    t64 = *((unsigned int *)t57);
    *((unsigned int *)t51) = (t63 | t64);
    t65 = (t20 + 4);
    t66 = (t43 + 4);
    t67 = *((unsigned int *)t20);
    t68 = (~(t67));
    t69 = *((unsigned int *)t65);
    t70 = (~(t69));
    t71 = *((unsigned int *)t43);
    t72 = (~(t71));
    t73 = *((unsigned int *)t66);
    t74 = (~(t73));
    t75 = (t68 & t70);
    t76 = (t72 & t74);
    t77 = (~(t75));
    t78 = (~(t76));
    t79 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t79 & t77);
    t80 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t80 & t78);
    t81 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t81 & t77);
    t82 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t82 & t78);
    goto LAB33;

LAB34:    *((unsigned int *)t83) = 1;
    goto LAB37;

LAB36:    t90 = (t83 + 4);
    *((unsigned int *)t83) = 1;
    *((unsigned int *)t90) = 1;
    goto LAB37;

LAB38:    t96 = (t0 + 2484);
    t97 = (t96 + 36U);
    t98 = *((char **)t97);
    memset(t95, 0, 8);
    t99 = (t98 + 4);
    t100 = *((unsigned int *)t99);
    t101 = (~(t100));
    t102 = *((unsigned int *)t98);
    t103 = (t102 & t101);
    t104 = (t103 & 1U);
    if (t104 != 0)
        goto LAB44;

LAB42:    if (*((unsigned int *)t99) == 0)
        goto LAB41;

LAB43:    t105 = (t95 + 4);
    *((unsigned int *)t95) = 1;
    *((unsigned int *)t105) = 1;

LAB44:    memset(t106, 0, 8);
    t107 = (t95 + 4);
    t108 = *((unsigned int *)t107);
    t109 = (~(t108));
    t110 = *((unsigned int *)t95);
    t111 = (t110 & t109);
    t112 = (t111 & 1U);
    if (t112 != 0)
        goto LAB45;

LAB46:    if (*((unsigned int *)t107) != 0)
        goto LAB47;

LAB48:    t115 = *((unsigned int *)t83);
    t116 = *((unsigned int *)t106);
    t117 = (t115 & t116);
    *((unsigned int *)t114) = t117;
    t118 = (t83 + 4);
    t119 = (t106 + 4);
    t120 = (t114 + 4);
    t121 = *((unsigned int *)t118);
    t122 = *((unsigned int *)t119);
    t123 = (t121 | t122);
    *((unsigned int *)t120) = t123;
    t124 = *((unsigned int *)t120);
    t125 = (t124 != 0);
    if (t125 == 1)
        goto LAB49;

LAB50:
LAB51:    goto LAB40;

LAB41:    *((unsigned int *)t95) = 1;
    goto LAB44;

LAB45:    *((unsigned int *)t106) = 1;
    goto LAB48;

LAB47:    t113 = (t106 + 4);
    *((unsigned int *)t106) = 1;
    *((unsigned int *)t113) = 1;
    goto LAB48;

LAB49:    t126 = *((unsigned int *)t114);
    t127 = *((unsigned int *)t120);
    *((unsigned int *)t114) = (t126 | t127);
    t128 = (t83 + 4);
    t129 = (t106 + 4);
    t130 = *((unsigned int *)t83);
    t131 = (~(t130));
    t132 = *((unsigned int *)t128);
    t133 = (~(t132));
    t134 = *((unsigned int *)t106);
    t135 = (~(t134));
    t136 = *((unsigned int *)t129);
    t137 = (~(t136));
    t138 = (t131 & t133);
    t139 = (t135 & t137);
    t140 = (~(t138));
    t141 = (~(t139));
    t142 = *((unsigned int *)t120);
    *((unsigned int *)t120) = (t142 & t140);
    t143 = *((unsigned int *)t120);
    *((unsigned int *)t120) = (t143 & t141);
    t144 = *((unsigned int *)t114);
    *((unsigned int *)t114) = (t144 & t140);
    t145 = *((unsigned int *)t114);
    *((unsigned int *)t114) = (t145 & t141);
    goto LAB51;

LAB52:    *((unsigned int *)t146) = 1;
    goto LAB55;

LAB54:    t153 = (t146 + 4);
    *((unsigned int *)t146) = 1;
    *((unsigned int *)t153) = 1;
    goto LAB55;

LAB56:    t158 = (t0 + 2392);
    t159 = (t158 + 36U);
    t160 = *((char **)t159);
    memset(t161, 0, 8);
    t162 = (t160 + 4);
    t163 = *((unsigned int *)t162);
    t164 = (~(t163));
    t165 = *((unsigned int *)t160);
    t166 = (t165 & t164);
    t167 = (t166 & 1U);
    if (t167 != 0)
        goto LAB59;

LAB60:    if (*((unsigned int *)t162) != 0)
        goto LAB61;

LAB62:    t170 = *((unsigned int *)t146);
    t171 = *((unsigned int *)t161);
    t172 = (t170 & t171);
    *((unsigned int *)t169) = t172;
    t173 = (t146 + 4);
    t174 = (t161 + 4);
    t175 = (t169 + 4);
    t176 = *((unsigned int *)t173);
    t177 = *((unsigned int *)t174);
    t178 = (t176 | t177);
    *((unsigned int *)t175) = t178;
    t179 = *((unsigned int *)t175);
    t180 = (t179 != 0);
    if (t180 == 1)
        goto LAB63;

LAB64:
LAB65:    goto LAB58;

LAB59:    *((unsigned int *)t161) = 1;
    goto LAB62;

LAB61:    t168 = (t161 + 4);
    *((unsigned int *)t161) = 1;
    *((unsigned int *)t168) = 1;
    goto LAB62;

LAB63:    t181 = *((unsigned int *)t169);
    t182 = *((unsigned int *)t175);
    *((unsigned int *)t169) = (t181 | t182);
    t183 = (t146 + 4);
    t184 = (t161 + 4);
    t185 = *((unsigned int *)t146);
    t186 = (~(t185));
    t187 = *((unsigned int *)t183);
    t188 = (~(t187));
    t189 = *((unsigned int *)t161);
    t190 = (~(t189));
    t191 = *((unsigned int *)t184);
    t192 = (~(t191));
    t193 = (t186 & t188);
    t194 = (t190 & t192);
    t195 = (~(t193));
    t196 = (~(t194));
    t197 = *((unsigned int *)t175);
    *((unsigned int *)t175) = (t197 & t195);
    t198 = *((unsigned int *)t175);
    *((unsigned int *)t175) = (t198 & t196);
    t199 = *((unsigned int *)t169);
    *((unsigned int *)t169) = (t199 & t195);
    t200 = *((unsigned int *)t169);
    *((unsigned int *)t169) = (t200 & t196);
    goto LAB65;

LAB66:    xsi_set_current_line(170, ng0);
    t207 = ((char*)((ng2)));
    t208 = (t0 + 2668);
    xsi_vlogvar_wait_assign_value(t208, t207, 0, 0, 1, 1000LL);
    goto LAB68;

LAB69:    *((unsigned int *)t13) = 1;
    goto LAB72;

LAB71:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB72;

LAB73:    t19 = (t0 + 2484);
    t21 = (t19 + 36U);
    t27 = *((char **)t21);
    memset(t20, 0, 8);
    t28 = (t27 + 4);
    t17 = *((unsigned int *)t28);
    t18 = (~(t17));
    t22 = *((unsigned int *)t27);
    t23 = (t22 & t18);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB79;

LAB77:    if (*((unsigned int *)t28) == 0)
        goto LAB76;

LAB78:    t33 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t33) = 1;

LAB79:    memset(t32, 0, 8);
    t34 = (t20 + 4);
    t25 = *((unsigned int *)t34);
    t26 = (~(t25));
    t29 = *((unsigned int *)t20);
    t30 = (t29 & t26);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB80;

LAB81:    if (*((unsigned int *)t34) != 0)
        goto LAB82;

LAB83:    t37 = *((unsigned int *)t13);
    t38 = *((unsigned int *)t32);
    t39 = (t37 & t38);
    *((unsigned int *)t43) = t39;
    t36 = (t13 + 4);
    t42 = (t32 + 4);
    t44 = (t43 + 4);
    t40 = *((unsigned int *)t36);
    t41 = *((unsigned int *)t42);
    t45 = (t40 | t41);
    *((unsigned int *)t44) = t45;
    t46 = *((unsigned int *)t44);
    t47 = (t46 != 0);
    if (t47 == 1)
        goto LAB84;

LAB85:
LAB86:    goto LAB75;

LAB76:    *((unsigned int *)t20) = 1;
    goto LAB79;

LAB80:    *((unsigned int *)t32) = 1;
    goto LAB83;

LAB82:    t35 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB83;

LAB84:    t48 = *((unsigned int *)t43);
    t49 = *((unsigned int *)t44);
    *((unsigned int *)t43) = (t48 | t49);
    t50 = (t13 + 4);
    t55 = (t32 + 4);
    t52 = *((unsigned int *)t13);
    t53 = (~(t52));
    t54 = *((unsigned int *)t50);
    t58 = (~(t54));
    t59 = *((unsigned int *)t32);
    t60 = (~(t59));
    t61 = *((unsigned int *)t55);
    t62 = (~(t61));
    t75 = (t53 & t58);
    t76 = (t60 & t62);
    t63 = (~(t75));
    t64 = (~(t76));
    t67 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t67 & t63);
    t68 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t68 & t64);
    t69 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t69 & t63);
    t70 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t70 & t64);
    goto LAB86;

LAB87:    *((unsigned int *)t51) = 1;
    goto LAB90;

LAB89:    t57 = (t51 + 4);
    *((unsigned int *)t51) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB90;

LAB91:    t66 = (t0 + 2392);
    t84 = (t66 + 36U);
    t90 = *((char **)t84);
    memset(t83, 0, 8);
    t91 = (t90 + 4);
    t81 = *((unsigned int *)t91);
    t82 = (~(t81));
    t85 = *((unsigned int *)t90);
    t86 = (t85 & t82);
    t87 = (t86 & 1U);
    if (t87 != 0)
        goto LAB97;

LAB95:    if (*((unsigned int *)t91) == 0)
        goto LAB94;

LAB96:    t96 = (t83 + 4);
    *((unsigned int *)t83) = 1;
    *((unsigned int *)t96) = 1;

LAB97:    memset(t95, 0, 8);
    t97 = (t83 + 4);
    t88 = *((unsigned int *)t97);
    t89 = (~(t88));
    t92 = *((unsigned int *)t83);
    t93 = (t92 & t89);
    t94 = (t93 & 1U);
    if (t94 != 0)
        goto LAB98;

LAB99:    if (*((unsigned int *)t97) != 0)
        goto LAB100;

LAB101:    t100 = *((unsigned int *)t51);
    t101 = *((unsigned int *)t95);
    t102 = (t100 & t101);
    *((unsigned int *)t106) = t102;
    t99 = (t51 + 4);
    t105 = (t95 + 4);
    t107 = (t106 + 4);
    t103 = *((unsigned int *)t99);
    t104 = *((unsigned int *)t105);
    t108 = (t103 | t104);
    *((unsigned int *)t107) = t108;
    t109 = *((unsigned int *)t107);
    t110 = (t109 != 0);
    if (t110 == 1)
        goto LAB102;

LAB103:
LAB104:    goto LAB93;

LAB94:    *((unsigned int *)t83) = 1;
    goto LAB97;

LAB98:    *((unsigned int *)t95) = 1;
    goto LAB101;

LAB100:    t98 = (t95 + 4);
    *((unsigned int *)t95) = 1;
    *((unsigned int *)t98) = 1;
    goto LAB101;

LAB102:    t111 = *((unsigned int *)t106);
    t112 = *((unsigned int *)t107);
    *((unsigned int *)t106) = (t111 | t112);
    t113 = (t51 + 4);
    t118 = (t95 + 4);
    t115 = *((unsigned int *)t51);
    t116 = (~(t115));
    t117 = *((unsigned int *)t113);
    t121 = (~(t117));
    t122 = *((unsigned int *)t95);
    t123 = (~(t122));
    t124 = *((unsigned int *)t118);
    t125 = (~(t124));
    t138 = (t116 & t121);
    t139 = (t123 & t125);
    t126 = (~(t138));
    t127 = (~(t139));
    t130 = *((unsigned int *)t107);
    *((unsigned int *)t107) = (t130 & t126);
    t131 = *((unsigned int *)t107);
    *((unsigned int *)t107) = (t131 & t127);
    t132 = *((unsigned int *)t106);
    *((unsigned int *)t106) = (t132 & t126);
    t133 = *((unsigned int *)t106);
    *((unsigned int *)t106) = (t133 & t127);
    goto LAB104;

LAB105:    xsi_set_current_line(172, ng0);
    t120 = ((char*)((ng1)));
    t128 = (t0 + 2668);
    xsi_vlogvar_wait_assign_value(t128, t120, 0, 0, 1, 1000LL);
    goto LAB107;

}

static void Always_176_6(char *t0)
{
    char t4[8];
    char t15[8];
    char t27[8];
    char t38[8];
    char t46[8];
    char t89[8];
    char t91[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    int t70;
    int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    char *t85;
    char *t86;
    char *t87;
    int t88;
    char *t90;
    char *t92;
    char *t93;
    char *t94;
    char *t95;
    char *t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;

LAB0:    t1 = (t0 + 4516U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(176, ng0);
    t2 = (t0 + 5768);
    *((int *)t2) = 1;
    t3 = (t0 + 4544);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(177, ng0);

LAB5:    xsi_set_current_line(178, ng0);
    t5 = (t0 + 2392);
    t6 = (t5 + 36U);
    t7 = *((char **)t6);
    memset(t4, 0, 8);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t8);
    t10 = (~(t9));
    t11 = *((unsigned int *)t7);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t8) == 0)
        goto LAB6;

LAB8:    t14 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t14) = 1;

LAB9:    memset(t15, 0, 8);
    t16 = (t4 + 4);
    t17 = *((unsigned int *)t16);
    t18 = (~(t17));
    t19 = *((unsigned int *)t4);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t16) != 0)
        goto LAB12;

LAB13:    t23 = (t15 + 4);
    t24 = *((unsigned int *)t15);
    t25 = *((unsigned int *)t23);
    t26 = (t24 || t25);
    if (t26 > 0)
        goto LAB14;

LAB15:    memcpy(t46, t15, 8);

LAB16:    t78 = (t46 + 4);
    t79 = *((unsigned int *)t78);
    t80 = (~(t79));
    t81 = *((unsigned int *)t46);
    t82 = (t81 & t80);
    t83 = (t82 != 0);
    if (t83 > 0)
        goto LAB28;

LAB29:    xsi_set_current_line(188, ng0);
    t2 = (t0 + 2484);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t5 + 4);
    t9 = *((unsigned int *)t6);
    t10 = (~(t9));
    t11 = *((unsigned int *)t5);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB47;

LAB45:    if (*((unsigned int *)t6) == 0)
        goto LAB44;

LAB46:    t7 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t7) = 1;

LAB47:    t8 = (t4 + 4);
    t17 = *((unsigned int *)t8);
    t18 = (~(t17));
    t19 = *((unsigned int *)t4);
    t20 = (t19 & t18);
    t21 = (t20 != 0);
    if (t21 > 0)
        goto LAB48;

LAB49:
LAB50:
LAB30:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    *((unsigned int *)t15) = 1;
    goto LAB13;

LAB12:    t22 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB13;

LAB14:    t28 = (t0 + 2484);
    t29 = (t28 + 36U);
    t30 = *((char **)t29);
    memset(t27, 0, 8);
    t31 = (t30 + 4);
    t32 = *((unsigned int *)t31);
    t33 = (~(t32));
    t34 = *((unsigned int *)t30);
    t35 = (t34 & t33);
    t36 = (t35 & 1U);
    if (t36 != 0)
        goto LAB20;

LAB18:    if (*((unsigned int *)t31) == 0)
        goto LAB17;

LAB19:    t37 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t37) = 1;

LAB20:    memset(t38, 0, 8);
    t39 = (t27 + 4);
    t40 = *((unsigned int *)t39);
    t41 = (~(t40));
    t42 = *((unsigned int *)t27);
    t43 = (t42 & t41);
    t44 = (t43 & 1U);
    if (t44 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t39) != 0)
        goto LAB23;

LAB24:    t47 = *((unsigned int *)t15);
    t48 = *((unsigned int *)t38);
    t49 = (t47 & t48);
    *((unsigned int *)t46) = t49;
    t50 = (t15 + 4);
    t51 = (t38 + 4);
    t52 = (t46 + 4);
    t53 = *((unsigned int *)t50);
    t54 = *((unsigned int *)t51);
    t55 = (t53 | t54);
    *((unsigned int *)t52) = t55;
    t56 = *((unsigned int *)t52);
    t57 = (t56 != 0);
    if (t57 == 1)
        goto LAB25;

LAB26:
LAB27:    goto LAB16;

LAB17:    *((unsigned int *)t27) = 1;
    goto LAB20;

LAB21:    *((unsigned int *)t38) = 1;
    goto LAB24;

LAB23:    t45 = (t38 + 4);
    *((unsigned int *)t38) = 1;
    *((unsigned int *)t45) = 1;
    goto LAB24;

LAB25:    t58 = *((unsigned int *)t46);
    t59 = *((unsigned int *)t52);
    *((unsigned int *)t46) = (t58 | t59);
    t60 = (t15 + 4);
    t61 = (t38 + 4);
    t62 = *((unsigned int *)t15);
    t63 = (~(t62));
    t64 = *((unsigned int *)t60);
    t65 = (~(t64));
    t66 = *((unsigned int *)t38);
    t67 = (~(t66));
    t68 = *((unsigned int *)t61);
    t69 = (~(t68));
    t70 = (t63 & t65);
    t71 = (t67 & t69);
    t72 = (~(t70));
    t73 = (~(t71));
    t74 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t74 & t72);
    t75 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t75 & t73);
    t76 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t76 & t72);
    t77 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t77 & t73);
    goto LAB27;

LAB28:    xsi_set_current_line(179, ng0);

LAB31:    xsi_set_current_line(180, ng0);
    t84 = (t0 + 2116);
    t85 = (t84 + 36U);
    t86 = *((char **)t85);

LAB32:    t87 = ((char*)((ng1)));
    t88 = xsi_vlog_unsigned_case_compare(t86, 2, t87, 2);
    if (t88 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng2)));
    t70 = xsi_vlog_unsigned_case_compare(t86, 2, t2, 2);
    if (t70 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng3)));
    t70 = xsi_vlog_unsigned_case_compare(t86, 2, t2, 2);
    if (t70 == 1)
        goto LAB37;

LAB38:    t2 = ((char*)((ng4)));
    t70 = xsi_vlog_unsigned_case_compare(t86, 2, t2, 2);
    if (t70 == 1)
        goto LAB39;

LAB40:
LAB42:
LAB41:    xsi_set_current_line(185, ng0);
    t2 = (t0 + 2024);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t6 = (t0 + 2852);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 32, 1000LL);

LAB43:    goto LAB30;

LAB33:    xsi_set_current_line(181, ng0);
    t90 = ((char*)((ng1)));
    t92 = (t0 + 2024);
    t93 = (t92 + 36U);
    t94 = *((char **)t93);
    memset(t91, 0, 8);
    t95 = (t91 + 4);
    t96 = (t94 + 4);
    t97 = *((unsigned int *)t94);
    t98 = (t97 >> 24);
    *((unsigned int *)t91) = t98;
    t99 = *((unsigned int *)t96);
    t100 = (t99 >> 24);
    *((unsigned int *)t95) = t100;
    t101 = *((unsigned int *)t91);
    *((unsigned int *)t91) = (t101 & 255U);
    t102 = *((unsigned int *)t95);
    *((unsigned int *)t95) = (t102 & 255U);
    xsi_vlogtype_concat(t89, 32, 32, 2U, t91, 8, t90, 24);
    t103 = (t0 + 2852);
    xsi_vlogvar_wait_assign_value(t103, t89, 0, 0, 32, 1000LL);
    goto LAB43;

LAB35:    xsi_set_current_line(182, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 2024);
    t6 = (t5 + 36U);
    t7 = *((char **)t6);
    memset(t15, 0, 8);
    t8 = (t15 + 4);
    t14 = (t7 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 16);
    *((unsigned int *)t15) = t10;
    t11 = *((unsigned int *)t14);
    t12 = (t11 >> 16);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t13 & 65535U);
    t17 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t17 & 65535U);
    xsi_vlogtype_concat(t4, 32, 32, 2U, t15, 16, t3, 16);
    t16 = (t0 + 2852);
    xsi_vlogvar_wait_assign_value(t16, t4, 0, 0, 32, 1000LL);
    goto LAB43;

LAB37:    xsi_set_current_line(183, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 2024);
    t6 = (t5 + 36U);
    t7 = *((char **)t6);
    memset(t15, 0, 8);
    t8 = (t15 + 4);
    t14 = (t7 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 8);
    *((unsigned int *)t15) = t10;
    t11 = *((unsigned int *)t14);
    t12 = (t11 >> 8);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t13 & 16777215U);
    t17 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t17 & 16777215U);
    xsi_vlogtype_concat(t4, 32, 32, 2U, t15, 24, t3, 8);
    t16 = (t0 + 2852);
    xsi_vlogvar_wait_assign_value(t16, t4, 0, 0, 32, 1000LL);
    goto LAB43;

LAB39:    xsi_set_current_line(184, ng0);
    t3 = (t0 + 2024);
    t5 = (t3 + 36U);
    t6 = *((char **)t5);
    t7 = (t0 + 2852);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 32, 1000LL);
    goto LAB43;

LAB44:    *((unsigned int *)t4) = 1;
    goto LAB47;

LAB48:    xsi_set_current_line(189, ng0);
    t14 = (t0 + 2024);
    t16 = (t14 + 36U);
    t22 = *((char **)t16);
    t23 = (t0 + 2852);
    xsi_vlogvar_wait_assign_value(t23, t22, 0, 0, 32, 1000LL);
    goto LAB50;

}

static void Always_193_7(char *t0)
{
    char t13[8];
    char t22[8];
    char t33[8];
    char t41[8];
    char t84[8];
    char t86[8];
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
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    char *t46;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t55;
    char *t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    int t65;
    int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t80;
    char *t81;
    char *t82;
    int t83;
    char *t85;
    char *t87;
    char *t88;
    char *t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;

LAB0:    t1 = (t0 + 4660U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(193, ng0);
    t2 = (t0 + 5776);
    *((int *)t2) = 1;
    t3 = (t0 + 4688);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(194, ng0);

LAB5:    xsi_set_current_line(195, ng0);
    t4 = (t0 + 1428U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(197, ng0);
    t2 = (t0 + 1244U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB9;

LAB10:
LAB11:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(196, ng0);
    t11 = ((char*)((ng5)));
    t12 = (t0 + 2944);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 32, 1000LL);
    goto LAB8;

LAB9:    xsi_set_current_line(198, ng0);

LAB12:    xsi_set_current_line(199, ng0);
    t4 = (t0 + 1612U);
    t5 = *((char **)t4);
    memset(t13, 0, 8);
    t4 = (t5 + 4);
    t14 = *((unsigned int *)t4);
    t15 = (~(t14));
    t16 = *((unsigned int *)t5);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB13;

LAB14:    if (*((unsigned int *)t4) != 0)
        goto LAB15;

LAB16:    t12 = (t13 + 4);
    t19 = *((unsigned int *)t13);
    t20 = *((unsigned int *)t12);
    t21 = (t19 || t20);
    if (t21 > 0)
        goto LAB17;

LAB18:    memcpy(t41, t13, 8);

LAB19:    t73 = (t41 + 4);
    t74 = *((unsigned int *)t73);
    t75 = (~(t74));
    t76 = *((unsigned int *)t41);
    t77 = (t76 & t75);
    t78 = (t77 != 0);
    if (t78 > 0)
        goto LAB31;

LAB32:    xsi_set_current_line(209, ng0);
    t2 = (t0 + 1612U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB47;

LAB48:
LAB49:
LAB33:    goto LAB11;

LAB13:    *((unsigned int *)t13) = 1;
    goto LAB16;

LAB15:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB16;

LAB17:    t23 = (t0 + 2392);
    t24 = (t23 + 36U);
    t25 = *((char **)t24);
    memset(t22, 0, 8);
    t26 = (t25 + 4);
    t27 = *((unsigned int *)t26);
    t28 = (~(t27));
    t29 = *((unsigned int *)t25);
    t30 = (t29 & t28);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB23;

LAB21:    if (*((unsigned int *)t26) == 0)
        goto LAB20;

LAB22:    t32 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t32) = 1;

LAB23:    memset(t33, 0, 8);
    t34 = (t22 + 4);
    t35 = *((unsigned int *)t34);
    t36 = (~(t35));
    t37 = *((unsigned int *)t22);
    t38 = (t37 & t36);
    t39 = (t38 & 1U);
    if (t39 != 0)
        goto LAB24;

LAB25:    if (*((unsigned int *)t34) != 0)
        goto LAB26;

LAB27:    t42 = *((unsigned int *)t13);
    t43 = *((unsigned int *)t33);
    t44 = (t42 & t43);
    *((unsigned int *)t41) = t44;
    t45 = (t13 + 4);
    t46 = (t33 + 4);
    t47 = (t41 + 4);
    t48 = *((unsigned int *)t45);
    t49 = *((unsigned int *)t46);
    t50 = (t48 | t49);
    *((unsigned int *)t47) = t50;
    t51 = *((unsigned int *)t47);
    t52 = (t51 != 0);
    if (t52 == 1)
        goto LAB28;

LAB29:
LAB30:    goto LAB19;

LAB20:    *((unsigned int *)t22) = 1;
    goto LAB23;

LAB24:    *((unsigned int *)t33) = 1;
    goto LAB27;

LAB26:    t40 = (t33 + 4);
    *((unsigned int *)t33) = 1;
    *((unsigned int *)t40) = 1;
    goto LAB27;

LAB28:    t53 = *((unsigned int *)t41);
    t54 = *((unsigned int *)t47);
    *((unsigned int *)t41) = (t53 | t54);
    t55 = (t13 + 4);
    t56 = (t33 + 4);
    t57 = *((unsigned int *)t13);
    t58 = (~(t57));
    t59 = *((unsigned int *)t55);
    t60 = (~(t59));
    t61 = *((unsigned int *)t33);
    t62 = (~(t61));
    t63 = *((unsigned int *)t56);
    t64 = (~(t63));
    t65 = (t58 & t60);
    t66 = (t62 & t64);
    t67 = (~(t65));
    t68 = (~(t66));
    t69 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t69 & t67);
    t70 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t70 & t68);
    t71 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t71 & t67);
    t72 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t72 & t68);
    goto LAB30;

LAB31:    xsi_set_current_line(200, ng0);

LAB34:    xsi_set_current_line(201, ng0);
    t79 = (t0 + 2208);
    t80 = (t79 + 36U);
    t81 = *((char **)t80);

LAB35:    t82 = ((char*)((ng1)));
    t83 = xsi_vlog_unsigned_case_compare(t81, 2, t82, 2);
    if (t83 == 1)
        goto LAB36;

LAB37:    t2 = ((char*)((ng2)));
    t65 = xsi_vlog_unsigned_case_compare(t81, 2, t2, 2);
    if (t65 == 1)
        goto LAB38;

LAB39:    t2 = ((char*)((ng3)));
    t65 = xsi_vlog_unsigned_case_compare(t81, 2, t2, 2);
    if (t65 == 1)
        goto LAB40;

LAB41:    t2 = ((char*)((ng4)));
    t65 = xsi_vlog_unsigned_case_compare(t81, 2, t2, 2);
    if (t65 == 1)
        goto LAB42;

LAB43:
LAB45:
LAB44:    xsi_set_current_line(206, ng0);
    t2 = (t0 + 1520U);
    t3 = *((char **)t2);
    t2 = (t0 + 2944);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 1000LL);

LAB46:    goto LAB33;

LAB36:    xsi_set_current_line(202, ng0);
    t85 = ((char*)((ng1)));
    t87 = (t0 + 1520U);
    t88 = *((char **)t87);
    memset(t86, 0, 8);
    t87 = (t86 + 4);
    t89 = (t88 + 4);
    t90 = *((unsigned int *)t88);
    t91 = (t90 >> 24);
    *((unsigned int *)t86) = t91;
    t92 = *((unsigned int *)t89);
    t93 = (t92 >> 24);
    *((unsigned int *)t87) = t93;
    t94 = *((unsigned int *)t86);
    *((unsigned int *)t86) = (t94 & 255U);
    t95 = *((unsigned int *)t87);
    *((unsigned int *)t87) = (t95 & 255U);
    xsi_vlogtype_concat(t84, 32, 32, 2U, t86, 8, t85, 24);
    t96 = (t0 + 2944);
    xsi_vlogvar_wait_assign_value(t96, t84, 0, 0, 32, 1000LL);
    goto LAB46;

LAB38:    xsi_set_current_line(203, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1520U);
    t5 = *((char **)t4);
    memset(t22, 0, 8);
    t4 = (t22 + 4);
    t11 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 16);
    *((unsigned int *)t22) = t7;
    t8 = *((unsigned int *)t11);
    t9 = (t8 >> 16);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t10 & 65535U);
    t14 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t14 & 65535U);
    xsi_vlogtype_concat(t13, 32, 32, 2U, t22, 16, t3, 16);
    t12 = (t0 + 2944);
    xsi_vlogvar_wait_assign_value(t12, t13, 0, 0, 32, 1000LL);
    goto LAB46;

LAB40:    xsi_set_current_line(204, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1520U);
    t5 = *((char **)t4);
    memset(t22, 0, 8);
    t4 = (t22 + 4);
    t11 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 8);
    *((unsigned int *)t22) = t7;
    t8 = *((unsigned int *)t11);
    t9 = (t8 >> 8);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t10 & 16777215U);
    t14 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t14 & 16777215U);
    xsi_vlogtype_concat(t13, 32, 32, 2U, t22, 24, t3, 8);
    t12 = (t0 + 2944);
    xsi_vlogvar_wait_assign_value(t12, t13, 0, 0, 32, 1000LL);
    goto LAB46;

LAB42:    xsi_set_current_line(205, ng0);
    t3 = (t0 + 1520U);
    t4 = *((char **)t3);
    t3 = (t0 + 2944);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, 0, 32, 1000LL);
    goto LAB46;

LAB47:    xsi_set_current_line(210, ng0);
    t4 = (t0 + 1520U);
    t5 = *((char **)t4);
    t4 = (t0 + 2944);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 32, 1000LL);
    goto LAB49;

}

static void Always_216_8(char *t0)
{
    char t18[8];
    char t19[8];
    char t29[8];
    char t30[8];
    char t34[8];
    char t46[8];
    char t55[8];
    char t72[8];
    char t81[8];
    char t98[8];
    char t107[8];
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
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t31;
    char *t32;
    char *t33;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t44;
    char *t45;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    char *t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    char *t70;
    char *t71;
    char *t73;
    char *t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    char *t85;
    char *t86;
    char *t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    char *t95;
    char *t96;
    char *t97;
    char *t99;
    char *t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    char *t111;
    char *t112;
    char *t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    char *t121;
    unsigned int t122;
    unsigned int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    char *t127;
    char *t128;

LAB0:    t1 = (t0 + 4804U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(216, ng0);
    t2 = (t0 + 5784);
    *((int *)t2) = 1;
    t3 = (t0 + 4832);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(217, ng0);
    t4 = (t0 + 1428U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(221, ng0);
    t2 = (t0 + 1244U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(228, ng0);

LAB29:    xsi_set_current_line(229, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 3036);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 1000LL);

LAB11:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(218, ng0);

LAB8:    xsi_set_current_line(219, ng0);
    t11 = ((char*)((ng6)));
    t12 = (t0 + 3036);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 16, 1000LL);
    goto LAB7;

LAB9:    xsi_set_current_line(222, ng0);

LAB12:    xsi_set_current_line(223, ng0);
    t4 = (t0 + 1612U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t13 = *((unsigned int *)t4);
    t14 = (~(t13));
    t15 = *((unsigned int *)t5);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB13;

LAB14:
LAB15:    goto LAB11;

LAB13:    xsi_set_current_line(224, ng0);
    t11 = (t0 + 3036);
    t12 = (t11 + 36U);
    t20 = *((char **)t12);
    memset(t19, 0, 8);
    t21 = (t19 + 4);
    t22 = (t20 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (t23 >> 1);
    *((unsigned int *)t19) = t24;
    t25 = *((unsigned int *)t22);
    t26 = (t25 >> 1);
    *((unsigned int *)t21) = t26;
    t27 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t27 & 32767U);
    t28 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t28 & 32767U);
    t31 = (t0 + 3036);
    t32 = (t31 + 36U);
    t33 = *((char **)t32);
    memset(t34, 0, 8);
    t35 = (t34 + 4);
    t36 = (t33 + 4);
    t37 = *((unsigned int *)t33);
    t38 = (t37 >> 12);
    t39 = (t38 & 1);
    *((unsigned int *)t34) = t39;
    t40 = *((unsigned int *)t36);
    t41 = (t40 >> 12);
    t42 = (t41 & 1);
    *((unsigned int *)t35) = t42;
    t43 = (t0 + 3036);
    t44 = (t43 + 36U);
    t45 = *((char **)t44);
    memset(t46, 0, 8);
    t47 = (t46 + 4);
    t48 = (t45 + 4);
    t49 = *((unsigned int *)t45);
    t50 = (t49 >> 3);
    t51 = (t50 & 1);
    *((unsigned int *)t46) = t51;
    t52 = *((unsigned int *)t48);
    t53 = (t52 >> 3);
    t54 = (t53 & 1);
    *((unsigned int *)t47) = t54;
    t56 = *((unsigned int *)t34);
    t57 = *((unsigned int *)t46);
    t58 = (t56 ^ t57);
    *((unsigned int *)t55) = t58;
    t59 = (t34 + 4);
    t60 = (t46 + 4);
    t61 = (t55 + 4);
    t62 = *((unsigned int *)t59);
    t63 = *((unsigned int *)t60);
    t64 = (t62 | t63);
    *((unsigned int *)t61) = t64;
    t65 = *((unsigned int *)t61);
    t66 = (t65 != 0);
    if (t66 == 1)
        goto LAB16;

LAB17:
LAB18:    t69 = (t0 + 3036);
    t70 = (t69 + 36U);
    t71 = *((char **)t70);
    memset(t72, 0, 8);
    t73 = (t72 + 4);
    t74 = (t71 + 4);
    t75 = *((unsigned int *)t71);
    t76 = (t75 >> 1);
    t77 = (t76 & 1);
    *((unsigned int *)t72) = t77;
    t78 = *((unsigned int *)t74);
    t79 = (t78 >> 1);
    t80 = (t79 & 1);
    *((unsigned int *)t73) = t80;
    t82 = *((unsigned int *)t55);
    t83 = *((unsigned int *)t72);
    t84 = (t82 ^ t83);
    *((unsigned int *)t81) = t84;
    t85 = (t55 + 4);
    t86 = (t72 + 4);
    t87 = (t81 + 4);
    t88 = *((unsigned int *)t85);
    t89 = *((unsigned int *)t86);
    t90 = (t88 | t89);
    *((unsigned int *)t87) = t90;
    t91 = *((unsigned int *)t87);
    t92 = (t91 != 0);
    if (t92 == 1)
        goto LAB19;

LAB20:
LAB21:    t95 = (t0 + 3036);
    t96 = (t95 + 36U);
    t97 = *((char **)t96);
    memset(t98, 0, 8);
    t99 = (t98 + 4);
    t100 = (t97 + 4);
    t101 = *((unsigned int *)t97);
    t102 = (t101 >> 0);
    t103 = (t102 & 1);
    *((unsigned int *)t98) = t103;
    t104 = *((unsigned int *)t100);
    t105 = (t104 >> 0);
    t106 = (t105 & 1);
    *((unsigned int *)t99) = t106;
    t108 = *((unsigned int *)t81);
    t109 = *((unsigned int *)t98);
    t110 = (t108 ^ t109);
    *((unsigned int *)t107) = t110;
    t111 = (t81 + 4);
    t112 = (t98 + 4);
    t113 = (t107 + 4);
    t114 = *((unsigned int *)t111);
    t115 = *((unsigned int *)t112);
    t116 = (t114 | t115);
    *((unsigned int *)t113) = t116;
    t117 = *((unsigned int *)t113);
    t118 = (t117 != 0);
    if (t118 == 1)
        goto LAB22;

LAB23:
LAB24:    xsi_vlogtype_concat(t30, 1, 1, 1U, t107, 1);
    memset(t29, 0, 8);
    t121 = (t30 + 4);
    t122 = *((unsigned int *)t121);
    t123 = (~(t122));
    t124 = *((unsigned int *)t30);
    t125 = (t124 & t123);
    t126 = (t125 & 1U);
    if (t126 != 0)
        goto LAB28;

LAB26:    if (*((unsigned int *)t121) == 0)
        goto LAB25;

LAB27:    t127 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t127) = 1;

LAB28:    xsi_vlogtype_concat(t18, 16, 16, 2U, t29, 1, t19, 15);
    t128 = (t0 + 3036);
    xsi_vlogvar_wait_assign_value(t128, t18, 0, 0, 16, 1000LL);
    goto LAB15;

LAB16:    t67 = *((unsigned int *)t55);
    t68 = *((unsigned int *)t61);
    *((unsigned int *)t55) = (t67 | t68);
    goto LAB18;

LAB19:    t93 = *((unsigned int *)t81);
    t94 = *((unsigned int *)t87);
    *((unsigned int *)t81) = (t93 | t94);
    goto LAB21;

LAB22:    t119 = *((unsigned int *)t107);
    t120 = *((unsigned int *)t113);
    *((unsigned int *)t107) = (t119 | t120);
    goto LAB24;

LAB25:    *((unsigned int *)t29) = 1;
    goto LAB28;

}

static void Cont_232_9(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 4948U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(232, ng0);
    t2 = ((char*)((ng7)));
    t4 = (t0 + 3036);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    xsi_vlog_mul_concat(t3, 32, 16, t2, 1U, t6, 16);
    t7 = (t0 + 5976);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t3, 8);
    xsi_driver_vfirst_trans(t7, 0, 31);
    t12 = (t0 + 5792);
    *((int *)t12) = 1;

LAB1:    return;
}

static void Cont_239_10(char *t0)
{
    char t5[8];
    char t23[8];
    char t39[8];
    char t47[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
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
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    char *t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    int t71;
    int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t80;
    char *t81;
    char *t82;
    char *t83;
    unsigned int t84;
    unsigned int t85;
    char *t86;
    unsigned int t87;
    unsigned int t88;
    char *t89;
    unsigned int t90;
    unsigned int t91;
    char *t92;

LAB0:    t1 = (t0 + 5092U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(239, ng0);
    t2 = (t0 + 2760);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t5, 0, 8);
    t6 = (t4 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t4);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t6) != 0)
        goto LAB6;

LAB7:    t13 = (t5 + 4);
    t14 = *((unsigned int *)t5);
    t15 = *((unsigned int *)t13);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB8;

LAB9:    memcpy(t47, t5, 8);

LAB10:    t79 = (t0 + 6012);
    t80 = (t79 + 32U);
    t81 = *((char **)t80);
    t82 = (t81 + 40U);
    t83 = *((char **)t82);
    memset(t83, 0, 8);
    t84 = 1U;
    t85 = t84;
    t86 = (t47 + 4);
    t87 = *((unsigned int *)t47);
    t84 = (t84 & t87);
    t88 = *((unsigned int *)t86);
    t85 = (t85 & t88);
    t89 = (t83 + 4);
    t90 = *((unsigned int *)t83);
    *((unsigned int *)t83) = (t90 | t84);
    t91 = *((unsigned int *)t89);
    *((unsigned int *)t89) = (t91 | t85);
    xsi_driver_vfirst_trans(t79, 0, 0);
    t92 = (t0 + 5800);
    *((int *)t92) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t5) = 1;
    goto LAB7;

LAB6:    t12 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB7;

LAB8:    t17 = (t0 + 2852);
    t18 = (t17 + 36U);
    t19 = *((char **)t18);
    t20 = (t0 + 2944);
    t21 = (t20 + 36U);
    t22 = *((char **)t21);
    memset(t23, 0, 8);
    t24 = (t19 + 4);
    t25 = (t22 + 4);
    t26 = *((unsigned int *)t19);
    t27 = *((unsigned int *)t22);
    t28 = (t26 ^ t27);
    t29 = *((unsigned int *)t24);
    t30 = *((unsigned int *)t25);
    t31 = (t29 ^ t30);
    t32 = (t28 | t31);
    t33 = *((unsigned int *)t24);
    t34 = *((unsigned int *)t25);
    t35 = (t33 | t34);
    t36 = (~(t35));
    t37 = (t32 & t36);
    if (t37 != 0)
        goto LAB12;

LAB11:    if (t35 != 0)
        goto LAB13;

LAB14:    memset(t39, 0, 8);
    t40 = (t23 + 4);
    t41 = *((unsigned int *)t40);
    t42 = (~(t41));
    t43 = *((unsigned int *)t23);
    t44 = (t43 & t42);
    t45 = (t44 & 1U);
    if (t45 != 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t40) != 0)
        goto LAB17;

LAB18:    t48 = *((unsigned int *)t5);
    t49 = *((unsigned int *)t39);
    t50 = (t48 & t49);
    *((unsigned int *)t47) = t50;
    t51 = (t5 + 4);
    t52 = (t39 + 4);
    t53 = (t47 + 4);
    t54 = *((unsigned int *)t51);
    t55 = *((unsigned int *)t52);
    t56 = (t54 | t55);
    *((unsigned int *)t53) = t56;
    t57 = *((unsigned int *)t53);
    t58 = (t57 != 0);
    if (t58 == 1)
        goto LAB19;

LAB20:
LAB21:    goto LAB10;

LAB12:    *((unsigned int *)t23) = 1;
    goto LAB14;

LAB13:    t38 = (t23 + 4);
    *((unsigned int *)t23) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB14;

LAB15:    *((unsigned int *)t39) = 1;
    goto LAB18;

LAB17:    t46 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t46) = 1;
    goto LAB18;

LAB19:    t59 = *((unsigned int *)t47);
    t60 = *((unsigned int *)t53);
    *((unsigned int *)t47) = (t59 | t60);
    t61 = (t5 + 4);
    t62 = (t39 + 4);
    t63 = *((unsigned int *)t5);
    t64 = (~(t63));
    t65 = *((unsigned int *)t61);
    t66 = (~(t65));
    t67 = *((unsigned int *)t39);
    t68 = (~(t67));
    t69 = *((unsigned int *)t62);
    t70 = (~(t69));
    t71 = (t64 & t66);
    t72 = (t68 & t70);
    t73 = (~(t71));
    t74 = (~(t72));
    t75 = *((unsigned int *)t53);
    *((unsigned int *)t53) = (t75 & t73);
    t76 = *((unsigned int *)t53);
    *((unsigned int *)t53) = (t76 & t74);
    t77 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t77 & t73);
    t78 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t78 & t74);
    goto LAB21;

}

static void Always_243_11(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;

LAB0:    t1 = (t0 + 5236U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(243, ng0);
    t2 = (t0 + 5808);
    *((int *)t2) = 1;
    t3 = (t0 + 5264);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(244, ng0);
    t4 = (t0 + 1796U);
    t5 = *((char **)t4);
    t4 = (t0 + 3128);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 1000LL);
    goto LAB2;

}

static void Always_250_12(char *t0)
{
    char t11[8];
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
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    t1 = (t0 + 5380U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(250, ng0);
    t2 = (t0 + 5816);
    *((int *)t2) = 1;
    t3 = (t0 + 5408);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(251, ng0);
    t4 = (t0 + 1244U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(259, ng0);

LAB19:    xsi_set_current_line(260, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2576);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 9, 1000LL);

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(252, ng0);

LAB8:    xsi_set_current_line(253, ng0);
    t12 = (t0 + 2576);
    t13 = (t12 + 36U);
    t14 = *((char **)t13);
    memset(t11, 0, 8);
    t15 = (t14 + 4);
    t16 = *((unsigned int *)t14);
    t17 = *((unsigned int *)t15);
    t18 = (t16 | t17);
    if (t18 != 511U)
        goto LAB10;

LAB9:    if (*((unsigned int *)t15) == 0)
        goto LAB11;

LAB12:    t19 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t19) = 1;

LAB10:    t20 = (t11 + 4);
    t21 = *((unsigned int *)t20);
    t22 = (~(t21));
    t23 = *((unsigned int *)t11);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB13;

LAB14:    xsi_set_current_line(255, ng0);
    t2 = (t0 + 3128);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB16;

LAB17:
LAB18:
LAB15:    goto LAB7;

LAB11:    *((unsigned int *)t11) = 1;
    goto LAB10;

LAB13:    xsi_set_current_line(254, ng0);
    t26 = (t0 + 2576);
    t27 = (t26 + 36U);
    t28 = *((char **)t27);
    t29 = (t0 + 2576);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 9, 1000LL);
    goto LAB15;

LAB16:    xsi_set_current_line(256, ng0);
    t12 = (t0 + 2576);
    t13 = (t12 + 36U);
    t14 = *((char **)t13);
    t15 = ((char*)((ng8)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 32, t14, 9, t15, 32);
    t19 = (t0 + 2576);
    xsi_vlogvar_wait_assign_value(t19, t11, 0, 0, 9, 1000LL);
    goto LAB18;

}

static void Cont_265_13(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
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
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;

LAB0:    t1 = (t0 + 5524U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(265, ng0);
    t2 = (t0 + 2576);
    t4 = (t2 + 36U);
    t5 = *((char **)t4);
    memset(t3, 0, 8);
    t6 = (t3 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t12 & 255U);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 255U);
    t14 = (t0 + 6048);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 40U);
    t18 = *((char **)t17);
    memset(t18, 0, 8);
    t19 = 255U;
    t20 = t19;
    t21 = (t3 + 4);
    t22 = *((unsigned int *)t3);
    t19 = (t19 & t22);
    t23 = *((unsigned int *)t21);
    t20 = (t20 & t23);
    t24 = (t18 + 4);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 | t19);
    t26 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t26 | t20);
    xsi_driver_vfirst_trans(t14, 0, 7);
    t27 = (t0 + 5824);
    *((int *)t27) = 1;

LAB1:    return;
}


extern void work_m_00000000003898547485_1970402940_init()
{
	static char *pe[] = {(void *)Cont_131_0,(void *)Always_135_1,(void *)Cont_147_2,(void *)Cont_150_3,(void *)Always_154_4,(void *)Always_164_5,(void *)Always_176_6,(void *)Always_193_7,(void *)Always_216_8,(void *)Cont_232_9,(void *)Cont_239_10,(void *)Always_243_11,(void *)Always_250_12,(void *)Cont_265_13};
	xsi_register_didat("work_m_00000000003898547485_1970402940", "isim/FrameGenChk_tb_isim_beh.exe.sim/work/m_00000000003898547485_1970402940.didat");
	xsi_register_executes(pe);
}
