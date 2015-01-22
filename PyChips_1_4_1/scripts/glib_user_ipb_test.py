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


# user led control
led1 = 0
led2 = 0
ctrl0 = (led2<<4)+led1
testword = 0xaaaa5555
#

print
print "-> ctrl_regs initialize"
glib.write("user_ipb_ctrl_regs",0x00000000, 0) 			# write to  address ["user_ipb_ctrl_regs"+0] 
glib.write("user_ipb_ctrl_regs",0x00000000, 1) 			# write to  address ["user_ipb_ctrl_regs"+1] 
print

print "-> read ctrl_regs"
print
print uInt32HexStr(glib.read("user_ipb_ctrl_regs",0))	# read from address ["user_ipb_stat_regs"+0]
print uInt32HexStr(glib.read("user_ipb_ctrl_regs",1))	# read from address ["user_ipb_stat_regs"+1]
print uInt32HexStr(glib.read("user_ipb_ctrl_regs",2))	# read from address ["user_ipb_stat_regs"+2]
print

print "-> read stat_regs"
print
print uInt32HexStr(glib.read("user_ipb_stat_regs",0))	# read from address ["user_ipb_stat_regs"+0]
print uInt32HexStr(glib.read("user_ipb_stat_regs",1))	# read from address ["user_ipb_stat_regs"+1]
print uInt32HexStr(glib.read("user_ipb_stat_regs",2))	# read from address ["user_ipb_stat_regs"+2]
print

print "-> ctrl_regs update"
glib.write("user_ipb_ctrl_regs",    ctrl0, 0) 			# write to  address ["user_ipb_ctrl_regs"+0] 
glib.write("user_ipb_ctrl_regs", testword, 1) 			# write to  address ["user_ipb_ctrl_regs"+1] 
print

print "-> read ctrl_regs"
print
print uInt32HexStr(glib.read("user_ipb_ctrl_regs",0))	# read from address ["user_ipb_stat_regs"+0]
print uInt32HexStr(glib.read("user_ipb_ctrl_regs",1))	# read from address ["user_ipb_stat_regs"+1]
print uInt32HexStr(glib.read("user_ipb_ctrl_regs",2))	# read from address ["user_ipb_stat_regs"+2]
print

print "-> read stat_regs"
print
print uInt32HexStr(glib.read("user_ipb_stat_regs",0))	# read from address ["user_ipb_stat_regs"+0]
print uInt32HexStr(glib.read("user_ipb_stat_regs",1))	# read from address ["user_ipb_stat_regs"+1]
print uInt32HexStr(glib.read("user_ipb_stat_regs",2))	# read from address ["user_ipb_stat_regs"+2]
print
