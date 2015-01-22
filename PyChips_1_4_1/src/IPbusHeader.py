'''
Created on May 14, 2010

@author: Robert Frazier
'''
from ChipsException import ChipsException
from CommonTools import uInt32HexStr


# This is an enumeration of the different codes for the different transaction types
TYPE_ID_READ           = 0x03   # Read transaction code
TYPE_ID_WRITE          = 0x04   # Write transaction code
TYPE_ID_RMW_BITS       = 0x05   # Read-Modify-Write Bits transaction code
TYPE_ID_RMW_SUM        = 0x06   # Read-Modify-Write Sum transaction code
TYPE_ID_NON_INCR_READ  = 0x08   # Non-Incrementing Read transaction code
TYPE_ID_NON_INCR_WRITE = 0x09   # Non-Incrementing Write transaction code
TYPE_ID_RSVD_ADDR_INFO = 0x1E   # Reserved Address Info Request transaction code
TYPE_ID_BYTE_ORDER     = 0x1F   # Byte-Order Transaction transaction code

# Request transaction element (i.e. controller-to-target) minimum body size 
_minimumRequestBodySize = { TYPE_ID_READ           : 1,  # Read
                            TYPE_ID_WRITE          : 1,  # Write 
                            TYPE_ID_RMW_BITS       : 3,  # Read-Modify-Write Bits
                            TYPE_ID_RMW_SUM        : 2,  # Read-Modify-Write Sum
                            TYPE_ID_NON_INCR_READ  : 1,  # Non-incrementing Read
                            TYPE_ID_NON_INCR_WRITE : 1,  # Non-incrementing Write
                            TYPE_ID_RSVD_ADDR_INFO : 0,  # Reserved Address Info request
                            TYPE_ID_BYTE_ORDER     : 0 } # Byte-order

# Response transaction element (i.e. target-to-controller) minimum body size     
_minimumResponseBodySize = { TYPE_ID_READ           : 0,  # Read
                             TYPE_ID_WRITE          : 0,  # Write
                             TYPE_ID_RMW_BITS       : 1,  # Read-Modify-Write Bits
                             TYPE_ID_RMW_SUM        : 1,  # Read-Modify-Write Sum
                             TYPE_ID_NON_INCR_READ  : 0,  # Non-incrementing Read
                             TYPE_ID_NON_INCR_WRITE : 0,  # Non-incrementing Write
                             TYPE_ID_RSVD_ADDR_INFO : 2,  # Reserved Address Info request
                             TYPE_ID_BYTE_ORDER     : 0 } # Byte-order


def makeHeader(version, transactionId, words, typeId, direction, resultCode):
        '''Returns a 32-bit IPbus transaction element header as created from individual header components.'''
        
        rawHeaderU32 =  ((version & 0xf) << 28)  | \
                        ((transactionId & 0x7ff) << 17) | \
                        ((words & 0x1ff) << 8) | \
                        ((typeId & 0x1f) << 3) | \
                        ((direction & 0x1) << 2) | \
                        (resultCode & 0x3)
        
        return rawHeaderU32
             

def getExpectedBodySize(rawHeaderU32):
    '''Calculates the expected body size of an IPbus TransactionElement from the raw 32-bit header word'''

    result = 0
    typeId = getTypeId(rawHeaderU32)

    # Test if it's a known request/response typeId (doesn't matter which bodySize map we use)
    if typeId in _minimumResponseBodySize:
        
        # response from target to controller
        if getDirection(rawHeaderU32): 
            if typeId == TYPE_ID_READ or typeId == TYPE_ID_NON_INCR_READ:
                result = getWords(rawHeaderU32) + _minimumResponseBodySize[typeId]
            else: result = _minimumResponseBodySize[typeId]
        
        # request from controller to target
        else: 
            if typeId == TYPE_ID_WRITE or typeId == TYPE_ID_NON_INCR_WRITE:
                result = getWords(rawHeaderU32) + _minimumRequestBodySize[typeId]
            else: result = _minimumRequestBodySize[typeId]

    # Unknown transaction typeId.
    else:
        raise ChipsException("Cannot determine the expected body size from the given IPbus header '0x" + uInt32HexStr(rawHeaderU32) +
                             "', as it is of unknown transaction type '" + hex(typeId) + "'!")
    
    return result  


def getVersion(rawHeaderU32):
    '''Returns the IPbus Version number contained within a raw IPbus Header'''
    return (rawHeaderU32 >> 28) & 0xf
    

def getTransactionId(rawHeaderU32):
    '''Returns the Transaction ID number contained within a raw IPbus Header'''
    return (rawHeaderU32 >> 17) & 0x7ff
    

def getWords(rawHeaderU32):
    '''Returns the value stored in the Words field of a raw IPbus Header'''
    return (rawHeaderU32 >> 8) & 0x1ff


def updateWords(rawHeaderU32, newWords):
    '''Returns the raw IPbus header but with the words field updated to the value specified'''
    return (rawHeaderU32 & 0xfffe00ff | ((newWords & 0x1ff) << 8))

    
def getTypeId(rawHeaderU32):
    '''Returns the Type ID Code contained within a raw IPbus Header'''
    return (rawHeaderU32 >> 3) & 0x1f


def getDirection(rawHeaderU32):
    '''Returns the Direction Bit contained within a raw IPbus Header'''
    return (rawHeaderU32 >> 2) & 0x1


def updateDirection(rawHeaderU32, newDirection):
    '''Returns the raw IPbus header but with the direction bit updated to the value specified'''
    return (rawHeaderU32 & 0xfffffffb | ((newDirection & 0x1) << 2))


def getResultCode(rawHeaderU32):
    '''Returns the Result Code contained within a raw IPbus Header'''
    return rawHeaderU32 & 0x3


def updateResultCode(rawHeaderU32, newResultCode):
    '''Returns the raw IPbus header but with the Result Code updated to the value specified'''
    return (rawHeaderU32 & 0xfffffffc) | (newResultCode & 0x3)

