##===================================================================================================##
##==================================== Script Information ===========================================##
##===================================================================================================##
##																								 
## Company:  				CERN (PH-ESE-BE)													 
## Engineer: 				Manoel Barros Marin (manoel.barros.marin@cern.ch) (m.barros@ieee.org)
## 																						 					
## Create Date:				14/03/2013													 
## Script Name:				glib_flash_test												 
## Python Version:			2.7.3																			
##																											
## Revision:				1.0 																				
##																													
## Additional Comments: 																				
## * Because the FLASH is programmed during this test, it is necesary to reset the FLASH and configure
##   the FPGA once before triggering an FPGA configuration using ICAP. This can be done by uncommenting
##   out the lines 237-292 or by running the script "glib_program_b_assert.py" (a power cycle of 
##   the GLIB could be used instead).
##																													
##===================================================================================================##
##===================================================================================================##

## Python modules:
import sys
import os
from time import *

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

flash_bank = "flash_bank7" 		# Note!!! The block selected has to be within the bank selected
flash_block = "flash_block65"	#
block_offset = 2
single_data = 0xFBFA
words = 32	# Note!!! Maximum 32 words (minimum 1 word)

command = []

bufferWords_data = []
for i in range(0, words):
	bufferWords_data.append(0x00+i) 

print
print "-> Note!!! User image will be corrupted after this test."
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

	##########################################
	## Asynchronous read mode configuration ##
	##########################################

	print
	print "-> Configuring asynchronous read"
	print confAsyncRead(glib)

	#####################
	## Status Register ##
	#####################

	print
	print "-> Write - Read Status Register Command"	
	command = [readStatusReg_comm]
	glib.fifoWrite(flash_bank, command)
	print "-> Read  - Status Register"
	print "-> The content of the Status Reg is: ", uInt32HexStr(glib.read(flash_bank))[4:8]
	print "->" 
	print "-> Write - Clear Status Register Command"
	command = [clearStatusReg_comm]	
	glib.fifoWrite(flash_bank, command)
	print "->" 
	print "-> Write - Read Status Register Command"
	command = [readStatusReg_comm]
	glib.fifoWrite(flash_bank, command)
	print "-> Read  - Status Register"
	print "-> The content of the Status Reg is: ", uInt32HexStr(glib.read(flash_bank))[4:8]

	##################
	## Block Unlock ##
	##################

	print
	print "-> Block Unlock... (Blocks are Locked after power up)"
	print blockLockOrUnlock(glib, flash_block, "u")
	print "->" 
	print "-> Write - Electronic Signature Command: Read Block Protection"
	command = [readElectSignarure_comm]
	glib.fifoWrite(flash_block, command, 0x2)	# Block Protection (Block Address + 002)
	print "-> Read  - Status of the block protection ('0000': not protected | '0001': protected)"
	print "-> The status of the Block Protection is: ", uInt32HexStr(glib.read(flash_block, 0x2))[4:8]

	##################################
	## Read data BEFORE block erase ##
	##################################

	print 
	print "-> Enabling read data..."
	print enableReadDataInBlock(glib, flash_block)
	print "-> Read  - Data BEFORE block erase"
	print "-> The content of the memory position", block_offset, "of the block", flash_block, "BEFORE block erase is:  %s" % uInt32HexStr(glib.read(flash_block, block_offset))[4:8]
	
	#################
	## Block Erase ##
	#################
	
	print
	print "-> Function - Block Erase"
	start = time()
	blockErase(glib, flash_block)
	elapsed = (time() - start)	
	print "-> Erasing a block takes:", elapsed, "seconds"
	
	#################################
	## Read data AFTER block erase ##
	#################################
	
	print	
	print "-> Enabling read data..."
	print enableReadDataInBlock(glib, flash_block)
	print "-> Read  - Data AFTER block erase"
	print "-> The content of the position", block_offset, "of the block", flash_block, "AFTER block erase is: ", uInt32HexStr(glib.read(flash_block, block_offset))[4:8]

	#######################
	## Write single word ##
	#######################
	
	print
	print "-> Function - Single Program (Data written: %s)" % uInt32HexStr(single_data)[4:8]
	start = time()	
	singleProgram(glib, flash_block, block_offset, single_data)	
	elapsed = (time() - start)	
	print "-> Writing one word to the flash takes:", elapsed, "seconds"
		
	#########################################
	## Read data AFTER single word program ##
	#########################################
	
	print	
	print "-> Enabling read data..."
	print enableReadDataInBlock(glib, flash_block)
	print "-> Read  - Data AFTER single word program"
	print "-> The content of the memory position", block_offset, "of the block", flash_block, "AFTER single word program is: ", uInt32HexStr(glib.read(flash_block, block_offset))[4:8]
	
	#################
	## Block Erase ##
	#################
	
	print
	print "-> Function - Block Erase"
	print blockErase(glib, flash_block)
	
	###########################################
	## Multiple single word writes (n words) ##
	###########################################
	
	print
	print "-> Multiple single word writes (%d words)" % words
	start = time()
	for i in range(0, words):	
		singleProgram(glib, flash_block, block_offset + i, bufferWords_data[i])
	elapsed = (time() - start)	
	print "-> Writing %d words using single word writes takes:" % words, elapsed, "seconds"

	###########################################################
	## Read data AFTER multiple single word writes (n words) ##
	###########################################################
	
	print	
	print "-> Enabling read data..."
	print enableReadDataInBlock(glib, flash_block)
	print "-> Read  - Data AFTER multiple single word writes (reading %d memory positions)" % words
	readBuffer = []
	for i in range(0, words):
		readBuffer.append(uInt32HexStr(glib.read(flash_block, block_offset + i))[4:8])	
	print "-> The content of the memory positions of the block %s AFTER multiple single word writes (%d words): " % (flash_block, words)
	print "->"
	positions = block_offset
	for i in range(0, words):
		print "-> Position %2d : %s" % (positions, readBuffer[i])
		positions = positions + 1

	#################
	## Block Erase ##
	#################
	
	print
	print "-> Function - Block Erase"
	print blockErase(glib, flash_block)
	
	#####################################
	## Read data BEFORE Buffered write ##
	#####################################
	
	print	
	print "-> Enabling read data..."
	print enableReadDataInBlock(glib, flash_block)
	print "-> Read  - Data BEFORE Buffered write (reading %d memory positions)" % words
	readBuffer = []
	for i in range(0, words):
		readBuffer.append(uInt32HexStr(glib.read(flash_block, block_offset + i))[4:8])	
	print "-> The content of the memory positions of the block %s BEFORE buffered write are: " % flash_block
	print "->"
	positions = block_offset
	for i in range(0, words):
		print "-> Position %2d : %s" % (positions, readBuffer[i])
		positions = positions + 1
	
	####################
	## Buffered write ##
	####################
	
	print
	print "-> Function - Buffered Program (writing %d words)" % words
	start = time()
	bufferProgram(glib, flash_block, block_offset, bufferWords_data, words)
	elapsed = (time() - start)	
	print "-> Buffered Program takes:", elapsed, "seconds"

	####################################
	## Read data AFTER Buffered write ##
	####################################
	
	print	
	print "-> Enabling read data..."
	print enableReadDataInBlock(glib, flash_block)
	print "-> Read  - Data AFTER Buffered write (reading %d memory positions)" % words	
	readBuffer = []
	for i in range(0, words):
		readBuffer.append(uInt32HexStr(glib.read(flash_block, block_offset + i))[4:8])	
	print "-> The content of the memory positions of the block %s AFTER buffered write are: " % flash_block
	print "->"
	positions = block_offset
	for i in range(0, words):
		print "-> Position %2d : %s" % (positions, readBuffer[i])
		positions = positions + 1
	
	print
	print "-> Note!!! The FLASH and FPGA must be rebooted before triggering an FPGA configuration using ICAP."	
	
	############
	print
	print "-> done"
	############

	print
	print
	os.system('glib_program_b_assert.py')

elif prompt_var == "no":
			
	print
	print "-> FLASH test cancelled."	