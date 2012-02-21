MHV7R1 ;WAS/GPM - HL7 RECEIVER FOR QBP^Q13 ; [8/22/05 11:48pm]
 ;;1.0;My HealtheVet;;Aug 23, 2005
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 ;
QBPQ13 ;Process QBP^Q13 messages from the MHV QBP-Q13 Subsciber protocol
 ;
 ; This routine and subroutines assume that all VistA HL7 environment
 ; variables are properly initialized and will produce a fatal error
 ; if they are missing.
 ;
 ;  The message will be checked to see if it is a valid QBP^Q13 query.
 ; If not a negative acknowledgement will be sent.  If the query is an
 ; immedeiate mode or synchronous query, the realtime request manager
 ; is called to handle the query.
 ; In the future deferred mode queries may be filed in a database for 
 ; later processing, or transmission.
 ;
 ;  Integration Agreements:
 ;        10103 : $$HL7TFM^XLFDT
 ;
 ;  Input:
 ;          HL7 environment variables
 ;
 ; Output:
 ;          Processed query or negative acknowledgement
 ;
 N MSGROOT,QRY,XMT,ERR
 S (QRY,XMT,ERR)=""
 ;S MSGROOT="^TMP(""MHV7"",$J)"
 S MSGROOT="MHV7MSG"
 N MHV7MSG
 S ^XTMP("MHV7LOG")=1                ;Temporary - turns on logging
 D LOG^MHV7U("QBP-Q13 RECEIVER","","S",1)
 ;
 D LOADMSG^MHV7U(MSGROOT)
 D LOG^MHV7U("LOAD",MSGROOT,"I",0)
 ;
 D PARSEMSG^MHV7U(MSGROOT,.HL)
 D LOG^MHV7U("PARSE",MSGROOT,"I",0)
 ;
 I '$$VALIDQ13(MSGROOT,.QRY,.XMT,.ERR) D  Q
 . D LOG^MHV7U("MSG CHECK","INVALID^"_ERR,"S",0)
 . D XMIT^MHV7T(.QRY,.XMT,ERR,"",.HL)
 D LOG^MHV7U("MSG CHECK","VALID","S",0)
 ;
 ; Immediate Mode
 ; Only real time synchronous calls are supported at this time.
 I QRY("PRI")="I" D REALTIME^MHVRQI(.QRY,.XMT,.HL) Q
 ;
 Q
 ;
