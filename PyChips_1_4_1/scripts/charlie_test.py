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
chipsLog.setLevel(logging.DEBUG)    # Verbose logging (see packets being sent and received)


print
print "-> BOARD INFORMATION"
print "-> -----------------"

brd_char 	= ['w','x','y','z']
brd_char[0] = chr(glib.read("board_id_char1"))
brd_char[1] = chr(glib.read("board_id_char2"))
brd_char[2] = chr(glib.read("board_id_char3"))
brd_char[3] = chr(glib.read("board_id_char4"))
print "-> brd :",brd_char[0],brd_char[1],brd_char[2],brd_char[3]

sys_char 	= ['w','x','y','z']
sys_char[0] = chr(glib.read("sys_id_char1"))
sys_char[1] = chr(glib.read("sys_id_char2"))
sys_char[2] = chr(glib.read("sys_id_char3"))
sys_char[3] = chr(glib.read("sys_id_char4"))
print "-> sys :",sys_char[0],sys_char[1],sys_char[2],sys_char[3]

ver_major = glib.read("ver_major")
ver_minor = glib.read("ver_minor")
ver_build = glib.read("ver_build")
print "-> ver :", ver_major,".",ver_minor,".",ver_build
yy  = 2000+glib.read("firmware_yy")
mm  = glib.read("firmware_mm")
dd  = glib.read("firmware_dd")
print "-> date:", dd,"/",mm,"/", yy

#####################################################################
os.system('c:\python27\python glib_i2c_eeprom_read_eui.py')
#####################################################################
'''
glib.write("user_ipb_ctrl_regs",0x00000001, 0)
time.sleep(0.1)
glib.write("user_ipb_ctrl_regs",0x00000000, 0)
time.sleep(0.1)
glib.write("user_ipb_ctrl_regs",0x00000001, 0)
time.sleep(0.1)
glib.write("user_ipb_ctrl_regs",0x00000000, 0)
time.sleep(0.1)
glib.write("user_ipb_ctrl_regs",0x00000001, 0)
time.sleep(0.1)
glib.write("user_ipb_ctrl_regs",0x00000000, 0)
time.sleep(0.1)

glib.write("user_ipb_ctrl_regs",0x00000001, 0)
time.sleep(0.2)
glib.write("user_ipb_ctrl_regs",0x00000000, 0)
time.sleep(0.1)
glib.write("user_ipb_ctrl_regs",0x00000001, 0)
time.sleep(0.2)
glib.write("user_ipb_ctrl_regs",0x00000000, 0)
time.sleep(0.1)
glib.write("user_ipb_ctrl_regs",0x00000001, 0)
time.sleep(0.2)
glib.write("user_ipb_ctrl_regs",0x00000000, 0)
time.sleep(0.1)

glib.write("user_ipb_ctrl_regs",0x00000001, 0)
time.sleep(0.1)
glib.write("user_ipb_ctrl_regs",0x00000000, 0)
time.sleep(0.1)
glib.write("user_ipb_ctrl_regs",0x00000001, 0)
time.sleep(0.1)
glib.write("user_ipb_ctrl_regs",0x00000000, 0)
time.sleep(0.1)
glib.write("user_ipb_ctrl_regs",0x00000001, 0)
time.sleep(0.1)
glib.write("user_ipb_ctrl_regs",0x00000000, 0)
time.sleep(0.1)
'''

glib.write("user_ipb_space",0x41041041, 0)
glib.write("user_ipb_space",0xbeef, 14)
glib.write("user_ipb_space",0x7fa4bb6b, 13)
glib.write("user_ipb_space",0xbeef, 14)
#glib.write("user_ipb_space",0xdeadbeef, 0)
#glib.write("user_ipb_space",0x0, 0)
glib.write("user_ipb_ctrl_regs",0x00000001, 0)
#glib.read("user_ipb_space", 1)
#glib.write("user_ipb_space",0, 3)
#glib.write("user_ipb_space",0, 5)
print "test", hex(glib.read("user_ipb_space", 20))

