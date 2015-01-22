##===================================================================================================##
##==================================== Script Information ===========================================##
##===================================================================================================##
##																								 
## Company:  				CERN (PH-ESE-BE)													 
## Engineer: 				Manoel Barros Marin (manoel.barros.marin@cern.ch) (m.barros@ieee.org)
## 																						 					
## Create Date:				13/03/2013													 
## Script Name:				glib_flash_corrupt_user_image												 
## Python Version:			2.7.3																			
##																											
## Revision:				1.0 																				
##																													
## Additional Comments: 																							
##																													
##===================================================================================================##
##===================================================================================================##

## Python modules:
import sys
import os
from time import *

## Custom modules:
from glib_flash_functions_module import *

##  Import the PyChips code - PYTHONPATH must be set to the PyChips installation src folder!
from PyChipsUser import *

##===================================================================================================##
##======================================== Script Body ==============================================## 
##===================================================================================================##

#######################################################################################################
## PYCHIPS
#######################################################################################################

##################################################################################################
### Uncomment one of the following two lines to turn on verbose or very-verbose debug modes.   ###
### These debug modes allow you to see the packets being sent and received.                    ###
##################################################################################################
#chipsLog.setLevel(logging.DEBUG)    # Verbose logging (see packets being sent and received)

# Read in an address table by creating an AddressTable object (Note the forward slashes, not backslashes!)
glibAddrTable = AddressTable("./glibAddrTable.dat")

f = open('./ipaddr.dat', 'r')
ipaddr = f.readline()
f.close()
glib = ChipsBusUdp(glibAddrTable, ipaddr, 50001)
print
print "--=======================================--"
print "  Opening GLIB with IP", ipaddr
print "--=======================================--"

#######################################################################################################
## Main
#######################################################################################################

flash_block = "flash_block65"

print
print "-> Note!!! Are you sure that you want to corrupt the user image?"
prompt_var = ""
while prompt_var != "yes" and prompt_var != "no" :
	prompt_var = raw_input("-> Type \"yes\" to continue or \"no\" to exit: ")

if prompt_var == "yes":

	#####################
	## Flash Selection ##
	#####################
	
	print
	print "-> Set flash controlled by ipbus:"
	glib.write("flash_select",1)
	print "-> Flash_select pin is : ", glib.read("flash_select")
	
	## Asynchronous read mode configuration
	print 
	print "-> Configuring asynchronous read..."
	print confAsyncRead(glib)
		
	##################
	## Block Unlock ##
	##################

	print
	print "-> Unlocking block %s..." % flash_block[11:13]
	print blockLockOrUnlock(glib, flash_block, "u")
							
	######################	
	## Erases the block ##
	######################

	print
	print "-> Erasing block %s..." % flash_block[11:13]
	print blockErase(glib, flash_block)

	#################
	## Block Erase ##
	#################

	print
	print "-> Locking block %s..." % flash_block[11:13]
	print blockLockOrUnlock(glib, flash_block, "l")

	############
	print
	print "-> done"
	############

	print
	print
	os.system('glib_program_b_assert.py')
	
elif prompt_var == "no":
			
	print
	print "-> User image corruption procedure cancelled."					
	
##===================================================================================================##
##===================================================================================================##