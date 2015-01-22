from PyChipsUser import *
glibAddrTable = AddressTable("./glibAddrTable.dat")

########################################
# IP address
########################################
f = open('./ipaddr.dat', 'r')
ipaddr = f.readline()
f.close()
glib = ChipsBusUdp(glibAddrTable, ipaddr, 50001)
#print
#print "--=======================================--"
#print "  Opening GLIB with IP", ipaddr
#print "--=======================================--"
########################################
# i2c_settings        	0000000d    ffffffff     1     1
  # i2c_enable          0000000d    00000800     1     1
  # i2c_bus_select      0000000d    00000400     1     1
  # i2c_prescaler       0000000d    000003ff     1     1

# i2c_command         	0000000e    ffffffff     1     1
  # i2c_strobe 	  		0000000e    80000000     1     1 
  # i2c_mode16 	  		0000000e    02000000     1     1 
  # i2c_write 	  		0000000e    00800000     1     1 
  # i2c_slvaddr_7b  	0000000e    007f0000     1     1 
  # i2c_wrdata  		0000000e    000000ff     1     1 

#  i2c_reply			0000000f    ffffffff     1     0
	# i2c_reply_status  0000000f    0c000000     1     0
	# i2c_reply_8b		0000000f    000000ff     1     0
	# i2c_reply_16b		0000000f    0000ffff     1     0
########################################

i2c_eeprom_reg_address  = [0xFA,0xFB,0xFC,0xFD,0xFE,0xFF] # see 24AA025E48 manual
RegBuffer = [0,0,0,0,0,0]
#AckBuffer = [0,0,0,0,0,0]

#print
#print "-> enabling i2c controller  "

# glib.write("i2c_prescaler" , 500)
# glib.write("i2c_bus_select", 0)
# glib.write("i2c_enable"    , 1)

i2c_en    = 1
i2c_sel   = 0
i2c_presc = 500
i2c_settings_value = i2c_en*(2**11) + i2c_sel*(2**10) + i2c_presc
glib.write("i2c_settings", i2c_settings_value)

i2c_str   = 1
i2c_m16   = 0
i2c_slv   = 0x56

for i in range(0,6):
	
	# set register address
	# ----------------------------------------
	i2c_wr    = 1 # do an i2c write transaction
	i2c_command_value = i2c_str*(2**31)+i2c_m16*(2**25)+i2c_wr*(2**23)+i2c_slv*(2**16)+i2c_eeprom_reg_address[i]
	glib.write("i2c_command", i2c_command_value)
	status = glib.read("i2c_reply_status")
	##########################################
	# check i2c transaction status
	##########################################
	status = glib.read("i2c_reply_status")
	if (status!=1): print ("i2c_error")
	##########################################
		
	# read register contents
	# ----------------------------------------
	i2c_wr    = 0 # do an i2c read transaction
	i2c_command_value = i2c_str*(2**31)+i2c_m16*(2**25)+i2c_wr*(2**23)+i2c_slv*(2**16)
	glib.write("i2c_command", i2c_command_value)
	RegBuffer[i] = glib.read("i2c_reply_8b")
	##########################################
	# check i2c transaction status
	##########################################
	status = glib.read("i2c_reply_status")
	if (status!=1): print ("i2c_error")
	##########################################	

print
print "-> hardware ID:",uInt8HexStr(RegBuffer[0]),uInt8HexStr(RegBuffer[1]),uInt8HexStr(RegBuffer[2]),uInt8HexStr(RegBuffer[3]),uInt8HexStr(RegBuffer[4]),uInt8HexStr(RegBuffer[5])	

#print uInt32HexListStr(AckBuffer)

#print
#print "-> disabling i2c controller "
#glib.write("i2c_settings", i2c_ctrl_disable)	

i2c_en    = 0
i2c_sel   = 0
i2c_presc = 500
i2c_settings_value = i2c_en*(2**11) + i2c_sel*(2**10) + i2c_presc
glib.write("i2c_settings", i2c_settings_value)

#print
#print "-> done"
#print
#print "--=======================================--"
#print 
#print
