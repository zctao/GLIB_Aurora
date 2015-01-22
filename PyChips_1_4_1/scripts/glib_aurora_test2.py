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


data11 = 0xcafebabe
data12 = 0x1a2b3c4d
data13 = 0xdeadbeef

data21 = 0x19900614
data22 = 0x12348765
data23 = 0xfade6789

print
print "-> write aurora_1 data to registers:", hex(data11)," ",hex(data12)," ",hex(data13)
glib.write("aurora1_datareg1",data11,0)
glib.write("aurora1_datareg2",data12,0)
glib.write("aurora1_datareg3",data13,0)

print
print "-> write aurora_2 data to registers:", hex(data21)," ",hex(data22)," ",hex(data23)
glib.write("aurora2_datareg1",data21,0)
glib.write("aurora2_datareg2",data22,0)
glib.write("aurora2_datareg3",data23,0)


input11 = glib.read("aurora1_datareg1")
input12 = glib.read("aurora1_datareg2")
input13 = glib.read("aurora1_datareg3")

input21 = glib.read("aurora2_datareg1")
input22 = glib.read("aurora2_datareg2")
input23 = glib.read("aurora2_datareg3")

print 
print "check data regs: "
print hex(input11)
print hex(input12)
print hex(input13)
print
print hex(input21)
print hex(input22)
print hex(input23)

print
print "-> reset data input FSMs..."
glib.write("reset_fsm",0x00000001,0)
glib.write("reset_fsm",0xfffffff0,0)

print
dataflow = 0xfffffff3  #last digit: 0=not send data; 1=send data 1->2; 2=send data 2->1; 3=mutually

if dataflow == 0xfffffff0:
	print ">>>>>> not sending data <<<<<<"
if dataflow == 0xfffffff1:
	print ">>>>>> sending data from 1 to 2 >>>>>>"
if dataflow == 0xfffffff2:
	print "<<<<<< sending data from 2 to 1 <<<<<<"
if dataflow == 0xfffffff3:
	print "<<<<<< exchange data between 1 and 2 >>>>>>"
#turn on enable signal and then off
glib.write("aurora_en",dataflow,0)
glib.write("aurora_en",0xfffffff0,0)

print
print "-> read aurora 1 :"

dataout11 = glib.read("aurora1_rdbk_data1_reg")
print "-> aurora1 data1 output :", hex(dataout11)

print
print "-> read aurora1 status1 :"
status11 = glib.read("aurora1_rdbk_stat1_reg")
print "-> aurora status :", bin(status11)
print "tx_tready :", str(bin(status11))[2]
print "rx_tvalid :", str(bin(status11))[3]
print "rx_tlast :", str(bin(status11))[4]
print "rx_tkeep :", str(bin(status11))[5:9]
print "hard_err :", str(bin(status11))[9]
print "soft_err :", str(bin(status11))[10]
print "frame_err :", str(bin(status11))[11]
print "lane_up :", str(bin(status11))[12]
print "channel_up :", str(bin(status11))[13]

print
dataout12 = glib.read("aurora1_rdbk_data2_reg")
print "-> aurora1 data2 output :", hex(dataout12)

print
print "-> read aurora1 status2 :"
status12 = glib.read("aurora1_rdbk_stat2_reg")
print "-> aurora status :", bin(status12)
print "tx_tready :", str(bin(status12))[2]
print "rx_tvalid :", str(bin(status12))[3]
print "rx_tlast :", str(bin(status12))[4]
print "rx_tkeep :", str(bin(status12))[5:9]
print "hard_err :", str(bin(status12))[9]
print "soft_err :", str(bin(status12))[10]
print "frame_err :", str(bin(status12))[11]
print "lane_up :", str(bin(status12))[12]
print "channel_up :", str(bin(status12))[13]

print
dataout13 = glib.read("aurora1_rdbk_data3_reg")
print "-> aurora data3 output :", hex(dataout13)

