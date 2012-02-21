MHV7R2 ;WAS/GPM - HL7 RECEIVER FOR OMP^O09 ; [8/22/05 11:53pm]
 ;;1.0;My HealtheVet;;Aug 23, 2005
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 ;
OMPO09 ;Process OMP^O09 messages from the MHV OMP^O09 Subsciber protocol
 ;
 ; This routine and subroutines assume that all VistA HL7 environment
 ; variables are properly initialized and will produce a fatal error
 ; if they are missing.
 ;
 ;  The message will be checked to see if it is a valid OMP^O09 order
 ; message.  If not, a negative acknowledgement will be sent.  If the ; order message is real time or synchronous, the realtime request
 ; manager is called to handle it.
 ;
 ;  Input:
 ;          HL7 environment variables
 ;
 ; Output:
 ;          Processed query or negative acknowledgement
 ;
 N MSGROOT,REQ,XMT,ERR
 S (REQ,XMT,ERR)=""
 S MSGROOT="^TMP(""MHV7"",$J)"
 S ^XTMP("MHV7LOG")=1                ;Temporary - turns on logging
 D LOG^MHV7U("OMP-O09 RECEIVER","","S",1)
 ;
 D LOADMSG^MHV7U(MSGROOT)
 D LOG^MHV7U("LOAD",MSGROOT,"I",0)
 ;
 D PARSEMSG^MHV7U(MSGROOT,.HL)
 ;D LOG^MHV7U("PARSE",MSGROOT,"I",0)
 ;
 I '$$VALIDO09(MSGROOT,.REQ,.XMT,.ERR) D  Q
 . D LOG^MHV7U("MSG CHECK","INVALID^"_ERR,"S",0)
 . D XMIT^MHV7T(.REQ,.XMT,ERR,"",.HL)
 D LOG^MHV7U("MSG CHECK","VALID","S",0)
 ;
 ; Immediate Mode
 ; Only real time synchronous calls are supported at this time.
 I REQ("PRI")="I" D REALTIME^MHVRQI(.REQ,.XMT,.HL) Q
 ;
 Q
 ;
