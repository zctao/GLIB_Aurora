##===================================================================================================##
##==================================== Script Information ===========================================##
##===================================================================================================##
##																								 
## Company:  				CERN (PH-ESE-BE)													 
## Engineer: 				Manoel Barros Marin (manoel.barros.marin@cern.ch) (m.barros@ieee.org)
## 																						 					
## Create Date:				05/04/2013													 
## Script Name:				glib_icap_bootsts_status_reg_rd											 
## Python Version:			2.7.3																			
##																											
## Revision:				1.0 																				
##																													
## Additional Comments: 																							
## * Note!!! The bit 26 of the status register is different when read by JTAG than by ICAP because
##           the JTAG interface is 16 bit (status[26] = 0) while the ICAP interface is set to 32 bit
##           (status[26] = 1)(See Xilinx AR# 34909).
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

#####################################################################

###################
## ICAP commands ##
###################

bootsts_command       = [0xFFFFFFFF, 0xAA995566, 0x20000000, 0x20000000, 0x2802C001, 0x20000000, 0x20000000]
status_command        = [0xFFFFFFFF, 0xAA995566, 0x20000000, 0x20000000, 0x2800E001, 0x20000000, 0x20000000]

#####################################################################

#####################################################################

####################
## Read registers ##
####################

bootsts_len = 16
status_len  = 32

## Register bit masks:
regMask = []
for i in range(32):
	regMask.append(0x00000000 + (2**i))
	
## bootsts register:	
print
print "-> Reading bootsts register content..."
print "->"
glib.fifoWrite("icap", bootsts_command, 0)
bootsts_reg = glib.read("icap")

bootsts_bit = []
for i in range(bootsts_len):
	bootsts_bit.append(0)
	bootsts_bit[i] = (bootsts_reg & regMask[i]) >> i

print "-> BOOTSTS register content                                            : 0x%s" % uInt32HexStr(bootsts_reg)[4:9]
print "-> [0]  VALID_0 - ERROR OR END OF STARTUP (EOS) DETECTED...............:", bootsts_bit[0]
print "-> [1]  FALLBACK_0 - FALLBACK TRIGGERED RECONFIGURATION................:", bootsts_bit[1]
print "-> [2]  IPROG_0 - INTERNAL WARMBOOT (IPROG) TRIGGERED RECONFIGURATION..:", bootsts_bit[2]
print "-> [3]  WTO_ERROR_0 - WATCHDOG TIME OUT ERROR..........................:", bootsts_bit[3]
print "-> [4]  ID_ERROR_0 - FPGA DEVICE IDCODE ERROR..........................:", bootsts_bit[4]
print "-> [5]  CRC_ERROR_0 - CYCLIC REDUNDANCY CHECK (CRC) ERROR..............:", bootsts_bit[5]
print "-> [6]  WRAP_ERROR_0 - BPI FLASH ADDRESS COUNTER WRAP AROUND ERROR.....:", bootsts_bit[6]
print "-> [7]  HMAC_ERROR_0 - HMAC ERROR......................................:", bootsts_bit[7]
print "-> [8]  VALID_1 - ERROR OR END OF STARTUP (EOS) DETECTED...............:", bootsts_bit[8]
print "-> [9]  FALLBACK_1 - FALLBACK TRIGGERED RECONFIGURATION................:", bootsts_bit[9]
print "-> [10] IPROG_1 - INTERNAL WARMBOOT (IPROG) TRIGGERED RECONFIGURATION..:", bootsts_bit[10]
print "-> [11] WTO_ERROR_1 - WATCHDOG TIME OUT ERROR..........................:", bootsts_bit[11]
print "-> [12] ID_ERROR_1 - FPGA DEVICE IDCODE ERROR..........................:", bootsts_bit[12]
print "-> [13] CRC_ERROR_1 - CYCLIC REDUNDANCY CHECK (CRC) ERROR..............:", bootsts_bit[13]
print "-> [14] WRAP_ERROR_1 - BPI FLASH ADDRESS COUNTER WRAP AROUND ERROR.....:", bootsts_bit[14]
print "-> [15] HMAC_ERROR_1 - HMAC ERROR......................................:", bootsts_bit[15]

## status register:
print 
print "-> Reading status register content..."
print "->"
glib.fifoWrite("icap", status_command, 0)
status_reg = glib.read("icap")

status_bit = []
for i in range(status_len):
	status_bit.append(0)
	status_bit[i] = (status_reg & regMask[i]) >> i

print "-> STATUS register content                                             : 0x%s" % uInt32HexStr(status_reg)
print "-> [0]  CRC ERROR......................................................:", status_bit[0]
print "-> [1]  DECRYPTOR ERROR................................................:", status_bit[1]
print "-> [2]  PLL LOCK STATUS................................................:", status_bit[2]
print "-> [3]  DCI MATCH STATUS...............................................:", status_bit[3]
print "-> [4]  END OF STARTUP (EOS) STATUS....................................:", status_bit[4]
print "-> [5]  GTS_CFG_B STATUS...............................................:", status_bit[5]
print "-> [6]  GWE STATUS ....................................................:", status_bit[6]
print "-> [7]  GHIGH STATUS...................................................:", status_bit[7]
print "-> [8]  MODE PIN M[0]..................................................:", status_bit[8]
print "-> [9]  MODE PIN M[1]..................................................:", status_bit[9]
print "-> [10] MODE PIN M[2]..................................................:", status_bit[10]
print "-> [11] INIT_B INTERNAL SIGNAL STATUS..................................:", status_bit[11]
print "-> [12] INIT_B PIN.....................................................:", status_bit[12]
print "-> [13] DONE INTERNAL SIGNAL STATUS....................................:", status_bit[13]
print "-> [14] DONE PIN.......................................................:", status_bit[14]
print "-> [15] IDCODE ERROR...................................................:", status_bit[15]
print "-> [16] SECURITY ERROR.................................................:", status_bit[16]
print "-> [17] SYSTEM MONITOR OVER-TEMP ALARM STATUS..........................:", status_bit[17]
print "-> [18] CFG STARTUP STATE MACHINE PHASE................................:", status_bit[18]
print "-> [19] CFG STARTUP STATE MACHINE PHASE................................:", status_bit[19]
print "-> [20] CFG STARTUP STATE MACHINE PHASE................................:", status_bit[20]
print "-> [21] RESERVED.......................................................:", status_bit[21]
print "-> [22] SPI FLASH SELECT PIN FS[0].....................................:", status_bit[22]
print "-> [23] SPI FLASH SELECT PIN FS[1].....................................:", status_bit[23]
print "-> [24] SPI FLASH SELECT PIN FS[2].....................................:", status_bit[24]
print "-> [25] CFG BUS WIDTH DETECTION........................................:", status_bit[25]
print "-> [26] CFG BUS WIDTH DETECTION........................................:", status_bit[26]
print "-> [27] RESERVED.......................................................:", status_bit[27]
print "-> [28] HSWAPEN PIN....................................................:", status_bit[28]
print "-> [29] BAD PACKET ERROR...............................................:", status_bit[29]
print "-> [30] RESERVED.......................................................:", status_bit[30]
print "-> [31] EFUSE BUSY STATUS..............................................:", status_bit[31]

print "->"
print "-> done"

##===================================================================================================##
##===================================================================================================##	