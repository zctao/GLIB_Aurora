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

#chipsLog.setLevel(logging.DEBUG)    # Verbose logging (see packets being sent and received)

data = [0xFEBCF005,0x00000000,0x00040004,0x002801F4,0x01440FA4,0x004F03E7]
data2 = [0xFEBCF005,0x00000000,0x00040004,0x002801F4,0x01440FA5,0x004F03E7]

tablex1 = 0x0001ffff
tablez1 = 0x0002fffe
tablex2 = 0x0004fffc
tablez2 = 0x0003fffd
tablex3 = 0x0001fffb
tablez3 = 0x0006fffa
stub_count = 0b00000000000000000000000001100011
print hex(0b00000000000000000000000001100011)

#glib.write("TRACKLET_CNT_FIFO_STAT",1)


glib.blockWrite("in_stub_mem", data)
glib.blockWrite("out_stub_mem_a", data)
#glib.blockWrite("out_stub_mem_b", data)
#glib.blockWrite("out_stub_mem_c", data)

glib.write("Window_X_LUT", tablex1,0)
glib.write("Window_Z_LUT", tablez1,0)
glib.write("Window_X_LUT", tablex2,500)
glib.write("Window_Z_LUT", tablez2,40)
glib.write("Window_X_LUT", tablex3,999)
glib.write("Window_Z_LUT", tablez3,79)

print glib.blockRead("in_stub_mem", 6)
print glib.blockRead("out_stub_mem_a", 6)
#print glib.blockRead("out_stub_mem_b", 1)
#print glib.blockRead("out_stub_mem_c", 1)
#print glib.read("Window_X_LUT", 0)
#print glib.read("Window_Z_LUT", 0)
#print glib.read("Window_X_LUT", 500)
#print glib.read("Window_Z_LUT", 500)
#print glib.read("Window_X_LUT", 999)
#print glib.read("Window_Z_LUT", 999)

#print "TRACKLET_CNT_FIFO_STAT",glib.read("TRACKLET_CNT_FIFO_STAT")

glib.write("stub_cnt_fifo", stub_count)
"""
print "Write to stub count fifo"

print "TRACKLET_CNT_FIFO_STAT",glib.read("TRACKLET_CNT_FIFO_STAT")
glib.write("TRACKLET_FIFO_RD",0)

print "TRACKLET_CNT_FIFO_DAT",glib.read("TRACKLET_CNT_FIFO_DAT")
if glib.read("TRACKLET_CNT_FIFO_DAT") > 0:
	print "Tracklet A"
	for i in range(0,glib.read("TRACKLET_CNT_FIFO_DAT")):
		print "Tracklet #",i+1
		glib.write("TRACKLET_FIFO_RD",1)
		for j in range(0,4):
			print "Word #",j, "=",hex(glib.read("TRACKLET_A_BASE",j))
"""
test = [0xffffffff]

glib.write("read_test_register",0xffffffff)
#glib.write("write_to_lookup",0xffffffff)


print "x0=", glib.read("doutx0")
print "i_s_one2=", hex(glib.read("i_s_one2_reg"))
print "i_a2=", glib.read("i_a2_reg")
print "i_t_one2=", glib.read("i_t_one2_reg")
print "i_b3=", glib.read("i_b3_reg")
print "i_t_two3=", glib.read("i_t_two3_reg")
print "i_c4=", glib.read("i_c4_reg")
print "i_t_three4=", (glib.read("i_t_three4_reg"))
print "i_t_sixp4=", glib.read("i_t_sixp4_reg")
print "i_t_seven4=", glib.read("i_t_seven4_reg")
print "i_s_two5=", glib.read("i_s_two5_reg")
print "i_rinv6=", glib.read("i_rinv6_reg")

