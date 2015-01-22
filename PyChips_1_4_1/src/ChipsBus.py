'''
Created on May 12, 2010

@author: Robert Frazier, Carl Jeske
'''

# System imports
import socket

# Project imports
import IPbusHeader
from TransactionElement import TransactionElement
from Transaction import Transaction
from CommonTools import uInt32HexStr, uInt32Compatible, uInt32BitFlip
from ChipsLog import chipsLog
from ChipsException import ChipsException



class ChipsBusBase(object):
    """Common Hardware Interface Protocol System Bus (CHIPS-Bus) abstract base-class
        
    Allows you to communicate with and control devices running Jeremy Mans's, et al, IP-based
    uTCA control system firmware.  This base class represents the part of the ChipsBus code
    that is protocol-agnostic.  Protocol-specific concrete classes, using either UDP or TCP,
    derive from this.
    
    The bus assumes 32-bit word addressing, so in a 32-bit address space up to 2^34 bytes in
    total can be addressed.
    """

    IPBUS_PROTOCOL_VER = 1     # Original Jeremy Mans version = 0, Andy Rose + Dave Newbold's new version = 1.
    SOCKET_BUFFER_SIZE = 4096  # Max UDP/TCP socket buffer size in bytes for receiving packets.
    MAX_TRANSACTION_ID = 2047  # Set to 127 if you have issues with Greg's Mini-T firmware.

    # Max depth of a block read or write before bridging the read/write over multiple requests.
    # Note that for UDP the max IPBus packet size cannot exceed 368 32-bit words (1472 bytes), or
    # it'll fail due to reaching the max Ethernet packet payload size (without using jumbo frames).
    MAX_BLOCK_TRANSFER_DEPTH = 350

    
    def __init__(self, addrTable, hostIp, hostPort, localPort = None):
        """ChipsBus abstract base-class constructor
                
        addrTable:  An instance of AddressTable for the device you wish to communicate with.
        hostIP:  The IP address of the device you want to control, e.g. the string '192.168.1.100'.
        hostPort:  The network port number of the device you want to control.
        localPort:  If you wish to bind the socket to a particular local port, then specify the
            the local port number here.  The default (None) means that the socket will not bind
            to any specific local port - an available port be found when it comes to sending any
            packets.
        """
        object.__init__(self)
        self._transactionId = 1
        self.addrTable = addrTable
        self._hostAddr = (hostIp, hostPort)        
        self._transactionQueue = []
        self._transactionItemQueue = []
        self._transactionRWFlagQueue = []
        
        # This is for prepending to the beginning of every outgoing IPbus packet
        # in order to ensure a UDP payload size of at least 18 bytes.  Tests shows
        # that weird stuff occasionally happens if we drop below below this, as
        # we drop below minimum Ethernet payload size.
        self._fourByteOrderTransactions = []
        for i in range(4):  self._fourByteOrderTransactions.append(self._createByteOrderTransactionElement())
    
    
    def queueRead(self, name, addrOffset = 0):
        """Create a read transaction element and add it to the transaction queue.
        
        This works in the same way as a normal read(), except that many can be queued
        into a packet and dispatched all at once rather than individually.  Run the
        queued transactions with queueRun().
        
        Only single-register reads/writes can be queued.  Block reads/writes, etc, cannot
        be queued.
        """
        
        if len(self._transactionQueue) <= 50:
        
            chipsLog.debug("Read queued: register '" + name + "' with addrOffset = 0x" + uInt32HexStr(addrOffset))
        
            item = self.addrTable.getItem(name) # Get the details of the relevant item from the addr table.
        
            try:
                self._checkRWFlag(item)
            except ChipsException, err:
                raise ChipsException("Read error on register '" + name + "':\n\t" + str(err))
        
            self._transactionQueue.append(self._createReadTransactionElement(item, 1, addrOffset))
            self._transactionItemQueue.append(item)
            self._transactionRWFlagQueue.append(1)
            
        else:
            chipsLog.warning("Warning: transaction not added to queue as transaction queue has reached its maximum length!\n" +
                             "\tPlease either run or clear the transaction queue before continuing.\n")
                
        
    def queueWrite(self, name, dataU32, addrOffset = 0):
        """Create a register write (RMW-bits) transaction element and add it to the transaction queue.
        
        This works in the same way as a normal write(), except that many can be queued
        into a packet and dispatched all at once rather than individually.  Run the
        queued transactions with queueRun().
        
        Only single-register reads/writes can be queued.  Block reads/writes, etc, cannot
        be queued.
        """

        if len(self._transactionQueue) <= 50:
        
            dataU32 = dataU32 & 0xffffffff # Ignore oversize input.
            chipsLog.debug("Write queued: dataU32 = 0x" + uInt32HexStr(dataU32) + " to register '"
                           + name + "' with addrOffset = 0x" + uInt32HexStr(addrOffset))
        
            item = self.addrTable.getItem(name) # Get the details of the relevant item from the addr table.
        
            try:
                self._checkRWFlag(item, 0, 1)
            except ChipsException, err:
                raise ChipsException("Write error on register '" + name + "':\n\t" + str(err))
        
            self._transactionQueue.append(self._createRMWBitsTransactionElement(item, dataU32, addrOffset))
            self._transactionItemQueue.append(item)
            self._transactionRWFlagQueue.append(0)
            
        else:
            chipsLog.warning("Warning: transaction not added to queue as transaction queue has reached its maximum length!\n" +
                             "\tPlease either run or clear the transaction queue before continuing.\n")
        
        
    def queueRun(self):
        """Runs the current queue of single register read or write transactions and returns two lists. The
        first contains the values read and the second contains the values written.
        
        Note: Only single-register reads/writes can be queued.  Block reads/writes, etc, cannot
        be queued.
        """

        chipsLog.debug("Running all queued transactions")
        # A check is performed to ensure the lists containing the transaction
        # queue information are of equal length
        if len(self._transactionQueue) != len(self._transactionItemQueue) or len(self._transactionQueue) != len(self._transactionRWFlagQueue):
            raise ChipsException("Error while running queued transactions: elements missing from transaction list!")
        
        transactionQueueLength = len(self._transactionQueue)
        readResponse = []
        writeResponse = []
        
        try:
            transaction = self._makeAndRunTransaction(self._transactionQueue)
        except ChipsException, err:
            self.queueClear()
            raise ChipsException("Error while running queued transactions:\n\t" + str(err))
        
        for i in range(transactionQueueLength):
            item = self._transactionItemQueue[i]
            transactionResponse = transaction.responses[i - transactionQueueLength].getBody()[0] & 0xffffffff
            transactionResponse = item.shiftDataFromMask(transactionResponse)
            
            if self._transactionRWFlagQueue[i]:
                readResponse.append(transactionResponse)
                chipsLog.debug("Read success! Register '" + item.getName() + "' returned: 0x" + uInt32HexStr(transactionResponse))
            else:
                writeResponse.append(transactionResponse)
                chipsLog.debug("Write success! Register '" + item.getName() + "' assigned: 0x" + uInt32HexStr(transactionResponse))
        
        self.queueClear()
        
        response = [readResponse, writeResponse]
        
        return response
        
        
    def queueClear(self):
        """Clears the current queue of transactions"""
        
        chipsLog.debug("Clearing transaction queue")
        
        self._transactionQueue = []
        self._transactionItemQueue = []
        self._transactionRWFlagQueue =[]
        
        
    def read(self, name, addrOffset=0):
        """Read from a single masked/unmasked 32-bit register.  The result is returned from the function.
        
        This read transaction runs straight away - i.e it's not queued at all.   
        Warning: using this method clears any previously queued transactions
            that have not yet been run!
        
        name: the register name of the register you want to read from.
        addrOffset: optional - provide a 32-bit word offset if you wish.
        
        Notes: Use the addrOffset at your own risk!  No checking is done to
            see if offsets are remotely sensible!
        """
        
        if len(self._transactionQueue):
            chipsLog.warning("Warning: Individual read requested, clearing previously queued transactions!\n")
            self.queueClear()
        
        self.queueRead(name, addrOffset)
        
        result = self.queueRun()
        
        return result[0][0]
    
    
    def write(self, name, dataU32, addrOffset=0):
        """Write to a single register (masked, or otherwise).

        This write transaction runs straight away - i.e it's not queued at all.   
        Warning: using this method clears any previously queued transactions 
            that have not yet been run!
        
        name: the register name of the register you want to read from.
        dataU32: the 32-bit value you want writing
        addrOffset: optional - provide a 32-bit word offset if you wish.
        
        Notes:
            Use the addrOffset at your own risk!  No checking is done to
                see if offsets are remotely sensible!
            Under the hood, this is implemented as an RMW-bits transaction.
        """
        
        if len(self._transactionQueue):
            chipsLog.warning("Warning: Individual write requested, clearing previously queued transactions!\n")
            self.queueClear()
        
        dataU32 = dataU32 & 0xffffffff # Ignore oversize input.
        
        self.queueWrite(name, dataU32, addrOffset)
        
        result = self.queueRun()
        
        if result[1][0] != dataU32:
            raise ChipsException("Write error: write verification failed!")

    
    def blockRead(self, name, depth=1, addrOffset=0):
        """Block read (not for masked registers!).  Returns a list of the read results (32-bit numbers).
        
        The blockRead() transaction runs straight away - it cannot be queued.

        name: the register name of the register you want to read from.
        depth: the number of 32-bit reads deep you want to go from the start address.
            (i.e. depth=3 will return a list with three 32-bit values). 
        addrOffset: optional - provide a 32-bit word offset if you wish.
        
        Notes: Use the depth and addrOffset at your own risk!  No checking is done to
            see if these values are remotely sensible!
        """

        chipsLog.debug("Block read requested: register '" + name + "' with addrOffset = 0x"
                       + uInt32HexStr(addrOffset) + " and depth = " + str(depth))

        return self._blockOrFifoRead(name, depth, addrOffset, False)



    def fifoRead(self, name, depth=1, addrOffset=0):
        """Non-incrementing block read (not for masked registers!). Returns list of the read results.
        
        Reads from the same address the number of times specified by depth

        The fifoRead() transaction runs straight away - it cannot be queued.
        
        name: the register name of the register you want to read from.
        depth: the number of 32-bit reads you want to perform on the FIFO
            (i.e. depth=3 will return a list with three 32-bit values). 
        addrOffset: optional - provide a 32-bit word offset if you wish.
        
        Notes: Use the depth and addrOffset at your own risk!  No checking is done to
            see if these values are remotely sensible!
        """        

        chipsLog.debug("FIFO read (non-incrementing block read) requested: register '" + name + "' with addrOffset = 0x"
                       + uInt32HexStr(addrOffset) + " and depth = " + str(depth))

        return self._blockOrFifoRead(name, depth, addrOffset, True)

    
    def blockWrite(self, name, dataList, addrOffset=0):
        """Block write (not for masked registers!).
        
        The blockWrite() transaction runs straight away - it cannot be queued.

        name: the register name of the register you want to read from.
        dataList: the list of 32-bit values you want writing.  The size of the list
            determines how deep the block write goes.  
        addrOffset: optional - provide a 32-bit word offset if you wish.
        
        Notes:  Use this at your own risk!  No checking is currently done to see if
            you will be stomping on any other registers if the dataList or addrOffset
            is inappropriate in size!
        """

        chipsLog.debug("Block write requested: register '" + name + "' with addrOffset = 0x"
                       + uInt32HexStr(addrOffset) + " and depth = " + str(len(dataList)))

        return self._blockOrFifoWrite(name, dataList, addrOffset, False)

        
    def fifoWrite(self, name, dataList, addrOffset=0):
        """Non-incrementing block write (not for masked registers!).
        
        Writes all the values held in the dataList to the same register.

        The fifoWrite() transaction runs straight away - it cannot be queued.
        
        name: the register name of the register you want to read from.
        dataList: the list of 32-bit values you want writing.  The size of the list
            determines how many writes will be performed on the FIFO.
        addrOffset: optional - provide a 32-bit word offset if you wish.
        
        Notes:  Use this at your own risk!  No checking is currently done to see if
            you will be stomping on any other registers if the dataList or addrOffset
            is inappropriate in size!
        """

        chipsLog.debug("FIFO write (non-incrementing block write) requested: register '" + name + "' with addrOffset = 0x"
                       + uInt32HexStr(addrOffset) + " and depth = " + str(len(dataList)))

        return self._blockOrFifoWrite(name, dataList, addrOffset, True)


    def _getTransactionId(self):
        """Returns the current value of the transaction ID counter and increments.
        
        Note:  Transaction ID = 0 will be reserved for byte-order transactions, which
        are common and rather uninteresting.  For any other kind of transaction, this
        can be used to get access to an incrementing counter, that will go from 1->2047
        before looping back around to 1.
        """
        currentValue = self._transactionId
        if self._transactionId < ChipsBus.MAX_TRANSACTION_ID:
            self._transactionId += 1
        else:
            self._transactionId = 1
        return currentValue


    def _createRMWBitsTransactionElement(self, addrTableItem, dataU32, addrOffset = 0):
        """Returns a Read/Modify/Write Bits Request transaction element (i.e. masked write)
        
        addrTableItem:  The relevant address table item you want to perform the RMWBits transaction on.
        dataU32:  The data (32 bits max, or equal in width to the bit-mask).
        addrOffset:  The offset on the address specified within the address table item, default is 0.
        """

        if not uInt32Compatible(dataU32):
            raise ChipsException("Read-Modify-Write Bits transaction creation error: cannot create a RMW-bits " \
                            "transaction with data values (" + hex(dataU32) +") that are not valid 32-bit " \
                            "unsigned integers!")
    
        rmwHeader = IPbusHeader.makeHeader(ChipsBus.IPBUS_PROTOCOL_VER, self._getTransactionId(), 3, IPbusHeader.TYPE_ID_RMW_BITS, 0, 0)
        rmwBody = [addrTableItem.getAddress() + addrOffset, \
                   uInt32BitFlip(addrTableItem.getMask()), \
                   addrTableItem.shiftDataToMask(dataU32)]
        return TransactionElement.makeFromHeaderAndBody(rmwHeader, rmwBody)


    def _createWriteTransactionElement(self, addrTableItem, dataList, addrOffset = 0, isFifo = False):
        """Returns a Write Request transaction element (i.e. unmasked/block write)
        
        addrTableItem:  The relevant address table item you want to perform the write transaction on.
        dataList:  The list of 32-bit numbers you want to write (the list size defines the write depth) 
        addrOffset:  The offset on the address specified within the address table item, default is 0.
        isFifo: False gives a normal write transaction; True gives a non-incrementing write transaction (i.e. same addr many times).
        """
        for value in dataList:
            if not uInt32Compatible(value):
                raise ChipsException("Write transaction creation error: cannot create a write transaction with data " \
                                     "values (" + hex(value) +") that are not valid 32-bit unsigned integers!")

        typeId = IPbusHeader.TYPE_ID_WRITE
        if isFifo: typeId = IPbusHeader.TYPE_ID_NON_INCR_WRITE
        writeHeader = IPbusHeader.makeHeader(ChipsBusBase.IPBUS_PROTOCOL_VER, self._getTransactionId(), len(dataList), typeId, 0, 0)
        writeBody = [addrTableItem.getAddress() + addrOffset] + dataList
        return TransactionElement.makeFromHeaderAndBody(writeHeader, writeBody)


    def _createReadTransactionElement(self, addrTableItem, readDepth = 1, addrOffset = 0, isFifo = False):
        """Returns a Read Request transaction element
        
        addrTableItem:  The relevant address table item you want to perform the write transaction on.
        readDepth:  The depth of the read; default is 1, which would be a single 32-bit register read. 
        addrOffset:  The offset on the address specified within the address table item, default is 0.
        isFifo: False gives a normal read transaction; True gives a non-incrementing read transaction (i.e. same addr many times).
        """
        typeId = IPbusHeader.TYPE_ID_READ
        if isFifo: typeId = IPbusHeader.TYPE_ID_NON_INCR_READ
        readHeader = IPbusHeader.makeHeader(ChipsBusBase.IPBUS_PROTOCOL_VER, self._getTransactionId(), readDepth, typeId, 0, 0)
        readBody = [addrTableItem.getAddress() + addrOffset]
        return TransactionElement.makeFromHeaderAndBody(readHeader, readBody)


    def _createByteOrderTransactionElement(self):
        """Returns a Byte-Order Request transaction element.
        
        Note: Byte-order transactions will always and exclusively have transactionId = 0.
        """
        byteOrderHeader = IPbusHeader.makeHeader(ChipsBusBase.IPBUS_PROTOCOL_VER, 0, 0, IPbusHeader.TYPE_ID_BYTE_ORDER, 0, 0)
        return TransactionElement.makeFromHeaderAndBody(byteOrderHeader)


    def _makeAndRunTransaction(self, requestsList):
        """Constructs, runs and then returns a completed transaction from the given requestsList

        requestsList: a list of TransactionElements (i.e. requests from client to the hardware).
        
        Notes:  _makeAndRunTransaction will automatically prepend one byte-order transaction.
        """

        # Construct the transaction and serialise it - we prepend four byte-order transactions in
        # order to ensure we meet minimum Ethernet payload requirements, else funny stuff happens.
        transaction = Transaction.constructClientTransaction(self._fourByteOrderTransactions + requestsList, self._hostAddr)
        
        transaction.serialiseRequests()
        
        chipsLog.debug("Sending packet now.");
        try:
            # Send the transaction
            #print transaction.serialRequests, transaction.addr  			
            self._socketSend(transaction)
        except socket.error, socketError:
            raise ChipsException("A socket error occurred whilst sending the IPbus transaction request packet:\n\t" + str(socketError))
          
        try:
            # Get response
            transaction.serialResponses = self._socket.recv(ChipsBus.SOCKET_BUFFER_SIZE)
            #print transaction.serialResponses
        except socket.error, socketError:
            raise ChipsException("A socket error occurred whilst getting the IPbus transaction response packet:\n\t" + str(socketError))
        chipsLog.debug("Received response packet.");

        transaction.deserialiseResponses()

        transaction.doTransactionChecks() # Generic transaction checks

        return transaction


    def _initSocketCommon(self, localPort):
        """Performs common socket initialisation (i.e. common to UDP + TCP)"""
        if localPort != None:
            localAddr = ("", localPort)
            self._socket.bind(localAddr)
        self._socket.settimeout(1)

        
    def _blockOrFifoRead(self, name, depth, addrOffset, isFifo = False):
        """Common code for either a block read or a FIFO read."""

        if depth <= 0:
            chipsLog.warn("Ignoring read with depth = 0 from register '" + name + "'!")
            return
        
        if depth > ChipsBus.MAX_BLOCK_TRANSFER_DEPTH:
            return self._oversizeBlockOrFifoRead(name, depth, addrOffset, isFifo)
        
        item = self.addrTable.getItem(name) # Get the details of the relevant item from the addr table.
       
        if item.getMask() != 0xffffffff:
            raise ChipsException("Block/FIFO read error: cannot perform block or FIFO read on a masked register address!")

        try:
            self._checkRWFlag(item)
            # create and run the transaction and get the response
            transaction = self._makeAndRunTransaction( [self._createReadTransactionElement(item, depth, addrOffset, isFifo)] )
        except ChipsException, err:
            raise ChipsException("Block/FIFO read error on register '" + name + "':\n\t" + str(err))

        blockReadResponse = transaction.responses[-1] # Block read response will be last in list

        chipsLog.debug("Block/FIFO read success! Register '" + name + "' (addrOffset=0x"
                       + uInt32HexStr(addrOffset) + ") was read successfully." )

        return blockReadResponse.getBody().tolist()

    
    def _oversizeBlockOrFifoRead(self, name, depth, addrOffset, isFifo):
        """Handles a block or FIFO read that's too big to be handled by a single UDP packet"""
        
        chipsLog.debug("Read depth too large for single packet... will automatically split read over many packets")
        
        remainingTransactions = depth
        result =[]
        
        offsetMultiplier = 1
        if isFifo: offsetMultiplier = 0
        
        while remainingTransactions > ChipsBus.MAX_BLOCK_TRANSFER_DEPTH:
            
            result.extend(self._blockOrFifoRead(name, ChipsBus.MAX_BLOCK_TRANSFER_DEPTH, addrOffset + ((depth - remainingTransactions) * offsetMultiplier), isFifo))
            remainingTransactions -= ChipsBus.MAX_BLOCK_TRANSFER_DEPTH
            
        result.extend(self._blockOrFifoRead(name, remainingTransactions, addrOffset + ((depth - remainingTransactions) * offsetMultiplier), isFifo))
        
        return result
    
    
    def _blockOrFifoWrite(self, name, dataList, addrOffset, isFifo = False):
        """Common code for either a block write or a FIFO write."""

        depth = len(dataList)

        item = self.addrTable.getItem(name) # Get the details of the relevant item from the addr table.
       
        if item.getMask() != 0xffffffff:
            raise ChipsException("Block/FIFO write error: cannot perform block or FIFO write on a masked register address!")
        
        if depth == 0:
            chipsLog.warn("Ignoring block/FIFO write to register '" + name + "': dataList is empty!");
            return
        elif depth > ChipsBus.MAX_BLOCK_TRANSFER_DEPTH:
            return self._oversizeBlockOrFifoWrite(name, dataList, addrOffset, isFifo)

        try:
            self._checkRWFlag(item, 0, 1)
            # create and run the transaction and get the response
            self._makeAndRunTransaction( [self._createWriteTransactionElement(item, dataList, addrOffset, isFifo)] )
        except ChipsException, err:
            raise ChipsException("Block/FIFO write error on register '" + name + "':\n\t" + str(err))

        chipsLog.debug("Block/FIFO write success! " + str(depth) + " 32-bit words were written to '"
                        + name + "' (addrOffset=0x" + uInt32HexStr(addrOffset) + ")")
    
        
    def _oversizeBlockOrFifoWrite(self, name, dataList, addrOffset, isFifo):
        """Handling for a block write which is too big for the hardware to handle in one go"""
        
        chipsLog.debug("Write depth too large for single packet... will automatically split write over many packets")

        depth = len(dataList)
        remainingTransactions = depth

        offsetMultiplier = 1
        if isFifo: offsetMultiplier = 0
                
        while remainingTransactions > ChipsBus.MAX_BLOCK_TRANSFER_DEPTH:
            self._blockOrFifoWrite(name, dataList[(depth - remainingTransactions):(depth - remainingTransactions) + ChipsBus.MAX_BLOCK_TRANSFER_DEPTH],
                                   addrOffset + ((depth - remainingTransactions) * offsetMultiplier), isFifo)
            remainingTransactions -= ChipsBus.MAX_BLOCK_TRANSFER_DEPTH
            
        self._blockOrFifoWrite(name, dataList[(depth - remainingTransactions):], addrOffset + ((depth - remainingTransactions) * offsetMultiplier), isFifo)


    def _socketSend(self, transaction):
        raise NotImplementedError("ChipsBusBase is an Abstract Base Class!\n" \
                                  "Please use a concrete implementation such as ChipsBusUdp or ChipsBusTcp!")
        

    def _checkRWFlag(self, addrTableItem, read = 1, write = 0):
        """Checks to ensure that read/write is allowed for the given address table item"""
        
        if read == 1 and addrTableItem.getReadFlag() == 0:
            raise ChipsException("Read transaction creation error: read is not allowed on register '" + addrTableItem.getName() +
                            "'.")
        if write == 1 and addrTableItem.getWriteFlag() == 0:
            raise ChipsException("Write transaction creation error: write is not allowed on register '" +
                            addrTableItem.getName() + "'.")        


