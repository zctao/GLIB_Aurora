#  Import the PyChips code - PYTHONPATH must be set to the PyChips installation src folder!
from PyChipsUser import *
from time import *

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

##################################################################################################

## *******************************
## ******* User modifiable *******
## *******************************
flash_bank = "flash_bank7" 		# Note!!! The block selected has to be within the bank selected
flash_block = "flash_block64"	#
block_offset = 2
single_data = 0xFBFA
words = 32	# Note!!! Maximum 32 words (minimum 1 word)
## *******************************
## *******************************

bufferWords_data = []
for i in range(0, words):
	bufferWords_data.append(0x00+i) 
	
## (Xilinx DS617 Page 12)
confAsyncRead_comm = [0x0060,0x0003]
readConfReg_comm = [0x0090]	# address = bank_address + 5
readStatReg_comm = [0x0070]
clearStatReg_comm = [0x0050]
blockUnlock_comm = [0x0060, 0x00D0]
readBlockProtect_comm = [0x0090]	# address = block_address + 2
readData_comm = [0x00FF]

##################################################################################################
# Function definitions:
##################################################################################################

def blockErase(block):	# 'block' is a string
	'''Erases a block of the flash'''
	comm_buffer = [0x0020,0x00D0] # Block Erase (Cycles 1 and 2)
	statusReg = int(uInt32HexStr(glib.read(block))[4:8], 16)	
	glib.fifoWrite(block, comm_buffer)
	while (statusReg != 0x0080):		
		statusReg = int(uInt32HexStr(glib.read(block))[4:8], 16)	
		
		
def singleProgram(block, offset, data):	
	'''Writes one word to the flash'''		
	w_buffer = [0x0040, data]
	statusReg = int(uInt32HexStr(glib.read(block))[4:8], 16)	
	glib.fifoWrite(block, w_buffer, offset)	
	while (statusReg != 0x0080):		
		statusReg = int(uInt32HexStr(glib.read(block))[4:8], 16)	

		
def bufferProgram(block, base_offset, data):
	'''Writes 32 words to the flash'''	
	en_comm = [0x00E8]
	strt_comm = [0x00D0]
	words_buf = [words-1]
	statusReg = int(uInt32HexStr(glib.read(block))[4:8], 16)	
	glib.fifoWrite(block, en_comm, base_offset)	
	while (statusReg != 0x0080):		
		statusReg = int(uInt32HexStr(glib.read(block))[4:8], 16)	
	glib.fifoWrite(block, words_buf, base_offset)	
	glib.blockWrite(block, data, base_offset)		
	glib.fifoWrite(block, strt_comm, base_offset)	
	while (statusReg != 0x0080):		
		statusReg = int(uInt32HexStr(glib.read(block))[4:8], 16)		

##################################################################################################	


