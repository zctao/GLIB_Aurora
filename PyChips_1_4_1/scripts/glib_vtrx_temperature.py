from PyChipsUser import *
from time import *

glibAddrTable = AddressTable("./glibAddrTable.dat")

f = open('./ipaddr.dat', 'r')
ipaddr = f.readline()
f.close()
glib = ChipsBusUdp(glibAddrTable, ipaddr, 50001)
# print
# print "--=======================================--"
# print "  Opening GLIB with IP", ipaddr
# print "--=======================================--"


#######
debug=0
#######


i2c_ctrl_disable = 0x00000000 
i2c_ctrl_enable  = 0x000009f4

strobe = 1
m16b   = 0
ral	   = 0	

fpga_temp_sensor_slave_addr  = 0x2A
front_temp_sensor_slave_addr = 0x1A
rear_temp_sensor_slave_addr  = 0x4E

fpga_temp_sensor_reg_addr    = 0x01 # remote temperature register
front_temp_sensor_reg_addr   = 0x00 # local  temperature register
rear_temp_sensor_reg_addr    = 0x00 # local  temperature register

slave_addr  = [fpga_temp_sensor_slave_addr, front_temp_sensor_slave_addr, rear_temp_sensor_slave_addr]
wrdata      = [fpga_temp_sensor_reg_addr,   front_temp_sensor_reg_addr,   rear_temp_sensor_reg_addr] 
rddata      = [0,0,0]
status      = ["xxxx","yyyy","zzzz","aaaa","bbbb","cccc"]

###################################################
# print
# print "-> enabling i2c controller  "
glib.write("i2c_settings", i2c_ctrl_enable)
###################################################
for i in range (0,3):
	## i2c wr transaction
	wr = 1
	# send cmd
	i2c_cmd = strobe*(2**31) + m16b*(2**25) + ral*(2**24) + wr*(2**23) + slave_addr[i] *(2**16) + wrdata[i]
	glib.write("i2c_command", i2c_cmd)
	sleep(0.01)
	# get reply
	reply = glib.read("i2c_reply")
	sleep(0.1)
	# check reply
	i2c_status = (reply & 0x0c000000)/(2**26)
	if   (i2c_status == 1): status[2*i+0] = "done"
	elif (i2c_status == 3): status[2*i+0] = "fail"
	else: status = "pending"
	if (debug==1): print "-> slave",uInt8HexStr(slave_addr[i]),"wrdata", uInt8HexStr(wrdata[i]),status[i],uInt32HexStr(reply)		

	## i2c rd transaction
	wr = 0
	# send cmd
	i2c_cmd = strobe*(2**31) + m16b*(2**25) + ral*(2**24) + wr*(2**23) + slave_addr[i] *(2**16)
	glib.write("i2c_command", i2c_cmd)
	sleep(0.01)
	# get reply
	reply = glib.read("i2c_reply")
	sleep(0.1)
	# check reply
	rddata[i] = reply & 0xff
	i2c_status = (reply & 0x0c000000)/(2**26)
	if   (i2c_status == 1): status[2*i+1] = "done"
	elif (i2c_status == 3): status[2*i+1] = "fail"
	else: status = "pending"
	if (debug==1): print "-> slave",uInt8HexStr(slave_addr[i]),"rddata", uInt8HexStr(rddata[i]),status[i],uInt32HexStr(reply)	
###################################################
location    = ["fpga ", "front", "rear "]
temperature_value = ["positive", "positive", "positive"]
print
print "--=============--"
print "-> Temperatures"
print "--=============--"
for i in range (0,3):
	# temperature value is signed 8-bit 
	if (rddata[i]<128): 
		temperature = rddata[i]
	else: 
		temperature = rddata[i]-256
		temperature_value = "negative" 
	#
	print "->", location[i],temperature,"deg C"
print "--=============--"
if status!=["done","done","done","done","done","done"]: 
	print "-> ERROR: transaction(s) failed"
elif temperature_value!=["positive", "positive", "positive"]: 
	print "-> ERROR: temperature(s) out of range"
else:
	print "-> DONE"
print "--=============--"
###################################################
# print
# print "-> disabling i2c controller "
glib.write("i2c_settings", i2c_ctrl_disable)
# print
# print "--=======================================--"
# print 
print
