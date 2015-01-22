##===================================================================================================##
##==================================== Module Information ===========================================##
##===================================================================================================##
##																								 
## Company:  				CERN (PH-ESE-BE)													 
## Engineer: 				Manoel Barros Marin (manoel.barros.marin@cern.ch) (m.barros@ieee.org)
## 																						 					
## Create Date:				20/01/2013 													 
## Module Name:				glib_flash_full_erase												 
## Python Version:			2.7.3																			
##																											
## Revision:				1.0 																				
##																													
## Additional Comments: 																							
##																												
##===================================================================================================##
##===================================================================================================##

## Python modules:
from time import *
import sys
import os

## Custom modules:
from glib_flash_functions_module import *

## Import the PyChips code - PYTHONPATH must be set to the PyChips installation src folder!
from PyChipsUser import *

##===================================================================================================##
##======================================== Script Body ==============================================## 
##===================================================================================================##

#######################################################################################################
## PYCHIPS
#######################################################################################################

#######################################################################################################
### Uncomment one of the following two lines to turn on verbose or very-verbose debug modes.   		###
### These debug modes allow you to see the packets being sent and received.                    		###
#######################################################################################################

##chipsLog.setLevel(logging.DEBUG)    # Verbose logging (see packets being sent and received)

## Read in an address table by creating an AddressTable object (Note the forward slashes, not backslashes!)
glibAddrTable = AddressTable("./glibAddrTable.dat")

f = open('./ipaddr.dat', 'r')
ipaddr = f.readline()
f.close()
glib = ChipsBusUdp(glibAddrTable, ipaddr, 50001)

print
print "--=======================================--"
print "  Opening GLIB with IP", ipaddr
print "--=======================================--"
print

#######################################################################################################
## Main
#######################################################################################################

## Flash Selection:
print
print "-> Set flash controlled by ipbus..."
glib.write("flash_select",1)
print "-> Flash_select pin is : ", glib.read("flash_select")	

## Asynchronous read mode configuration:
print "->" 
print "-> Set asyncrhonous read mode..."
print confAsyncRead(glib)

#######################################################################################################
## Erase all data in FLASH
#######################################################################################################

print "->" 
print "-> Erasing the FLASH..."				

start_time = time()	

for i in range(num_total_blocks):		
	
	print "->" 
	print "-> Erasing flash_block%d..." % i			
	
	## Unlocks the block:
	print "->"
	print blockLockOrUnlock(glib, ("flash_block%d" % i), 'u')						
	
	#########################################################################	
	## Note!!! block blank check command of the FLASH does not work properly
	#########################################################################
	
	# for j in range(5): # Five attempts
	
	## Erases the block:		
	print "->"
	print blockErase(glib, ("flash_block%d" % i))
	
	## Checks whether whe block is blank or not:
	# block_blank = blockBlankCheck(glib, ("flash_bank%d" % i))		
	# print block_blank
	# if block_blank[0:4] == "Done":
		# break
	
	#########################################################################
	
	## Locks the block:
	print "->"
	print blockLockOrUnlock(glib, ("flash_block%d" % i), 'l')	
	
elapsed_time = time() - start_time
minutes = (elapsed_time // 60)
seconds = elapsed_time % 60	
				
print "->"	
print "-> Done"				
print "->"	
print "-> Process time: %d minutes and %d seconds." % (minutes, seconds)
print
		
##===================================================================================================##
##===================================================================================================##
	