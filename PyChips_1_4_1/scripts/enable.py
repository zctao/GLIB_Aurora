from PyChipsUser import *
from time import sleep

glibAddrTable = AddressTable("./glibAddrTable.dat")

f = open('./ipaddr.dat', 'r')
ipaddr = f.readline()
f.close()
glib = ChipsBusUdp(glibAddrTable, ipaddr, 50001)

def enable():
	glib.write("ram_enable_0",1)	
	print "-> ram_enable    	   	:", glib.read("ram_enable_0")

def write_enable(n):
	for i in range(1,5):
		strg = "ram_enable_"+str(i)
		glib.write(strg,n)	
		print "-> write_enable_"+str(i)+"       	:", glib.read("ram_enable_"+str(i))
		