VALIDO09(MSGROOT,REQ,XMT,ERR) ;Parse and Validate message
 ;
 ;  OMP^O09 messages must contain PID, ORC, and RXE segments
 ;  The following sequences are required
 ;     PID(3)  - ICN/DFN
 ;     ORC(2)  - Placer Order Number
 ;     RXE(1).4- Order Start Time
 ;     RXE(15) - Prescription Number
 ;  The following sequences are optional
 ;
 ;  ERR = segment^sequence^field^code^ACK type^error text
 ;
 N MSH,PID,ORC,RXE,CNT,ICN,SSN,REQTYPE,DFN,PRI,REQTIEN,REQT0,TYPE,ID,I,ORDERCTL,PORDERN,ORDERQTY,GIVEID,GIVESYS,GIVEAMT,GIVEUNT,ORDERTM,RXNUM,FAMILY,GIVEN,MIDDLE,SUFFIX
 S ERR=""
 K REQ,XMT
 ;
 ;Set response control defaults
 S XMT("PROTOCOL")="MHV ORP-O10 Event Driver"   ;Response protocol
 S XMT("BUILDER")="ORPO10^MHV7B2"               ;Response builder
 S XMT("MODE")="D"                               ;Response mode
 I $G(HL("APAT"))="" S XMT("MODE")="I"           ;Immediate mode
 S XMT("HLMTIENS")=HLMTIENS                      ;Message IEN
 S REQ("MID")=""                                 ;Message ID
 ;
 ;Validate message is a well-formed OMP^O09 message
 ;Must have MSH first followed by PID, then one or more ORC/RXE pairs
 I $G(@MSGROOT@(1,0))="MSH" M MSH=@MSGROOT@(1) S REQ("MID")=$G(MSH(9))
 E  S ERR="MSH^1^^100^AE^Missing MSH segment" Q 0
 I $G(@MSGROOT@(2,0))="PID" M PID=@MSGROOT@(2),REQ("PID")=PID
 E  S ERR="PID^1^^100^AE^Missing PID segment" Q 0
 S CNT=3
 F  Q:'$D(@MSGROOT@(CNT))  D  Q:ERR'=""
 . I $G(@MSGROOT@(CNT,0))="ORC" M ORC(CNT\2)=@MSGROOT@(CNT)
 . E  S ERR="ORC^1^^100^AE^Missing ORC segment" Q
 . I $G(@MSGROOT@(CNT+1,0))="RXE" M RXE(CNT\2)=@MSGROOT@(CNT+1)
 . E  S ERR="RXE^1^^100^AE^Missing RXE segment" Q
 . S CNT=CNT+2
 . Q
 Q:ERR'="" 0
 I '$D(ORC) S ERR="ORC^1^^100^AE^Missing ORC segment" Q 0
 I '$D(RXE) S ERR="RXE^1^^100^AE^Missing RXE segment" Q 0
 ;
 ;
 ;Validate required fields and refill request parameters
 ;
 S ICN="",DFN="",SSN=""
 F I=1:1:3 Q:'$D(PID(3,I))  D  Q:ERR'=""
 . S ID=$G(PID(3,I,1))
 . S TYPE=$G(PID(3,I,5))
 . I ID="" S ERR="PID^1^3^101^AE^Missing Patient ID" Q
 . I TYPE="" S ERR="PID^1^3^101^AE^Missing Patient ID Type" Q
 . I TYPE="NI" S ICN=ID
 . I TYPE="PI" S DFN=ID
 . I TYPE="SS" S SSN=ID
 . Q
 Q:ERR'="" 0
 ;
 S FAMILY=$G(PID(5,1,1))
 S GIVEN=$G(PID(5,1,2))
 S MIDDLE=$G(PID(5,1,3))
 S SUFFIX=$G(PID(5,1,4))
 ;
 I '$$VALIDID(.ICN,.DFN,.SSN,.ERR) S ERR="PID^1^3^"_ERR Q 0
 ;
 ; *** May need to add validation of name - compare against system
 ;I FAMILY="" S ERR="PID^1^5^101^AE^Missing Patient Family Name" Q 0
 ;I GIVEN="" S ERR="PID^1^5^101^AE^Missing Patient Given Name" Q 0
 ;
 F I=1:1 Q:'$D(ORC(I))  D  Q:ERR'=""
 . S ORDERCTL=$G(ORC(I,1))
 . S PORDERN=$G(ORC(I,2))
 . I ORDERCTL="" S ERR="ORC^"_I_"^2^101^AE^Missing Order Control" Q
 . I PORDERN="" S ERR="ORC^"_I_"^2^101^AE^Missing Placer Order#" Q
 . ;
 . S ORDERQTY=$G(RXE(I,1,1,1))
 . S ORDERTM=$G(RXE(I,1,1,4))
 . S GIVEID=$G(RXE(I,2,1,1))
 . S GIVESYS=$G(RXE(I,2,1,3))
 . S GIVEAMT=$G(RXE(I,3))
 . S GIVEUNT=$G(RXE(I,5))
 . S RXNUM=$G(RXE(I,15))
 . I ORDERQTY="" S ERR="RXE^"_I_"^1^101^AE^Missing Order Quantity" Q
 . I ORDERTM="" S ERR="RXE^"_I_"^1^101^AE^Missing Order Start Time" Q
 . I GIVEID="" S ERR="RXE^"_I_"^2^101^AE^Missign Give Code ID" Q
 . I GIVESYS="" S ERR="RXE^"_I_"^2^101^AE^Missing Give Code System" Q
 . I GIVEAMT="" S ERR="RXE^"_I_"^3^101^AE^Missing Give Amount" Q
 . I GIVEUNT="" S ERR="RXE^"_I_"^5^101^AE^Missing Give Units" Q
 . I RXNUM="" S ERR="RXE^"_I_"^15^101^AE^Missing Prescription#" Q
 . I RXNUM'?1N.N0.1A S ERR="RXE^"_I_"^15^102^AE^Invalid Prescription#" Q
 . S REQ("RX",I)=RXNUM_"^"_PORDERN_"^"_ORDERTM
 . Q
 Q:ERR'="" 0
 ;
 S PRI=XMT("MODE")
 S REQTYPE="RxRefill"
 S REQTIEN=$O(^MHV(2275.3,"D",REQTYPE,0))
 I 'REQTIEN S ERR="MSH^1^9^103^AE^Request Type Not Found" Q 0
 S REQT0=$G(^MHV(2275.3,REQTIEN,0))
 S REQTYPE=$P(REQT0,"^",2)
 ;
 S REQ("ICN")=ICN         ;ICN
 S REQ("DFN")=DFN         ;DFN
 S REQ("SSN")=SSN         ;SSN
 S REQ("TYPE")=REQTYPE    ;Request Data Type
 S REQ("PRI")=PRI         ;Priority
 ;
 S REQ("BLOCKED")=$P(REQT0,"^",3)
 S REQ("REALTIME")=$P(REQT0,"^",4)
 S REQ("EXECUTE")=$TR($P(REQT0,"^",5),"~","^")
 ;
 Q 1
 ;
