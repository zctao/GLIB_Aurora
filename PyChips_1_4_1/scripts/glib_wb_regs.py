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

first_reg_used = "user_wb_regs"
words   = 64
offset  = 0

print
for i in range(0, words):
	print "-> user wb regs", '%02d' % i, "contents", uInt32HexStr(glib.read(first_reg_used,i))


print 
print












