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
# print
# print "--=======================================--"
# print "  Opening GLIB with IP", ipaddr
# print "--=======================================--"
########################################
reg_fmc_gbt_status_offset 	= 4	
reg_fmc_bert_wrds_offset    = 32+5
reg_fmc_bert_errs_offset    = 32+7
reg_fmc_bert_ctrl_offset    = 32+20

reg_sfp_gbt_status_offset 	= 10	
reg_sfp_bert_wrds_offset    = 32+11
reg_sfp_bert_errs_offset    = 32+13
reg_sfp_bert_ctrl_offset    = 32+28
#####################################################################
#os.system('c:\python27\python glib_board_info.py')
#####################################################################
#loops = 1

arguments = len(sys.argv)

if (arguments>1):
	if   (sys.argv[1] == "sfp"):
		bert_ctrl_offset  = reg_sfp_bert_ctrl_offset
		bert_wrds_offset  = reg_sfp_bert_wrds_offset
		bert_errs_offset  = reg_sfp_bert_errs_offset
		gbt_status_offset = reg_sfp_gbt_status_offset
		quad = "sfp"
		print
		print "-> sfp 20bit@240MHz bert selected"
	else:	
		bert_ctrl_offset  = reg_fmc_bert_ctrl_offset
		bert_wrds_offset  = reg_fmc_bert_wrds_offset
		bert_errs_offset  = reg_fmc_bert_errs_offset
		gbt_status_offset = reg_fmc_gbt_status_offset
		quad = "fmc1"
		print
		print "-> fmc 20bit@240MHz bert selected"
else:	
	bert_ctrl_offset  = reg_fmc_bert_ctrl_offset
	bert_wrds_offset  = reg_fmc_bert_wrds_offset
	bert_errs_offset  = reg_fmc_bert_errs_offset
	gbt_status_offset = reg_fmc_gbt_status_offset
	print
	print "-> fmc 20bit@240MHz bert selected"
#####################################################################
# read status
#####################################################################
gbt_rx_status 	= glib.read("user_wb_regs",gbt_status_offset)
bit_position	= gbt_rx_status % 256
gbt_aligned 	= gbt_rx_status / 256
print "->"
print "-> gbt rx bitslip"
print "-> --------------"
print "-> bit_position:", bit_position
print "-> gbt_aligned :", gbt_aligned
#####################################################################
latency = 0xff & glib.read("user_wb_regs",bert_ctrl_offset)
	
#print
#print "-> read the results",loops,"times"
print "->"
print "-> clear |latch |enable |load |latency"
print "-> ------+------+------+------+-------"
print "->   0      1      1      0      ", latency
print "->   0      0      1      0      ", latency

#for i in range(0, loops):
glib.write("user_wb_regs",0x011000+latency, bert_ctrl_offset)
glib.write("user_wb_regs",0x001000+latency, bert_ctrl_offset)
	
words_lo  = glib.read("user_wb_regs",bert_wrds_offset)
words_hi  = glib.read("user_wb_regs",bert_wrds_offset+1)
errors_lo = glib.read("user_wb_regs",bert_errs_offset)
errors_hi = glib.read("user_wb_regs",bert_errs_offset+1)
	
words  = words_hi  * 2**32 + words_lo
errors = errors_hi * 2**32 + errors_lo
print "->"
print "-> words:", '%.4g'  % words, "errors:", '%.4g'  % errors
#print "-> words:", '%015d' % words, "errors:", '%015d' % errors
#sleep(1)
#####################################################################
#print
#print "-> done"
print
print "--=======================================--"
print
print