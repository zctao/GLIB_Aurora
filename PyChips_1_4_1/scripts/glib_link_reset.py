from PyChipsUser import *
import sys
import os
from time import sleep
#####################################################################
glibAddrTable = AddressTable("./glibAddrTable.dat")
print
print
print "--=======================================--"
print "  Opening GLIB with IP 192.168.0.111"
print "--=======================================--"
glib = ChipsBusUdp(glibAddrTable, "192.168.0.111", 50001)
print
print
#####################################################################
#	regs_to_wb(0)		<= x"55534552"								; --"USER"	
#	regs_to_wb(1)		<= x"56545278"								; --"fmc1"	
#	regs_to_wb(2) 		<= user_firmware_id
#	------------------
#	reg_fmc1_link_ctrl<= regs_from_wb(17)						;
#	reg_fmc1_sram_ctrl<= regs_from_wb(18)						;
#	reg_fmc1_gtx_ctrl <= regs_from_wb(19)						;
#	reg_fmc1_bert_ctrl<= regs_from_wb(20)						;
#	------------------
#	reg_sfp_link_ctrl	<= regs_from_wb(25)						;
#	reg_sfp_sram_ctrl	<= regs_from_wb(26)						;
#	reg_sfp_gtx_ctrl 	<= regs_from_wb(27)						;
#	reg_sfp_bert_ctrl	<= regs_from_wb(28)						;
#####################################################################
reg_fmc_gbt_status_offset   =  4	
reg_fmc_bitslip_ctrl_offset = 16
reg_fmc_link_ctrl_offset    = 17
reg_fmc_sram_ctrl_offset    = 18			
reg_fmc_gtx_ctrl_offset 	= 19
reg_fmc_bert_ctrl_offset 	= 20
#
reg_sfp_gbt_status_offset   = 10	
reg_sfp_bitslip_ctrl_offset = 24
reg_sfp_link_ctrl_offset    = 25
reg_sfp_sram_ctrl_offset    = 26			
reg_sfp_gtx_ctrl_offset 	= 27
reg_sfp_bert_ctrl_offset 	= 28
#####################################################################

lb_setting = 0 *(2**28)

glib.write("user_wb_regs",lb_setting + 0x00000505, reg_fmc_link_ctrl_offset)
glib.write("user_wb_regs",lb_setting + 0x00000505, reg_sfp_link_ctrl_offset)

glib.write("user_wb_regs",lb_setting + 0x00000504, reg_fmc_link_ctrl_offset)
glib.write("user_wb_regs",lb_setting + 0x00000504, reg_sfp_link_ctrl_offset)

glib.write("user_wb_regs",lb_setting + 0x00000500, reg_fmc_link_ctrl_offset)
glib.write("user_wb_regs",lb_setting + 0x00000500, reg_sfp_link_ctrl_offset)

glib.write("user_wb_regs",lb_setting + 0x00000400, reg_fmc_link_ctrl_offset)
glib.write("user_wb_regs",lb_setting + 0x00000400, reg_sfp_link_ctrl_offset)

glib.write("user_wb_regs",lb_setting + 0x00000000, reg_fmc_link_ctrl_offset)
glib.write("user_wb_regs",lb_setting + 0x00000000, reg_sfp_link_ctrl_offset)
#
print
print "-> link reset sequence"
print
print "-> gtx_tx|gbt_tx|gtx_rx|gbt_rx"
print "-> ------+------+------+------"
print "->   1      1      1      1   "
print "->   0      1      1      1   "
print "->   0      0      1      1   "
print "->   0      0      0      1   "
print "->   0      0      0      0   "
print
print
print "-> done"
print
print "--=======================================--"
print 
print