VALIDID(ICN,DFN,SSN,ERR) ;Validate patient identifiers
 ; Will accept ICN, SSN, or DFN, but must have at least one.
 ; Only validate one, in order of preference: ICN, SSN, DFN.
 ;
 ;  Integration Agreements:
 ;         2701 : $$GETDFN^MPIF001, $$GETICN^MPIF001
 ;        10035 : Direct referenc of ^DPT(DFN,0);9
 ; 
 N XSSN,XDFN
 S ERR=""
 I ICN="",SSN="",DFN="" S ERR="101^AE^Missing Patient ID" Q 0
 ;I ICN="" S ERR="101^AE^Missing ICN" Q 0
 ;
 I ICN'="" D  Q:ERR'="" 0 Q 1
 . S ICN=$P(ICN,"V")
 . I ICN'?9.10N S ERR="102^AE^Invalid ICN" Q
 . S XDFN=$$GETDFN^MPIF001(ICN)
 . I XDFN<1 S ERR="204^AR^Patient Not Found" Q
 . S XSSN=$P($G(^DPT(XDFN,0)),"^",9)
 . I SSN'="" D  Q:ERR'=""
 .. I SSN'?9N S ERR="102^AE^Invalid SSN" Q
 .. I SSN'=XSSN S ERR="204^AE^Patient SSN Mismatch" Q
 . I DFN'="",DFN'=XDFN S ERR="204^AE^Patient DFN Mismatch" Q
 . S DFN=XDFN,SSN=XSSN
 . Q
 ;
 I SSN'="" D  Q:ERR'="" 0 Q 1
 . I SSN'?9N S ERR="102^AE^Invalid SSN" Q
 . S XDFN=$O(^DPT("SSN",SSN,""))
 . I XDFN<1 S ERR="204^AR^Patient Not Found" Q
 . S ICN=+$$GETICN^MPIF001(DFN)
 . I ICN<1 S ICN=""
 . I DFN'="",DFN'=XDFN S ERR="204^AE^Patient DFN Mismatch" Q
 . S DFN=XDFN
 . Q
 ;
 I DFN'="" D  Q:ERR'="" 0 Q 1
 . I DFN'?1N.N  S ERR="102^AE^Invalid DFN" Q
 . I DFN<1 S ERR="102^AE^Invalid DFN" Q
 . I '$D(^DPT(DFN,0)) S ERR="204^AR^Patient Not Found" Q
 . S ICN=+$$GETICN^MPIF001(DFN)
 . I ICN<1 S ICN=""
 . S SSN=$P($G(^DPT(DFN,0)),"^",9)
 . Q
 ;
 S ERR="101^AE^Missing Patient ID" Q 0
 ;
