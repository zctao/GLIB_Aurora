from PyChipsUser import *
from time import sleep

print
print
print "--=======================================--"
print "  Opening GLIB with IP 192.168.0.111"
print "--=======================================--"

glibAddrTable = AddressTable("./glibAddrTable.dat")
glib = ChipsBusUdp(glibAddrTable, "192.168.0.111", 50001)

print
print "-> reg 00: user id          :" , uInt32HexStr(glib.read("user_wb_regs",0))
print "-> reg 01: type id          :" , uInt32HexStr(glib.read("user_wb_regs",1))
print "-> reg 02: firmware id      :" , uInt32HexStr(glib.read("user_wb_regs",2))
print 
print "-> ----------------------------------------"
print "-> reg 04: fmc gbt status   :" , uInt32HexStr(glib.read("user_wb_regs",4))
print "-> reg 05: fmc bert wrd_L   :" , uInt32HexStr(glib.read("user_wb_regs",5))
print "-> reg 06: fmc bert wrd_H   :" , uInt32HexStr(glib.read("user_wb_regs",6))
print "-> reg 07: fmc bert err_L   :" , uInt32HexStr(glib.read("user_wb_regs",7))
print "-> reg 08: fmc bert err_H   :" , uInt32HexStr(glib.read("user_wb_regs",8))
print "-> ----------------------------------------"
print "-> reg 16: fmc_bitslip_ctrl :" , uInt32HexStr(glib.read("user_wb_regs",16))
print "-> reg 17: fmc_link_ctrl    :" , uInt32HexStr(glib.read("user_wb_regs",17))
print "-> reg 18: fmc_sram_ctrl    :" , uInt32HexStr(glib.read("user_wb_regs",18))
print "-> reg 19: fmc_gtx_ctrl     :" , uInt32HexStr(glib.read("user_wb_regs",19))
print "-> reg 20: fmc_bert_ctrl    :" , uInt32HexStr(glib.read("user_wb_regs",20))
print "-> ----------------------------------------"
print "-> reg 10: sfp gbt status   :" , uInt32HexStr(glib.read("user_wb_regs",10))
print "-> reg 11: sfp bert wrd_L   :" , uInt32HexStr(glib.read("user_wb_regs",11))
print "-> reg 12: sfp bert wrd_H   :" , uInt32HexStr(glib.read("user_wb_regs",12))
print "-> reg 13: sfp bert err_L   :" , uInt32HexStr(glib.read("user_wb_regs",13))
print "-> reg 14: sfp bert err_H   :" , uInt32HexStr(glib.read("user_wb_regs",14))
print "-> ----------------------------------------"
print "-> reg 24: sfp_bitslip_ctrl :" , uInt32HexStr(glib.read("user_wb_regs",24))
print "-> reg 25: sfp_link_ctrl    :" , uInt32HexStr(glib.read("user_wb_regs",25))
print "-> reg 26: sfp_sram_ctrl    :" , uInt32HexStr(glib.read("user_wb_regs",26))
print "-> reg 27: sfp_gtx_ctrl     :" , uInt32HexStr(glib.read("user_wb_regs",27))
print "-> reg 28: sfp_bert_ctrl    :" , uInt32HexStr(glib.read("user_wb_regs",28))
print
print "-> done"
print
print "--=======================================--"
print 
print












