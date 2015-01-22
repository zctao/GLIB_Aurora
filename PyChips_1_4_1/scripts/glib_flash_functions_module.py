##===================================================================================================##
##==================================== Module Information ===========================================##
##===================================================================================================##
##																								 
## Company:  				CERN (PH-ESE-BE)													 
## Engineer: 				Manoel Barros Marin (manoel.barros.marin@cern.ch) (m.barros@ieee.org)
## 																						 					
## Create Date:				20/01/2013 													 
## Module Name:				glib_flash_functions_module												 
## Python Version:			2.7.3																			
##																											
## Revision:				1.0 																				
##																													
## Additional Comments: 																							
## * Module with functions to control the Xilinx Platform Flash XL (xcf128x) through PYCHIPS.	
##																												
##===================================================================================================##
##===================================================================================================##

## Import the PyChips code - PYTHONPATH must be set to the PyChips installation src folder!
from PyChipsUser import *

##===================================================================================================##
##======================================== Module  Body =============================================## 
##===================================================================================================##

#######################################################################################################
## Constant declarations
#######################################################################################################

## Register bit masks:
regMask = []
for i in range(16):
	regMask.append(0x0000 + (1*(2**i)))

## FLASH and MCS constants:
num_param_blocks_in_param_bank = 4
num_total_blocks = 131
higher_block = 130
ela_per_block = 2
std_block_size = 64*(2**10) # Kword
max_write_buffer = 32 # 16 bit words
statusReg_width	= 8 # bits

## Golden PROM file constants:
higher_golden_block = 130
lower_golden_block  =  67 

## User PROM file constants:
higher_user_block = 66
lower_user_block  = 11

#######################################################################################################
## FLASH commands
#######################################################################################################

## (Xilinx DS617 Page 12):
blockLockConfirm_comm		= 0x0001
setConfigRegConfirm_comm    = 0x0003
altProgSetup_comm			= 0x0010
blockEraseSetup_comm		= 0x0020
blockLockDownConfirm_comm	= 0x002F
programSetup_comm			= 0x0040
clearStatusReg_comm			= 0x0050
blockLockSetup_comm			= 0x0060
blockUnlockSetup_comm		= 0x0060
blockLockDownSetup_comm		= 0x0060
setConfigRegSetup_comm		= 0x0060
readStatusReg_comm        	= 0x0070
buffEnhFactProgSet_comm		= 0x0080
readElectSignarure_comm		= 0x0090
readCfiQuery_comm			= 0x0098
progEraseSupend_comm		= 0x00B0
blankCheckSetup_comm		= 0x00BC
protectRegProgram_comm		= 0x00C0
blankCheckConfirm_comm		= 0x00CB
progEraseresume_comm		= 0x00D0
blockEraseConfirm_comm		= 0x00D0
blockUnlockConfirm_comm		= 0x00D0
bufferProgConfirm_comm		= 0x00D0
buffEnhFactProgConfirm_comm	= 0x00D0
bufferProgram_comm			= 0x00E8
readArray_comm				= 0x00FF

#######################################################################################################
## Function definitions
#######################################################################################################

def readConfigReg(glib):
	''' Reads the Configuration Register.'''

	return hex(glib.read("flash_block130", 0x5))
	
def confAsyncRead(glib):	
	'''Sets the read mode as asynchronous.'''

	## Load commands in buffer:	
	comm_buffer = []	
	comm_buffer.append([setConfigRegSetup_comm, setConfigRegConfirm_comm])	
	comm_buffer.append([readElectSignarure_comm])
	
	## Process:	
	for i in range(5): # Five attempts
		##(Note!!! Configuration data for asynchronous read is provided in the address)
		glib.fifoWrite("flash_async_read_cmd", comm_buffer[0]) # Configuration Register data is in the address	
		glib.fifoWrite("flash_block130", comm_buffer[1], 0x5)  # Configuration Register (Bank Address + 005)
		## Read to check whether CR15=1 or not)(Conf_Reg = BDDF):
		configReg = glib.read("flash_block130", 0x5)
		if configReg == 0xBDDF:
			return "-> Asynchronous read configuration done"			
	return "-> Error!!! It was not possible to set the read mode as asynchronous."
	
