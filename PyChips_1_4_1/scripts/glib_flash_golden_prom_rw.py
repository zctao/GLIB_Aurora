##===================================================================================================##
##==================================== Script Information ===========================================##
##===================================================================================================##
##																								 
## Company:  				CERN (PH-ESE-BE)													 
## Engineer: 				Manoel Barros Marin (manoel.barros.marin@cern.ch) (m.barros@ieee.org)
## 																						 					
## Create Date:				13/03/2013													 
## Script Name:				glib_flash_golden_prom_rw												 
## Python Version:			2.7.3																			
##																											
## Revision:				1.0 																				
##																													
## Additional Comments: 																							
## * Read and Write Golden PROM(MCS) file from/to golden FLASH region (000000h-3FFFFFh).
##																													
##===================================================================================================##
##===================================================================================================##

## Python modules:
import sys
import os
import binascii
import array
from time import *

## Custom modules:
from glib_flash_functions_module import *

## Import the PyChips code - PYTHONPATH must be set to the PyChips installation src folder!
from PyChipsUser import *

##===================================================================================================##
##======================================== Script Body ==============================================## 
##===================================================================================================##

args = sys.argv
arg_length = len(args)

if arg_length == 3:	

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
	
	## Flash Selection:	
	print
	print "-> Set flash controlled by ipbus"
	glib.write("flash_select",1)
	print "-> Flash_select pin is : ", glib.read("flash_select")	
	
	## Asynchronous read mode configuration
	print "-> "
	# print confAsyncRead(glib)
	confAsyncRead(glib)
	
	if args[2] == "r":	

		##################################################
		## Read Golden area on FLASH and dump to a file ##
		##################################################	
		
		## Dump flash golden space to BINARY file (same format as on FLASH):

		start_time = time()

		bin_file = file(args[1], 'wb')			
		readBuffer = array.array('H') # 2 Bytes			
		
		print "->" 	
		print "-> Reading golden FLASH content and dumping it to a binary file..." 
		print "-> "
		print "-> Binary file:", bin_file.name			
		
		command = [readArray_comm]
		for i in reversed(range(lower_golden_block, higher_golden_block+1)):							
			
			flash_block = "flash_block%d" % i
			
			glib.fifoWrite(flash_block, command)			
			
			print "-> "
			print "-> * %s..." % flash_block
			
			for j in range(std_block_size):								
				readBuffer.append(glib.read(flash_block, j))				

		readBuffer.tofile(bin_file)
		bin_file.close()	

		elapsed_time = time() - start_time
		minutes = (elapsed_time // 60)
		seconds = elapsed_time % 60
		
		print "->"	
		print "-> done"				
		print "->"	
		print "-> Process time: %d minutes and %d seconds." % (minutes, seconds)
		print			
		
		## To be done - Dump flash to ASCII file (converted to MCS format)(All standard blocks):
		
		# ascii_file = open('prom_file/ascii_prom_file_from_flash_.mcs', 'w')						
		# print "->" 
		# print "-> Reading FLASH content..." 
		# print
		# for i in reversed(range(num_param_blocks_in_param_bank, num_total_blocks)):							
			# start = time()
			# glib.fifoWrite(("flash_block%d" % i), readData_comm)			
			# print
			# print "-> Flash block", i
			# for j in range(std_block_size):	
				# bin_string_temp = uInt32HexStr(glib.read(("flash_block%d" % i), j))[4:8]			
				# ascii_msB = binascii.unhexlify(bin_string_temp[0:2])			
				# ascii_lsB = binascii.unhexlify(bin_string_temp[2:4])
				# ascii_word = ascii_msB + ascii_lsB		
				# ascii_file.write(ascii_word+"\n")							
			# elapsed = time() - start
			# print "Reading time:", elapsed, "seconds"			
		# ascii_file.close()			
	
	elif args[2] == "w":		
		
		print
		print "-> Note!!! The system can not be recovered if Golden image is corrupted or invalid."
		prompt_var = ""
		while prompt_var != "yes" and prompt_var != "no" :
			prompt_var = raw_input("-> Type \"yes\" to continue or \"no\" to exit: ")
		
		if prompt_var == "yes":
		
			###################################################
			## Read MCS file and write Golden image to FLASH ##
			###################################################
			
			not_eof = 1		
			flash_block = []
			first_block = 1
			data_address = 0x0000
			write_buffer = []				
			
			area_error = 0
			
			start_time = time()
			
			mcs_file = open(args[1], 'r')	
			
			print "-> " 
			print "-> Parsing the PROM file and writing the FLASH..."			
			print "-> "
			print "-> PROM file:", mcs_file.name			
			
			while not_eof == 1:				
				
				mcs_line = mcs_file.readline()
				
				mcs_record_delimiter   = mcs_line[0]  # :
				mcs_record_data_length = mcs_line[1:3] 
				mcs_record_address     = mcs_line[3:7]
				mcs_record_type	       = mcs_line[7:9]
				
				mcs_ela_address	       = mcs_line[9:13]			
				
				######################################################
				# print "->"
				# print "-> mcs_line:", mcs_line[:((len(mcs_line)-1))] ## (len(mcs_line)-1) to avoid the end line character				
				######################################################
				
				if mcs_record_type == "04": ## ELA				
					
					ela	= int(mcs_ela_address, 16)				## Every ELA increment is FFFFh (64 KB)(32 KW)													
					block_decrease = ela // ela_per_block		## Every Std Block of the FLASH is FFFFh (64 KW)(128 KB)
					first_ela_in_block = ela % ela_per_block 	## (0: first ela | 1: second ela)
					block_number = higher_golden_block - block_decrease
					
					if block_number < lower_golden_block:
						
						print
						print "-> Error!!! PROM file tried to write out of the Golden image area."
						print
						area_error = 1
						break
					
					prev_flash_block = flash_block
					flash_block = "flash_block%d" % block_number									
					
					if first_ela_in_block == 0:	
						
						print "-> "
						print "-> Writing block %s..." % flash_block					
						
						if first_block == 0:
							# print "-> "
							# print blockLockOrUnlock(glib, prev_flash_block, "l")
							blockLockOrUnlock(glib, prev_flash_block, "l")
						first_block = 0
						
						unlock_and_erase_block = 1				
					
					############################################################
					# print "-> "
					# print "-> mcs_record_type:", mcs_record_type				
					# print "-> ela:", hex(ela)
					# print "-> block_decrease:", block_decrease
					# print "-> first_ela_in_block:", first_ela_in_block
					# print "-> flash_block:", flash_block
					# print "-> unlock_and_erase_block:", unlock_and_erase_block
					############################################################				
					
				elif mcs_record_type == "00": ## Data record								
					
					## Obtain the base address for fhe next burst write transfer from data record
					## stored on the first position of the buffer:				
					
					##################################################
					# print "->"
					# print "-> len(write_buffer):", len(write_buffer)				
					##################################################								
					
					if len(write_buffer) == 0:
						## Address is divided by two because the record is addressing Bytes while
						## the FLASH is addressed by words.
						##
						## It is also necessary to add the ela bit of the block before the division:
						data_address = ((first_ela_in_block*(2**16))+int(mcs_record_address, 16)) / 2
						
						#############################################
						# print "->"
						# print "-> Loading address..."									
						# print "-> data address:", hex(data_address)
						#############################################
					
					## Fills the write buffer with the data from the record (word by word):
					data_length = int(mcs_record_data_length, 16) ## Bytes								
					for i in range(data_length/2): ## Words
						mcs_data_word = mcs_line[(9+(4*i)):(9+((4*i)+4))]
						## Data bytes in the word must be swapped:
						lsB = mcs_data_word[0:2]
						msB	= mcs_data_word[2:4]
						swapped_word = msB + lsB
						## Data must be and integer:
						write_buffer.append(int(swapped_word, 16))									
					
					## Unlocks and erases when first access to a block:				
					if unlock_and_erase_block == 1:
						
						## Unlocks the block:
						# print "-> "
						# print blockLockOrUnlock(glib, flash_block, "u")
						blockLockOrUnlock(glib, flash_block, "u")
						
						## Erases the block:
						# print "-> "
						# print blockErase(glib, flash_block)
						blockErase(glib, flash_block)
						
						## Disables the unlock and erase procedure:
						unlock_and_erase_block = 0									
					
					## If the buffer is full writes performs the burst write transaction (64 Bytes) (32 Words):
					if len(write_buffer) == 32:							
						
						# print "-> "
						# print "-> Writing %s..." % flash_block								
						# print bufferProgram(glib, flash_block, data_address, write_buffer, max_write_buffer)											
						bufferProgram(glib, flash_block, data_address, write_buffer, max_write_buffer)
						
						## Deletes and declares again the buffer after write:
						del write_buffer
						write_buffer = []					
			
				elif mcs_record_type == "01": ## EOF				
					
					## If buffer is not empty write the flash:
					if len(write_buffer) != 0:
											
						# print "->"
						# print "-> Writing buffer remains:", len(write_buffer), "words"						
						# print bufferProgram(glib, flash_block, data_address, write_buffer, len(write_buffer))																
						bufferProgram(glib, flash_block, data_address, write_buffer, len(write_buffer))
					
					## Exits the while loop:
					not_eof = 0
				
				else:
				
					print
					print "-> Error!!! Unable to identify the record type..."
					print "-> **(The format of the PROM file must be MCS)** "
					print
					break
				
			mcs_file.close()
			
			if area_error == 0:
				elapsed_time = time() - start_time
				minutes = (elapsed_time // 60)
				seconds = elapsed_time % 60							
					
				print "->"	
				print "-> Done"				
				print "->"	
				print "-> Process time: %d minutes and %d seconds." % (minutes, seconds)
				print
		
				print
				print
				os.system('glib_program_b_assert.py')	
		
		elif prompt_var == "no":
			
			print
			print "-> Write Golden image procedure cancelled."			
		
	else:
	
		print
		print "-> Error!!! The second argument must be:"
		print "-> * r : Reads the FLASH and dumps it into a file."	
		print "-> * w : Reads a MCS file and writes the FLASH."			
		print
	
else:

	print
	print "-> Error!!! Two argument are required."
	print "-> "
	print "-> Syntax:"
	print "-> "
	print "-> glib_flash_golden_prom_wr.py <file.mcs> <w|r>"
	print "-> "	
	print "-> <file.mcs> - File to read/write"	
	print "-> <w|r>      - Either read OR write mode:" 		
	print "-> 	         - w : Read file  -> Write FLASH"
	print "-> 	         - r : Read FLASH -> Write file"	
	print

##===================================================================================================##
##===================================================================================================##
