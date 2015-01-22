from PyChipsUser import *
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

spi_comm = 0x8FA38014;
cdce_readcommand = 0x8E 

deassert_powerup = 0
assert_powerup  = 1
deassert_sync = 0
assert_sync = 1

print 
print "-> ctrl value      ", uInt32HexStr(glib.read ("ctrl")) 

print 
glib.write("cdce_ctrl_sel", 0) # controlled by IPbus
glib.write("cdce_powerup", deassert_powerup)
glib.read ("ctrl") # dummy read
glib.read ("ctrl") # dummy read
print "-> powering down   ", uInt32HexStr(glib.read ("ctrl")) 


print
glib.write("cdce_powerup", assert_powerup)
glib.read ("ctrl") # dummy read
glib.read ("ctrl") # dummy read
print "-> powering up     ", uInt32HexStr(glib.read ("ctrl")) 


print
glib.write("cdce_sync", deassert_sync)
glib.read ("ctrl") # dummy read
glib.read ("ctrl") # dummy read
print "-> deasserting sync", uInt32HexStr(glib.read ("ctrl")) 

print
glib.write("cdce_sync", assert_sync)
glib.read ("ctrl") # dummy read
glib.read ("ctrl") # dummy read
print "-> asserting sync  ", uInt32HexStr(glib.read ("ctrl")) 



glib.write("spi_txdata",cdce_readcommand)
glib.write("spi_command", spi_comm)
glib.write("spi_txdata",0xAAAAAAAA) # dummy write
glib.write("spi_command", spi_comm);
RdBuffer = glib.read("spi_rxdata")
print
print "-> reg 08 contents ",uInt32HexStr(RdBuffer)




print
print "-> done"



print
print "--=======================================--"
print
print
