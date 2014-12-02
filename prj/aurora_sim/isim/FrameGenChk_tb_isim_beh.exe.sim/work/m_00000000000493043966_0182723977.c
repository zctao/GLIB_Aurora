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
static const char *ng0 = "C:/Users/LabView User/Documents/ztaotest/GLIB_Aurora/prj/aurora_sim/ipcore_dir/aurora8b10b/src/aurora8b10b_channel_init_sm.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {255U, 0U};



static void Always_195_0(char *t0)
{
    char t7[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
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
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;

LAB0:    t1 = (t0 + 4204U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(195, ng0);
    t2 = (t0 + 7424);
    *((int *)t2) = 1;
    t3 = (t0 + 4232);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(196, ng0);
    t4 = (t0 + 1244U);
    t5 = *((char **)t4);
    t4 = (t0 + 1520U);
    t6 = *((char **)t4);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t6);
    t10 = (t8 | t9);
    *((unsigned int *)t7) = t10;
    t4 = (t5 + 4);
    t11 = (t6 + 4);
    t12 = (t7 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t11);
    t15 = (t13 | t14);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t12);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB5;

LAB6:
LAB7:    t34 = (t7 + 4);
    t35 = *((unsigned int *)t34);
    t36 = (~(t35));
    t37 = *((unsigned int *)t7);
    t38 = (t37 & t36);
    t39 = (t38 != 0);
    if (t39 > 0)
        goto LAB8;

LAB9:    xsi_set_current_line(203, ng0);

LAB12:    xsi_set_current_line(204, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3404);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 1000LL);
    xsi_set_current_line(205, ng0);
    t2 = (t0 + 2164U);
    t3 = *((char **)t2);
    t2 = (t0 + 3496);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 1000LL);
    xsi_set_current_line(206, ng0);
    t2 = (t0 + 2256U);
    t3 = *((char **)t2);
    t2 = (t0 + 3588);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 1000LL);

LAB10:    goto LAB2;

LAB5:    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t7) = (t18 | t19);
    t20 = (t5 + 4);
    t21 = (t6 + 4);
    t22 = *((unsigned int *)t20);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = *((unsigned int *)t21);
    t27 = (~(t26));
    t28 = *((unsigned int *)t6);
    t29 = (t28 & t27);
    t30 = (~(t25));
    t31 = (~(t29));
    t32 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t32 & t30);
    t33 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t33 & t31);
    goto LAB7;

LAB8:    xsi_set_current_line(197, ng0);

LAB11:    xsi_set_current_line(198, ng0);
    t40 = ((char*)((ng1)));
    t41 = (t0 + 3404);
    xsi_vlogvar_wait_assign_value(t41, t40, 0, 0, 1, 1000LL);
    xsi_set_current_line(199, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3496);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 1000LL);
    xsi_set_current_line(200, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3588);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 1000LL);
    goto LAB10;

}

static void Cont_212_1(char *t0)
{
    char t8[8];
    char t17[8];
    char t26[8];
    char t54[8];
    char t86[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    char *t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    int t78;
    int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    char *t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    char *t100;
    char *t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    char *t114;
    char *t115;
    char *t116;
    char *t117;
    char *t118;
    unsigned int t119;
    unsigned int t120;
    char *t121;
    unsigned int t122;
    unsigned int t123;
    char *t124;
    unsigned int t125;
    unsigned int t126;
    char *t127;

LAB0:    t1 = (t0 + 4348U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(212, ng0);
    t2 = (t0 + 3404);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 3496);
    t6 = (t5 + 36U);
    t7 = *((char **)t6);
    t9 = (t0 + 1796U);
    t10 = *((char **)t9);
    memset(t8, 0, 8);
    t9 = (t10 + 4);
    t11 = *((unsigned int *)t9);
    t12 = (~(t11));
    t13 = *((unsigned int *)t10);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB7;

LAB5:    if (*((unsigned int *)t9) == 0)
        goto LAB4;

LAB6:    t16 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t16) = 1;

LAB7:    t18 = (t0 + 1888U);
    t19 = *((char **)t18);
    memset(t17, 0, 8);
    t18 = (t19 + 4);
    t20 = *((unsigned int *)t18);
    t21 = (~(t20));
    t22 = *((unsigned int *)t19);
    t23 = (t22 & t21);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB11;

LAB9:    if (*((unsigned int *)t18) == 0)
        goto LAB8;

LAB10:    t25 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t25) = 1;

LAB11:    t27 = *((unsigned int *)t8);
    t28 = *((unsigned int *)t17);
    t29 = (t27 | t28);
    *((unsigned int *)t26) = t29;
    t30 = (t8 + 4);
    t31 = (t17 + 4);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t30);
    t34 = *((unsigned int *)t31);
    t35 = (t33 | t34);
    *((unsigned int *)t32) = t35;
    t36 = *((unsigned int *)t32);
    t37 = (t36 != 0);
    if (t37 == 1)
        goto LAB12;

LAB13:
LAB14:    t55 = *((unsigned int *)t7);
    t56 = *((unsigned int *)t26);
    t57 = (t55 & t56);
    *((unsigned int *)t54) = t57;
    t58 = (t7 + 4);
    t59 = (t26 + 4);
    t60 = (t54 + 4);
    t61 = *((unsigned int *)t58);
    t62 = *((unsigned int *)t59);
    t63 = (t61 | t62);
    *((unsigned int *)t60) = t63;
    t64 = *((unsigned int *)t60);
    t65 = (t64 != 0);
    if (t65 == 1)
        goto LAB15;

LAB16:
LAB17:    t87 = *((unsigned int *)t4);
    t88 = *((unsigned int *)t54);
    t89 = (t87 | t88);
    *((unsigned int *)t86) = t89;
    t90 = (t4 + 4);
    t91 = (t54 + 4);
    t92 = (t86 + 4);
    t93 = *((unsigned int *)t90);
    t94 = *((unsigned int *)t91);
    t95 = (t93 | t94);
    *((unsigned int *)t92) = t95;
    t96 = *((unsigned int *)t92);
    t97 = (t96 != 0);
    if (t97 == 1)
        goto LAB18;

LAB19:
LAB20:    t114 = (t0 + 7628);
    t115 = (t114 + 32U);
    t116 = *((char **)t115);
    t117 = (t116 + 40U);
    t118 = *((char **)t117);
    memset(t118, 0, 8);
    t119 = 1U;
    t120 = t119;
    t121 = (t86 + 4);
    t122 = *((unsigned int *)t86);
    t119 = (t119 & t122);
    t123 = *((unsigned int *)t121);
    t120 = (t120 & t123);
    t124 = (t118 + 4);
    t125 = *((unsigned int *)t118);
    *((unsigned int *)t118) = (t125 | t119);
    t126 = *((unsigned int *)t124);
    *((unsigned int *)t124) = (t126 | t120);
    xsi_driver_vfirst_trans(t114, 0, 0);
    t127 = (t0 + 7432);
    *((int *)t127) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t8) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t17) = 1;
    goto LAB11;

LAB12:    t38 = *((unsigned int *)t26);
    t39 = *((unsigned int *)t32);
    *((unsigned int *)t26) = (t38 | t39);
    t40 = (t8 + 4);
    t41 = (t17 + 4);
    t42 = *((unsigned int *)t40);
    t43 = (~(t42));
    t44 = *((unsigned int *)t8);
    t45 = (t44 & t43);
    t46 = *((unsigned int *)t41);
    t47 = (~(t46));
    t48 = *((unsigned int *)t17);
    t49 = (t48 & t47);
    t50 = (~(t45));
    t51 = (~(t49));
    t52 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t52 & t50);
    t53 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t53 & t51);
    goto LAB14;

