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
static unsigned int ng3[] = {1045575U, 0U};
static unsigned int ng4[] = {1048570U, 0U};
static unsigned int ng5[] = {1043575U, 0U};



static void Initial_90_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(91, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2012);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 20);

LAB1:    return;
}

static void Always_130_1(char *t0)
{
    char t6[8];
    char t20[8];
    char t27[8];
    char t55[8];
    char t70[8];
    char t77[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
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
    char *t18;
    char *t19;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t56;
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
    unsigned int t67;
    char *t68;
    char *t69;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    char *t76;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    char *t81;
    char *t82;
    char *t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    char *t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    char *t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    char *t111;
    char *t112;

LAB0:    t1 = (t0 + 2680U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(130, ng0);
    t2 = (t0 + 3308);
    *((int *)t2) = 1;
    t3 = (t0 + 2708);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(131, ng0);

LAB5:    xsi_set_current_line(132, ng0);
    t4 = (t0 + 1324U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t5 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB6;

LAB7:    if (*((unsigned int *)t4) != 0)
        goto LAB8;

LAB9:    t13 = (t6 + 4);
    t14 = *((unsigned int *)t6);
    t15 = (!(t14));
    t16 = *((unsigned int *)t13);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB10;

LAB11:    memcpy(t27, t6, 8);

LAB12:    memset(t55, 0, 8);
    t56 = (t27 + 4);
    t57 = *((unsigned int *)t56);
    t58 = (~(t57));
    t59 = *((unsigned int *)t27);
    t60 = (t59 & t58);
    t61 = (t60 & 1U);
    if (t61 != 0)
        goto LAB20;

LAB21:    if (*((unsigned int *)t56) != 0)
        goto LAB22;

LAB23:    t63 = (t55 + 4);
    t64 = *((unsigned int *)t55);
    t65 = (!(t64));
    t66 = *((unsigned int *)t63);
    t67 = (t65 || t66);
    if (t67 > 0)
        goto LAB24;

LAB25:    memcpy(t77, t55, 8);

LAB26:    t105 = (t77 + 4);
    t106 = *((unsigned int *)t105);
    t107 = (~(t106));
    t108 = *((unsigned int *)t77);
    t109 = (t108 & t107);
    t110 = (t109 != 0);
    if (t110 > 0)
        goto LAB34;

LAB35:    xsi_set_current_line(135, ng0);
    t2 = (t0 + 2012);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 20, t4, 20, t5, 20);
    t12 = (t0 + 2012);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 20, 1000LL);

LAB36:    goto LAB2;

LAB6:    *((unsigned int *)t6) = 1;
    goto LAB9;

LAB8:    t12 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB9;

LAB10:    t18 = (t0 + 1416U);
    t19 = *((char **)t18);
    memset(t20, 0, 8);
    t18 = (t19 + 4);
    t21 = *((unsigned int *)t18);
    t22 = (~(t21));
    t23 = *((unsigned int *)t19);
    t24 = (t23 & t22);
    t25 = (t24 & 1U);
    if (t25 != 0)
        goto LAB13;

LAB14:    if (*((unsigned int *)t18) != 0)
        goto LAB15;

LAB16:    t28 = *((unsigned int *)t6);
    t29 = *((unsigned int *)t20);
    t30 = (t28 | t29);
    *((unsigned int *)t27) = t30;
    t31 = (t6 + 4);
    t32 = (t20 + 4);
    t33 = (t27 + 4);
    t34 = *((unsigned int *)t31);
    t35 = *((unsigned int *)t32);
    t36 = (t34 | t35);
    *((unsigned int *)t33) = t36;
    t37 = *((unsigned int *)t33);
    t38 = (t37 != 0);
    if (t38 == 1)
        goto LAB17;

LAB18:
LAB19:    goto LAB12;

LAB13:    *((unsigned int *)t20) = 1;
    goto LAB16;

LAB15:    t26 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB16;

LAB17:    t39 = *((unsigned int *)t27);
    t40 = *((unsigned int *)t33);
    *((unsigned int *)t27) = (t39 | t40);
    t41 = (t6 + 4);
    t42 = (t20 + 4);
    t43 = *((unsigned int *)t41);
    t44 = (~(t43));
    t45 = *((unsigned int *)t6);
    t46 = (t45 & t44);
    t47 = *((unsigned int *)t42);
    t48 = (~(t47));
    t49 = *((unsigned int *)t20);
    t50 = (t49 & t48);
    t51 = (~(t46));
    t52 = (~(t50));
    t53 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t53 & t51);
    t54 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t54 & t52);
    goto LAB19;

