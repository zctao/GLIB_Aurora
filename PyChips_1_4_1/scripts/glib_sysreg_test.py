#  Import the PyChips code - PYTHONPATH must be set to the PyChips installation src folder!
from PyChipsUser import *
from time import sleep

##################################################################################################
### Uncomment one of the following two lines to turn on verbose or very-verbose debug modes.   ###
### These debug modes allow you to see the packets being sent and received.                    ###
##################################################################################################
#chipsLog.setLevel(logging.DEBUG)    # Verbose logging (see packets being sent and received)


# Read in an address table by creating an AddressTable object (Note the forward slashes, not backslashes!)
glibAddrTable = AddressTable("./glibAddrTable.dat")

f = open('./ipaddr.dat', 'r')
ipaddr = f.readline()
f.close()
glib = ChipsBusUdp(glibAddrTable, ipaddr, 50001)
print
print "--=======================================--"
print "  Opening GLIB with IP", ipaddr
print "--=======================================--"

print 
print "sys_id   =", uInt32HexStr(glib.read("sys_id"))
print "board_id =", uInt32HexStr(glib.read("board_id"))

print "Writing to Test register..."
glib.write("test", 0xdeadbeef)

print "Readback of Test =", uInt32HexStr(glib.read("test"))
print
print "additional commands"
print "test =", uInt32HexStr(glib.read("test"))
glib.write("test",0x11223344)
print "test =", uInt32HexStr(glib.read("test"))


first_reg_used = "board_id"
words   = 32
offset  = 0
wrBuffer = []
for i in range(0, words):
	wrBuffer.append(i+1) 

print
print "-> reading",words,"registers starting from",first_reg_used,"..."
rdBuffer = glib.blockRead(first_reg_used, words, offset)
print 
#print uInt32HexListStr(rdBuffer)
for i in range(0, words):
	print i, uInt32HexStr(rdBuffer[i])
print
print "-> done"
print
print "--=======================================--"
print 
print