LAB15:    t66 = *((unsigned int *)t54);
    t67 = *((unsigned int *)t60);
    *((unsigned int *)t54) = (t66 | t67);
    t68 = (t7 + 4);
    t69 = (t26 + 4);
    t70 = *((unsigned int *)t7);
    t71 = (~(t70));
    t72 = *((unsigned int *)t68);
    t73 = (~(t72));
    t74 = *((unsigned int *)t26);
    t75 = (~(t74));
    t76 = *((unsigned int *)t69);
    t77 = (~(t76));
    t78 = (t71 & t73);
    t79 = (t75 & t77);
    t80 = (~(t78));
    t81 = (~(t79));
    t82 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t82 & t80);
    t83 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t83 & t81);
    t84 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t84 & t80);
    t85 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t85 & t81);
    goto LAB17;

LAB18:    t98 = *((unsigned int *)t86);
    t99 = *((unsigned int *)t92);
    *((unsigned int *)t86) = (t98 | t99);
    t100 = (t4 + 4);
    t101 = (t54 + 4);
    t102 = *((unsigned int *)t100);
    t103 = (~(t102));
    t104 = *((unsigned int *)t4);
    t105 = (t104 & t103);
    t106 = *((unsigned int *)t101);
    t107 = (~(t106));
    t108 = *((unsigned int *)t54);
    t109 = (t108 & t107);
    t110 = (~(t105));
    t111 = (~(t109));
    t112 = *((unsigned int *)t92);
    *((unsigned int *)t92) = (t112 & t110);
    t113 = *((unsigned int *)t92);
    *((unsigned int *)t92) = (t113 & t111);
    goto LAB20;

}

static void Cont_216_2(char *t0)
{
    char t7[8];
    char t40[8];
    char t74[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
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
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
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
    char *t72;
    char *t73;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    char *t79;
    char *t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    char *t88;
    char *t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    char *t102;
    char *t103;
    char *t104;
    char *t105;
    char *t106;
    unsigned int t107;
    unsigned int t108;
    char *t109;
    unsigned int t110;
    unsigned int t111;
    char *t112;
    unsigned int t113;
    unsigned int t114;
    char *t115;

LAB0:    t1 = (t0 + 4492U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(216, ng0);
    t2 = (t0 + 3496);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 1888U);
    t6 = *((char **)t5);
    t8 = *((unsigned int *)t4);
    t9 = *((unsigned int *)t6);
    t10 = (t8 & t9);
    *((unsigned int *)t7) = t10;
    t5 = (t4 + 4);
    t11 = (t6 + 4);
    t12 = (t7 + 4);
    t13 = *((unsigned int *)t5);
    t14 = *((unsigned int *)t11);
    t15 = (t13 | t14);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t12);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB4;

LAB5:
LAB6:    t38 = (t0 + 1796U);
    t39 = *((char **)t38);
    t41 = *((unsigned int *)t7);
    t42 = *((unsigned int *)t39);
    t43 = (t41 & t42);
    *((unsigned int *)t40) = t43;
    t38 = (t7 + 4);
    t44 = (t39 + 4);
    t45 = (t40 + 4);
    t46 = *((unsigned int *)t38);
    t47 = *((unsigned int *)t44);
    t48 = (t46 | t47);
    *((unsigned int *)t45) = t48;
    t49 = *((unsigned int *)t45);
    t50 = (t49 != 0);
    if (t50 == 1)
        goto LAB7;

LAB8:
LAB9:    t71 = (t0 + 3588);
    t72 = (t71 + 36U);
    t73 = *((char **)t72);
    t75 = *((unsigned int *)t40);
    t76 = *((unsigned int *)t73);
    t77 = (t75 | t76);
    *((unsigned int *)t74) = t77;
    t78 = (t40 + 4);
    t79 = (t73 + 4);
    t80 = (t74 + 4);
    t81 = *((unsigned int *)t78);
    t82 = *((unsigned int *)t79);
    t83 = (t81 | t82);
    *((unsigned int *)t80) = t83;
    t84 = *((unsigned int *)t80);
    t85 = (t84 != 0);
    if (t85 == 1)
        goto LAB10;

LAB11:
LAB12:    t102 = (t0 + 7664);
    t103 = (t102 + 32U);
    t104 = *((char **)t103);
    t105 = (t104 + 40U);
    t106 = *((char **)t105);
    memset(t106, 0, 8);
    t107 = 1U;
    t108 = t107;
    t109 = (t74 + 4);
    t110 = *((unsigned int *)t74);
    t107 = (t107 & t110);
    t111 = *((unsigned int *)t109);
    t108 = (t108 & t111);
    t112 = (t106 + 4);
    t113 = *((unsigned int *)t106);
    *((unsigned int *)t106) = (t113 | t107);
    t114 = *((unsigned int *)t112);
    *((unsigned int *)t112) = (t114 | t108);
    xsi_driver_vfirst_trans(t102, 0, 0);
    t115 = (t0 + 7440);
    *((int *)t115) = 1;

LAB1:    return;
LAB4:    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t7) = (t18 | t19);
    t20 = (t4 + 4);
    t21 = (t6 + 4);
    t22 = *((unsigned int *)t4);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (~(t26));
    t28 = *((unsigned int *)t21);
    t29 = (~(t28));
    t30 = (t23 & t25);
    t31 = (t27 & t29);
    t32 = (~(t30));
    t33 = (~(t31));
    t34 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t34 & t32);
    t35 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t35 & t33);
    t36 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t36 & t32);
    t37 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t37 & t33);
    goto LAB6;

LAB7:    t51 = *((unsigned int *)t40);
    t52 = *((unsigned int *)t45);
    *((unsigned int *)t40) = (t51 | t52);
    t53 = (t7 + 4);
    t54 = (t39 + 4);
    t55 = *((unsigned int *)t7);
    t56 = (~(t55));
    t57 = *((unsigned int *)t53);
    t58 = (~(t57));
    t59 = *((unsigned int *)t39);
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
    t69 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t69 & t65);
    t70 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t70 & t66);
    goto LAB9;

LAB10:    t86 = *((unsigned int *)t74);
    t87 = *((unsigned int *)t80);
    *((unsigned int *)t74) = (t86 | t87);
    t88 = (t40 + 4);
    t89 = (t73 + 4);
    t90 = *((unsigned int *)t88);
    t91 = (~(t90));
    t92 = *((unsigned int *)t40);
    t93 = (t92 & t91);
    t94 = *((unsigned int *)t89);
    t95 = (~(t94));
    t96 = *((unsigned int *)t73);
    t97 = (t96 & t95);
    t98 = (~(t93));
    t99 = (~(t97));
    t100 = *((unsigned int *)t80);
    *((unsigned int *)t80) = (t100 & t98);
    t101 = *((unsigned int *)t80);
    *((unsigned int *)t80) = (t101 & t99);
    goto LAB12;

}

static void Always_222_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 4636U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(222, ng0);
    t2 = (t0 + 7448);
    *((int *)t2) = 1;
    t3 = (t0 + 4664);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(223, ng0);
    t4 = (t0 + 3588);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t7 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 1, 1000LL);
    goto LAB2;

}

static void Always_226_4(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 4780U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(226, ng0);
    t2 = (t0 + 7456);
    *((int *)t2) = 1;
    t3 = (t0 + 4808);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(227, ng0);
    t4 = (t0 + 3680);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t7 = (t0 + 2484);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 1, 1000LL);
    goto LAB2;

}

static void Always_231_5(char *t0)
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

LAB0:    t1 = (t0 + 4924U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(231, ng0);
    t2 = (t0 + 7464);
    *((int *)t2) = 1;
    t3 = (t0 + 4952);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(232, ng0);
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

LAB6:    xsi_set_current_line(233, ng0);
    t2 = (t0 + 3404);
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
        goto LAB11;

LAB9:    if (*((unsigned int *)t5) == 0)
        goto LAB8;

LAB10:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;

LAB11:    t12 = (t0 + 2576);
    xsi_vlogvar_wait_assign_value(t12, t13, 0, 0, 1, 1000LL);

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(232, ng0);
    t11 = ((char*)((ng2)));
    t12 = (t0 + 2576);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 1000LL);
    goto LAB7;

LAB8:    *((unsigned int *)t13) = 1;
    goto LAB11;

}

