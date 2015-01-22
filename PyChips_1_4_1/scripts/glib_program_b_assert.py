##===================================================================================================##
##==================================== Script Information ===========================================##
##===================================================================================================##
##																								 
## Company:  				CERN (PH-ESE-BE)													 
## Engineer: 				Manoel Barros Marin (manoel.barros.marin@cern.ch) (m.barros@ieee.org)
## 																						 					
## Create Date:				04/04/2013													 
## Script Name:				glib_program_b_assert												 
## Python Version:			2.7.3																			
##																											
## Revision:				1.0 																				
##																													
## Additional Comments: 																							
## * Resets the FLASH and triggers an FPGA configuration. If the FLASH is programmed using the scripts
##   provided, it is necesary to do this procedure once before triggering an FPGA configuration using 
##   ICAP (a power cycle of the GLIB could be used instead).
##																													
##===================================================================================================##
##===================================================================================================##

## Python modules:
# import module

## Import the PyChips code - PYTHONPATH must be set to the PyChips installation src folder!
from PyChipsUser import *

##===================================================================================================##
##======================================== Script Body ==============================================## 
##===================================================================================================##

#######################################################################################################
## PYCHIPS
#######################################################################################################

#######################################################################################################
### Uncomment one of the following two lines to turn on verbose or very-verbose debug modes.        ###
### These debug modes allow you to see the packets being sent and received.                         ###
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

print "->"	
print "-> Reseting FLASH and triggering FPGA configuration (asserting the program_b pin)..." 
print "->"
print
glib.write("fpga_program_b_trst", 0)

##===================================================================================================##
##===================================================================================================##

