from PyChipsUser import *
import sys
import os
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

#####################################################################
reg_sram_mux_ctrl_offset    = 18			
#####################################################################
glib.write("ctrl_sram",0)
print
print "-> set sram1 controlled by user"
glib.write("sram1_user_logic",1)
#####################################################################
print	
print "-> start capture to sram1"
glib.write("user_wb_regs",1, reg_sram_mux_ctrl_offset)
glib.write("user_wb_regs",0, reg_sram_mux_ctrl_offset)
#####################################################################
print
print "-> done"
print
print "--=======================================--"
print 
print