def confSyncRead(glib):	
	'''Sets the read mode as synchronous.'''

	## Load commands in buffer:	
	comm_buffer = []	
	comm_buffer.append([setConfigRegSetup_comm, setConfigRegConfirm_comm])	
	comm_buffer.append([readElectSignarure_comm])
	
	## Process:	
	for i in range(5): # Five attempts
		##(Note!!! Configuration data for synchronous read is provided in the address)
		glib.fifoWrite("flash_sync_read_cmd", comm_buffer[0]) # Configuration Register data is in the address	
		glib.fifoWrite("flash_block130", comm_buffer[1], 0x5)  # Configuration Register (Bank Address + 005)	
	
def blockLockOrUnlock(glib, block, operation): # 'block' is a string
	'''Locks or unlocks a block of the flash (Xilinx DS617(v3.0.1) page 75, figure 43).'''
		
	## Operation dectection:
	if operation == "l":	
		comm_buffer = [blockLockSetup_comm, blockLockConfirm_comm, readElectSignarure_comm]	
		lock_status_expected = 0x0001
		lock_op = "LOCK"
	elif operation == "u":
		comm_buffer = [blockUnlockSetup_comm, blockUnlockConfirm_comm, readElectSignarure_comm]	
		lock_status_expected = 0x0000
		lock_op = "UNLOCK"	
	else:	
		return "-> Error!!! Check the value provided to the argument \"operation\"."
	
	## Process:	
	for i in range(5): # Five attempts
		glib.fifoWrite(block, comm_buffer)
		## Electronic signature Codes (Xilinx DS617(v3.0.1) page 75, figure 43)
		## * Block protection (Block address + 0x2): 		
		##   - Locked:                                0x0001
		##   - Unlocked:                   			  0x0000
		##   - Note!!! Lock-Down is not suppported by this funcion
		lock_status = glib.read(block, 0x2)  		 
		if lock_status == lock_status_expected: 	 
			return "-> Lock state modification of %s to %s done." % (block, lock_op)		
	return "-> Error!!! It was not possible to %s %s." % (lock_op, block)
	
def blockErase(glib, block): # 'block' is a string
	'''Erases a block of the flash (Xilinx DS617(v3.0.1) page 73, figure 41).'''
	
	## Block Erase commands (2 cycles):
	comm_buffer = [blockEraseSetup_comm, blockEraseConfirm_comm]
	
	## Status Register bits declaration and initialization:
	sr = []
	for i in range(statusReg_width):
		sr.append(0)	
	
	## Process:
	glib.fifoWrite(block, comm_buffer)
	while sr[7] != 1:		
		statusReg = glib.read(block)
		for i in range(statusReg_width):			
			sr[i] = (statusReg & regMask[i]) >> i	
	if sr[3] == 1 or sr[4] == 1 or sr[5] == 1 or sr[1] == 1:
		error_array = []
		if sr[3] == 1:
			error_array.append("-> Error!!! VPP Invalid.")
		if sr[4] == 1:		
			error_array.append("-> Error!!! Command sequence error.")
		if sr[5] == 1:		
			error_array.append("-> Error!!! Erase Error.")		
		if sr[1] == 1:
			error_array.append("-> Error!!! Erase to Protected Block.")
		writeBuffer = [clearStatusReg_comm]
		glib.fifoWrite(block, writeBuffer)
		return error_array		
	else:
		return "-> Erase of %s done." % block

###
### Blank check command does not work properly - check with Xilinx!!!!!
###
		
