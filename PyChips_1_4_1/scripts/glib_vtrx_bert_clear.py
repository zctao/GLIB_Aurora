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
#	regs_to_wb(4)		<= reg_fmc1_gbt_status					;	
#	regs_to_wb(5)		<= reg_fmc1_bert_status_words_lo		;	
#	regs_to_wb(6)		<= reg_fmc1_bert_status_words_hi		;	
#	regs_to_wb(7)		<= reg_fmc1_bert_status_errors_lo		;	
#	regs_to_wb(8)		<= reg_fmc1_bert_status_errors_hi		;	
#	------------------
#	regs_to_wb(10)		<= reg_sfp_gbt_status					;	
#	regs_to_wb(11)		<= reg_sfp_bert_status_words_lo			;	
#	regs_to_wb(12)		<= reg_sfp_bert_status_words_hi			;	
#	regs_to_wb(13)		<= reg_sfp_bert_status_errors_lo		;	
#	regs_to_wb(14)		<= reg_sfp_bert_status_errors_hi		;	
#	------------------
#	reg_fmc1_link_ctrl	<= regs_from_wb(17)						;
#	reg_fmc1_sram_ctrl	<= regs_from_wb(18)						;
#	reg_fmc1_gtx_ctrl 	<= regs_from_wb(19)						;
#	reg_fmc1_bert_ctrl	<= regs_from_wb(20)						;
#	------------------
#	reg_sfp_link_ctrl	<= regs_from_wb(25)						;
#	reg_sfp_sram_ctrl	<= regs_from_wb(26)						;
#	reg_sfp_gtx_ctrl 	<= regs_from_wb(27)						;
#	reg_sfp_bert_ctrl	<= regs_from_wb(28)						;
#####################################################################
reg_fmc_gbt_status_offset 	=  4	
reg_sfp_gbt_status_offset 	= 10	
#
reg_fmc_bert_ctrl_offset    = 20
reg_sfp_bert_ctrl_offset    = 28
#####################################################################
# get board status
#####################################################################
# os.system('python glib_board_info.py')
#####################################################################
print 
print "-> cdce locked:", glib.read("cdce_lock")
#####################################################################
arguments = len(sys.argv)
if (arguments>1):
	if   (sys.argv[1] == "sfp"):
		bert_ctrl_offset = reg_sfp_bert_ctrl_offset
		gbt_status_offset = reg_sfp_gbt_status_offset
		print
		print "-> sfp bert selected"
	else:	
		bert_ctrl_offset = reg_fmc_bert_ctrl_offset
		gbt_status_offset = reg_fmc_gbt_status_offset
		print
		print "-> fmc bert selected"
else:	
	bert_ctrl_offset = reg_fmc_bert_ctrl_offset
	gbt_status_offset = reg_fmc_gbt_status_offset
	print
	print "-> fmc bert selected"
#
#####################################################################
gbt_status  = glib.read("user_wb_regs", gbt_status_offset)
gbt_aligned = gbt_status / 256
print
print "->",sys.argv[1], "gbt aligned:", gbt_aligned
#####################################################################
latency = 0xff & glib.read("user_wb_regs",bert_ctrl_offset)
print
print "-> clear counters"
print
print "-> clear |latch |enable |load  |latency"
print "-> ------+------+------+------+-------"
print "->   1      0      1      0       ", latency
print "->   0      0      1      0       ", latency
#print "->   0      1      1      0       ", latency
#print "->   0      0      1      0       ", latency
print
glib.write("user_wb_regs",0x101000+latency, bert_ctrl_offset)
glib.write("user_wb_regs",0x001000+latency, bert_ctrl_offset)
#glib.write("user_wb_regs",0x011000+latency, bert_ctrl_offset)
#glib.write("user_wb_regs",0x001000+latency, bert_ctrl_offset)
#####################################################################
print
print "-> done"
print
print "--=======================================--"
print 
print 
