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


#####################################################################

bootsts_command       = [0xFFFFFFFF, 0xAA995566, 0x20000000, 0x20000000, 0x2802C001, 0x20000000, 0x20000000]
stat_command          = [0xFFFFFFFF, 0xAA995566, 0x20000000, 0x20000000, 0x2800E001, 0x20000000, 0x20000000]
read_wbstar_command   = [0xFFFFFFFF, 0xAA995566, 0x20000000, 0x20000000, 0x28020001, 0x20000000, 0x20000000]
write_wbstar_command  = [0xFFFFFFFF, 0xAA995566, 0x20000000, 0x20000000, 0x30020001, 0x14400000, 0x20000000]	# Memory Position: 0x400000
iprog_command         = [0xFFFFFFFF, 0xAA995566, 0x20000000, 0x20000000, 0x30008001, 0x0000000F, 0x20000000]

#####################################################################

#####################################################################

## *******************************
## ******* User modifiable *******
## *******************************
page = 2	# 0-> 0x000000, 1 -> 0x200000, 2 -> 0x400000, 3 -> 0x600000
## *******************************
## *******************************

#####################################################################
print "-> reading bootsts register with the icap"
glib.fifoWrite("icap", bootsts_command, 0)
print "-> bootsts register:", uInt32HexStr(glib.read("icap"))
print "->"
print "-> reading stat register with the icap"
glib.fifoWrite("icap", stat_command, 0)
print "-> stat register:", uInt32HexStr(glib.read("icap"))
print "->"
print "-> reading wbstar register with the icap"
glib.fifoWrite("icap", read_wbstar_command, 0)
print "-> wbstar register:", uInt32HexStr(glib.read("icap"))
print "->"
print "-> writing wbstar register with the icap"
glib.fifoWrite("icap", write_wbstar_command, 0)
print "->"
print "-> reading wbstar register with the icap"
glib.fifoWrite("icap", read_wbstar_command, 0)
print "-> wbstar register:", uInt32HexStr(glib.read("icap"))
####################################################################
print 
####################################################################
# print "-> selecting the page %d of the flash memory" % page
# glib.write("icap_page",  page) 
# print "-> jumping to other revision using iprog by icap"
# glib.fifoWrite("icap", iprog_command, 0)		# Note!!! After this command the FPGA is configured 
#####################################################################


