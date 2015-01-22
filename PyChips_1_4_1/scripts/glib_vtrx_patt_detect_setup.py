from PyChipsUser import *
import sys
import os
glibAddrTable = AddressTable("./glibAddrTable.dat")

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

print "SFP slow BERT pattern detector setup"
print
print "sfp_slow_pd_enable", uInt32HexStr(glib.read("sfp_slow_pd_enable"))	
glib.write("sfp_slow_pd_enable", 1)
print "sfp_slow_pd_enable", uInt32HexStr(glib.read("sfp_slow_pd_enable"))	
print
print "user_sfp_slow_pd_pattrn", uInt32HexStr(glib.read("user_sfp_slow_pd_pattrn"))	
glib.write("user_sfp_slow_pd_pattrn", 0xFFFFFFFF)		
print "user_sfp_slow_pd_pattrn", uInt32HexStr(glib.read("user_sfp_slow_pd_pattrn"))	
print	
print "sfp_slow_pd_chkwth", uInt32HexStr(glib.read("sfp_slow_pd_chkwth"))	
glib.write("sfp_slow_pd_chkwth", 7) 
print "sfp_slow_pd_chkwth", uInt32HexStr(glib.read("sfp_slow_pd_chkwth"))		
print	
print "sfp_slow_pd_dassdly", uInt32HexStr(glib.read("sfp_slow_pd_dassdly"))	
glib.write("sfp_slow_pd_dassdly", 0) 
print "sfp_slow_pd_dassdly", uInt32HexStr(glib.read("sfp_slow_pd_dassdly"))	
print
print
print "SFP fast BERT pattern detector setup"
print
print "sfp_fast_pd_enable", uInt32HexStr(glib.read("sfp_fast_pd_enable"))	
glib.write("sfp_fast_pd_enable", 1)
print "sfp_fast_pd_enable", uInt32HexStr(glib.read("sfp_fast_pd_enable"))	
print
print "user_sfp_fast_pd_pattrn", uInt32HexStr(glib.read("user_sfp_fast_pd_pattrn"))	
glib.write("user_sfp_fast_pd_pattrn", 0xAAAAA)	
print "user_sfp_fast_pd_pattrn", uInt32HexStr(glib.read("user_sfp_fast_pd_pattrn"))	
print	
print "sfp_fast_pd_chkwth", uInt32HexStr(glib.read("sfp_fast_pd_chkwth"))	
glib.write("sfp_fast_pd_chkwth", 19) 
print "sfp_fast_pd_chkwth", uInt32HexStr(glib.read("sfp_fast_pd_chkwth"))		
print	
print "sfp_fast_pd_dassdly", uInt32HexStr(glib.read("sfp_fast_pd_dassdly"))	
glib.write("sfp_fast_pd_dassdly", 6) 
print "sfp_fast_pd_dassdly", uInt32HexStr(glib.read("sfp_fast_pd_dassdly"))	

print
print "--=======================================--"
print
print 