static void Cont_238_6(char *t0)
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
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 5068U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(238, ng0);
    t2 = (t0 + 3496);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 7700);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 0);
    t18 = (t0 + 7472);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_250_7(char *t0)
{
    char t7[8];
    char t44[8];
    char t76[8];
    char t85[8];
    char t117[8];
    char t147[8];
    char t157[8];
    char t189[8];
    char t219[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
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
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    char *t49;
    char *t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    char *t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    int t68;
    int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    char *t89;
    char *t90;
    char *t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    char *t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    int t109;
    int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    char *t121;
    char *t122;
    char *t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    char *t131;
    char *t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    int t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    char *t145;
    char *t146;
    char *t148;
    char *t149;
    char *t150;
    unsigned int t151;
    unsigned int t152;
    unsigned int t153;
    unsigned int t154;
    unsigned int t155;
    char *t156;
    unsigned int t158;
    unsigned int t159;
    unsigned int t160;
    char *t161;
    char *t162;
    char *t163;
    unsigned int t164;
    unsigned int t165;
    unsigned int t166;
    unsigned int t167;
    unsigned int t168;
    unsigned int t169;
    unsigned int t170;
    char *t171;
    char *t172;
    unsigned int t173;
    unsigned int t174;
    unsigned int t175;
    unsigned int t176;
    unsigned int t177;
    unsigned int t178;
    unsigned int t179;
    unsigned int t180;
    int t181;
    int t182;
    unsigned int t183;
    unsigned int t184;
    unsigned int t185;
    unsigned int t186;
    unsigned int t187;
    unsigned int t188;
    unsigned int t190;
    unsigned int t191;
    unsigned int t192;
    char *t193;
    char *t194;
    char *t195;
    unsigned int t196;
    unsigned int t197;
    unsigned int t198;
    unsigned int t199;
    unsigned int t200;
    unsigned int t201;
    unsigned int t202;
    char *t203;
    char *t204;
    unsigned int t205;
    unsigned int t206;
    unsigned int t207;
    int t208;
    unsigned int t209;
    unsigned int t210;
    unsigned int t211;
    int t212;
    unsigned int t213;
    unsigned int t214;
    unsigned int t215;
    unsigned int t216;
    char *t217;
    char *t218;
    unsigned int t220;
    unsigned int t221;
    unsigned int t222;
    char *t223;
    char *t224;
    unsigned int t225;
    unsigned int t226;
    unsigned int t227;
    unsigned int t228;
    unsigned int t229;
    unsigned int t230;
    unsigned int t231;
    char *t232;
    char *t233;
    unsigned int t234;
    unsigned int t235;
    unsigned int t236;
    int t237;
    unsigned int t238;
    unsigned int t239;
    unsigned int t240;
    int t241;
    unsigned int t242;
    unsigned int t243;
    unsigned int t244;
    unsigned int t245;
    char *t246;
    char *t247;
    char *t248;
    char *t249;
    char *t250;
    unsigned int t251;
    unsigned int t252;
    char *t253;
    unsigned int t254;
    unsigned int t255;
    char *t256;
    unsigned int t257;
    unsigned int t258;
    char *t259;

LAB0:    t1 = (t0 + 5212U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(250, ng0);
    t2 = (t0 + 3496);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 1704U);
    t6 = *((char **)t5);
    t8 = *((unsigned int *)t4);
    t9 = *((unsigned int *)t6);
    t10 = (t8 & t9);
    *((unsigned int *)t7) = t10;
    t5 = (t4 + 4);
    t11 = (t6 + 4);
    t12 = (t7 + 4);
    t13 = *((unsigned int *)t5);
    t14 = *((unsigned int *)t11);
    t15 = (t13 | t14);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t12);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB4;

LAB5:
LAB6:    t38 = (t0 + 3496);
    t39 = (t38 + 36U);
    t40 = *((char **)t39);
    t41 = (t0 + 3128);
    t42 = (t41 + 36U);
    t43 = *((char **)t42);
    t45 = *((unsigned int *)t40);
    t46 = *((unsigned int *)t43);
    t47 = (t45 & t46);
    *((unsigned int *)t44) = t47;
    t48 = (t40 + 4);
    t49 = (t43 + 4);
    t50 = (t44 + 4);
    t51 = *((unsigned int *)t48);
    t52 = *((unsigned int *)t49);
    t53 = (t51 | t52);
    *((unsigned int *)t50) = t53;
    t54 = *((unsigned int *)t50);
    t55 = (t54 != 0);
    if (t55 == 1)
        goto LAB7;

LAB8:
LAB9:    t77 = (t0 + 1796U);
    t78 = *((char **)t77);
    memset(t76, 0, 8);
    t77 = (t78 + 4);
    t79 = *((unsigned int *)t77);
    t80 = (~(t79));
    t81 = *((unsigned int *)t78);
    t82 = (t81 & t80);
    t83 = (t82 & 1U);
    if (t83 != 0)
        goto LAB13;

LAB11:    if (*((unsigned int *)t77) == 0)
        goto LAB10;

LAB12:    t84 = (t76 + 4);
    *((unsigned int *)t76) = 1;
    *((unsigned int *)t84) = 1;

LAB13:    t86 = *((unsigned int *)t44);
    t87 = *((unsigned int *)t76);
    t88 = (t86 & t87);
    *((unsigned int *)t85) = t88;
    t89 = (t44 + 4);
    t90 = (t76 + 4);
    t91 = (t85 + 4);
    t92 = *((unsigned int *)t89);
    t93 = *((unsigned int *)t90);
    t94 = (t92 | t93);
    *((unsigned int *)t91) = t94;
    t95 = *((unsigned int *)t91);
    t96 = (t95 != 0);
    if (t96 == 1)
        goto LAB14;

LAB15:
LAB16:    t118 = *((unsigned int *)t7);
    t119 = *((unsigned int *)t85);
    t120 = (t118 | t119);
    *((unsigned int *)t117) = t120;
    t121 = (t7 + 4);
    t122 = (t85 + 4);
    t123 = (t117 + 4);
    t124 = *((unsigned int *)t121);
    t125 = *((unsigned int *)t122);
    t126 = (t124 | t125);
    *((unsigned int *)t123) = t126;
    t127 = *((unsigned int *)t123);
    t128 = (t127 != 0);
    if (t128 == 1)
        goto LAB17;

LAB18:
LAB19:    t145 = (t0 + 1520U);
    t146 = *((char **)t145);
    t145 = (t0 + 3404);
    t148 = (t145 + 36U);
    t149 = *((char **)t148);
    memset(t147, 0, 8);
    t150 = (t149 + 4);
    t151 = *((unsigned int *)t150);
    t152 = (~(t151));
    t153 = *((unsigned int *)t149);
    t154 = (t153 & t152);
    t155 = (t154 & 1U);
    if (t155 != 0)
        goto LAB23;

LAB21:    if (*((unsigned int *)t150) == 0)
        goto LAB20;

LAB22:    t156 = (t147 + 4);
    *((unsigned int *)t147) = 1;
    *((unsigned int *)t156) = 1;

LAB23:    t158 = *((unsigned int *)t146);
    t159 = *((unsigned int *)t147);
    t160 = (t158 & t159);
    *((unsigned int *)t157) = t160;
    t161 = (t146 + 4);
    t162 = (t147 + 4);
    t163 = (t157 + 4);
    t164 = *((unsigned int *)t161);
    t165 = *((unsigned int *)t162);
    t166 = (t164 | t165);
    *((unsigned int *)t163) = t166;
    t167 = *((unsigned int *)t163);
    t168 = (t167 != 0);
    if (t168 == 1)
        goto LAB24;

LAB25:
LAB26:    t190 = *((unsigned int *)t117);
    t191 = *((unsigned int *)t157);
    t192 = (t190 | t191);
    *((unsigned int *)t189) = t192;
    t193 = (t117 + 4);
    t194 = (t157 + 4);
    t195 = (t189 + 4);
    t196 = *((unsigned int *)t193);
    t197 = *((unsigned int *)t194);
    t198 = (t196 | t197);
    *((unsigned int *)t195) = t198;
    t199 = *((unsigned int *)t195);
    t200 = (t199 != 0);
    if (t200 == 1)
        goto LAB27;

LAB28:
LAB29:    t217 = (t0 + 1244U);
    t218 = *((char **)t217);
    t220 = *((unsigned int *)t189);
    t221 = *((unsigned int *)t218);
    t222 = (t220 | t221);
    *((unsigned int *)t219) = t222;
    t217 = (t189 + 4);
    t223 = (t218 + 4);
    t224 = (t219 + 4);
    t225 = *((unsigned int *)t217);
    t226 = *((unsigned int *)t223);
    t227 = (t225 | t226);
    *((unsigned int *)t224) = t227;
    t228 = *((unsigned int *)t224);
    t229 = (t228 != 0);
    if (t229 == 1)
        goto LAB30;

LAB31:
LAB32:    t246 = (t0 + 7736);
    t247 = (t246 + 32U);
    t248 = *((char **)t247);
    t249 = (t248 + 40U);
    t250 = *((char **)t249);
    memset(t250, 0, 8);
    t251 = 1U;
    t252 = t251;
    t253 = (t219 + 4);
    t254 = *((unsigned int *)t219);
    t251 = (t251 & t254);
    t255 = *((unsigned int *)t253);
    t252 = (t252 & t255);
    t256 = (t250 + 4);
    t257 = *((unsigned int *)t250);
    *((unsigned int *)t250) = (t257 | t251);
    t258 = *((unsigned int *)t256);
    *((unsigned int *)t256) = (t258 | t252);
    xsi_driver_vfirst_trans(t246, 0, 0);
    t259 = (t0 + 7480);
    *((int *)t259) = 1;

LAB1:    return;
LAB4:    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t7) = (t18 | t19);
    t20 = (t4 + 4);
    t21 = (t6 + 4);
    t22 = *((unsigned int *)t4);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (~(t26));
    t28 = *((unsigned int *)t21);
    t29 = (~(t28));
    t30 = (t23 & t25);
    t31 = (t27 & t29);
    t32 = (~(t30));
    t33 = (~(t31));
    t34 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t34 & t32);
    t35 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t35 & t33);
    t36 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t36 & t32);
    t37 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t37 & t33);
    goto LAB6;