VALIDQ13(MSG,QRY,XMT,ERR) ;Parse and Validate message
 ;
 ;  QBP^Q13 messages must contain QPD and RCP segments
 ;          RDF segments are optional but not processed
 ;  The following sequences are required
 ;     PID(3) - Patient ID
 ;     QPD(3) - Request ID
 ;     QPD(4) - Subject Area
 ;     RCP(1) - priority
 ;  The following sequences are optional
 ;     QPD(5) - From Date
 ;     QPD(6) - To Date
 ;     QPD(7) - ICN
 ;     QPD(8) - DFN
 ;
 ;  ERR = segment^sequence^field^code^ACK type^error text
 ;
 N MSH,PID,RDF,RXE,QPD,RCP,REQID,ICN,REQTYPE,FROMDT,TODT,DFN,PRI,REQTIEN,REQT0,QTAG,QNAME,SEGTYPE,CNT,SSN,FAMILY,GIVEN,MIDDLE,SUFFIX,SEGTYPE,CNT,OCNT,RXNUM,I,ID,TYPE
 S ERR=""
 K QRY,XMT
 ;
 ;Set response control defaults
 S XMT("PROTOCOL")="MHV RTB-K13 Event Driver"   ;Response protocol
 S XMT("BUILDER")="RTBK13^MHV7B1"               ;Response builder
 S XMT("MODE")="D"                               ;Response mode
 I $G(HL("APAT"))="" S XMT("MODE")="I"           ;Immediate mode
 S XMT("HLMTIENS")=HLMTIENS                      ;Message IEN
 S QRY("MID")=""                                 ;Message ID
 S QRY("QPD")=""                                 ;QPD segment
 ;
 ;
 ;Validate message is a well formed QBP^Q13 message
 ;
 ;Must have MSH first, followed by QPD,PID,RXE,RDF,RCP in any order
 ;RDF is not required, any other segments are ignored
 ;
 I $G(@MSGROOT@(1,0))="MSH" M MSH=@MSGROOT@(1) S QRY("MID")=$G(MSH(9))
 E  S ERR="MSH^1^^100^AE^Missing MSH segment" Q 0
 S CNT=2,OCNT=0
 F  Q:'$D(@MSGROOT@(CNT))  D  S CNT=CNT+1
 . S SEGTYPE=$G(@MSGROOT@(CNT,0))
 . I SEGTYPE="PID" M PID=@MSGROOT@(CNT),QRY("PID")=PID Q
 . I SEGTYPE="QPD" M QPD=@MSGROOT@(CNT),QRY("QPD")=QPD Q
 . I SEGTYPE="RDF" M RDF=@MSGROOT@(CNT) Q
 . I SEGTYPE="RCP" M RCP=@MSGROOT@(CNT) Q
 . I SEGTYPE="RXE" S OCNT=OCNT+1 M RXE(OCNT)=@MSGROOT@(CNT) Q
 . Q
 ;
 I '$D(PID) S ERR="PID^1^^100^AE^Missing PID segment" Q 0
 I '$D(QPD) S ERR="QPD^1^^100^AE^Missing QPD segment" Q 0
 I '$D(RCP) S ERR="RCP^1^^100^AE^Missing RCP segment" Q 0
 ;
 ;
 ;Validate required fields and query parameters
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
 ; ID is validatd from PID only,
 ; May want to add fallback to use ID supplied in QPD
 I '$$VALIDID^MHV7R2(.ICN,.DFN,.SSN,.ERR) S ERR="PID^1^3^"_ERR Q 0
 ;
 ; *** May need to add validation of name - compare against system
 ;I FAMILY="" S ERR="PID^1^5^101^AE^Missing Patient Family Name" Q 0
 ;I GIVEN="" S ERR="PID^1^5^101^AE^Missing Patient Given Name" Q 0
 ;
 ;
 S QTAG=$G(QPD(2))            ;Query Tag
 S REQID=$G(QPD(3))           ;Request ID
 S REQTYPE=$G(QPD(4))         ;Request Type
 S FROMDT=$G(QPD(5))          ;From Date
 S TODT=$G(QPD(6))            ;To Date
 ; Do not use ICN or DFN from QPD, get from PID
 ;I ICN="" S ICN=$G(QPD(7))    ;ICN
 ;I DFN="" S DFN=$G(QPD(8))    ;DFN
 S PRI=$G(RCP(1))             ;Query Priority
 ;
 I '$D(QPD(1)) S ERR="QPD^1^1^101^AE^Missing Message Query Name" Q 0
 M QNAME=QPD(1)  ;Message Query Name
 ;
 I QTAG="" S ERR="QPD^1^2^101^AE^Missing Query Tag" Q 0
 ;
 I REQID="" S ERR="QPD^1^3^101^AE^Missing Request ID" Q 0
 ;
 I REQTYPE="" S ERR="QPD^1^4^101^AE^Missing Request Type" Q 0
 S REQTIEN=$O(^MHV(2275.3,"D",REQTYPE,0))
 I 'REQTIEN S ERR="QPD^1^4^103^AE^Request Type Not Found" Q 0
 S REQT0=$G(^MHV(2275.3,REQTIEN,0))
 S REQTYPE=$P(REQT0,"^",2)
 ;
 I FROMDT'="" D  Q:ERR'="" 0
 . I FROMDT'?8.16N S ERR="QPD^1^5^102^AE^Invalid From Date" Q
 . ;***Check into Time Zone issue between MHV server and site
 . S FROMDT=$$HL7TFM^XLFDT(FROMDT)\1
 . I FROMDT'?7N S ERR="QPD^1^5^102^AE^Invalid From Date" Q
 . Q
 ;
 I TODT'="" D  Q:ERR'="" 0
 . I TODT'?8.16N S ERR="QPD^1^6^102^AE^Invalid To Date" Q
 . ;***Check into Time Zone issue between MHV server and site
 . S TODT=$$HL7TFM^XLFDT(TODT)\1
 . I TODT'?7N S ERR="QPD^1^6^102^AE^Invalid To Date" Q
 . Q
 ;
 I TODT'="",TODT<FROMDT S ERR="QPD^1^6^102^AE^To Date precedes From Date" Q 0
 ;
 I PRI="" S ERR="RCP^1^1^101^AE^Missing Query Priority" Q 0
 I "D|I"'[PRI S ERR="RCP^1^1^102^AE^Invalid Query Priority" Q 0
 ;
 F CNT=1:1 Q:'$D(RXE(CNT))  D
 . S RXNUM=$G(RXE(CNT,15))
 . Q:RXNUM<1
 . S QRY("RXLIST",RXNUM)=""
 . Q
 ;
 S QRY("REQID")=REQID     ;Request ID
 S QRY("ICN")=ICN         ;ICN
 S QRY("TYPE")=REQTYPE    ;Request Data Type
 S QRY("FROM")=FROMDT     ;From Date
 S QRY("TO")=TODT         ;To Date
 S QRY("DFN")=DFN         ;DFN
 S QRY("SSN")=SSN         ;SSN
 S QRY("PRI")=PRI         ;Priority
 ;
 S QRY("BLOCKED")=$P(REQT0,"^",3)
 S QRY("REALTIME")=$P(REQT0,"^",4)
 S QRY("EXECUTE")=$TR($P(REQT0,"^",5),"~","^")
 ;
 Q 1
 ;
