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


loops = 10

for i in range(0, loops):
	print
	print "-> time elapsed after reset:", glib.read("user_wb_timer"), "ms"
	sleep(1)
print
print "-> done"
print
print "--=======================================--"
print 
print














