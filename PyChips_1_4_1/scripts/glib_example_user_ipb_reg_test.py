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

first_reg_used = "user_ipb_regs"
words   = 32
offset  = 0

print
for i in range(0, words):
	print "-> user ipb regs", '%02d' % i, "contents", uInt32HexStr(glib.read(first_reg_used,i))


wrBuffer = []
for i in range(0, words):
	wrBuffer.append(i+1) 
print
print "-> overwriting the registers ..."
glib.blockWrite(first_reg_used,wrBuffer)
	
print
print "->",words, "registers block starting from",first_reg_used,"..."
rdBuffer = glib.blockRead(first_reg_used, words, offset)
print 
print uInt32HexListStr(rdBuffer)
print
print "-> done"
print
print "--=======================================--"
print 
print










