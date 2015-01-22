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
# reg_bitslip_ctrl
#####################################################################
#	--(16)			-> rx_slide_enable
#	--(12)			-> rx_slide_ctrl -- 0: auto, 1: external
#	--(8)			-> rx_slide_run
#	--(4:0)			-> rx_slide_nbr
#####################################################################
#	reg_link_ctrl 	      
#####################################################################
#	--(0)	   		-> gtx_tx_reset 												
#	--(1)	   		-> gtx_tx_sync_reset 										
#	--(2)	   		-> gbt_tx_reset 		
#	--(5:4)			-> gtx_rx_powerdown 														
#	--(8)	   		-> gtx_rx_reset 												
#	--(9)   		-> gtx_rx_sync_reset											
#	--(10)   		-> gbt_rx_reset 		
#	--(13:12)		-> gtx_tx_powerdown													
#	--(30:28)		-> gtx_loopback 	
#####################################################################
#	-- reg_gtx_conf_ctrl
#####################################################################
#	--( 3: 0)		->	diff swing	-- default "0110" 
#	--( 8: 4)		->	pstemph		-- default "00000"
#	--(15:12)		->	preemph		-- default "0000" 
#	--(18:16)		->  eqmix    	-- default "000"  
#	--(20)			->	rxpol		-- default '0'    
#	--(24)			->	txpol 		-- default '0'    
#
#	-- diff swing	
#	-- +-----+----+
#	-- |[3:0]| mV | 
#	-- +-----+----+
#	-- |0000 |110 |
#	-- |0001 |210 |
#	-- |0010 |310 |
#	-- |0011 |400 |
#	-- |0100 |480 |
#	-- |0101 |570 |
#	-- |0110 |660 |
#	-- |0111 |740 |
#	-- |1000 |810 |
#	-- |1001 |880 |
#	-- |1010 |940 |
#	-- |1011 |990 |
#	-- |1100 |1040|
#	-- |1101 |1080|
#	-- |1110 |1110|
#	-- |1111 |1130|
#	-- +-----+----+
#
#	-- Post-Emphasis Magnitude
#	-- +-----+----+
#	--	|[4:0]| dB |
#	-- +-----+----+
#	-- |00000|0.18|
#	-- |00001|0.19|
#	-- |00010|0.18|
#	-- |00011|0.18|
#	-- |00100|0.18|
#	-- |00101|0.18|
#	-- |00110|0.18|
#	-- |00111|0.18|
#	-- |01000|0.19|
#	-- |01001|0.2 |
#	-- |01010|0.39|
#	-- |01011|0.63|
#	-- |01100|0.82|
#	-- |01101|1.07|
#	-- |01110|1.32|
#	-- |01111|1.6 |
#	-- |10000|1.65|
#	-- |10001|1.94|
#	-- |10010|2.21|
#	-- |10011|2.52|
#	-- |10100|2.76|
#	-- |10101|3.08|
#	-- |10110|3.41|
#	-- |10111|3.77|
#	-- |11000|3.97|
#	-- |11001|4.36|
#	-- |11010|4.73|
#	-- |11011|5.16|
#	-- |11100|5.47|
#	-- |11101|5.93|
#	-- |11110|6.38|
#	-- |11111|6.89|
#	-- +-----+----+
#
#	-- Pre-Emphasis Magnitude)
#	-- +-----+----+
#	-- |[3:0]| dB |
#	-- +-----+----+
#	-- |0000 |0.15|
#	-- |0001 |0.3 |
#	-- |0010 |0.45|
#	-- |0011 |0.61|
#	-- |0100 |0.74|
#	-- |0101 |0.91|
#	-- |0110 |1.07|
#	-- |0111 |1.25|
#	-- |1000 |1.36|
#	-- |1001 |1.55|
#	-- |1010 |1.74|
#	-- |1011 |1.94|
#	-- |1100 |2.11|
#	-- |1101 |2.32|
#	-- |1110 |2.54|
#	-- |1111 |2.77|
#	-- +-----+----+
#####################################################################
os.system('c:\python27\python glib_board_info.py')
#####################################################################
# 000: Normal operation
# 001: Near-End PCS Loopback
# 010: Near-End PMA Loopback
# 011: Reserved
# 100: Far-End PMA Loopback
# 101: Reserved
# 110: Far-End PCS Loopback
loopback = 0
arguments = len(sys.argv)
if (arguments>1): loopback = int(sys.argv[1])
print
print "-> loopback set to", loopback
#####################################################################
# fmc gtx configuration (diff swing, pre-emphasis etc)
#####################################################################
fmc_diff_swing = 6 
fmc_pstemph    = 0		
fmc_preemph    = 0		
fmc_eqmix      = 0    	
fmc_rxpol      = 0		
fmc_txpol      = 0 		
fmc_gtx_ctrl = fmc_txpol*(2**24) + fmc_rxpol*(2**20) + fmc_eqmix*(2**16) + fmc_preemph*(2**12)+fmc_pstemph*(2**4) + fmc_diff_swing*(2**0)
glib.write("user_wb_regs",fmc_gtx_ctrl, reg_fmc_gtx_ctrl_offset)
#
print
print "-> fmc gtx conf"
print "   -----------------"
print "-> diff_swing:", fmc_diff_swing 
print "-> pstemph   :", fmc_pstemph 
print "-> preemph   :", fmc_preemph    
print "-> eqmix     :", fmc_eqmix    
print "-> rxpol     :", fmc_rxpol    
print "-> txpol     :", fmc_txpol    
#####################################################################
# sfp gtx configuration (diff swing, pre-emphasis etc)
#####################################################################
sfp_diff_swing = 6 
sfp_pstemph    = 0		
sfp_preemph    = 0		
sfp_eqmix      = 0    	
sfp_rxpol      = 0		
sfp_txpol      = 0 		
sfp_gtx_ctrl = sfp_txpol*(2**24) + sfp_rxpol*(2**20) + sfp_eqmix*(2**16) + sfp_preemph*(2**12)+sfp_pstemph*(2**4)+sfp_diff_swing*(2**0)
glib.write("user_wb_regs",sfp_gtx_ctrl, reg_sfp_gtx_ctrl_offset)
#
print
print "-> sfp gtx conf"
print "   -----------------"
print "-> diff_swing:", sfp_diff_swing 
print "-> pstemph   :", sfp_pstemph 
print "-> preemph   :", sfp_preemph    
print "-> eqmix     :", sfp_eqmix    
print "-> rxpol     :", sfp_rxpol    
print "-> txpol     :", sfp_txpol    
#####################################################################
# fmc/sfp bitslip disable
#####################################################################
glib.write("user_wb_regs", 0, reg_fmc_bitslip_ctrl_offset)
glib.write("user_wb_regs", 0, reg_sfp_bitslip_ctrl_offset)
print
print "-> fmc bitslip disable"    
print "-> sfp bitslip disable"    
#####################################################################
# fmc/sfp bert ctrl clear
#####################################################################
glib.write("user_wb_regs",0, reg_fmc_bert_ctrl_offset)
glib.write("user_wb_regs",0, reg_sfp_bert_ctrl_offset)
print
print "-> fmc bert ctrl clear"    
print "-> sfp bert ctrl clear"    
#####################################################################
# fmc/sfp link control (reset sequence and loopback settings)
#####################################################################
lb_setting = loopback *(2**28)

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
#####################################################################
# fmc/sfp auto bitslip
#####################################################################
program_str = 'c:\python27\python'
arg1 = 'fmc' 
arg2 = '0'
file_to_run = 'glib_vtrx_bitslip.py'
cmd_str = ''.join([program_str, ' ', file_to_run, ' ', arg1, ' ', arg2])
os.system(cmd_str)
#
program_str = 'c:\python27\python'
arg1 = 'sfp'
arg2 = '0'
file_to_run = 'glib_vtrx_bitslip.py'
cmd_str = ''.join([program_str, ' ', file_to_run, ' ', arg1, ' ', arg2])
os.system(cmd_str)
#####################################################################
# setup srams 
#####################################################################
#ctrl_sram				00000008    ffffffff     1     1
#  sram1_user_logic		00000008    00000001     1     1
#  sram1_bist_run		00000008    00000002     1     1
#  sram2_user_logic		00000008    00010000     1     1
#  sram2_bist_run		00000008    00020000     1     1 
#  flash_select			00000008    00100000     1     1 
# -----------
glib.write("ctrl_sram",0)
#
sram1_user_logic = 1
sram1_bist_run	 = 0
sram2_user_logic = 1
sram2_bist_run	 = 0
flash_select	 = 0
#
sram_ctrl_command = flash_select*(2**20)+sram2_bist_run*(2**17)+sram2_user_logic*(2**16)+sram1_bist_run*(2**1)+sram1_user_logic*(2**0)
glib.write("ctrl_sram",sram_ctrl_command)
print
print "-> set sram1 & sram2 controlled by user"
#####################################################################
# start capturing
#####################################################################
glib.write("user_wb_regs",1, reg_fmc_sram_ctrl_offset)
glib.write("user_wb_regs",0, reg_fmc_sram_ctrl_offset)
print "-> start capture to fmc sram (resetting the mux)"
glib.write("user_wb_regs",1, reg_sfp_sram_ctrl_offset)
glib.write("user_wb_regs",0, reg_sfp_sram_ctrl_offset)
print "-> start capture to sfp sram (resetting the mux)"
#####################################################################
print
print "-> done"
print
print "--=======================================--"
print 
print
