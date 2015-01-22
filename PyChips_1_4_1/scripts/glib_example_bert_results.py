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

reg_bert1_wrds_offset    = 4
reg_bert2_wrds_offset    = 8
reg_bert3_wrds_offset    = 12

reg_bert1_errs_offset    = 6
reg_bert2_errs_offset    = 10
reg_bert3_errs_offset    = 14

reg_bitslip_ctrl_offset  = 16
reg_link_ctrl_offset     = 17
reg_sram_mux_ctrl_offset = 18			
#####################################################################
os.system('python glib_board_info.py')
#####################################################################
print 
print "-> cdce locked:", glib.read("cdce_lock")
#####################################################################
gbt_rx_status_reg = glib.read("user_wb_regs",reg_gbt_rx_status_offset)
bit_position = gbt_rx_status_reg % 256
gbt_aligned  = gbt_rx_status_reg / 256
print
print "-> bit_position:", bit_position
print "-> gbt_aligned :", gbt_aligned
#####################################################################
loops = 1
print
print "-> read the results",loops,"times"
print
print "-> clear |latch |enable |load  |latency"
print "-> ------+------+------+------+-------"
print "->   0      1      1      0       x   "
print "->   0      0      1      0       x   "

arguments = len(sys.argv)

reg_bert_ctrl_offset = 0
reg_bert_wrds_offset = 0
reg_bert_errs_offset = 0
latency = 0

if (arguments>1):
	if   (sys.argv[1] == "bert3"):
		reg_bert_ctrl_offset = reg_bert3_ctrl_offset
		reg_bert_wrds_offset = reg_bert3_wrds_offset
		reg_bert_errs_offset = reg_bert3_errs_offset
		print
		print "-> bert3 selected"
	elif (sys.argv[1] == "bert2"):	
		reg_bert_ctrl_offset = reg_bert2_ctrl_offset
		reg_bert_wrds_offset = reg_bert2_wrds_offset
		reg_bert_errs_offset = reg_bert2_errs_offset
		print
		print "-> bert2 selected"
	else:	
		reg_bert_ctrl_offset = reg_bert1_ctrl_offset
		reg_bert_wrds_offset = reg_bert1_wrds_offset
		reg_bert_errs_offset = reg_bert1_errs_offset
		print
		print "-> bert1 selected"
else:	
	reg_bert_ctrl_offset = reg_bert1_ctrl_offset
	reg_bert_wrds_offset = reg_bert1_wrds_offset
	reg_bert_errs_offset = reg_bert1_errs_offset
	print
	print "-> bert1 selected"

for i in range(0, loops):
	glib.write("user_wb_regs",0x011000, reg_bert_ctrl_offset)
	glib.write("user_wb_regs",0x001000, reg_bert_ctrl_offset)	
	words_lo  = glib.read("user_wb_regs",reg_bert_wrds_offset)
	words_hi  = glib.read("user_wb_regs",reg_bert_wrds_offset+1)
	errors_lo = glib.read("user_wb_regs",reg_bert_errs_offset)
	errors_hi = glib.read("user_wb_regs",reg_bert_errs_offset+1)
	words  = words_hi  * 2**32 + words_lo
	errors = errors_hi * 2**32 + errors_lo
	print
	print "-> words:", '%015d' % words, "errors:", '%015d' % errors
	sleep(1)
#####################################################################

print
print "-> done"
print
print "--=======================================--"
print 
print