LAB20:    *((unsigned int *)t55) = 1;
    goto LAB23;

LAB22:    t62 = (t55 + 4);
    *((unsigned int *)t55) = 1;
    *((unsigned int *)t62) = 1;
    goto LAB23;

LAB24:    t68 = (t0 + 1508U);
    t69 = *((char **)t68);
    memset(t70, 0, 8);
    t68 = (t69 + 4);
    t71 = *((unsigned int *)t68);
    t72 = (~(t71));
    t73 = *((unsigned int *)t69);
    t74 = (t73 & t72);
    t75 = (t74 & 1U);
    if (t75 != 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t68) != 0)
        goto LAB29;

LAB30:    t78 = *((unsigned int *)t55);
    t79 = *((unsigned int *)t70);
    t80 = (t78 | t79);
    *((unsigned int *)t77) = t80;
    t81 = (t55 + 4);
    t82 = (t70 + 4);
    t83 = (t77 + 4);
    t84 = *((unsigned int *)t81);
    t85 = *((unsigned int *)t82);
    t86 = (t84 | t85);
    *((unsigned int *)t83) = t86;
    t87 = *((unsigned int *)t83);
    t88 = (t87 != 0);
    if (t88 == 1)
        goto LAB31;

LAB32:
LAB33:    goto LAB26;

LAB27:    *((unsigned int *)t70) = 1;
    goto LAB30;

LAB29:    t76 = (t70 + 4);
    *((unsigned int *)t70) = 1;
    *((unsigned int *)t76) = 1;
    goto LAB30;

LAB31:    t89 = *((unsigned int *)t77);
    t90 = *((unsigned int *)t83);
    *((unsigned int *)t77) = (t89 | t90);
    t91 = (t55 + 4);
    t92 = (t70 + 4);
    t93 = *((unsigned int *)t91);
    t94 = (~(t93));
    t95 = *((unsigned int *)t55);
    t96 = (t95 & t94);
    t97 = *((unsigned int *)t92);
    t98 = (~(t97));
    t99 = *((unsigned int *)t70);
    t100 = (t99 & t98);
    t101 = (~(t96));
    t102 = (~(t100));
    t103 = *((unsigned int *)t83);
    *((unsigned int *)t83) = (t103 & t101);
    t104 = *((unsigned int *)t83);
    *((unsigned int *)t83) = (t104 & t102);
    goto LAB33;

LAB34:    xsi_set_current_line(133, ng0);
    t111 = ((char*)((ng1)));
    t112 = (t0 + 2012);
    xsi_vlogvar_wait_assign_value(t112, t111, 0, 0, 20, 1000LL);
    goto LAB36;

}

static void Always_139_2(char *t0)
{
    char t4[8];
    char t5[8];
    char t10[8];
    char t18[8];
    char t22[8];
    char *t1;
    char *t2;
    char *t3;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
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
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    int t46;
    int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
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
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    char *t71;

LAB0:    t1 = (t0 + 2824U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(139, ng0);
    t2 = (t0 + 3316);
    *((int *)t2) = 1;
    t3 = (t0 + 2852);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(140, ng0);

LAB5:    xsi_set_current_line(141, ng0);
    t6 = (t0 + 2012);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = ((char*)((ng3)));
    memset(t10, 0, 8);
    t11 = (t8 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB7;

LAB6:    t12 = (t9 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB7;

LAB10:    if (*((unsigned int *)t8) > *((unsigned int *)t9))
        goto LAB8;

LAB9:    t14 = (t0 + 2012);
    t15 = (t14 + 36U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng4)));
    memset(t18, 0, 8);
    t19 = (t16 + 4);
    if (*((unsigned int *)t19) != 0)
        goto LAB12;

LAB11:    t20 = (t17 + 4);
    if (*((unsigned int *)t20) != 0)
        goto LAB12;

LAB15:    if (*((unsigned int *)t16) < *((unsigned int *)t17))
        goto LAB13;

LAB14:    t23 = *((unsigned int *)t10);
    t24 = *((unsigned int *)t18);
    t25 = (t23 & t24);
    *((unsigned int *)t22) = t25;
    t26 = (t10 + 4);
    t27 = (t18 + 4);
    t28 = (t22 + 4);
    t29 = *((unsigned int *)t26);
    t30 = *((unsigned int *)t27);
    t31 = (t29 | t30);
    *((unsigned int *)t28) = t31;
    t32 = *((unsigned int *)t28);
    t33 = (t32 != 0);
    if (t33 == 1)
        goto LAB16;

LAB17:
LAB18:    memset(t5, 0, 8);
    t54 = (t22 + 4);
    t55 = *((unsigned int *)t54);
    t56 = (~(t55));
    t57 = *((unsigned int *)t22);
    t58 = (t57 & t56);
    t59 = (t58 & 1U);
    if (t59 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t54) != 0)
        goto LAB21;

LAB22:    t61 = (t5 + 4);
    t62 = *((unsigned int *)t5);
    t63 = *((unsigned int *)t61);
    t64 = (t62 || t63);
    if (t64 > 0)
        goto LAB23;

LAB24:    t66 = *((unsigned int *)t5);
    t67 = (~(t66));
    t68 = *((unsigned int *)t61);
    t69 = (t67 || t68);
    if (t69 > 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t61) > 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t5) > 0)
        goto LAB29;

