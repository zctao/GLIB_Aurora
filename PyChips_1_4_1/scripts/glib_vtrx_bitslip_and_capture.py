from PyChipsUser import *
import sys
import os
from time import sleep
#####################################################################
glibAddrTable = AddressTable("./glibAddrTable.dat")
glib = ChipsBusUdp(glibAddrTable, "192.168.0.111", 50001)
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
# reg_bitslip_ctrl
#####################################################################
#	--(16)			-> rx_slide_enable
#	--(12)			-> rx_slide_ctrl -- 0: auto, 1: external
#	--(8)			-> rx_slide_run
#	--(4:0)			-> rx_slide_nbr
#####################################################################
#os.system('python glib_board_info.py')
#####################################################################
arguments = len(sys.argv)

if (arguments>1):
	if   (sys.argv[1] == "sfp"):
		bitslip_ctrl_offset  = reg_sfp_bitslip_ctrl_offset
		gbt_status_offset  	 = reg_sfp_gbt_status_offset
		sram_ctrl_offset	 = reg_sfp_sram_ctrl_offset
		print
		print "-------------------------------"
		print "-> sfp bert selected"
		print "-------------------------------"
		
	else:	
		bitslip_ctrl_offset  = reg_fmc_bitslip_ctrl_offset
		gbt_status_offset  	 = reg_fmc_gbt_status_offset
		sram_ctrl_offset	 = reg_fmc_sram_ctrl_offset
		print
		print "-------------------------------"
		print "-> fmc bert selected"
		print "-------------------------------"
else:	
	bitslip_ctrl_offset  = reg_fmc_bitslip_ctrl_offset
	gbt_status_offset  	 = reg_fmc_gbt_status_offset
	sram_ctrl_offset	 = reg_fmc_sram_ctrl_offset
	print
	print "-------------------------------"
	print "-> fmc bert selected (default)"
	print "-------------------------------"
			
if (arguments>2):
	if (sys.argv[2]=="off"):
		slide_enable = 0
		slide_manual = 0
		slide_run    = 0
		slide_nbr    = 0
		print "-> disable bitslip"
	elif (sys.argv[2]=="auto"):
		slide_enable = 1
		slide_manual = 0
		slide_run    = 0
		slide_nbr    = 0
		print "-> auto bitslip"
	else:
		slide_enable = 1
		slide_manual = 1
		slide_run    = 0
		slide_nbr    = int(sys.argv[2])
		print "-> manual bitslip",slide_nbr,"bits"
else:
	slide_enable = 1
	slide_manual = 0
	slide_run    = 0
	slide_nbr    = 0
	print "-> auto bitslip (default)"
	
	
#####################################################################
# read status
#####################################################################
gbt_rx_status 	= glib.read("user_wb_regs",gbt_status_offset)
bitslips 		= gbt_rx_status % 256
gbt_aligned 	= gbt_rx_status / 256
print
print "-> gbt rx bitslip"
print "-> --------------"
print "-> bitslips   :", bitslips
print "-> gbt_aligned:", gbt_aligned
#####################################################################
# apply bitslip
#####################################################################
bitslip_ctrl = slide_enable*(2**16) + slide_manual*(2**12) + slide_run*(2**8) + slide_nbr*(2**0)
glib.write("user_wb_regs",bitslip_ctrl, bitslip_ctrl_offset)
print
print "-> gtx slide conf"
print "-> --------------"
print "-> slide_enable:", slide_enable 
print "-> slide_manual:", slide_manual 
print "-> slide_run   :", slide_run    
print "-> slide_nbr   :", slide_nbr    
# ---- start: set slide run only for manual bitslip -------
slide_run    = 1
bitslip_ctrl = slide_enable*(2**16) + slide_manual*(2**12) + slide_run*(2**8) + slide_nbr*(2**0)
glib.write("user_wb_regs",bitslip_ctrl, bitslip_ctrl_offset)
#####################################################################
# reset gbt rx
#####################################################################
print
print "-> gbt rx reset"
print
print "-> gtx_tx|gbt_tx|gtx_rx|gbt_rx"
print "-> ------+------+------+------"
print "->   0      0      0      1   "
print "->   0      0      0      0   "
#####################################################################
# read status
#####################################################################
gbt_rx_status 	= glib.read("user_wb_regs",gbt_status_offset)
bitslips 		= gbt_rx_status % 256
gbt_aligned 	= gbt_rx_status / 256
print "-> gbt rx bitslip"
print "-> --------------"
print "-> bitslips   :", bitslips
print "-> gbt_aligned:", gbt_aligned

#####################################################################
# start capturing
#####################################################################
glib.write("user_wb_regs",1, sram_ctrl_offset)
glib.write("user_wb_regs",0, sram_ctrl_offset)
print "-> start capture to sram (resetting the mux)"
#####################################################################
print
print "-> done"
print
print "--=======================================--"
print 
print

print
print
