from PyChipsUser import *
import sys
import os
from time import sleep
glibAddrTable = AddressTable("./glibAddrTable.dat")
#####################################################################
f = open('./ipaddr.dat', 'r')
ipaddr = f.readline()
f.close()
glib = ChipsBusUdp(glibAddrTable, ipaddr, 50001)
print
print "--=======================================--"
print "  Opening GLIB with IP", ipaddr
print "--=======================================--"
#####################################################################
reg_gbt_rx_status_offset = 0	
reg_bert1_ctrl_offset    = 20
reg_bert2_ctrl_offset    = 21
reg_bert3_ctrl_offset    = 22
#####################################################################
os.system('python glib_board_info.py')
#####################################################################
print 
print "-> cdce locked:", glib.read("cdce_lock")
#####################################################################
gbt_rx_status_reg = glib.read("user_wb_regs",reg_gbt_rx_status_offset)
gbt_aligned = gbt_rx_status_reg / 256
print
print "-> gbt_aligned:", gbt_aligned
#####################################################################
arguments = len(sys.argv)
if (arguments>1):
	if   (sys.argv[1] == "bert3"):
		bert_ctrl_offset = reg_bert3_ctrl_offset
		print
		print "-> bert3 selected"
	elif (sys.argv[1] == "bert2"):	
		bert_ctrl_offset = reg_bert2_ctrl_offset
		print
		print "-> bert2 selected"
	else:	
		bert_ctrl_offset = reg_bert1_ctrl_offset
		print
		print "-> bert1 selected"
else:	
	bert_ctrl_offset = reg_bert1_ctrl_offset
	print
	print "-> bert1 selected"
#####################################################################
loops = 8
print
print "-> clear counters"
print
print "-> clear |latch |enable |load  |latency"
print "-> ------+------+------+------+-------"
print "->   1      0      1      0       x   "
print "->   0      0      1      0       x   "
print
glib.write("user_wb_regs",0x101000, 10)
glib.write("user_wb_regs",0x001000, 10)
#####################################################################

print
print "-> done"
print
print "--=======================================--"
print 
print
