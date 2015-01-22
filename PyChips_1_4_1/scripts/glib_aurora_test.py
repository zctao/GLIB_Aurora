from PyChipsUser import *
glibAddrTable = AddressTable("./glibAddrTable.dat")
import os
import time
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
#chipsLog.setLevel(logging.DEBUG)    # Verbose logging (see packets being sent and received)

#testword = 0xaaaa5555

###########################################
#test reg
#print
#print "-> read initial value"
#init = glib.read("my_test_reg") 
#print "-> test reg initial value : ", init

#print
#print "-> test_reg initialize"
#glib.write("my_test_reg",0x00000000, 0) 

#print
#print "-> write test reg"
#glib.write("my_test_reg",0xcafebabe, 0)

#print
#print "-> Read test reg"
#readout = glib.read("my_test_reg")
#print "-> test reg readout :", hex(readout)

#print
#print "-> reg test done"
#print
#print "--=======================================--"
#print 
#print
################################################


data1 = 0x87654321
data2 = 0xcafebabe
data3 = 0xdeadbeef

print
print "-> write data to registers:", hex(data1)," ",hex(data2)," ",hex(data3)
glib.write("data_pack_reg1",data1,0)
glib.write("data_pack_reg2",data2,0)
glib.write("data_pack_reg3",data3,0)


input1 = glib.read("data_pack_reg1")
input2 = glib.read("data_pack_reg2")
input3 = glib.read("data_pack_reg3")

print 
print "check data reg: "
print hex(input1)
print hex(input2)
print hex(input3)

print 
print "-> send data..."
#turn on enable and off
glib.write("data_pack_en",0x00000001,0)
glib.write("data_pack_en",0x11111110,0)

print 
print "read out debug registers"
debug1 = glib.read("aurora_debug_reg1")
debug2 = glib.read("aurora_debug_reg2")
debug3 = glib.read("aurora_debug_reg3")

print "debug_reg1 :",hex(debug1)
print "debug_reg2 :",hex(debug1)
print "debug_reg3 :",hex(debug1)

print "-> read data1 :"
dataout1 = glib.read("aurora_rd_data1")
print "-> aurora data1 output :", hex(dataout1)

print
print "-> read aurora status1 :"
status1 = glib.read("aurora_rd_stat1")
print "-> aurora status :", hex(status1)
print "tx_tready :", str(bin(status1))[2]
print "rx_tvalid :", str(bin(status1))[3]
print "rx_tlast :", str(bin(status1))[4]
print "rx_tkeep :", str(bin(status1))[5:9]
print "hard_err_1 :", str(bin(status1))[9]
print "soft_err_1 :", str(bin(status1))[10]
print "frame_err_1 :", str(bin(status1))[11]
print "lane_up_1 :", str(bin(status1))[12]
print "channel_up_1 :", str(bin(status1))[13]
print "hard_err_2 :", str(bin(status1))[14]
print "soft_err_2 :", str(bin(status1))[15]
print "frame_err_2 :", str(bin(status1))[16]
print "lane_up_2 :", str(bin(status1))[17]
print "channel_up_2 :", str(bin(status1))[18]

print
print "-> read data2 :"
dataout2 = glib.read("aurora_rd_data2")
print "-> aurora data2 output :", hex(dataout2)

print
print "-> read aurora status2 :"
status2 = glib.read("aurora_rd_stat2")
print "-> aurora status :", hex(status2)
print "tx_tready :", str(bin(status2))[2]
print "rx_tvalid :", str(bin(status2))[3]
print "rx_tlast :", str(bin(status2))[4]
print "rx_tkeep :", str(bin(status2))[5:9]
print "hard_err_1 :", str(bin(status2))[9]
print "soft_err_1 :", str(bin(status2))[10]
print "frame_err_1 :", str(bin(status2))[11]
print "lane_up_1 :", str(bin(status2))[12]
print "channel_up_1 :", str(bin(status2))[13]
print "hard_err_2 :", str(bin(status2))[14]
print "soft_err_2 :", str(bin(status2))[15]
print "frame_err_2 :", str(bin(status2))[16]
print "lane_up_2 :", str(bin(status2))[17]
print "channel_up_2 :", str(bin(status2))[18]

