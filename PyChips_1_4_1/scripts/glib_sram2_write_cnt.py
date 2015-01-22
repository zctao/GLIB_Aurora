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

sram_used = "sram2"
KWord = 1024
MWord = 1024*1024
mem_size = 2*MWord 
words = 2*MWord #1*KWord
latency = 5
offset  = 0 #mem_size-words
lastaddr= offset+words-1

wrBuffer = []
for i in range(0, words):
	wrBuffer.append(0x10000+i) 

#####################################################################
print
print "-> set sram2 controlled by ipbus"
glib.write("sram2_user_logic",0)
print
print "-> select sram2 / deselect flash"
glib.write("flash_select",0)
#####################################################################
print
print "->",words,"words block write to",sram_used,"..."
glib.blockWrite(sram_used, wrBuffer, offset)	


print
print "-> done"
print
print "--=======================================--"
print 
print











