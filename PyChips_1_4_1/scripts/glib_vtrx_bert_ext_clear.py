from PyChipsUser import *
import sys
import os
from time import sleep
glibAddrTable = AddressTable("./glibAddrTable.dat")
########################################
# IP address
########################################
f = open('./ipaddr.dat', 'r')
ipaddr = f.readline()
f.close()
glib = ChipsBusUdp(glibAddrTable, ipaddr, 50001)
print
print "--=======================================--"
print "  Opening GLIB with IP", ipaddr
print "--=======================================--"
########################################
reg_fmc_gbt_status_offset 	=  4	
reg_sfp_gbt_status_offset 	= 10	
#
reg_fmc_bert_ctrl_offset    = 32+20
reg_sfp_bert_ctrl_offset    = 32+28
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
