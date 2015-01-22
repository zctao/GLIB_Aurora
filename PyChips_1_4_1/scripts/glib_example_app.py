from PyChipsUser import *
import sys
import os
from time import sleep
#####################################################################
# IP address
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
reg_gbt_rx_status_offset    = 0	
reg_bitslip_ctrl_offset     = 16
reg_link_ctrl_offset        = 17
reg_sram_mux_ctrl_offset    = 18			
reg_gtx_conf_ctrl_offset 	= 19
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
os.system('python glib_board_info.py')
#####################################################################
loopback = 0
arguments = len(sys.argv)
if (arguments>1): loopback = int(sys.argv[1])
print
print "-> loopback set to", loopback
#####################################################################
diff_swing = 6 
pstemph    = 0		
preemph    = 0		
eqmix      = 0    	
rxpol      = 0		
txpol      = 0 		
gtx_conf_ctrl = txpol*(2**24) + rxpol*(2**20) + eqmix*(2**16) + preemph*(2**12)+pstemph*(2**4)+diff_swing*(2**0)
glib.write("user_wb_regs", gtx_conf_ctrl, reg_gtx_conf_ctrl_offset)
#
print
print "-> gtx conf"
print "   -----------------"
print "-> diff_swing:", diff_swing 
print "-> pstemph   :", pstemph 
print "-> preemph   :", preemph    
print "-> eqmix     :", eqmix    
print "-> rxpol     :", rxpol    
print "-> txpol     :", txpol    
#####################################################################
slide_enable = 0
slide_manual = 0
slide_run    = 0
slide_nbr    = 0
gtx_rx_slide_ctrl = slide_enable*(2**16) + slide_manual*(2**12) + slide_run*(2**8)+slide_nbr*(2**0)
glib.write("user_wb_regs",gtx_rx_slide_ctrl, reg_bitslip_ctrl_offset)
#
print
print "-> gtx rx slide conf"
print "   -----------------"
print "-> slide_enable:", slide_enable 
print "-> slide_manual:", slide_manual 
print "-> slide_run   :", slide_run    
print "-> slide_nbr   :", slide_nbr    
#####################################################################
lb_setting = loopback *(2**28)
glib.write("user_wb_regs",lb_setting + 0x00000505, reg_link_ctrl_offset)
glib.write("user_wb_regs",lb_setting + 0x00000504, reg_link_ctrl_offset)
glib.write("user_wb_regs",lb_setting + 0x00000500, reg_link_ctrl_offset)
glib.write("user_wb_regs",lb_setting + 0x00000400, reg_link_ctrl_offset)
glib.write("user_wb_regs",lb_setting + 0x00000000, reg_link_ctrl_offset)
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
#####################################################################
gbt_rx_status_reg = glib.read("user_wb_regs",reg_gbt_rx_status_offset)
bitslips = gbt_rx_status_reg % 256
gbt_aligned = gbt_rx_status_reg / 256
print
print "-> gbt rx bitslip"
print "-> --------------"
print "-> bitslips   :", bitslips
print "-> gbt_aligned:", gbt_aligned
slide_enable = 1
slide_manual = 0
slide_run    = 0
slide_nbr    = 0

gtx_rx_slide_ctrl	 = slide_enable*(2**16) + slide_manual*(2**12) + slide_run*(2**8)+slide_nbr*(2**0)
glib.write("user_wb_regs",gtx_rx_slide_ctrl, reg_bitslip_ctrl_offset)

print
print "-> gtx slide conf"
print "-> --------------"
print "-> slide_enable:", slide_enable 
print "-> slide_manual:", slide_manual 
print "-> slide_run   :", slide_run    
print "-> slide_nbr   :", slide_nbr    
#####################################################################
print
print "-> gbt rx reset"
print
print "-> gtx_tx|gbt_tx|gtx_rx|gbt_rx"
print "-> ------+------+------+------"
print "->   0      0      0      1   "
print "->   0      0      0      0   "
#####################################################################
gbt_rx_status_reg = glib.read("user_wb_regs",reg_gbt_rx_status_offset)
bitslips = gbt_rx_status_reg % 256
gbt_aligned = gbt_rx_status_reg / 256
print
print "-> gbt rx bitslip"
print "-> --------------"
print "-> bitslips  : ", bitslips
print "-> gbt_aligned:", gbt_aligned
#####################################################################
glib.write("ctrl_sram",0)
print
print "-> set sram1 controlled by user"
glib.write("sram1_user_logic",1)
#####################################################################
print	
print "-> start capture to sram"
glib.write("user_wb_regs",1, reg_sram_mux_ctrl_offset)
glib.write("user_wb_regs",0, reg_sram_mux_ctrl_offset)
#####################################################################
print
print "-> done"
print
print "--=======================================--"
print 
print
