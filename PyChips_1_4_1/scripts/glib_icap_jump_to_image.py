##===================================================================================================##
##==================================== Script Information ===========================================##
##===================================================================================================##
##																								 
## Company:  				CERN (PH-ESE-BE)													 
## Engineer: 				Manoel Barros Marin (manoel.barros.marin@cern.ch) (m.barros@ieee.org)
## 																						 					
## Create Date:				14/03/2013													 
## Script Name:				glib_icap_jump_to_image												 
## Python Version:			2.7.3																			
##																											
## Revision:				1.0 																				
##																													
## Additional Comments: 																							
## * This script configures and triggers the ICAP primitive for jumping to User or Golden images.
##																													
##===================================================================================================##
##===================================================================================================##

## Python modules:
import sys
from time import sleep

## Import the PyChips code - PYTHONPATH must be set to the PyChips installation src folder!
from PyChipsUser import *

##===================================================================================================##
##======================================== Script Body ==============================================## 
##===================================================================================================##

args = sys.argv
arg_length = len(args)

if arg_length == 2:	

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

	arg_error = 0

	if args[1] == "user":
	
		page = 2 	## 2 -> 0x400000 (User image)
		
	elif args[1] == "golden":	
		
		page = 0 	## 0 -> 0x000000 (Golden image)
	
	else:
	
		print
		print "-> Error!!! Invalid argument."
		print "-> "
		print "-> Syntax:"
		print "-> "
		print "-> glib_icap_jump_to_image.py <user|golden>"
		print "-> "	
		print "-> <user|golden> - Either user OR golden:" 		
		print "-> 	            - user   : Jumps to User image"	
		print "-> 	            - golden : Jumps to Golden image"		
		arg_error = 1
	
	if arg_error == 0:
		
		print
		print "-> Jumping to %s image..." % args[1]
		print
		glib.write("icap_page", page)
		glib.write("icap_trigg", 1)

else:

	print
	print "-> Error!!! One argument is required."
	print "-> "
	print "-> Syntax:"
	print "-> "
	print "-> glib_icap_jump_to_image.py <user|golden>"
	print "-> "	
	print "-> <user|golden> - Either user OR golden:" 		
	print "-> 	            - user   : Jumps to User image"	
	print "-> 	            - golden : Jumps to Golden image"
	
##===================================================================================================##
##===================================================================================================##	