LAB30:    memcpy(t4, t70, 8);

LAB31:    t71 = (t0 + 1736);
    xsi_vlogvar_wait_assign_value(t71, t4, 0, 0, 1, 1000LL);
    xsi_set_current_line(142, ng0);
    t2 = (t0 + 2012);
    t3 = (t2 + 36U);
    t6 = *((char **)t3);
    t7 = ((char*)((ng5)));
    memset(t10, 0, 8);
    t8 = (t6 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB33;

LAB32:    t9 = (t7 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB33;

LAB36:    if (*((unsigned int *)t6) > *((unsigned int *)t7))
        goto LAB34;

LAB35:    t12 = (t0 + 2012);
    t13 = (t12 + 36U);
    t14 = *((char **)t13);
    t15 = ((char*)((ng4)));
    memset(t18, 0, 8);
    t16 = (t14 + 4);
    if (*((unsigned int *)t16) != 0)
        goto LAB38;

LAB37:    t17 = (t15 + 4);
    if (*((unsigned int *)t17) != 0)
        goto LAB38;

LAB41:    if (*((unsigned int *)t14) < *((unsigned int *)t15))
        goto LAB39;

LAB40:    t23 = *((unsigned int *)t10);
    t24 = *((unsigned int *)t18);
    t25 = (t23 & t24);
    *((unsigned int *)t22) = t25;
    t20 = (t10 + 4);
    t21 = (t18 + 4);
    t26 = (t22 + 4);
    t29 = *((unsigned int *)t20);
    t30 = *((unsigned int *)t21);
    t31 = (t29 | t30);
    *((unsigned int *)t26) = t31;
    t32 = *((unsigned int *)t26);
    t33 = (t32 != 0);
    if (t33 == 1)
        goto LAB42;

LAB43:
LAB44:    memset(t5, 0, 8);
    t36 = (t22 + 4);
    t55 = *((unsigned int *)t36);
    t56 = (~(t55));
    t57 = *((unsigned int *)t22);
    t58 = (t57 & t56);
    t59 = (t58 & 1U);
    if (t59 != 0)
        goto LAB45;

LAB46:    if (*((unsigned int *)t36) != 0)
        goto LAB47;

LAB48:    t54 = (t5 + 4);
    t62 = *((unsigned int *)t5);
    t63 = *((unsigned int *)t54);
    t64 = (t62 || t63);
    if (t64 > 0)
        goto LAB49;

LAB50:    t66 = *((unsigned int *)t5);
    t67 = (~(t66));
    t68 = *((unsigned int *)t54);
    t69 = (t67 || t68);
    if (t69 > 0)
        goto LAB51;

LAB52:    if (*((unsigned int *)t54) > 0)
        goto LAB53;

LAB54:    if (*((unsigned int *)t5) > 0)
        goto LAB55;

LAB56:    memcpy(t4, t61, 8);

LAB57:    t65 = (t0 + 1828);
    xsi_vlogvar_wait_assign_value(t65, t4, 0, 0, 1, 1000LL);
    goto LAB2;

LAB7:    t13 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB9;

LAB8:    *((unsigned int *)t10) = 1;
    goto LAB9;

LAB12:    t21 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB14;

LAB13:    *((unsigned int *)t18) = 1;
    goto LAB14;

LAB16:    t34 = *((unsigned int *)t22);
    t35 = *((unsigned int *)t28);
    *((unsigned int *)t22) = (t34 | t35);
    t36 = (t10 + 4);
    t37 = (t18 + 4);
    t38 = *((unsigned int *)t10);
    t39 = (~(t38));
    t40 = *((unsigned int *)t36);
    t41 = (~(t40));
    t42 = *((unsigned int *)t18);
    t43 = (~(t42));
    t44 = *((unsigned int *)t37);
    t45 = (~(t44));
    t46 = (t39 & t41);
    t47 = (t43 & t45);
    t48 = (~(t46));
    t49 = (~(t47));
    t50 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t50 & t48);
    t51 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t51 & t49);
    t52 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t52 & t48);
    t53 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t53 & t49);
    goto LAB18;

