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
static const char *ng0 = "v:/hipsBuilds/P_hips_v23.0/rst/hips/gtxe1/B_GTXE1_enc.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};

static void NetReassign_8579_7(char *);
static void NetReassign_8579_8(char *);


static void Initial_8578_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    char *t4;

LAB0:    t1 = (t0 + 1628U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(8578, ng0);

LAB4:    xsi_set_current_line(8579, ng0);
    t2 = (t0 + 4216);
    memset(t2, -1, 4);
    t3 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t3 & 1U);
    NetReassign_8579_7(t0);
    xsi_set_current_line(8579, ng0);
    t2 = (t0 + 4220);
    memset(t2, -1, 4);
    t3 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t3 & 1U);
    NetReassign_8579_8(t0);
    xsi_set_current_line(8580, ng0);
    t2 = (t0 + 1528);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(8581, ng0);
    t4 = (t0 + 760U);
    xsi_vlogsignal_release_indexed(t4, 0, 0);
    xsi_set_current_line(8581, ng0);
    t2 = (t0 + 852U);
    xsi_vlogsignal_release_indexed(t2, 0, 0);
    goto LAB1;

}

static void Gate_8586_1(char *t0)
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

LAB0:    t1 = (t0 + 1772U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 784U);
    t3 = *((char **)t2);
    t2 = (t0 + 3060);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 3060);
    xsi_driver_vfirst_trans(t8, 0, 0);
    t9 = (t0 + 2976);
    *((int *)t9) = 1;

LAB1:    return;
}

static void Gate_8587_2(char *t0)
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

LAB0:    t1 = (t0 + 1916U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 876U);
    t3 = *((char **)t2);
    t2 = (t0 + 3096);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 3096);
    xsi_driver_vfirst_trans(t8, 0, 0);
    t9 = (t0 + 2984);
    *((int *)t9) = 1;

LAB1:    return;
}

static void Gate_8589_3(char *t0)
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
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 2060U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 784U);
    t3 = *((char **)t2);
    t2 = (t0 + 968U);
    t4 = *((char **)t2);
    t2 = (t0 + 3132);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 760U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 3132);
    t11 = (t10 + 32U);
    t12 = (t0 + 760U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 3132);
    xsi_driver_vfirst_trans_bufif(t13, 0, 0);
    t14 = (t0 + 2992);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_8590_4(char *t0)
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
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 2204U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 876U);
    t3 = *((char **)t2);
    t2 = (t0 + 968U);
    t4 = *((char **)t2);
    t2 = (t0 + 3168);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 852U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 3168);
    t11 = (t10 + 32U);
    t12 = (t0 + 852U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 3168);
    xsi_driver_vfirst_trans_bufif(t13, 0, 0);
    t14 = (t0 + 3000);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_8591_5(char *t0)
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
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 2348U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 600U);
    t3 = *((char **)t2);
    t2 = (t0 + 968U);
    t4 = *((char **)t2);
    t2 = (t0 + 3204);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 576U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 3204);
    t11 = (t10 + 32U);
    t12 = (t0 + 576U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 3204);
    xsi_driver_vfirst_trans_bufif(t13, 0, 0);
    t14 = (t0 + 3008);
    *((int *)t14) = 1;

LAB1:    return;
}

static void Gate_8592_6(char *t0)
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
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 2492U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    t2 = (t0 + 968U);
    t4 = *((char **)t2);
    t2 = (t0 + 3240);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    t9 = (t0 + 668U);
    xsi_vlog_nmosSwitch_new(t8, t9, 0, 0, t4);
    t10 = (t0 + 3240);
    t11 = (t10 + 32U);
    t12 = (t0 + 668U);
    xsi_vlog_switch_set_trans_strength(*((char **)t11), t12, 0, 0, 0);
    t13 = (t0 + 3240);
    xsi_driver_vfirst_trans_bufif(t13, 0, 0);
    t14 = (t0 + 3016);
    *((int *)t14) = 1;

LAB1:    return;
}

static void NetReassign_8579_7(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    unsigned int t3;
    char *t4;
    char *t5;
    int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;

LAB0:    t1 = (t0 + 2636U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(8579, ng0);
    t3 = 0;
    t2 = ((char*)((ng1)));
    t4 = (t0 + 4216);
    t5 = (t0 + 4216);
    memset(t6, 0, 4);
    t7 = memcmp(t5, t6, 4);
    if (t7 != 0)
        goto LAB4;

LAB5:
LAB1:    return;
LAB4:    t8 = (t0 + 3276);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memset(t12, 0, 8);
    t13 = 1U;
    t14 = t13;
    t15 = (t2 + 4);
    t16 = *((unsigned int *)t2);
    t13 = (t13 & t16);
    t17 = *((unsigned int *)t15);
    t14 = (t14 & t17);
    t18 = (t12 + 4);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t19 | t13);
    t20 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t20 | t14);
    t21 = (t0 + 2536);
    xsi_driver_vforce_trans_indexed(t8, 0, 0, t4, t21);
    t3 = 1;
    goto LAB5;

}

static void NetReassign_8579_8(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    unsigned int t3;
    char *t4;
    char *t5;
    int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;

LAB0:    t1 = (t0 + 2780U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(8579, ng0);
    t3 = 0;
    t2 = ((char*)((ng2)));
    t4 = (t0 + 4220);
    t5 = (t0 + 4220);
    memset(t6, 0, 4);
    t7 = memcmp(t5, t6, 4);
    if (t7 != 0)
        goto LAB4;

LAB5:
LAB1:    return;
LAB4:    t8 = (t0 + 3312);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memset(t12, 0, 8);
    t13 = 1U;
    t14 = t13;
    t15 = (t2 + 4);
    t16 = *((unsigned int *)t2);
    t13 = (t13 & t16);
    t17 = *((unsigned int *)t15);
    t14 = (t14 & t17);
    t18 = (t12 + 4);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t19 | t13);
    t20 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t20 | t14);
    t21 = (t0 + 2680);
    xsi_driver_vforce_trans_indexed(t8, 0, 0, t4, t21);
    t3 = 1;
    goto LAB5;

}


extern void secureip_m_00000000002610590947_3430170656_init()
{
	static char *pe[] = {(void *)Initial_8578_0,(void *)Gate_8586_1,(void *)Gate_8587_2,(void *)Gate_8589_3,(void *)Gate_8590_4,(void *)Gate_8591_5,(void *)Gate_8592_6,(void *)NetReassign_8579_7,(void *)NetReassign_8579_8};
	xsi_register_didat("secureip_m_00000000002610590947_3430170656", "isim/FrameGenChk_tb_isim_beh.exe.sim/secureip/m_00000000002610590947_3430170656.didat");
	xsi_register_executes(pe);
}