LAB7:    t56 = *((unsigned int *)t44);
    t57 = *((unsigned int *)t50);
    *((unsigned int *)t44) = (t56 | t57);
    t58 = (t40 + 4);
    t59 = (t43 + 4);
    t60 = *((unsigned int *)t40);
    t61 = (~(t60));
    t62 = *((unsigned int *)t58);
    t63 = (~(t62));
    t64 = *((unsigned int *)t43);
    t65 = (~(t64));
    t66 = *((unsigned int *)t59);
    t67 = (~(t66));
    t68 = (t61 & t63);
    t69 = (t65 & t67);
    t70 = (~(t68));
    t71 = (~(t69));
    t72 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t72 & t70);
    t73 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t73 & t71);
    t74 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t74 & t70);
    t75 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t75 & t71);
    goto LAB9;

LAB10:    *((unsigned int *)t76) = 1;
    goto LAB13;

LAB14:    t97 = *((unsigned int *)t85);
    t98 = *((unsigned int *)t91);
    *((unsigned int *)t85) = (t97 | t98);
    t99 = (t44 + 4);
    t100 = (t76 + 4);
    t101 = *((unsigned int *)t44);
    t102 = (~(t101));
    t103 = *((unsigned int *)t99);
    t104 = (~(t103));
    t105 = *((unsigned int *)t76);
    t106 = (~(t105));
    t107 = *((unsigned int *)t100);
    t108 = (~(t107));
    t109 = (t102 & t104);
    t110 = (t106 & t108);
    t111 = (~(t109));
    t112 = (~(t110));
    t113 = *((unsigned int *)t91);
    *((unsigned int *)t91) = (t113 & t111);
    t114 = *((unsigned int *)t91);
    *((unsigned int *)t91) = (t114 & t112);
    t115 = *((unsigned int *)t85);
    *((unsigned int *)t85) = (t115 & t111);
    t116 = *((unsigned int *)t85);
    *((unsigned int *)t85) = (t116 & t112);
    goto LAB16;

LAB17:    t129 = *((unsigned int *)t117);
    t130 = *((unsigned int *)t123);
    *((unsigned int *)t117) = (t129 | t130);
    t131 = (t7 + 4);
    t132 = (t85 + 4);
    t133 = *((unsigned int *)t131);
    t134 = (~(t133));
    t135 = *((unsigned int *)t7);
    t136 = (t135 & t134);
    t137 = *((unsigned int *)t132);
    t138 = (~(t137));
    t139 = *((unsigned int *)t85);
    t140 = (t139 & t138);
    t141 = (~(t136));
    t142 = (~(t140));
    t143 = *((unsigned int *)t123);
    *((unsigned int *)t123) = (t143 & t141);
    t144 = *((unsigned int *)t123);
    *((unsigned int *)t123) = (t144 & t142);
    goto LAB19;

LAB20:    *((unsigned int *)t147) = 1;
    goto LAB23;

LAB24:    t169 = *((unsigned int *)t157);
    t170 = *((unsigned int *)t163);
    *((unsigned int *)t157) = (t169 | t170);
    t171 = (t146 + 4);
    t172 = (t147 + 4);
    t173 = *((unsigned int *)t146);
    t174 = (~(t173));
    t175 = *((unsigned int *)t171);
    t176 = (~(t175));
    t177 = *((unsigned int *)t147);
    t178 = (~(t177));
    t179 = *((unsigned int *)t172);
    t180 = (~(t179));
    t181 = (t174 & t176);
    t182 = (t178 & t180);
    t183 = (~(t181));
    t184 = (~(t182));
    t185 = *((unsigned int *)t163);
    *((unsigned int *)t163) = (t185 & t183);
    t186 = *((unsigned int *)t163);
    *((unsigned int *)t163) = (t186 & t184);
    t187 = *((unsigned int *)t157);
    *((unsigned int *)t157) = (t187 & t183);
    t188 = *((unsigned int *)t157);
    *((unsigned int *)t157) = (t188 & t184);
    goto LAB26;

LAB27:    t201 = *((unsigned int *)t189);
    t202 = *((unsigned int *)t195);
    *((unsigned int *)t189) = (t201 | t202);
    t203 = (t117 + 4);
    t204 = (t157 + 4);
    t205 = *((unsigned int *)t203);
    t206 = (~(t205));
    t207 = *((unsigned int *)t117);
    t208 = (t207 & t206);
    t209 = *((unsigned int *)t204);
    t210 = (~(t209));
    t211 = *((unsigned int *)t157);
    t212 = (t211 & t210);
    t213 = (~(t208));
    t214 = (~(t212));
    t215 = *((unsigned int *)t195);
    *((unsigned int *)t195) = (t215 & t213);
    t216 = *((unsigned int *)t195);
    *((unsigned int *)t195) = (t216 & t214);
    goto LAB29;

LAB30:    t230 = *((unsigned int *)t219);
    t231 = *((unsigned int *)t224);
    *((unsigned int *)t219) = (t230 | t231);
    t232 = (t189 + 4);
    t233 = (t218 + 4);
    t234 = *((unsigned int *)t232);
    t235 = (~(t234));
    t236 = *((unsigned int *)t189);
    t237 = (t236 & t235);
    t238 = *((unsigned int *)t233);
    t239 = (~(t238));
    t240 = *((unsigned int *)t218);
    t241 = (t240 & t239);
    t242 = (~(t237));
    t243 = (~(t241));
    t244 = *((unsigned int *)t224);
    *((unsigned int *)t224) = (t244 & t242);
    t245 = *((unsigned int *)t224);
    *((unsigned int *)t224) = (t245 & t243);
    goto LAB32;

}

