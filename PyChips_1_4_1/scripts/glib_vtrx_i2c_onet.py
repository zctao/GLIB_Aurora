from PyChipsUser import *
from time import sleep
glibAddrTable = AddressTable("./glibAddrTable.dat")
print
print
print "--=======================================--"
print "  Opening GLIB with IP 192.168.0.111"
print "--=======================================--"
glib = ChipsBusUdp(glibAddrTable, "192.168.0.111", 50001)

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
#i2c_ctrl_enable  = 0x00000A71 # 100KHz: prescaler-> 0x271=625
i2c_ctrl_enable  = 0x0000089C  # 400KHz: prescaler-> 0x09C=156
#i2c_ctrl_enable  = 0x0000083F #   1MHz: prescaler-> 0x03F=63
#vtrx_addr  		 = 0x0E # gbld 
vtrx_addr  		 = 0x08 # onet nt501b
dummy			 = 0x00	

print
print "-> enabling sys i2c controller  "
glib.write("i2c_settings", i2c_ctrl_enable)
sleep(0.1)
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

#WrBuffer = [0x97,0x19,0x19,0x55,0xFF,0xFF,0x02] # gbld
#WrBuffer = [0x90,0x6A,0x5D,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0] # onet nt501b
WrBuffer = [0x90,0x6A,0x5D] # onet nt501b short

print "-> vtrx i2c write"
print
for i in range(0,len(WrBuffer)):
	reg_addr = i
	wrdata = WrBuffer[i]
	fmc_vtrx_comm    = strobe*(2**31) + m16b*(2**25) + ral*(2**24) + wr*(2**23) + slave_addr *(2**16) + reg_addr *(2**8) + wrdata
	
	glib.write("i2c_command", fmc_vtrx_comm)
	sleep(0.02)
	reply = glib.read("i2c_reply")
	sleep(0.02)
	
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
	sleep(0.02)
	reply = glib.read("i2c_reply")
	sleep(0.02)
	
	rddata = reply & 0xff
	if (reply < 0x10000000): status = "done"
	else: status = "fail"
	print "-> slave",uInt8HexStr(slave_addr),"reg",uInt8HexStr(reg_addr),"data", uInt8HexStr(rddata),status	

	
#################
#print
#for i in range(0, 32):
#	print "-> user wb regs", '%02d' % i, "contents", uInt32HexStr(glib.read("user_wb_regs",i))
#################
print
print "-> disabling usr i2c controller "
glib.write("i2c_settings", i2c_ctrl_disable)	

print
print "-> done"
print
print "--=======================================--"
print 
print