class ChipsBusUdp(ChipsBusBase):
    """Common Hardware Interface Protocol System Bus (CHIPS-Bus) using UDP packets for bus data.
        
    Allows you to communicate with and control devices running Jeremy Mans's, et al, IP-based
    uTCA control system firmware.  This concrete class uses UDP packets for sending and 
    receiving the bus data.
    """

    def __init__(self, addrTable, hostIp, hostPort, localPort = None):
        """Constructor for ChipsBus over UDP
                
        addrTable:  An instance of AddressTable for the device you wish to communicate with.
        hostIP:  The IP address of the device you want to control, e.g. the string '192.168.1.100'.
        hostPort:  The network port number of the device you want to control.
        localPort:  If you wish to bind the socket to a particular local port, then specify the
            the local port number here.  The default (None) means that the socket will not bind
            to any specific local port - an available port be found when it comes to sending any
            packets.
        """
        ChipsBusBase.__init__(self, addrTable, hostIp, hostPort, localPort)
        self._socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)  # UDP
        self._initSocketCommon(localPort)        

    def _socketSend(self, transaction):
        """Send a transaction (via UDP)"""
        self._socket.sendto(transaction.serialRequests, transaction.addr)  # UDP-specific
        
class ChipsBusTcp(ChipsBusBase):
    """Common Hardware Interface Protocol System Bus (CHIPS-Bus) using TCP packets for bus data.
        
    Allows you to communicate with and control devices running Jeremy Mans's, et al, IP-based
    uTCA control system firmware.  This concrete class uses TCP packets for sending and 
    receiving the bus data.
    """

    def __init__(self, addrTable, hostIp, hostPort, localPort = None):
        """ChipsBus over TCP
                
        addrTable:  An instance of AddressTable for the device you wish to communicate with.
        hostIP:  The IP address of the device you want to control, e.g. the string '192.168.1.100'.
        hostPort:  The network port number of the device you want to control.
        localPort:  If you wish to bind the socket to a particular local port, then specify the
            the local port number here.  The default (None) means that the socket will not bind
            to any specific local port - an available port be found when it comes to sending any
            packets.
        """
        ChipsBusBase.__init__(self, addrTable, hostIp, hostPort, localPort)
        self._socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  # TCP
        self._initSocketCommon(localPort)        
        self._socket.connect((hostIp, hostPort))  # TCP-specific

    def _socketSend(self, transaction):
        """Send a transaction (via TCP)"""
        self._socket.send(transaction.serialRequests)  # TCP-specific

		
class ChipsBus(ChipsBusUdp):
    """Deprecated!  Essentially now just an alias for ChipsBusUdp.  Please update
    your code replacing usage of ChipsBus with ChipsBusUdp."""
    def __init__(self, addrTable, hostIp, hostPort, localPort = None):
        ChipsBusUdp.__init__(self, addrTable, hostIp, hostPort, localPort)
        chipsLog.warning("Please note: this class has been deprecated - use ChipsBusUdp"\
                         " in the future if you want the same functionality.")