print
print "-> read aurora1 status3 :"
status13 = glib.read("aurora1_rdbk_stat3_reg")
print "-> aurora status :", bin(status13)
print "tx_tready :", str(bin(status13))[2]
print "rx_tvalid :", str(bin(status13))[3]
print "rx_tlast :", str(bin(status13))[4]
print "rx_tkeep :", str(bin(status13))[5:9]
print "hard_err :", str(bin(status13))[9]
print "soft_err :", str(bin(status13))[10]
print "frame_err :", str(bin(status13))[11]
print "lane_up :", str(bin(status13))[12]
print "channel_up :", str(bin(status13))[13]

print
print "-> read aurora 2 :"

dataout21 = glib.read("aurora2_rdbk_data1_reg")
print "-> aurora2 data1 output :", hex(dataout21)

print
print "-> read aurora2 status1 :"
status21 = glib.read("aurora2_rdbk_stat1_reg")
print "-> aurora status :", bin(status21)
print "tx_tready :", str(bin(status21))[2]
print "rx_tvalid :", str(bin(status21))[3]
print "rx_tlast :", str(bin(status21))[4]
print "rx_tkeep :", str(bin(status21))[5:9]
print "hard_err :", str(bin(status21))[9]
print "soft_err :", str(bin(status21))[10]
print "frame_err :", str(bin(status21))[11]
print "lane_up :", str(bin(status21))[12]
print "channel_up :", str(bin(status21))[13]

print
dataout22 = glib.read("aurora2_rdbk_data2_reg")
print "-> aurora2 data2 output :", hex(dataout22)

print
print "-> read aurora2 status2 :"
status22 = glib.read("aurora2_rdbk_stat2_reg")
print "-> aurora status :", bin(status22)
print "tx_tready :", str(bin(status22))[2]
print "rx_tvalid :", str(bin(status22))[3]
print "rx_tlast :", str(bin(status22))[4]
print "rx_tkeep :", str(bin(status22))[5:9]
print "hard_err :", str(bin(status22))[9]
print "soft_err :", str(bin(status22))[10]
print "frame_err :", str(bin(status22))[11]
print "lane_up :", str(bin(status22))[12]
print "channel_up :", str(bin(status22))[13]

print
dataout23 = glib.read("aurora2_rdbk_data3_reg")
print "-> aurora data3 output :", hex(dataout23)

print
print "-> read aurora2 status3 :"
status23 = glib.read("aurora2_rdbk_stat3_reg")
print "-> aurora1 status :", bin(status23)
print "tx_tready :", str(bin(status23))[2]
print "rx_tvalid :", str(bin(status23))[3]
print "rx_tlast :", str(bin(status23))[4]
print "rx_tkeep :", str(bin(status23))[5:9]
print "hard_err :", str(bin(status23))[9]
print "soft_err :", str(bin(status23))[10]
print "frame_err :", str(bin(status23))[11]
print "lane_up :", str(bin(status23))[12]
print "channel_up :", str(bin(status23))[13]

print 
print "-> latency 1->2 (between tx_tvalid_1 and rx_tvalid_2) :"
latency_1to2 = glib.read("aurora_latency_reg1")
print bin(latency_1to2)
print latency_1to2

print 
print "-> latency 1->2 between local_tx_tvalid_1 and local_rx_tvalid_2 (w/o FIFO) :"
latency_1to2_local = glib.read("aurora_latency_reg3")
print bin(latency_1to2_local)
print latency_1to2_local

print 
print "-> latency 2->1 (between tx_tvalid_2 and rx_tvalid_1) :"
latency_2to1 = glib.read("aurora_latency_reg2")
print bin(latency_2to1)
print latency_2to1

print 
print "-> latency 2->1 between local_tx_tvalid_2 and local_rx_tvalid_1 (w/o FIFO) :"
latency_2to1_local = glib.read("aurora_latency_reg4")
print bin(latency_2to1_local)
print latency_2to1_local

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