static void Always_269_8(char *t0)
{
    char t7[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
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
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;

LAB0:    t1 = (t0 + 5356U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(269, ng0);
    t2 = (t0 + 7488);
    *((int *)t2) = 1;
    t3 = (t0 + 5384);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(270, ng0);
    t4 = (t0 + 1244U);
    t5 = *((char **)t4);
    t4 = (t0 + 1520U);
    t6 = *((char **)t4);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t6);
    t10 = (t8 | t9);
    *((unsigned int *)t7) = t10;
    t4 = (t5 + 4);
    t11 = (t6 + 4);
    t12 = (t7 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t11);
    t15 = (t13 | t14);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t12);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB5;

LAB6:
LAB7:    t34 = (t7 + 4);
    t35 = *((unsigned int *)t34);
    t36 = (~(t35));
    t37 = *((unsigned int *)t7);
    t38 = (t37 & t36);
    t39 = (t38 != 0);
    if (t39 > 0)
        goto LAB8;

LAB9:    xsi_set_current_line(273, ng0);
    t2 = (t0 + 2668);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t7, 0, 8);
    xsi_vlog_unsigned_add(t7, 8, t4, 8, t5, 8);
    t6 = (t0 + 2668);
    xsi_vlogvar_wait_assign_value(t6, t7, 0, 0, 8, 1000LL);

LAB10:    goto LAB2;

LAB5:    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t7) = (t18 | t19);
    t20 = (t5 + 4);
    t21 = (t6 + 4);
    t22 = *((unsigned int *)t20);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = *((unsigned int *)t21);
    t27 = (~(t26));
    t28 = *((unsigned int *)t6);
    t29 = (t28 & t27);
    t30 = (~(t25));
    t31 = (~(t29));
    t32 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t32 & t30);
    t33 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t33 & t31);
    goto LAB7;

LAB8:    xsi_set_current_line(271, ng0);
    t40 = ((char*)((ng2)));
    t41 = (t0 + 2668);
    xsi_vlogvar_wait_assign_value(t41, t40, 0, 0, 8, 1000LL);
    goto LAB10;

}

static void Cont_275_9(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;

LAB0:    t1 = (t0 + 5500U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(275, ng0);
    t2 = (t0 + 2668);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t6, 0, 8);
    t7 = (t4 + 4);
    t8 = (t5 + 4);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    t22 = (t0 + 7772);
    t23 = (t22 + 32U);
    t24 = *((char **)t23);
    t25 = (t24 + 40U);
    t26 = *((char **)t25);
    memset(t26, 0, 8);
    t27 = 1U;
    t28 = t27;
    t29 = (t6 + 4);
    t30 = *((unsigned int *)t6);
    t27 = (t27 & t30);
    t31 = *((unsigned int *)t29);
    t28 = (t28 & t31);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t33 | t27);
    t34 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t34 | t28);
    xsi_driver_vfirst_trans(t22, 0, 0);
    t35 = (t0 + 7496);
    *((int *)t35) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

}

static void Always_280_10(char *t0)
{
    char t6[8];
    char t16[8];
    char t50[8];
    char t51[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t52;
    char *t53;
    char *t54;
    char *t55;
    char *t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    char *t63;
    char *t64;
    char *t65;
    char *t66;

LAB0:    t1 = (t0 + 5644U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(280, ng0);
    t2 = (t0 + 7504);
    *((int *)t2) = 1;
    t3 = (t0 + 5672);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(281, ng0);
    t4 = (t0 + 2072U);
    t5 = *((char **)t4);
    t4 = (t0 + 3496);
    t7 = (t4 + 36U);
    t8 = *((char **)t7);
    memset(t6, 0, 8);
    t9 = (t8 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (~(t10));
    t12 = *((unsigned int *)t8);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t9) == 0)
        goto LAB5;

LAB7:    t15 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t15) = 1;

LAB8:    t17 = *((unsigned int *)t5);
    t18 = *((unsigned int *)t6);
    t19 = (t17 | t18);
    *((unsigned int *)t16) = t19;
    t20 = (t5 + 4);
    t21 = (t6 + 4);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t20);
    t24 = *((unsigned int *)t21);
    t25 = (t23 | t24);
    *((unsigned int *)t22) = t25;
    t26 = *((unsigned int *)t22);
    t27 = (t26 != 0);
    if (t27 == 1)
        goto LAB9;

LAB10:
LAB11:    t44 = (t16 + 4);
    t45 = *((unsigned int *)t44);
    t46 = (~(t45));
    t47 = *((unsigned int *)t16);
    t48 = (t47 & t46);
    t49 = (t48 != 0);
    if (t49 > 0)
        goto LAB12;

LAB13:
LAB14:    goto LAB2;

LAB5:    *((unsigned int *)t6) = 1;
    goto LAB8;

LAB9:    t28 = *((unsigned int *)t16);
    t29 = *((unsigned int *)t22);
    *((unsigned int *)t16) = (t28 | t29);
    t30 = (t5 + 4);
    t31 = (t6 + 4);
    t32 = *((unsigned int *)t30);
    t33 = (~(t32));
    t34 = *((unsigned int *)t5);
    t35 = (t34 & t33);
    t36 = *((unsigned int *)t31);
    t37 = (~(t36));
    t38 = *((unsigned int *)t6);
    t39 = (t38 & t37);
    t40 = (~(t35));
    t41 = (~(t39));
    t42 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t42 & t40);
    t43 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t43 & t41);
    goto LAB11;

LAB12:    xsi_set_current_line(282, ng0);
    t52 = (t0 + 2760);
    t53 = (t52 + 36U);
    t54 = *((char **)t53);
    memset(t51, 0, 8);
    t55 = (t51 + 4);
    t56 = (t54 + 4);
    t57 = *((unsigned int *)t54);
    t58 = (t57 >> 1);
    *((unsigned int *)t51) = t58;
    t59 = *((unsigned int *)t56);
    t60 = (t59 >> 1);
    *((unsigned int *)t55) = t60;
    t61 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t61 & 32767U);
    t62 = *((unsigned int *)t55);
    *((unsigned int *)t55) = (t62 & 32767U);
    t63 = (t0 + 3496);
    t64 = (t63 + 36U);
    t65 = *((char **)t64);
    xsi_vlogtype_concat(t50, 16, 16, 2U, t65, 1, t51, 15);
    t66 = (t0 + 2760);
    xsi_vlogvar_wait_assign_value(t66, t50, 0, 0, 16, 1000LL);
    goto LAB14;

}

static void Cont_284_11(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
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

LAB0:    t1 = (t0 + 5788U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(284, ng0);
    t2 = (t0 + 2760);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t5, 0, 8);
    t6 = (t5 + 4);
    t7 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 0);
    t10 = (t9 & 1);
    *((unsigned int *)t5) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    t13 = (t12 & 1);
    *((unsigned int *)t6) = t13;
    t14 = (t0 + 7808);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 40U);
    t18 = *((char **)t17);
    memset(t18, 0, 8);
    t19 = 1U;
    t20 = t19;
    t21 = (t5 + 4);
    t22 = *((unsigned int *)t5);
    t19 = (t19 & t22);
    t23 = *((unsigned int *)t21);
    t20 = (t20 & t23);
    t24 = (t18 + 4);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 | t19);
    t26 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t26 | t20);
    xsi_driver_vfirst_trans(t14, 0, 0);
    t27 = (t0 + 7512);
    *((int *)t27) = 1;

LAB1:    return;
}

static void Cont_291_12(char *t0)
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

