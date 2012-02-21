MHV7B1 ;WAS/GPM - HL7 message builder RTB^K13 ; [8/22/05 6:18pm]
 ;;1.0;My HealtheVet;;Aug 23, 2005
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 ;
 Q
 ;
RTBK13(MSGROOT,QRY,ERR,DATAROOT,HL) ; Build query response
 ;
 ;  Populates the array pointed to by MSGROOT with an RTB^K13 query
 ; response message by calling the appropriate segment builders based
 ; on the type of response ACK/Data or NAK.  Extracted data pointed to
 ; by DATAROOT, errors, hit counts, and query information are user to
 ; buld the segments.
 ; An error number in ERR^4 indicates a NAK is needed.
 ; DATAROOT being null indicates a dataless ACK (testing purposes).
 ;  Multiple types of RDF/RDT are supported based on the type of
 ; data in the response, indicated by QRY("TYPE").
 ;
 ;  Input:
 ;     MSGROOT - Global root of message
 ;         QRY - Query parameters
 ;             QRY("TYPE") - Request type number
 ;             QRY("MID") - original message control ID
 ;         ERR - Caret delimited error string
 ;               segment^sequence^field^code^ACK type^error text
 ;    DATAROOT - Global root of data array
 ;          HL - HL7 package array variable
 ;
 ;  Output: RTB^K13 message in MSGROOT
 ;
 N CNT,RDT,HIT
 S HIT=""
 I DATAROOT'="" S HIT=$G(@DATAROOT)
 I HIT="" S HIT=0
 S HIT=HIT_"^"_HIT_"^0"
 K @MSGROOT
 S CNT=1,@MSGROOT@(CNT)=$$MSA($G(QRY("MID")),ERR,.HL)
 I $P(ERR,"^",4) S CNT=CNT+1,HIT="0^0^0",@MSGROOT@(CNT)=$$ERR(ERR,.HL)
 S CNT=CNT+1,@MSGROOT@(CNT)=$$QAK(.QRY,ERR,HIT,.HL)
 S CNT=CNT+1,@MSGROOT@(CNT)=$$QPD(.QRY,.HL)
 Q:$P(ERR,"^",4)
 S CNT=CNT+1,@MSGROOT@(CNT)=$$RDF(QRY("TYPE"),.HL)
 Q:DATAROOT=""
 Q:@DATAROOT<1
 D RDT(MSGROOT,QRY("TYPE"),DATAROOT,.CNT,.HL)
 Q
 ;
MSA(MID,ERROR,HL) ;build MSA segment
 N MSA,ACK
 S ACK=$P(ERROR,"^",5)
 I ACK="" S ACK="AA"
 S MSA(0)="MSA"
 S MSA(1)=ACK                ;ACK code
 S MSA(2)=MID                ;message control ID
 S MSA(3)=$$ESCAPE^MHV7U($P(ERROR,"^",6),.HL)  ;text message
 Q $$BLDSEG^MHV7U(.MSA,.HL)
 ;
ERR(ERROR,HL) ;build ERR segment
 N ERR
 S ERR(0)="ERR"
 S ERR(1,1,1)=$P(ERROR,"^",1)           ;segment
 S ERR(1,1,2)=$P(ERROR,"^",2)           ;sequence
 S ERR(1,1,3)=$P(ERROR,"^",3)           ;field
 S ERR(1,1,4,1)=$P(ERROR,"^",4)         ;code
 S ERR(1,1,4,2)=$$ESCAPE^MHV7U($P(ERROR,"^",6),.HL) ;text
 Q $$BLDSEG^MHV7U(.ERR,.HL)
 ;
QAK(QRY,ERROR,HIT,HL) ;build QAK segment
 N QAK,STATUS
 S STATUS=$P(ERROR,"^",5)
 I STATUS="" S STATUS="OK"
 I STATUS="OK",HIT<1 S STATUS="NF"
 S QAK(0)="QAK"
 S QAK(1)=QRY("QPD",2)     ;query tag
 S QAK(2)=STATUS           ;query response status
 M QAK(3)=QRY("QPD",1)     ;message query name
 S QAK(4)=$P(HIT,"^",1)    ;hit count total
 S QAK(5)=$P(HIT,"^",2)    ;hits this payload
 S QAK(6)=$P(HIT,"^",3)    ;hits remaining
 Q $$BLDSEG^MHV7U(.QAK,.HL)
 ;
QPD(QRY,HL) ;build QPD segment
 N QPD
 M QPD=QRY("QPD")
 S QPD(0)="QPD"
 S QPD(7)=$G(QRY("ICN"))   ;ICN
 S QPD(8)=$G(QRY("DFN"))   ;DFN
 Q $$BLDSEG^MHV7U(.QPD,.HL)
 ;
RDF(REQTYPE,HL) ; build RDF segment
 N RTN
 S RTN=$$RTN(REQTYPE)
 Q:RTN="" "RDF"
 Q @("$$RDF^"_RTN_"(.HL)")
 ;
RDT(MSGROOT,REQTYPE,DATAROOT,CNT,HL) ; Build RDT segments
 N RTN
 S RTN=$$RTN(REQTYPE)
 Q:RTN=""
 D @("RDT^"_RTN_"(MSGROOT,DATAROOT,.CNT,.HL)")
 Q
 ;
RTN(REQTYPE) ;
 N RDEF
 S RDEF(3)="MHV7B1B"
 S RDEF(21)="MHV7B1B"
 Q $G(RDEF(REQTYPE))
 ;
