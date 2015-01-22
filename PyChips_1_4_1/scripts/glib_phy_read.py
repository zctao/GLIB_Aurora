from PyChipsUser import *
from time import sleep
glibAddrTable = AddressTable("./glibAddrTable.dat")

i2c_ctrl_disable = 0x00000000 
i2c_ctrl_enable  = 0x00000df4
i2c_phy_set_reg_address  = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
i2c_phy_set_reg_address[ 0] = 0x82470000
i2c_phy_set_reg_address[ 1] = 0x82470001 
i2c_phy_set_reg_address[ 2] = 0x82470002 
i2c_phy_set_reg_address[ 3] = 0x82470003
i2c_phy_set_reg_address[ 4] = 0x82470004 
i2c_phy_set_reg_address[ 5] = 0x82470005 
i2c_phy_set_reg_address[ 6] = 0x82470006 
i2c_phy_set_reg_address[ 7] = 0x82470007
i2c_phy_set_reg_address[ 8] = 0x82470008 
i2c_phy_set_reg_address[ 9] = 0x82470009 
i2c_phy_set_reg_address[10] = 0x8247000A 
i2c_phy_set_reg_address[11] = 0x8247000B
i2c_phy_set_reg_address[12] = 0x8247000C 
i2c_phy_set_reg_address[13] = 0x8247000D 
i2c_phy_set_reg_address[14] = 0x8247000E 
i2c_phy_set_reg_address[15] = 0x8247000F
i2c_phy_set_reg_address[16] = 0x82470010 
i2c_phy_set_reg_address[17] = 0x82470011 
i2c_phy_set_reg_address[18] = 0x82470012 
i2c_phy_set_reg_address[19] = 0x82470013
i2c_phy_set_reg_address[20] = 0x82470014 
i2c_phy_set_reg_address[21] = 0x82470015 
i2c_phy_set_reg_address[22] = 0x82470016 
i2c_phy_set_reg_address[23] = 0x82470017
i2c_phy_set_reg_address[24] = 0x82470018 
i2c_phy_set_reg_address[25] = 0x82470019 
i2c_phy_set_reg_address[26] = 0x8247001A 
i2c_phy_set_reg_address[27] = 0x8247001B
i2c_phy_set_reg_address[28] = 0x8247001C 
i2c_phy_set_reg_address[29] = 0x8247001D 
i2c_phy_set_reg_address[30] = 0x8247001E 
i2c_phy_set_reg_address[31] = 0x8247001F

i2c_phy_get_current_reg_contents = 0x80560000
AckBuffer = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
RegBuffer = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

f = open('./ipaddr.dat', 'r')
ipaddr = f.readline()
f.close()
glib = ChipsBusUdp(glibAddrTable, ipaddr, 50001)
print
print "--=======================================--"
print "  Opening GLIB with IP", ipaddr
print "--=======================================--"

print
print "-> enabling i2c controller  "
glib.write("i2c_settings", i2c_ctrl_enable)

print
print "-> reading 88E1111 registers"
print
for i in range(0,32):
	glib.write("i2c_command", i2c_phy_set_reg_address[i])
	#sleep(1)
	glib.read("i2c_reply") #dummy
	glib.read("i2c_reply") #dummy
	glib.read("i2c_reply") #dummy
	RegBuffer[i] = glib.read("i2c_reply")
	print "-> register",'%02d' % i,"contents=",uInt32HexStr(RegBuffer[i])
	
	
print
print "-> disabling i2c controller "
glib.write("i2c_settings", i2c_ctrl_disable)	

print
print "-> done"
print
print "--=======================================--"
print 
print