LAB0:    t1 = (t0 + 5932U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(291, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 7844);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void Always_299_13(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;

LAB0:    t1 = (t0 + 6076U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(299, ng0);
    t2 = (t0 + 7520);
    *((int *)t2) = 1;
    t3 = (t0 + 6104);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(300, ng0);
    t4 = (t0 + 968U);
    t5 = *((char **)t4);
    t4 = (t0 + 2852);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 1000LL);
    goto LAB2;

}

static void Always_305_14(char *t0)
{
    char t4[8];
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
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;

LAB0:    t1 = (t0 + 6220U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(305, ng0);
    t2 = (t0 + 7528);
    *((int *)t2) = 1;
    t3 = (t0 + 6248);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(306, ng0);
    t5 = (t0 + 3496);
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
        goto LAB8;

LAB6:    if (*((unsigned int *)t8) == 0)
        goto LAB5;

LAB7:    t14 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t14) = 1;

LAB8:    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (~(t16));
    t18 = *((unsigned int *)t4);
    t19 = (t18 & t17);
    t20 = (t19 != 0);
    if (t20 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(307, ng0);
    t2 = (t0 + 2852);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t6 = (t5 + 4);
    t9 = *((unsigned int *)t6);
    t10 = (~(t9));
    t11 = *((unsigned int *)t5);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB12;

LAB13:
LAB14:
LAB11:    goto LAB2;

LAB5:    *((unsigned int *)t4) = 1;
    goto LAB8;

LAB9:    xsi_set_current_line(306, ng0);
    t21 = ((char*)((ng2)));
    t22 = (t0 + 2944);
    xsi_vlogvar_wait_assign_value(t22, t21, 0, 0, 1, 1000LL);
    goto LAB11;

LAB12:    xsi_set_current_line(307, ng0);
    t7 = ((char*)((ng1)));
    t8 = (t0 + 2944);
    xsi_vlogvar_wait_assign_value(t8, t7, 0, 0, 1, 1000LL);
    goto LAB14;

}

static void Cont_310_15(char *t0)
{
    char t5[8];
    char t16[8];
    char t51[8];
    char t63[8];
    char t95[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    int t40;
    int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    char *t49;
    char *t50;
    char *t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    char *t61;
    char *t62;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    char *t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    int t87;
    int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    char *t100;
    char *t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    char *t109;
    char *t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    char *t123;
    char *t124;
    char *t125;
    char *t126;
    char *t127;
    unsigned int t128;
    unsigned int t129;
    char *t130;
    unsigned int t131;
    unsigned int t132;
    char *t133;
    unsigned int t134;
    unsigned int t135;
    char *t136;

LAB0:    t1 = (t0 + 6364U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(310, ng0);
    t2 = (t0 + 2852);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t6 = (t0 + 2944);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    memset(t5, 0, 8);
    t9 = (t8 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (~(t10));
    t12 = *((unsigned int *)t8);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB7;

LAB5:    if (*((unsigned int *)t9) == 0)
        goto LAB4;

LAB6:    t15 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t15) = 1;

LAB7:    t17 = *((unsigned int *)t4);
    t18 = *((unsigned int *)t5);
    t19 = (t17 & t18);
    *((unsigned int *)t16) = t19;
    t20 = (t4 + 4);
    t21 = (t5 + 4);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t20);
    t24 = *((unsigned int *)t21);
    t25 = (t23 | t24);
    *((unsigned int *)t22) = t25;
    t26 = *((unsigned int *)t22);
    t27 = (t26 != 0);
    if (t27 == 1)
        goto LAB8;

LAB9:
LAB10:    t48 = (t0 + 3036);
    t49 = (t48 + 36U);
    t50 = *((char **)t49);
    memset(t51, 0, 8);
    t52 = (t51 + 4);
    t53 = (t50 + 4);
    t54 = *((unsigned int *)t50);
    t55 = (t54 >> 0);
    t56 = (t55 & 1);
    *((unsigned int *)t51) = t56;
    t57 = *((unsigned int *)t53);
    t58 = (t57 >> 0);
    t59 = (t58 & 1);
    *((unsigned int *)t52) = t59;
    t60 = (t0 + 3496);
    t61 = (t60 + 36U);
    t62 = *((char **)t61);
    t64 = *((unsigned int *)t51);
    t65 = *((unsigned int *)t62);
    t66 = (t64 & t65);
    *((unsigned int *)t63) = t66;
    t67 = (t51 + 4);
    t68 = (t62 + 4);
    t69 = (t63 + 4);
    t70 = *((unsigned int *)t67);
    t71 = *((unsigned int *)t68);
    t72 = (t70 | t71);
    *((unsigned int *)t69) = t72;
    t73 = *((unsigned int *)t69);
    t74 = (t73 != 0);
    if (t74 == 1)
        goto LAB11;

LAB12:
LAB13:    t96 = *((unsigned int *)t16);
    t97 = *((unsigned int *)t63);
    t98 = (t96 | t97);
    *((unsigned int *)t95) = t98;
    t99 = (t16 + 4);
    t100 = (t63 + 4);
    t101 = (t95 + 4);
    t102 = *((unsigned int *)t99);
    t103 = *((unsigned int *)t100);
    t104 = (t102 | t103);
    *((unsigned int *)t101) = t104;
    t105 = *((unsigned int *)t101);
    t106 = (t105 != 0);
    if (t106 == 1)
        goto LAB14;

LAB15:
LAB16:    t123 = (t0 + 7880);
    t124 = (t123 + 32U);
    t125 = *((char **)t124);
    t126 = (t125 + 40U);
    t127 = *((char **)t126);
    memset(t127, 0, 8);
    t128 = 1U;
    t129 = t128;
    t130 = (t95 + 4);
    t131 = *((unsigned int *)t95);
    t128 = (t128 & t131);
    t132 = *((unsigned int *)t130);
    t129 = (t129 & t132);
    t133 = (t127 + 4);
    t134 = *((unsigned int *)t127);
    *((unsigned int *)t127) = (t134 | t128);
    t135 = *((unsigned int *)t133);
    *((unsigned int *)t133) = (t135 | t129);
    xsi_driver_vfirst_trans(t123, 0, 0);
    t136 = (t0 + 7536);
    *((int *)t136) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t5) = 1;
    goto LAB7;

LAB8:    t28 = *((unsigned int *)t16);
    t29 = *((unsigned int *)t22);
    *((unsigned int *)t16) = (t28 | t29);
    t30 = (t4 + 4);
    t31 = (t5 + 4);
    t32 = *((unsigned int *)t4);
    t33 = (~(t32));
    t34 = *((unsigned int *)t30);
    t35 = (~(t34));
    t36 = *((unsigned int *)t5);
    t37 = (~(t36));
    t38 = *((unsigned int *)t31);
    t39 = (~(t38));
    t40 = (t33 & t35);
    t41 = (t37 & t39);
    t42 = (~(t40));
    t43 = (~(t41));
    t44 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t44 & t42);
    t45 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t45 & t43);
    t46 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t46 & t42);
    t47 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t47 & t43);
    goto LAB10;

LAB11:    t75 = *((unsigned int *)t63);
    t76 = *((unsigned int *)t69);
    *((unsigned int *)t63) = (t75 | t76);
    t77 = (t51 + 4);
    t78 = (t62 + 4);
    t79 = *((unsigned int *)t51);
    t80 = (~(t79));
    t81 = *((unsigned int *)t77);
    t82 = (~(t81));
    t83 = *((unsigned int *)t62);
    t84 = (~(t83));
    t85 = *((unsigned int *)t78);
    t86 = (~(t85));
    t87 = (t80 & t82);
    t88 = (t84 & t86);
    t89 = (~(t87));
    t90 = (~(t88));
    t91 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t91 & t89);
    t92 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t92 & t90);
    t93 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t93 & t89);
    t94 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t94 & t90);
    goto LAB13;

LAB14:    t107 = *((unsigned int *)t95);
    t108 = *((unsigned int *)t101);
    *((unsigned int *)t95) = (t107 | t108);
    t109 = (t16 + 4);
    t110 = (t63 + 4);
    t111 = *((unsigned int *)t109);
    t112 = (~(t111));
    t113 = *((unsigned int *)t16);
    t114 = (t113 & t112);
    t115 = *((unsigned int *)t110);
    t116 = (~(t115));
    t117 = *((unsigned int *)t63);
    t118 = (t117 & t116);
    t119 = (~(t114));
    t120 = (~(t118));
    t121 = *((unsigned int *)t101);
    *((unsigned int *)t101) = (t121 & t119);
    t122 = *((unsigned int *)t101);
    *((unsigned int *)t101) = (t122 & t120);
    goto LAB16;

}

