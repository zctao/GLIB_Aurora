from PyChipsUser import *
import sys
import os
glibAddrTable = AddressTable("./glibAddrTable.dat")
########################################
# IP address
########################################
glibAddrTable = AddressTable("./glibAddrTable.dat")
f = open('./ipaddr.dat', 'r')
ipaddr = f.readline()
f.close()
glib = ChipsBusUdp(glibAddrTable, ipaddr, 50001)
print
print "--=======================================--"
print "  Opening GLIB with IP", ipaddr
print "--=======================================--"
########################################
os.system('c:\python27\python glib_vtrx_bert_ext_results.py sfp')
os.system('c:\python27\python glib_vtrx_bert_ext_results.py fmc')
os.system('c:\python27\python glib_vtrx_bert_results.py     sfp')
os.system('c:\python27\python glib_vtrx_bert_results.py     fmc')


print 