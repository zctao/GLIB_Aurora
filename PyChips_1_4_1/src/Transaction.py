'''
Created on May 12, 2010

@author: Robert Frazier
'''

# System imports
import logging
import socket

# Project imports
from ChipsLog import chipsLog
from ChipsException import ChipsException
from CommonTools import uInt32HexStr
from SerDes import SerDes
from IPbusHeader import getTransactionId, getTypeId, getDirection, getResultCode

class Transaction(object):

    '''Used for storing the details of a transaction in terms of serial/non-serial requests and responses'''

    def __init__(self):
        object.__init__(self)
        self.addr = ("", 0)  # Tuple of host string and port number, e.g. ("192.168.0.1", 50001) 
        self.requests = []  # Requests: a list of TransactionElement objects
        self.serialRequests = ""  # For holding the serialised requests payload string
        self.responses = []  # Responses: a list of TransactionElement objects
        self.serialResponses = ""  # For holding the serialised responses payload string
        self._serdes = SerDes() # For serialising/deserialising transactions


    @classmethod
    def constructHostTransaction(cls, packetPayload, clientAddr):
        """Constructs a typical host Transaction object instance
        
        Usage: the host has just received a serial packetPayload string from a
        client with clientAddr.  clientAddr is a tuple of ("hostIP", portNumber),
        e.g.  ("192.168.0.1", 50001).  Thus, you want to make a Transaction object
        with this data set via constructor.
        """
        transaction = cls()
        transaction.addr = clientAddr
        transaction.serialRequests = packetPayload
        return transaction


    @classmethod
    def constructClientTransaction(cls, transactionElementList, targetAddr):
        """Constructs a typical client Transaction object instance
        
        Usage: you want to send the host (i.e. hardware) a read/write/etc
        request, and have already formulated the TransactionElementList that
        needs to be serialised for sending to the host.  The argument targetAddr
        is the host's IP address and port number in the form of a tupe like this:
        ("hostIP", portNumber), e.g. ("192.168.0.2", 50002).
        """
        transaction = cls()
        transaction.addr = targetAddr
        transaction.requests = transactionElementList
        return transaction


    def appendRequest(self, transactionElement):
        self.requests.append(transactionElement)

        
    def appendResponse(self, transactionElement):
        self.responses.append(transactionElement)


    def serialiseRequests(self):
        """Serialise current requests list - the result is put into the serialisedRequests string"""
        self.serialRequests = self._serdes.serialise(self.requests)
    
    def serialiseResponses(self):
        """Serialise current responses list - the result is put into the serialisedResponses string"""
        self.serialResponses = self._serdes.serialise(self.responses)

        
    def deserialiseRequests(self):
        """Deserialise current serialisedRequests string - the result is put into the requests list"""
        self.requests = self._serdes.deserialise(self.serialRequests)

    
    def deserialiseResponses(self):
        """Deserialise current serialisedResponses string - the result is put into the responses list"""
        self.responses = self._serdes.deserialise(self.serialResponses) 

    def doTransactionChecks(self):
        """Performs a generic set of transaction checks on all transaction elements in the request/response lists"""		
        if len(self.requests) != len(self.responses):
            raise ChipsException("Transaction error: incorrect number of responses returned!")

        for iElement in range(len(self.requests)):
            request = self.requests[iElement]
            response = self.responses[iElement]
            #print "Request Code = ",getResultCode(request.getHeader())
            #print "Result Code = ",getResultCode(response.getHeader())
            if getTransactionId(request.getHeader()) != getTransactionId(response.getHeader()):
                raise ChipsException("Transaction error: request and response transaction IDs do not match; " \
                                     "expected '" + str(getTransactionId(request.getHeader())) + "' but got '" \
                                     + str(getTransactionId(response.getHeader())) + "'!")
            if getTypeId(request.getHeader()) != getTypeId(response.getHeader()):
                raise ChipsException("Transaction error: request and response transaction types do not match; " \
                                     "expected '" + hex(getTypeId(request.getHeader())) + "' but got '" \
                                     + hex(getTypeId(response.getHeader())) + "'!")
            if getDirection(response.getHeader()) != 1:
                raise ChipsException("Transaction error: erroneous response direction bit detected for " \
                                     "transaction number " + getTransactionId(response.getHeader()) + 
                                     " (header=0x" + uInt32HexStr(response.getHeader()) + ")!")
            if not response.validBodySize():
                raise ChipsException("Transaction error: incorrect response body size for " \
                                     "transaction number " + getTransactionId(response.getHeader()) + 
                                     " (header=0x" + uInt32HexStr(response.getHeader()) + ")!")
            if getResultCode(response.getHeader()):
                string1 = uInt32HexStr(response.getHeader())
                string2 = uInt32HexStr(getTransactionId(response.getHeader()))
                print "strings 1 and 2 are ", string1, string2
                print uInt32HexStr(response.getHeader()) + "test"
                raise ChipsException("Transaction error: non-zero result code returned for " \
										"transaction number " + string2 + 
										" (header=0x" + string1 + ")!")