static void Always_314_16(char *t0)
{
    char t4[8];
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 6508U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(314, ng0);
    t2 = (t0 + 7544);
    *((int *)t2) = 1;
    t3 = (t0 + 6536);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(315, ng0);
    t6 = (t0 + 3036);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    memset(t5, 0, 8);
    t9 = (t5 + 4);
    t10 = (t8 + 4);
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 1);
    *((unsigned int *)t5) = t12;
    t13 = *((unsigned int *)t10);
    t14 = (t13 >> 1);
    *((unsigned int *)t9) = t14;
    t15 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t15 & 32767U);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 & 32767U);
    t17 = (t0 + 1612U);
    t18 = *((char **)t17);
    xsi_vlogtype_concat(t4, 16, 16, 2U, t18, 1, t5, 15);
    t17 = (t0 + 3036);
    xsi_vlogvar_wait_assign_value(t17, t4, 0, 0, 16, 1000LL);
    goto LAB2;

}

static void Always_319_17(char *t0)
{
    char t7[8];
    char t19[8];
    char t36[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    char *t35;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;
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
    int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;

LAB0:    t1 = (t0 + 6652U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(319, ng0);
    t2 = (t0 + 7552);
    *((int *)t2) = 1;
    t3 = (t0 + 6680);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(320, ng0);
    t4 = (t0 + 3036);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    memset(t7, 0, 8);
    t8 = (t7 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 0);
    t12 = (t11 & 1);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t9);
    t14 = (t13 >> 0);
    t15 = (t14 & 1);
    *((unsigned int *)t8) = t15;
    t16 = (t0 + 2852);
    t17 = (t16 + 36U);
    t18 = *((char **)t17);
    t20 = *((unsigned int *)t7);
    t21 = *((unsigned int *)t18);
    t22 = (t20 ^ t21);
    *((unsigned int *)t19) = t22;
    t23 = (t7 + 4);
    t24 = (t18 + 4);
    t25 = (t19 + 4);
    t26 = *((unsigned int *)t23);
    t27 = *((unsigned int *)t24);
    t28 = (t26 | t27);
    *((unsigned int *)t25) = t28;
    t29 = *((unsigned int *)t25);
    t30 = (t29 != 0);
    if (t30 == 1)
        goto LAB5;

LAB6:
LAB7:    t33 = (t0 + 2944);
    t34 = (t33 + 36U);
    t35 = *((char **)t34);
    t37 = *((unsigned int *)t19);
    t38 = *((unsigned int *)t35);
    t39 = (t37 & t38);
    *((unsigned int *)t36) = t39;
    t40 = (t19 + 4);
    t41 = (t35 + 4);
    t42 = (t36 + 4);
    t43 = *((unsigned int *)t40);
    t44 = *((unsigned int *)t41);
    t45 = (t43 | t44);
    *((unsigned int *)t42) = t45;
    t46 = *((unsigned int *)t42);
    t47 = (t46 != 0);
    if (t47 == 1)
        goto LAB8;

LAB9:
LAB10:    t68 = (t0 + 3128);
    xsi_vlogvar_wait_assign_value(t68, t36, 0, 0, 1, 1000LL);
    goto LAB2;

LAB5:    t31 = *((unsigned int *)t19);
    t32 = *((unsigned int *)t25);
    *((unsigned int *)t19) = (t31 | t32);
    goto LAB7;

LAB8:    t48 = *((unsigned int *)t36);
    t49 = *((unsigned int *)t42);
    *((unsigned int *)t36) = (t48 | t49);
    t50 = (t19 + 4);
    t51 = (t35 + 4);
    t52 = *((unsigned int *)t19);
    t53 = (~(t52));
    t54 = *((unsigned int *)t50);
    t55 = (~(t54));
    t56 = *((unsigned int *)t35);
    t57 = (~(t56));
    t58 = *((unsigned int *)t51);
    t59 = (~(t58));
    t60 = (t53 & t55);
    t61 = (t57 & t59);
    t62 = (~(t60));
    t63 = (~(t61));
    t64 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t64 & t62);
    t65 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t65 & t63);
    t66 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t66 & t62);
    t67 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t67 & t63);
    goto LAB10;

}

static void Always_325_18(char *t0)
{
    char t7[8];
    char t19[8];
    char t51[8];
    char t62[8];
    char t96[8];
    char t97[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    int t43;
    int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t52;
    char *t53;
    char *t54;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    char *t67;
    char *t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    char *t76;
    char *t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    char *t98;
    char *t99;
    char *t100;
    char *t101;
    char *t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;

LAB0:    t1 = (t0 + 6796U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(325, ng0);
    t2 = (t0 + 7560);
    *((int *)t2) = 1;
    t3 = (t0 + 6824);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(326, ng0);
    t4 = (t0 + 3036);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    memset(t7, 0, 8);
    t8 = (t7 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 0);
    t12 = (t11 & 1);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t9);
    t14 = (t13 >> 0);
    t15 = (t14 & 1);
    *((unsigned int *)t8) = t15;
    t16 = (t0 + 2852);
    t17 = (t16 + 36U);
    t18 = *((char **)t17);
    t20 = *((unsigned int *)t7);
    t21 = *((unsigned int *)t18);
    t22 = (t20 & t21);
    *((unsigned int *)t19) = t22;
    t23 = (t7 + 4);
    t24 = (t18 + 4);
    t25 = (t19 + 4);
    t26 = *((unsigned int *)t23);
    t27 = *((unsigned int *)t24);
    t28 = (t26 | t27);
    *((unsigned int *)t25) = t28;
    t29 = *((unsigned int *)t25);
    t30 = (t29 != 0);
    if (t30 == 1)
        goto LAB5;

LAB6:
LAB7:    t52 = (t0 + 3496);
    t53 = (t52 + 36U);
    t54 = *((char **)t53);
    memset(t51, 0, 8);
    t55 = (t54 + 4);
    t56 = *((unsigned int *)t55);
    t57 = (~(t56));
    t58 = *((unsigned int *)t54);
    t59 = (t58 & t57);
    t60 = (t59 & 1U);
    if (t60 != 0)
        goto LAB11;

LAB9:    if (*((unsigned int *)t55) == 0)
        goto LAB8;

LAB10:    t61 = (t51 + 4);
    *((unsigned int *)t51) = 1;
    *((unsigned int *)t61) = 1;

LAB11:    t63 = *((unsigned int *)t19);
    t64 = *((unsigned int *)t51);
    t65 = (t63 | t64);
    *((unsigned int *)t62) = t65;
    t66 = (t19 + 4);
    t67 = (t51 + 4);
    t68 = (t62 + 4);
    t69 = *((unsigned int *)t66);
    t70 = *((unsigned int *)t67);
    t71 = (t69 | t70);
    *((unsigned int *)t68) = t71;
    t72 = *((unsigned int *)t68);
    t73 = (t72 != 0);
    if (t73 == 1)
        goto LAB12;

LAB13:
LAB14:    t90 = (t62 + 4);
    t91 = *((unsigned int *)t90);
    t92 = (~(t91));
    t93 = *((unsigned int *)t62);
    t94 = (t93 & t92);
    t95 = (t94 != 0);
    if (t95 > 0)
        goto LAB15;

LAB16:
LAB17:    goto LAB2;

LAB5:    t31 = *((unsigned int *)t19);
    t32 = *((unsigned int *)t25);
    *((unsigned int *)t19) = (t31 | t32);
    t33 = (t7 + 4);
    t34 = (t18 + 4);
    t35 = *((unsigned int *)t7);
    t36 = (~(t35));
    t37 = *((unsigned int *)t33);
    t38 = (~(t37));
    t39 = *((unsigned int *)t18);
    t40 = (~(t39));
    t41 = *((unsigned int *)t34);
    t42 = (~(t41));
    t43 = (t36 & t38);
    t44 = (t40 & t42);
    t45 = (~(t43));
    t46 = (~(t44));
    t47 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t47 & t45);
    t48 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t48 & t46);
    t49 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t49 & t45);
    t50 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t50 & t46);
    goto LAB7;

LAB8:    *((unsigned int *)t51) = 1;
    goto LAB11;

