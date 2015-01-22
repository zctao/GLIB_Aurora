import sys
import os
# from PyChipsUser import *
# glibAddrTable = AddressTable("./glibAddrTable.dat")
#######################################
## IP address
#######################################
# f = open('./ipaddr.dat', 'r')
# ipaddr = f.readline()
# f.close()
# glib = ChipsBusUdp(glibAddrTable, ipaddr, 50001)
# print
# print "--=======================================--"
# print "  Opening GLIB with IP", ipaddr
# print "--=======================================--"
#######################################


# print
# print "-> tclkb enable"
# glib.write("tclkb_dr_en", 1)
# print "-> tclkb disable"
# glib.write("tclkb_dr_en", 0)


os.system('c:\python27\python glib_vtrx_init.py 2 >> foo.txt')
os.system('c:\python27\python glib_vtrx_temperature.py')
################
print
print "--===--"
print "  SFP  "
print "--===--"
print
################
os.system('c:\python27\python glib_vtrx_bert_ext_conf.py sfp 16 >> foo.txt')
os.system('c:\python27\python glib_vtrx_bert_conf.py     sfp 12 >> foo.txt')
os.system('c:\python27\python glib_vtrx_phase_monitoring.py sfp')
os.system('c:\python27\python glib_vtrx_bert_ext_results.py sfp')
os.system('c:\python27\python glib_vtrx_bert_results.py 	sfp')
################
print
print "--====--"
print "  FMC1  " 
print "--====--"
print
################
os.system('c:\python27\python glib_vtrx_bert_ext_conf.py fmc 16 >> foo.txt')
os.system('c:\python27\python glib_vtrx_bert_conf.py     fmc 12 >> foo.txt')
os.system('c:\python27\python glib_vtrx_phase_monitoring.py fmc')
os.system('c:\python27\python glib_vtrx_bert_ext_results.py fmc')
os.system('c:\python27\python glib_vtrx_bert_results.py 	fmc')
