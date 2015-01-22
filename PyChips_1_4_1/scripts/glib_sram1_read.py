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

sram_used = "sram1"
KWord = 1024
MWord = 1024*1024
mem_size = 2*MWord 
words = 2*MWord
offset  = 0 #mem_size-words
#lastaddr= offset+words
#####################################################################
print "-> set sram1 controlled by ipbus"
#
sram1_user_logic = 0
sram1_bist_run	 = 0
sram2_user_logic = 0
sram2_bist_run	 = 0
flash_select	 = 0
#
sram_ctrl_command = flash_select*(2**20)+sram2_bist_run*(2**17)+sram2_user_logic*(2**16)+sram1_bist_run*(2**1)+sram1_user_logic*(2**0)
glib.write("ctrl_sram",sram_ctrl_command)
#####################################################################
print
print "->",words,"words block read from",sram_used,"..."
rdBuffer = glib.blockRead(sram_used, words, offset)
f = open('./tmp.txt', 'w')
for i in range(0, words):
	f.write(uInt32HexStr(rdBuffer[i]))
	f.write('\n')
print
print "-> writing to file ./temp.txt"
#####################################################################
del rdBuffer[32:words]
print 
print "-> printing first 32 words"
print uInt32HexListStr(rdBuffer)

print
print "-> done"
print
print "--=======================================--"
print 
print











