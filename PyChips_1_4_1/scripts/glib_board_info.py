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
print
print "-> BOARD STATUS     "
print "-> -----------------"

print "-> sfp1 absent       :", glib.read("glib_sfp1_mod_abs")
print "-> sfp1 rxlos        :", glib.read("glib_sfp1_rxlos")
print "-> sfp1 txfault      :", glib.read("glib_sfp1_txfault")
print "-> sfp2 absent       :", glib.read("glib_sfp2_mod_abs")
print "-> sfp2 rxlos        :", glib.read("glib_sfp2_rxlos")
print "-> sfp2 txfault      :", glib.read("glib_sfp2_txfault")
print "-> sfp3 absent       :", glib.read("glib_sfp3_mod_abs")
print "-> sfp3 rxlos        :", glib.read("glib_sfp3_rxlos")
print "-> sfp3 txfault      :", glib.read("glib_sfp3_txfault")
print "-> sfp4 absent       :", glib.read("glib_sfp4_mod_abs")
print "-> sfp4 rxlos        :", glib.read("glib_sfp4_rxlos")
print "-> sfp4 txfault      :", glib.read("glib_sfp4_txfault")
print "-> ethphy interrupt  :", glib.read("gbe_int")
print "-> fmc1 presence     :", glib.read("fmc1_present")
print "-> fmc2 presence     :", glib.read("fmc2_present")
print "-> fpga reset state  :", glib.read("fpga_reset")
print "-> cpld bus state    :", uInt8HexStr(glib.read("v6_cpld"))
print "-> cdce locked       :", glib.read("cdce_lock")

print "-> user reg 0       :", hex(glib.read("user_ipb_regs0"))
print "-> user reg 1       :", glib.read("user_ipb_regs1")
print "-> user reg 2       :", glib.read("user_ipb_regs2")
print "-> user reg 3       :", glib.read("user_ipb_regs3")

print "-> user reg 6       :", glib.read("user_ipb_regs6")
print "-> user reg 16       :", glib.read("user_ipb_regs16")

#print "-> user reg 4       :", glib.read("user_ipb_regs4")
#print "-> user reg 5       :", glib.read("user_ipb_regs5")

#glib.write("user_ipb_regs16",0xdeadbeef)

#glib.write("user_ipb_regs17",0xdeadbeef)


print "-> user reg 0       :", hex(glib.read("user_ipb_regs0"))
print "-> user reg 1       :", hex(glib.read("user_ipb_regs1"))
print "-> user reg 2       :", hex(glib.read("user_ipb_regs2"))

#print "-> user reg 15       :", hex(glib.read("user_ipb_regs15"))
#print "-> user reg 16       :", hex(glib.read("user_ipb_regs16"))
#print "-> user reg 17       :", hex(glib.read("user_ipb_regs17"))

data = [1,2,3,4,5]
glib.blockWrite("sram1", data)
glib.blockWrite("user_ipb_mem", data)
print "sram1 " ,glib.blockRead("sram1", 5)
print "test "  ,glib.blockRead("user_ipb_mem",5)

#glib.write("user_ipb_mem", 1)
#glib.read("user_ipb_mem")
#d2 = glib.blockRead("user_ipb_mem", 10)

#print d2

#print "-> led test		:", glib.read("gbt_fpga_led_2")

print
print "-> done"
print
print "--=======================================--"
print 
print

