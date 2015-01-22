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

reg_fmc_bert_ctrl_offset    = 32+20
reg_sfp_bert_ctrl_offset    = 32+28
#####################################################################
# get board status
#####################################################################
#os.system('c:\python27\python glib_board_info.py')
#####################################################################
latency = 0
bert_ctrl_offset = 0
arguments = len(sys.argv)
if (arguments>1):
	if   (sys.argv[1] == "fmc"):
		bert_ctrl_offset = reg_fmc_bert_ctrl_offset
		gbt_status_offset = reg_fmc_gbt_status_offset
		print
		print "-> fmc bert selected"
	elif (sys.argv[1] == "sfp"):	
		bert_ctrl_offset = reg_sfp_bert_ctrl_offset
		gbt_status_offset = reg_sfp_gbt_status_offset
		print
		print "-> sfp bert selected"
	else:
		bert_ctrl_offset = 0
		gbt_status_offset = 0
		print
		print "-> no bert selected"
else:
	print 
	print "-> please select bert & define latency"
	
if (arguments>2):
	latency = int(sys.argv[2])
	print
	print "-> latency set to", latency
else:
	print 
	print "-> please define latency"
	latency = 0
#####################################################################
gbt_status  = glib.read("user_wb_regs", gbt_status_offset)
gbt_aligned = gbt_status / 256
print
print "->",sys.argv[1], "gbt aligned:", gbt_aligned
#####################################################################
glib.write("user_wb_regs",0x000000+latency, bert_ctrl_offset)
glib.write("user_wb_regs",0x000100+latency, bert_ctrl_offset)
glib.write("user_wb_regs",0x000000+latency, bert_ctrl_offset)
glib.write("user_wb_regs",0x001000+latency, bert_ctrl_offset)
glib.write("user_wb_regs",0x101000+latency, bert_ctrl_offset)
glib.write("user_wb_regs",0x001000+latency, bert_ctrl_offset)
#
print
print "-> start bert"
print
print "-> clear |latch |enable |load |latency"
print "-> ------+------+------+------+-------"
print "->   0      0      0      0      ", latency
print "->   0      0      0      1      ", latency
print "->   0      0      0      0      ", latency
print "->   0      0      1      0       x   "
print "->   1      0      1      0       x   "
print "->   0      0      1      0       x   "
#####################################################################
print
print "-> done"
print
print "--=======================================--"
print 
print