def blockBlankCheck(glib, block): # 'block' is a string
	'''Checks whether a block is blank or not (Xilinx DS617(v3.0.1) page 70, figure 38).'''		
	
	## Block blank check commands (2 cycles):
	comm_buffer	= [blankCheckSetup_comm, blankCheckConfirm_comm] 	
	
	## Status Register bits declaration and initialization:
	sr = []
	for i in range(statusReg_width):
		sr.append(0)	
	
	## Process:
	glib.fifoWrite(block, comm_buffer)		
	while sr[7] != 1:		
		statusReg = glib.read(block)
		print hex(statusReg)
		for i in range(statusReg_width):			
			sr[i] = (statusReg & regMask[i]) >> i	
	if sr[4] == 1 or sr[5] == 1 :
		error_array = []
		if sr[4] == 1:
			error_array.append("-> Error!!! Command sequence error.")
		if sr[5] == 1:		
			error_array.append("-> Error!!! Blank check error.")		
		writeBuffer = [clearStatusReg_comm]
		glib.fifoWrite(block, writeBuffer)
		return error_array		
	else:
		return "-> Blank check of %s done." % block
	
def singleProgram(glib, block, offset, data):	# 'block' is a string
	'''Writes one word to the flash (Xilinx DS617(v3.0.1) page 69, figure 37).'''		
	
	## Load command and data in buffer:	
	writeBuffer = [programSetup_comm, data]
	
	## Status Register bits declaration and initialization:
	sr = []
	for i in range(statusReg_width):
		sr.append(0)	
	
	## Process:
	glib.fifoWrite(block, writeBuffer, offset)		
	while sr[7] != 1:				
		statusReg = glib.read(block)
		for i in range(statusReg_width):			
			sr[i] = (statusReg & regMask[i]) >> i
	if sr[3] == 1 or sr[4] == 1 or sr[1] == 1:
		error_array = []
		if sr[3] == 1:
			error_array.append("-> Error!!! VPP Invalid.")
		if sr[4] == 1:		
			error_array.append("-> Error!!! Program error.")
		if sr[1] == 1:
			error_array.append("-> Error!!! Program to Protected Block.")
		writeBuffer = [clearStatusReg_comm]
		glib.fifoWrite(block, writeBuffer)
		return error_array		
	else:
		return "-> Single program done."

def bufferProgram(glib, block, base_offset, data, words):
	'''Writes up to 32 words to the flash (Xilinx DS617(v3.0.1) page 71, figure 39).'''
	
	## Write commands and buffer size etup:
	comm_buffer = [[bufferProgram_comm], [bufferProgConfirm_comm]]
	buffer_size = [words-1]
	
	## Status Register bits declaration and initialization:
	sr = []
	for i in range(statusReg_width):
		sr.append(0)	
	
	## Process:	
	glib.fifoWrite(block, comm_buffer[0], base_offset)	
	statusReg 						= int(uInt32HexStr(glib.read(block))[4:8], 16)	
	while statusReg != 0x0080:		
		statusReg 					= int(uInt32HexStr(glib.read(block))[4:8], 16)	
	glib.fifoWrite(block, buffer_size, base_offset)		
	glib.blockWrite(block, data, base_offset)			
	glib.fifoWrite(block, comm_buffer[1], base_offset)		
	while sr[7] != 1:				
		statusReg = glib.read(block)
		for i in range(statusReg_width):			
			sr[i] = (statusReg & regMask[i]) >> i
	if sr[3] == 1 or sr[4] == 1 or sr[1] == 1:
		error_array = []
		if sr[3] == 1:
			error_array.append("-> Error!!! VPP Invalid.")
		if sr[4] == 1:		
			error_array.append("-> Error!!! Program error.")
		if sr[1] == 1:
			error_array.append("-> Error!!! Program to Protected Block.")
		writeBuffer = [clearStatusReg_comm]
		glib.fifoWrite(block, writeBuffer)
		return error_array			
	else:
		return "-> Buffer program on %s at base addess %s done." % (block, hex(base_offset))
	
def enableReadDataInBlock(glib, block):
	'''Enables data read operaton in the block of the flash provided as argument.'''
	
	## Load command in buffer:	
	comm_buffer = [readArray_comm]	
	
	## Procedure:
	glib.fifoWrite(block, comm_buffer)	
	return "-> Read data enable for %s done" % block

##===================================================================================================##
##===================================================================================================##