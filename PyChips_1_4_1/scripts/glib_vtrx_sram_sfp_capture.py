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
reg_sram_mux_ctrl_offset    = 26			
#####################################################################
glib.write("ctrl_sram",0)
print
print "-> set sram2 controlled by user"
glib.write("sram2_user_logic",1)
#####################################################################
print	
print "-> start capture to sram2"
glib.write("user_wb_regs",1, reg_sram_mux_ctrl_offset)
glib.write("user_wb_regs",0, reg_sram_mux_ctrl_offset)
#####################################################################
print
print "-> done"
print
print "--=======================================--"
print 
print
