import sys
import os
from time import sleep

from PyChipsUser import *
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

glib.write("gbt_phase_mon_reset", 1)
glib.write("gbt_phase_mon_reset", 0)
sleep(0.5)

if sys.argv[1] == 'sfp':
	quad = 'sfp'
elif sys.argv[1] == 'fmc':
	quad = 'fmc1'	

print
print "-> %s mgt clock phase monitoring" % quad
print "-> --------------------------"
print "-> upper threshold:        ",  uInt32HexStr(glib.read("%s_phase_mon_upper" % quad))[6:8]
print "-> phase monitoring stats: ",  uInt32HexStr(glib.read("%s_phase_mon_stats" % quad))[4:6]
print "-> lower threshold:        ",  uInt32HexStr(glib.read("%s_phase_mon_lower" % quad))[6:8]
print "-> phase monitoring OK:     ",  glib.read("%s_phase_mon_ok" % quad)
print
print "--=======================================--"
print
print