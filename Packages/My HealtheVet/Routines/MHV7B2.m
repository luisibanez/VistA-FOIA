MHV7B2 ;WAS/GPM - HL7 message builder ORP^O10 ; [8/22/05 11:47pm]
 ;;1.0;My HealtheVet;;Aug 23, 2005
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 ;
 Q
 ;
ORPO10(MSGROOT,REQ,ERR,DATAROOT,HL) ; Build refill request response
 ;
 ;  Populates the array pointed to by MSGROOT with an ORP^O10 order
 ; response message by calling the appropriate segment builders based
 ; on the type of response ACK or NAK.  Extracted data pointed to
 ; by DATAROOT, errors, and request parameters are used to build the
 ; segments.  An error number in ERR^4 indicates a NAK is needed.
 ;
 ;  Integration Agreements:
 ;         3065 : $$HLNAME^XLFNAME
 ;        10112 : $$SITE^VASITE
 ;
 ;  Input:
 ;     MSGROOT - Global root of message
 ;         REQ - Query parameters
 ;             REQ("TYPE") - Request type number
 ;             REQ("MID") - original message control ID
 ;         ERR - Caret delimited error string
 ;               segment^sequence^field^code^ACK type^error text
 ;    DATAROOT - Global root of data array
 ;          HL - HL7 package array variable
 ;
 ;  Output: ORP^O10 message in MSGROOT
 ;
 N CNT,RDT,HIT,I
 K @MSGROOT
 S CNT=1,@MSGROOT@(CNT)=$$MSA^MHV7B1($G(REQ("MID")),ERR,.HL)
 I $P(ERR,"^",4) S CNT=CNT+1,@MSGROOT@(CNT)=$$ERR^MHV7B1(ERR,.HL)
 Q:$P(ERR,"^",4)
 S CNT=CNT+1,@MSGROOT@(CNT)=$$PID(.REQ,.HL)
 F I=1:1 Q:'$D(@DATAROOT@(I))  D
 . S CNT=CNT+1,@MSGROOT@(CNT)=$$ORC(@DATAROOT@(I),.HL)
 . S CNT=CNT+1,@MSGROOT@(CNT)=$$RXE(@DATAROOT@(I),.HL)
 . Q
 Q
 ;
PID(REQ,HL) ;
 N PID,NAME,STATION,IDCNT
 S STATION=$P($$SITE^VASITE,"^",3)
 S PID(0)="PID"
 S IDCNT=0
 I REQ("ICN")'="" D
 . S IDCNT=IDCNT+1
 . S PID(3,IDCNT,1)=REQ("ICN")          ;Patient ID - ICN
 . S PID(3,IDCNT,4,1)="USVHA"           ;assigning authority ID
 . S PID(3,IDCNT,4,3)="HL70363"         ;assigning authority type
 . S PID(3,IDCNT,5)="NI"                ;Patient ID type
 . S PID(3,IDCNT,6,1)="VA FACILITY ID"  ;assigning facility
 . S PID(3,IDCNT,6,2)=STATION           ;Station number
 . S PID(3,IDCNT,6,3)="L"               ;facility ID type
 . Q
 ;
 I REQ("DFN")'="" D
 . S IDCNT=IDCNT+1
 . S PID(3,IDCNT,1)=REQ("DFN")          ;Patient ID - DFN
 . S PID(3,IDCNT,4,1)="USVHA"           ;assigning authority ID
 . S PID(3,IDCNT,4,3)="HL70363"         ;assigning authority type
 . S PID(3,IDCNT,5)="PI"                ;Patient ID type
 . S PID(3,IDCNT,6,1)="VA FACILITY ID"  ;assigning facility
 . S PID(3,IDCNT,6,2)=STATION           ;Station number
 . S PID(3,IDCNT,6,3)="L"               ;facility ID type
 . Q
 ;
 I REQ("SSN")'="" D
 . S IDCNT=IDCNT+1
 . S PID(3,IDCNT,1)=REQ("SSN")          ;Patient ID - SSN
 . S PID(3,IDCNT,4,1)="USSSA"           ;assigning authority ID
 . S PID(3,IDCNT,4,3)="HL70363"         ;assigning authority type
 . S PID(3,IDCNT,5)="SS"                ;Patient ID type
 . S PID(3,IDCNT,6,1)="VA FACILITY ID"  ;assigning facility
 . S PID(3,IDCNT,6,2)="200MH"           ;Station number
 . S PID(3,IDCNT,6,3)="L"               ;facility ID type
 . Q
 ;
 S NAME("FILE")=2,NAME("FIELD")=.01,NAME("IENS")=REQ("DFN")_","
 S NAME=$$NAMEFMT^XLFNAME(.NAME)
 S PID(5,1,1)=$$ESCAPE^MHV7U($P(NAME,"^"),.HL)    ;family
 S PID(5,1,2)=$$ESCAPE^MHV7U($P(NAME,"^",2),.HL)  ;given
 S PID(5,1,3)=$$ESCAPE^MHV7U($P(NAME,"^",3),.HL)  ;middle
 S PID(5,1,4)=$$ESCAPE^MHV7U($P(NAME,"^",4),.HL)  ;suffix
 ;
 Q $$BLDSEG^MHV7U(.PID,.HL)
 ;
ORC(DATA,HL) ;build ORC segment
 N ORC,STATUS,CONTROL
 S STATUS=$P(DATA,"^",2)
 S CONTROL=$S(STATUS=1:"OK",1:"UA")
 S ORC(0)="ORC"
 S ORC(1)=CONTROL              ;order control
 S ORC(2)=$P(DATA,"^",3)       ;placer order number
 S ORC(3)=$P(DATA,"^",3)       ;filler order number
 Q $$BLDSEG^MHV7U(.ORC,.HL)
 ;
RXE(DATA,HL) ;build RXE segment
 N RXE,STATUS,CONTROL
 S STATUS=$P(DATA,"^",2)
 S CONTROL=$S(STATUS=1:"OK",1:"UA")
 S RXE(0)="RXE"
 S RXE(1,1,1,1)=1              ;order quantity
 S RXE(1,1,4,1)=$P(DATA,"^",4) ;order start time
 S RXE(2,1,1)=CONTROL          ;give code identifier
 S RXE(2,1,2)=STATUS           ;give code text
 S RXE(2,1,3)="HL70119"        ;give code system
 S RXE(3)=1                    ;give amount
 S RXE(5)="1 refill unit"      ;give units
 ;S RXE(7)=""                  ;division number
 S RXE(15)=$P(DATA,"^",1)      ;prescription number
 Q $$BLDSEG^MHV7U(.RXE,.HL)
 ;
