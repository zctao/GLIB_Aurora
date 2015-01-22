from PyChipsUser import *
from time import sleep
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

i2c_ctrl_disable = 0x00000000 
i2c_ctrl_enable  = 0x000009F4
vtrx_addr  		 = 0x7E # gbld v4
#vtrx_addr  		 = 0x0E # gbld v3
#vtrx_addr  		 = 0x08 # onet nt501b
dummy			 = 0x00	

print
print "-> enabling sys i2c controller  "
glib.write("i2c_settings", i2c_ctrl_enable)
sleep(0.5)
print

##################
# write vtrx
#################
#
strobe 		 = 1
m16b   		 = 0
ral	   		 = 1 # equivalent to memWR 
slave_addr   = vtrx_addr
wr           = 1
#

WrBuffer = [0x87,0x0,0x19,0x55,0xFF,0xFF,0x04] # gbld
#WrBuffer = [0x90,0x6A,0x5D,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0] # onet nt501b

print "-> vtrx i2c write"
print
for i in range(0,len(WrBuffer)):
	reg_addr = i
	wrdata = WrBuffer[i]
	fmc_vtrx_comm    = strobe*(2**31) + m16b*(2**25) + ral*(2**24) + wr*(2**23) + slave_addr *(2**16) + reg_addr *(2**8) + wrdata

	glib.write("i2c_command", fmc_vtrx_comm)
	sleep(0.01)
	reply = glib.read("i2c_reply")
	sleep(0.1)
	
	if (reply < 0x10000000): status = "done"
	else: status = "fail"
	print "-> slave",uInt8HexStr(slave_addr),"reg",uInt8HexStr(reg_addr),"data", uInt8HexStr(wrdata),status	

print
print "-> vtrx i2c read"
print
##################
# read vtrx
#################
######reg_to_access = 0x02
#
strobe 		 = 1
m16b   		 = 0
ral	   		 = 1 # equivalent to memWR 
slave_addr   = vtrx_addr
######reg_addr     = reg_to_access
wrdata		 = dummy 
wr           = 0
#
for j in range (0,len(WrBuffer)):
	reg_addr     = 0x00 + j
	
	fmc_vtrx_comm    = strobe*(2**31) + m16b*(2**25) + ral*(2**24) + wr*(2**23) + slave_addr *(2**16) + reg_addr *(2**8) + wrdata
	glib.write("i2c_command", fmc_vtrx_comm)
	sleep(0.01)
	reply = glib.read("i2c_reply")
	sleep(0.1)
	
	rddata = reply & 0xff
        i2c_status = (reply & 0x0c000000)/(2**26)
        if   (i2c_status == 1): status = "done"
	elif (i2c_status == 3): status = "fail"
        else: status = "pending"
	print "-> slave",uInt8HexStr(slave_addr),"reg",uInt8HexStr(reg_addr),"data", uInt8HexStr(rddata),status	

print
print "-> disabling sys i2c controller "
glib.write("i2c_settings", i2c_ctrl_disable)	

print
print "-> done"
print
print "--=======================================--"
print 
print
