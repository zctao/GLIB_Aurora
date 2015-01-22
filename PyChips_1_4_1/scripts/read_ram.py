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


#print glib.read("ram_enable_0")
#glib.write("ram_enable_0",1)
print glib.read("ram_data_out")