LAB19:    *((unsigned int *)t5) = 1;
    goto LAB22;

LAB21:    t60 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t60) = 1;
    goto LAB22;

LAB23:    t65 = ((char*)((ng2)));
    goto LAB24;

LAB25:    t70 = ((char*)((ng1)));
    goto LAB26;

LAB27:    xsi_vlog_unsigned_bit_combine(t4, 1, t65, 1, t70, 1);
    goto LAB31;

LAB29:    memcpy(t4, t65, 8);
    goto LAB31;

LAB33:    t11 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB35;

LAB34:    *((unsigned int *)t10) = 1;
    goto LAB35;

LAB38:    t19 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB40;

LAB39:    *((unsigned int *)t18) = 1;
    goto LAB40;

LAB42:    t34 = *((unsigned int *)t22);
    t35 = *((unsigned int *)t26);
    *((unsigned int *)t22) = (t34 | t35);
    t27 = (t10 + 4);
    t28 = (t18 + 4);
    t38 = *((unsigned int *)t10);
    t39 = (~(t38));
    t40 = *((unsigned int *)t27);
    t41 = (~(t40));
    t42 = *((unsigned int *)t18);
    t43 = (~(t42));
    t44 = *((unsigned int *)t28);
    t45 = (~(t44));
    t46 = (t39 & t41);
    t47 = (t43 & t45);
    t48 = (~(t46));
    t49 = (~(t47));
    t50 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t50 & t48);
    t51 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t51 & t49);
    t52 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t52 & t48);
    t53 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t53 & t49);
    goto LAB44;

LAB45:    *((unsigned int *)t5) = 1;
    goto LAB48;

LAB47:    t37 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t37) = 1;
    goto LAB48;

LAB49:    t60 = ((char*)((ng2)));
    goto LAB50;

LAB51:    t61 = ((char*)((ng1)));
    goto LAB52;

LAB53:    xsi_vlog_unsigned_bit_combine(t4, 1, t60, 1, t61, 1);
    goto LAB57;

LAB55:    memcpy(t4, t60, 8);
    goto LAB57;

}

static void Always_145_3(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    t1 = (t0 + 2968U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(145, ng0);
    t2 = (t0 + 3324);
    *((int *)t2) = 1;
    t3 = (t0 + 2996);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(146, ng0);

LAB5:    xsi_set_current_line(147, ng0);
    t5 = (t0 + 1736);
    t6 = (t5 + 36U);
    t7 = *((char **)t6);
    t8 = (t0 + 1828);
    t9 = (t8 + 36U);
    t10 = *((char **)t9);
    xsi_vlogtype_concat(t4, 2, 2, 2U, t10, 1, t7, 1);
    t11 = (t0 + 1920);
    xsi_vlogvar_wait_assign_value(t11, t4, 0, 0, 2, 1000LL);
    goto LAB2;

}

static void Cont_153_4(char *t0)
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

LAB0:    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(153, ng0);
    t2 = (t0 + 1920);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 3376);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 3U;
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
    xsi_driver_vfirst_trans(t5, 0, 1);
    t18 = (t0 + 3332);
    *((int *)t18) = 1;

LAB1:    return;
}


extern void work_m_00000000002417491787_3505455210_init()
{
	static char *pe[] = {(void *)Initial_90_0,(void *)Always_130_1,(void *)Always_139_2,(void *)Always_145_3,(void *)Cont_153_4};
	xsi_register_didat("work_m_00000000002417491787_3505455210", "isim/FrameGenChk_tb_isim_beh.exe.sim/work/m_00000000002417491787_3505455210.didat");
	xsi_register_executes(pe);
}
