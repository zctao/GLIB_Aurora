from PyChipsUser import *
from time import sleep
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

sfpUpperThreshold = 0x70
sfpLowerThreshold = 0x50

fmc1UpperThreshold = 0x48
fmc1LowerThreshold = 0x28

print
glib.write("cdce_ctrl_sel", 0) # controlled by IPbus
glib.write("cdce_sync", 0)
glib.read ("ctrl") # dummy read
glib.read ("ctrl") # dummy read
print "-> deasserting sync", uInt32HexStr(glib.read ("ctrl")) 
glib.write("cdce_sync", 1)
glib.read ("ctrl") # dummy read
glib.read ("ctrl") # dummy read
print "-> asserting sync  ", uInt32HexStr(glib.read ("ctrl")) 
sleep(0.5)

print
print
print "   ###############################"
print "   #### CDCE Phase Monitoring ####"
print "   ###############################"
print
print

print "-> CDCE locked:             ", glib.read("cdce_lock")
print




############## SETUP ###############

# print
# print "-> Monitoring setup ..."
# print
# print "-> Writing SFP  lower threshold"
# glib.write("sfp_phase_mon_lower", sfpLowerThreshold)
# print "-> Writing SFP  upper threshold"
# glib.write("sfp_phase_mon_upper", sfpUpperThreshold)
# print "-> Writing FMC1 lower threshold"
# glib.write("fmc1_phase_mon_lower", fmc1LowerThreshold)
# print "-> Writing FMC1 upper threshold"
# glib.write("fmc1_phase_mon_upper", fmc1UpperThreshold)

############### RUN ###############

print
print "-> Monitoring Run ..."
glib.write("gbt_phase_mon_reset", 1)
glib.write("gbt_phase_mon_reset", 0)
sleep(0.5)

############ GET RESULTS ############

print
print "-> Monitoring Results ..."
print
print "-> SFP"
print
print "-> phase monitoring done:   ",  glib.read("sfp_phase_mon_done")
print 
print "-> upper threshold:        ",  uInt32HexStr(glib.read("sfp_phase_mon_upper"))[6:8]
print "-> phase monitoring stats: ",  uInt32HexStr(glib.read("sfp_phase_mon_stats"))[4:6]
print "-> lower threshold:        ",  uInt32HexStr(glib.read("sfp_phase_mon_lower"))[6:8]
print
print "-> phase monitoring OK:     ",  glib.read("sfp_phase_mon_ok")

print
print "-> FMC1"
print
print "-> phase monitoring done:   ",  glib.read("fmc1_phase_mon_done")
print 
print "-> upper threshold:        ",  uInt32HexStr(glib.read("fmc1_phase_mon_upper"))[6:8]
print "-> phase monitoring stats: ",  uInt32HexStr(glib.read("fmc1_phase_mon_stats"))[4:6]
print "-> lower threshold:        ",  uInt32HexStr(glib.read("fmc1_phase_mon_lower"))[6:8]
print
print "-> phase monitoring OK:     ",  glib.read("fmc1_phase_mon_ok")
print 
print
print "-> CDCE locked:             ", glib.read("cdce_lock")
print
print "-> done"
print
print "--=======================================--"
print 
print

