from PyChipsUser import *
from time import sleep
glibAddrTable = AddressTable("./glibAddrTable.dat")

f = open('./ipaddr.dat', 'r')
ipaddr = f.readline()
f.close()
glib = ChipsBusUdp(glibAddrTable, ipaddr, 50001)
print
print "--=======================================--"
print "  Opening GLIB with IP", ipaddr
print "--=======================================--"

i2c_ctrl_disable = 0x00000000 
i2c_ctrl_enable  = 0x000009F4

fmc_GA 			 = 0 # fmc1 -> 0, fmc2 -> 3
fmc_eeprom_addr  = 0x50 + fmc_GA
dummy			 = 0x00	

#######################################
# reply(31)		<= error_rdack4;
# reply(30)		<= error_rdack3;
# reply(29)		<= error_rdack2;
# reply(28)		<= error_rdack1;
# reply(27)		<= error;
# reply(26)		<= done;
# reply(25)		<= extm;
# reply(24)		<= ral;
#######################################

print
print "-> enabling sys i2c controller  "
glib.write("i2c_settings", i2c_ctrl_enable)
print
##################
# write mem
#################
data_to_write = 0xa9
reg_to_access = 0x01
#
strobe 		 = 1
m16b   		 = 0
ral	   		 = 1 # equivalent to memWR 
slave_addr   = fmc_eeprom_addr
reg_addr     = reg_to_access
wrdata		 = data_to_write 
wr           = 1
#
fmc_eeprom_comm    = strobe*(2**31) + m16b*(2**25) + ral*(2**24) + wr*(2**23) + slave_addr *(2**16) + reg_addr *(2**8) + wrdata
glib.write("i2c_command", fmc_eeprom_comm)
for i in range(0,10): glib.read("board_id")
print "reply  :", uInt32HexStr(glib.read("i2c_reply"))
##################
# write mem
#################
data_to_write = 0xd3
reg_to_access = 0x02
#
strobe 		 = 1
m16b   		 = 0
ral	   		 = 1 # equivalent to memWR 
slave_addr   = fmc_eeprom_addr
reg_addr     = reg_to_access
wrdata		 = data_to_write 
wr           = 1
#
fmc_eeprom_comm    = strobe*(2**31) + m16b*(2**25) + ral*(2**24) + wr*(2**23) + slave_addr *(2**16) + reg_addr *(2**8) + wrdata
glib.write("i2c_command", fmc_eeprom_comm)
for i in range(0,10): glib.read("board_id")
print "reply  :", uInt32HexStr(glib.read("i2c_reply"))
##################
# read mem
#################
reg_to_access = 0x01
#
strobe 		 = 1
m16b   		 = 0
ral	   		 = 1 # equivalent to memWR 
slave_addr   = fmc_eeprom_addr
reg_addr     = reg_to_access
wrdata		 = dummy 
wr           = 0
#
fmc_eeprom_comm    = strobe*(2**31) + m16b*(2**25) + ral*(2**24) + wr*(2**23) + slave_addr *(2**16) + reg_addr *(2**8) + wrdata
glib.write("i2c_command", fmc_eeprom_comm)
for i in range(0,10): glib.read("board_id")
print "reply  :", uInt32HexStr(glib.read("i2c_reply"))
##################
# read mem
#################
reg_to_access = 0x02
#
strobe 		 = 1
m16b   		 = 0
ral	   		 = 1 # equivalent to memWR 
slave_addr   = fmc_eeprom_addr
reg_addr     = reg_to_access
wrdata		 = dummy 
wr           = 0
#
fmc_eeprom_comm    = strobe*(2**31) + m16b*(2**25) + ral*(2**24) + wr*(2**23) + slave_addr *(2**16) + reg_addr *(2**8) + wrdata
glib.write("i2c_command", fmc_eeprom_comm)
for i in range(0,10): glib.read("board_id")
print "reply  :", uInt32HexStr(glib.read("i2c_reply"))
##################
print
print "-> disabling usr i2c controller "
glib.write("i2c_settings", i2c_ctrl_disable)	

print
print "-> done"
print
print "--=======================================--"
print 
print