LAB12:    t74 = *((unsigned int *)t62);
    t75 = *((unsigned int *)t68);
    *((unsigned int *)t62) = (t74 | t75);
    t76 = (t19 + 4);
    t77 = (t51 + 4);
    t78 = *((unsigned int *)t76);
    t79 = (~(t78));
    t80 = *((unsigned int *)t19);
    t81 = (t80 & t79);
    t82 = *((unsigned int *)t77);
    t83 = (~(t82));
    t84 = *((unsigned int *)t51);
    t85 = (t84 & t83);
    t86 = (~(t81));
    t87 = (~(t85));
    t88 = *((unsigned int *)t68);
    *((unsigned int *)t68) = (t88 & t86);
    t89 = *((unsigned int *)t68);
    *((unsigned int *)t68) = (t89 & t87);
    goto LAB14;

LAB15:    xsi_set_current_line(327, ng0);
    t98 = (t0 + 3220);
    t99 = (t98 + 36U);
    t100 = *((char **)t99);
    memset(t97, 0, 8);
    t101 = (t97 + 4);
    t102 = (t100 + 4);
    t103 = *((unsigned int *)t100);
    t104 = (t103 >> 1);
    *((unsigned int *)t97) = t104;
    t105 = *((unsigned int *)t102);
    t106 = (t105 >> 1);
    *((unsigned int *)t101) = t106;
    t107 = *((unsigned int *)t97);
    *((unsigned int *)t97) = (t107 & 3U);
    t108 = *((unsigned int *)t101);
    *((unsigned int *)t101) = (t108 & 3U);
    t109 = (t0 + 3496);
    t110 = (t109 + 36U);
    t111 = *((char **)t110);
    xsi_vlogtype_concat(t96, 3, 3, 2U, t111, 1, t97, 2);
    t112 = (t0 + 3220);
    xsi_vlogvar_wait_assign_value(t112, t96, 0, 0, 3, 1000LL);
    goto LAB17;

}

static void Cont_330_19(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
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

LAB0:    t1 = (t0 + 6940U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(330, ng0);
    t2 = (t0 + 3220);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t5, 0, 8);
    t6 = (t5 + 4);
    t7 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 0);
    t10 = (t9 & 1);
    *((unsigned int *)t5) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    t13 = (t12 & 1);
    *((unsigned int *)t6) = t13;
    t14 = (t0 + 7916);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 40U);
    t18 = *((char **)t17);
    memset(t18, 0, 8);
    t19 = 1U;
    t20 = t19;
    t21 = (t5 + 4);
    t22 = *((unsigned int *)t5);
    t19 = (t19 & t22);
    t23 = *((unsigned int *)t21);
    t20 = (t20 & t23);
    t24 = (t18 + 4);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 | t19);
    t26 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t26 | t20);
    xsi_driver_vfirst_trans(t14, 0, 0);
    t27 = (t0 + 7568);
    *((int *)t27) = 1;

LAB1:    return;
}

static void Always_334_20(char *t0)
{
    char t6[8];
    char t16[8];
    char t50[8];
    char t51[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t52;
    char *t53;
    char *t54;
    char *t55;
    char *t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    char *t63;
    char *t64;
    char *t65;
    char *t66;

LAB0:    t1 = (t0 + 7084U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(334, ng0);
    t2 = (t0 + 7576);
    *((int *)t2) = 1;
    t3 = (t0 + 7112);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(335, ng0);
    t4 = (t0 + 1336U);
    t5 = *((char **)t4);
    t4 = (t0 + 3496);
    t7 = (t4 + 36U);
    t8 = *((char **)t7);
    memset(t6, 0, 8);
    t9 = (t8 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (~(t10));
    t12 = *((unsigned int *)t8);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t9) == 0)
        goto LAB5;

LAB7:    t15 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t15) = 1;

LAB8:    t17 = *((unsigned int *)t5);
    t18 = *((unsigned int *)t6);
    t19 = (t17 | t18);
    *((unsigned int *)t16) = t19;
    t20 = (t5 + 4);
    t21 = (t6 + 4);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t20);
    t24 = *((unsigned int *)t21);
    t25 = (t23 | t24);
    *((unsigned int *)t22) = t25;
    t26 = *((unsigned int *)t22);
    t27 = (t26 != 0);
    if (t27 == 1)
        goto LAB9;

LAB10:
LAB11:    t44 = (t16 + 4);
    t45 = *((unsigned int *)t44);
    t46 = (~(t45));
    t47 = *((unsigned int *)t16);
    t48 = (t47 & t46);
    t49 = (t48 != 0);
    if (t49 > 0)
        goto LAB12;

LAB13:
LAB14:    goto LAB2;

LAB5:    *((unsigned int *)t6) = 1;
    goto LAB8;

LAB9:    t28 = *((unsigned int *)t16);
    t29 = *((unsigned int *)t22);
    *((unsigned int *)t16) = (t28 | t29);
    t30 = (t5 + 4);
    t31 = (t6 + 4);
    t32 = *((unsigned int *)t30);
    t33 = (~(t32));
    t34 = *((unsigned int *)t5);
    t35 = (t34 & t33);
    t36 = *((unsigned int *)t31);
    t37 = (~(t36));
    t38 = *((unsigned int *)t6);
    t39 = (t38 & t37);
    t40 = (~(t35));
    t41 = (~(t39));
    t42 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t42 & t40);
    t43 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t43 & t41);
    goto LAB11;

LAB12:    xsi_set_current_line(336, ng0);
    t52 = (t0 + 3312);
    t53 = (t52 + 36U);
    t54 = *((char **)t53);
    memset(t51, 0, 8);
    t55 = (t51 + 4);
    t56 = (t54 + 4);
    t57 = *((unsigned int *)t54);
    t58 = (t57 >> 1);
    *((unsigned int *)t51) = t58;
    t59 = *((unsigned int *)t56);
    t60 = (t59 >> 1);
    *((unsigned int *)t55) = t60;
    t61 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t61 & 127U);
    t62 = *((unsigned int *)t55);
    *((unsigned int *)t55) = (t62 & 127U);
    t63 = (t0 + 3496);
    t64 = (t63 + 36U);
    t65 = *((char **)t64);
    xsi_vlogtype_concat(t50, 8, 8, 2U, t65, 1, t51, 7);
    t66 = (t0 + 3312);
    xsi_vlogvar_wait_assign_value(t66, t50, 0, 0, 8, 1000LL);
    goto LAB14;

}

static void Cont_339_21(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
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

LAB0:    t1 = (t0 + 7228U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(339, ng0);
    t2 = (t0 + 3312);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t5, 0, 8);
    t6 = (t5 + 4);
    t7 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 0);
    t10 = (t9 & 1);
    *((unsigned int *)t5) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    t13 = (t12 & 1);
    *((unsigned int *)t6) = t13;
    t14 = (t0 + 7952);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 40U);
    t18 = *((char **)t17);
    memset(t18, 0, 8);
    t19 = 1U;
    t20 = t19;
    t21 = (t5 + 4);
    t22 = *((unsigned int *)t5);
    t19 = (t19 & t22);
    t23 = *((unsigned int *)t21);
    t20 = (t20 & t23);
    t24 = (t18 + 4);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 | t19);
    t26 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t26 | t20);
    xsi_driver_vfirst_trans(t14, 0, 0);
    t27 = (t0 + 7584);
    *((int *)t27) = 1;

LAB1:    return;
}


extern void work_m_00000000000493043966_0182723977_init()
{
	static char *pe[] = {(void *)Always_195_0,(void *)Cont_212_1,(void *)Cont_216_2,(void *)Always_222_3,(void *)Always_226_4,(void *)Always_231_5,(void *)Cont_238_6,(void *)Cont_250_7,(void *)Always_269_8,(void *)Cont_275_9,(void *)Always_280_10,(void *)Cont_284_11,(void *)Cont_291_12,(void *)Always_299_13,(void *)Always_305_14,(void *)Cont_310_15,(void *)Always_314_16,(void *)Always_319_17,(void *)Always_325_18,(void *)Cont_330_19,(void *)Always_334_20,(void *)Cont_339_21};
	xsi_register_didat("work_m_00000000000493043966_0182723977", "isim/FrameGenChk_tb_isim_beh.exe.sim/work/m_00000000000493043966_0182723977.didat");
	xsi_register_executes(pe);
}