print
print "-> read data3 :"
dataout3 = glib.read("aurora_rd_data3")
print "-> aurora data3 output :", hex(dataout3)

print
print "-> read aurora status3 :"
status3 = glib.read("aurora_rd_stat3")
print "-> aurora status :", hex(status3)


print 
print "-> rx_data"
dout = glib.read("aurora_rd_data")
print hex(dout)
print "tx_tready :", str(bin(status3))[2]
print "rx_tvalid :", str(bin(status3))[3]
print "rx_tlast :", str(bin(status3))[4]
print "rx_tkeep :", str(bin(status3))[5:9]
print "hard_err_1 :", str(bin(status3))[9]
print "soft_err_1 :", str(bin(status3))[10]
print "frame_err_1 :", str(bin(status3))[11]
print "lane_up_1 :", str(bin(status3))[12]
print "channel_up_1 :", str(bin(status3))[13]
print "hard_err_2 :", str(bin(status3))[14]
print "soft_err_2 :", str(bin(status3))[15]
print "frame_err_2 :", str(bin(status3))[16]
print "lane_up_2 :", str(bin(status3))[17]
print "channel_up_2 :", str(bin(status3))[18]

print 
print "-> loop back latency: "
latency_lb = glib.read("aurora_latency_lb_reg")
print bin(latency_lb)
print latency_lb

print 
print "-> latency: "
latency = glib.read("aurora_latency_reg")
print bin(latency)
print latency

# data2 = 0xdeadbeef
# print
# print "-> send data :", data2
# glib.write("aurora_wr_data",data2,0)

# print
# print "-> read data :"
# dataout = glib.read("aurora_rd_data")
# print "-> aurora data output :", hex(dataout)

# print
# print "-> read aurora status :"
# status = glib.read("aurora_rd_status")
# print "-> aurora status :", hex(status)
# print "tx_tready :", str(bin(status))[2]
# print "rx_tvalid :", str(bin(status))[3]
# print "rx_tlast :", str(bin(status))[4]
# print "rx_tkeep :", str(bin(status))[5:9]
# print "hard_err_1 :", str(bin(status))[9]
# print "soft_err_1 :", str(bin(status))[10]
# print "frame_err_1 :", str(bin(status))[11]
# print "lane_up_1 :", str(bin(status))[12]
# print "channel_up_1 :", str(bin(status))[13]
# print "hard_err_2 :", str(bin(status))[14]
# print "soft_err_2 :", str(bin(status))[15]
# print "frame_err_2 :", str(bin(status))[16]
# print "lane_up_2 :", str(bin(status))[17]
# print "channel_up_2 :", str(bin(status))[18]

# data3 = 0x12345678
# print 
# print "-> send last data :", data3
# glib.write("aurora_wr_data",data3,1)

# print
# print "-> read data :"
# dataout = glib.read("aurora_rd_data")
# print "-> aurora data output :", hex(dataout)

# print
# print "-> read aurora status :"
# status = glib.read("aurora_rd_status")
# print "-> aurora status :", hex(status)
# print "tx_tready :", str(bin(status))[2]
# print "rx_tvalid :", str(bin(status))[3]
# print "rx_tlast :", str(bin(status))[4]
# print "rx_tkeep :", str(bin(status))[5:9]
# print "hard_err_1 :", str(bin(status))[9]
# print "soft_err_1 :", str(bin(status))[10]
# print "frame_err_1 :", str(bin(status))[11]
# print "lane_up_1 :", str(bin(status))[12]
# print "channel_up_1 :", str(bin(status))[13]
# print "hard_err_2 :", str(bin(status))[14]
# print "soft_err_2 :", str(bin(status))[15]
# print "frame_err_2 :", str(bin(status))[16]
# print "lane_up_2 :", str(bin(status))[17]
# print "channel_up_2 :", str(bin(status))[18]
