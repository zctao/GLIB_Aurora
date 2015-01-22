import sys
import os
from PyChipsUser import *
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


print 
print
glib.write("user_wb_regs", int(sys.argv[1], 16)) #hex(int(sys.argv[1]))
print "-> gbt_fpga_ctrl_reg", uInt32HexStr(glib.read("user_wb_regs"))