####################################################################
## Flash Selection
####################################################################
print "-> Set flash controlled by ipbus"
glib.write("flash_select",1)
print "-> Flash_select pin is : ", glib.read("flash_select")
####################################################################
print
####################################################################
## Asynchronous read mode configuration
####################################################################
print "-> Configuration Register modification: Read Mode as asynchronous (CR15=1)(Conf_Reg = BDDF)"
glib.fifoWrite("flash_conf_reg", confAsyncRead_comm) # Set Configuration Register (Cycles 1 and 2)
print "->" 
print "-> Write - Electronic Signature Command: Read Configuration Register"
glib.fifoWrite(flash_bank, readConfReg_comm, 0x5)	# Configuration Register (Bank Address + 005)
print "-> Read  - Configuration Register (to check whether CR15=1 or not)(Conf_Reg = BDDF)"
print "-> The content of the Conf_Reg is:", uInt32HexStr(glib.read(flash_bank, 0x5))[4:8]
####################################################################
print
####################################################################
## Status Register
####################################################################
print "-> Write - Read Status Register Command"	
glib.fifoWrite(flash_bank, readStatReg_comm)
print "-> Read  - Status Register"
print "-> The content of the Status Reg is: ", uInt32HexStr(glib.read(flash_bank))[4:8]
print "->" 
print "-> Write - Clear Status Register Command"	
glib.fifoWrite(flash_bank, clearStatReg_comm)
print "->" 
print "-> Write - Read Status Register Command"
glib.fifoWrite(flash_bank, readStatReg_comm)
print "-> Read  - Status Register"
print "-> The content of the Status Reg is: ", uInt32HexStr(glib.read(flash_bank))[4:8]
####################################################################
print
####################################################################
## Block Unlock
####################################################################
print "-> Block Unlock Command (Blocks are Locked after power up)"
glib.fifoWrite(flash_block, blockUnlock_comm)
print "->" 
print "-> Write - Electronic Signature Command: Read Block Protection"
glib.fifoWrite(flash_block, readBlockProtect_comm, 0x2)	# Block Protection (Block Address + 002)
print "-> Read  - Status of the block protection ('0000': not protected | '0001': protected)"
print "-> The status of the Block Protection is:", uInt32HexStr(glib.read(flash_block, 0x2))[4:8]
####################################################################
print
####################################################################
## Read data BEFORE block erase
####################################################################
print "-> Write - Read Data Command"
glib.fifoWrite(flash_block, readData_comm)
print "-> Read  - Data BEFORE block erase"
print "-> The content of the memory position", block_offset, "of the block", flash_block, "BEFORE block erase is: ", uInt32HexStr(glib.read(flash_block, block_offset))[4:8]
####################################################################
print
####################################################################
## Block Erase
####################################################################
print "-> Function - Block Erase"
start = time()
blockErase(flash_block)
elapsed = (time() - start)	
print "-> Erasing a block takes:", elapsed, "seconds"
####################################################################
print
####################################################################
## Read data AFTER block erase
####################################################################
print "-> Write - Read Data Command"
glib.fifoWrite(flash_block, readData_comm)
print "-> Read  - Data AFTER block erase"
print "-> The content of the position", block_offset, "of the block", flash_block, "AFTER block erase is: ", uInt32HexStr(glib.read(flash_block, block_offset))[4:8]
####################################################################
print
####################################################################
## Write single word
####################################################################
print "-> Function - Single Program (Data written: %s)" % uInt32HexStr(single_data)[4:8]
start = time()
singleProgram(flash_block, block_offset, single_data)
elapsed = (time() - start)	
print "-> Writing one word to the flash takes:", elapsed, "seconds"
####################################################################
print	
####################################################################
## Read data AFTER single word program
####################################################################
print "-> Write - Read Data Command"
glib.fifoWrite(flash_block, readData_comm)
print "-> Read  - Data AFTER single word program"
print "-> The content of the memory position", block_offset, "of the block", flash_block, "AFTER single word program is: ", uInt32HexStr(glib.read(flash_block, block_offset))[4:8]
####################################################################
print
####################################################################
## Block Erase
####################################################################
print "-> Function - Block Erase"
blockErase(flash_block)
####################################################################
print
####################################################################
## Multiple single word writes (n words)
####################################################################
print "-> Multiple single word writes (%d words)" % words
start = time()
for i in range(0, words):	
	singleProgram(flash_block, block_offset + i, bufferWords_data[i])
elapsed = (time() - start)	
print "-> Writing %d words using single word writes takes:" % words, elapsed, "seconds"
####################################################################
print
####################################################################
## Read data AFTER multiple single word writes (n words)
####################################################################
print "-> Write - Read Data Command"
glib.fifoWrite(flash_block, readData_comm)
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
####################################################################
print
####################################################################
## Block Erase
####################################################################
print "-> Function - Block Erase"
blockErase(flash_block)
####################################################################
print
####################################################################
## Read data BEFORE Buffered write
####################################################################
print "-> Write - Read Data Command"
glib.fifoWrite(flash_block, readData_comm)
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
####################################################################
print	
####################################################################
## Buffered write
####################################################################
print "-> Function - Buffered Program (writing %d words)" % words
start = time()
bufferProgram(flash_block, block_offset, bufferWords_data)
elapsed = (time() - start)	
print "-> Buffered Program takes:", elapsed, "seconds"
####################################################################
print
####################################################################
## Read data AFTER Buffered write
####################################################################
print "-> Write - Read Data Command"
glib.fifoWrite(flash_block, readData_comm)
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
####################################################################
print
####################################################################
print "done"
####################################################################