'''
glib.blockWrite("DeltaOverR_1_A_TF", [3744])
glib.blockWrite("DeltaOverDX_1_A_TF", [3199])
glib.blockWrite("TwoOverOuterR_1_A_TF", [1344328])
glib.blockWrite("DXOverR_1_A_TF", [4])
glib.blockWrite("DXrsq_1_A_TF", [2])
glib.blockWrite("ROverDX_1_A_TF", [28000])

glib.blockWrite("DXOverR_3_A_TP", [3])
glib.blockWrite("DXrsq_3_A_TP", [5])
glib.blockWrite("ROverDX_3_A_TP", [40000])

glib.blockWrite("DeltaOverR_3_A_HM", [3744])
glib.blockWrite("DeltaOverDX_3_A_HM", [3199])
glib.blockWrite("TwoOverOuterR_3_A_HM", [1344328])
glib.blockWrite("DXOverR_3_A_HM", [3])
glib.blockWrite("DXrsq_3_A_HM", [4])
glib.blockWrite("ROverDX_3_A_HM", [40000])

glib.blockWrite("DXOverR_4_A_TP", [3])
glib.blockWrite("DXrsq_4_A_TP", [6])
glib.blockWrite("ROverDX_4_A_TP", [43200])

glib.blockWrite("DeltaOverR_4_A_HM", [3744])
glib.blockWrite("DeltaOverDX_4_A_HM", [3199])
glib.blockWrite("TwoOverOuterR_4_A_HM", [1344328])
glib.blockWrite("DXOverR_4_A_HM", [3])
glib.blockWrite("DXrsq_4_A_HM", [6])
glib.blockWrite("ROverDX_4_A_HM", [43200])

glib.blockWrite("DXOverR_5_A_TP", [1])
glib.blockWrite("DXrsq_5_A_TP", [21])
glib.blockWrite("ROverDX_5_A_TP", [80000])

glib.blockWrite("DeltaOverR_5_A_HM", [3744])
glib.blockWrite("DeltaOverDX_5_A_HM", [3199])
glib.blockWrite("TwoOverOuterR_5_A_HM", [1344328])
glib.blockWrite("DXOverR_5_A_HM", [1])
glib.blockWrite("DXrsq_5_A_HM", [21])
glib.blockWrite("ROverDX_5_A_HM", [80000])

glib.blockWrite("DXOverR_6_A_TP", [1])
glib.blockWrite("DXrsq_6_A_TP", [23])
glib.blockWrite("ROverDX_6_A_TP", [83200])

glib.blockWrite("DeltaOverR_6_A_HM", [3744])
glib.blockWrite("DeltaOverDX_6_A_HM", [3199])
glib.blockWrite("TwoOverOuterR_6_A_HM", [1344328])
glib.blockWrite("DXOverR_6_A_HM", [1])
glib.blockWrite("DXrsq_6_A_HM", [23])
glib.blockWrite("ROverDX_6_A_HM", [83200])

data_hm_3 = [0x40004,0x2801F4,0x13C0F9C,0x4F03E7,0xFEC4F064,0x0,0x4029B,0x28123B]
data_hm_4 = [0x40004,0x2801F4,0x13C0F9C,0x4F03E7,0xFEC4F064,0x0,0x4030A,0x2812AA]
data_hm_5 = [0x40A6E,0x281A0E]
data_hm_6 = [0x40B48,0x281AE8]
data_in   = [0xFEC4F064,0x0,0x40004,0x2801F4,0x13C0F9C,0x4F03E7,0x40147,0x28021D]
data_out  = [0xFEC4F064,0x0,0x40004,0x2801F4,0x13C0F9C,0x4F03E7,0x40196,0x280227]

glib.blockWrite("hit_match_mem3", data_hm_3)
glib.blockWrite("hit_match_fifo3", [4])
glib.blockWrite("hit_match_mem4", data_hm_4)
glib.blockWrite("hit_match_fifo4", [4])
glib.blockWrite("hit_match_mem5", data_hm_5)
glib.blockWrite("hit_match_fifo5", [1])
glib.blockWrite("hit_match_mem6", data_hm_6)
glib.blockWrite("hit_match_fifo6", [1])

glib.blockWrite("Window_X_LUT", [0x1ffff],0)
glib.blockWrite("Window_Z_LUT", [0x2fffe],0)
glib.blockWrite("Window_X_LUT", [0x4fffc],500)
glib.blockWrite("Window_Z_LUT", [0x3fffd],40)
glib.blockWrite("Window_X_LUT", [0x1fffb],999)
glib.blockWrite("Window_Z_LUT", [0x6fffa],79)
glib.blockWrite("Window_X_LUT", [0x0100ff9c],541)
glib.blockWrite("Window_Z_LUT", [0x6fffa],40)
glib.blockWrite("in_stub_mem", data_in)
glib.blockWrite("out_stub_mem", data_out)
glib.blockWrite("stub_fifo", [0b10000100])
glib.blockWrite("en_proc", [1])

#print glib.blockRead("in_stub_mem", 5)

print
print "-> done"
print
print "--=======================================--"
print 
print

'''