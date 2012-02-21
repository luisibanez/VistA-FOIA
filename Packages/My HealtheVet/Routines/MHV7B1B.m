MHV7B1B ;WAS/GPM - HL7 message builder RTB^K13 Rx Profile ; [8/22/05 11:45pm]
 ;;1.0;My HealtheVet;;Aug 23, 2005
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 ;
 Q
 ;
RDF(HL) ;  Build RDF segment for Rx Profile data
 N RDF
 S RDF(0)="RDF"
 S RDF(1)=20
 S RDF(2,1,1)="Prescription Number",RDF(2,1,2)="ST",RDF(2,1,3)=20
 S RDF(2,2,1)="IEN",RDF(2,2,2)="NM",RDF(2,2,3)=30
 S RDF(2,3,1)="Drug Name",RDF(2,3,2)="ST",RDF(2,3,3)=40
 S RDF(2,4,1)="Issue Date/Time",RDF(2,4,2)="TS",RDF(2,4,3)=26
 S RDF(2,5,1)="Last Fill Date",RDF(2,5,2)="TS",RDF(2,5,3)=26
 S RDF(2,6,1)="Release Date/Time",RDF(2,6,2)="TS",RDF(2,6,3)=26
 S RDF(2,7,1)="Expiration or Cancel Date",RDF(2,7,2)="TS",RDF(2,7,3)=26
 S RDF(2,8,1)="Status",RDF(2,8,2)="ST",RDF(2,8,3)=25
 S RDF(2,9,1)="Quantity",RDF(2,9,2)="NM",RDF(2,9,3)=11
 S RDF(2,10,1)="Days Supply",RDF(2,10,2)="NM",RDF(2,10,3)=3
 S RDF(2,11,1)="Number of Refills",RDF(2,11,2)="NM",RDF(2,11,3)=3
 S RDF(2,12,1)="Provider",RDF(2,12,2)="XCN",RDF(2,12,3)=150
 S RDF(2,13,1)="Placer Order Number",RDF(2,13,2)="ST",RDF(2,13,3)=30
 S RDF(2,14,1)="Mail/Window",RDF(2,14,2)="ST",RDF(2,14,3)=1
 S RDF(2,15,1)="Division",RDF(2,15,2)="NM",RDF(2,15,3)=3
 S RDF(2,16,1)="Division Name",RDF(2,16,2)="ST",RDF(2,16,3)=20
 S RDF(2,17,1)="MHV Request Status",RDF(2,17,2)="NM",RDF(2,17,3)=3
 S RDF(2,18,1)="MHV Request Status Date",RDF(2,18,2)="TS",RDF(2,18,3)=26
 S RDF(2,19,1)="Remarks",RDF(2,19,2)="ST",RDF(2,19,3)=75
 S RDF(2,20,1)="SIG",RDF(2,20,2)="TX",RDF(2,20,3)=1024
 Q $$BLDSEG^MHV7U(.RDF,.HL)
 ;
RDT(MSGROOT,DATAROOT,CNT,HL) ;  Build RDT segments for Rx Profile data
 ;
 ; Walks data in DATAROOT to popoulate MSGROOT with RDT segments
 ; sequentially numbered starting at CNT
 ;
 ;  Integration Agreements:
 ;         3065 : $$HLNAME^XLFNAME
 ;
 ;  Input:
 ;   MSGROOT - Root of array holding the message
 ;  DATAROOT - Root of array to hold extract data
 ;       CNT - Current message line counter
 ;        HL - HL7 package array variable
 ;
 ;  Output:
 ;           - Populated message array
 ;
 N I,RX,RX0,RXP,RXN,RXD,RDT,SIG,SEG,PIEN,NAME
 F I=1:1 Q:'$D(@DATAROOT@(I))  D
 . S RX=@DATAROOT@(I)
 . S RX0=@DATAROOT@(I,0)
 . S RXP=@DATAROOT@(I,"P")
 . S PIEN=+RXP
 . S RXN=@DATAROOT@(I,"RXN")
 . S RXD=@DATAROOT@(I,"DIV")
 . K SIG M SIG=@DATAROOT@(I,"SIG")
 . S RDT(0)="RDT"
 . S RDT(1)=$P(RX,"^")                         ;Rx Number
 . S RDT(2)=$P(RXN,"^",9)                      ;Rx IEN
 . S RDT(3)=$$ESCAPE^MHV7U($P(RX,"^",2),.HL)   ;Drug Name
 . S RDT(4)=$$FMTHL7^XLFDT($P(RX0,"^",5))      ;Issue Date/Time
 . S RDT(5)=$$FMTHL7^XLFDT($P(RX0,"^",12))     ;Last Fill Date
 . S RDT(6)=$$FMTHL7^XLFDT($P(RXN,"^",2))      ;Release Date/Time
 . S RDT(7)=$$FMTHL7^XLFDT($P(RX0,"^",3))      ;Expiration/Cancel Date
 . S RDT(8)=$$ESCAPE^MHV7U($P(RX0,"^",6),.HL)  ;Status
 . S RDT(9)=$P(RX0,"^",8)                      ;Quantity
 . S RDT(10)=$P(RX0,"^",7)                     ;Days Supply
 . S RDT(11)=$P(RX0,"^",4)                     ;Number of Refills
 . I PIEN D
 .. S RDT(12,1,1)=PIEN                         ;Provider IEN
 .. S NAME("FILE")=200,NAME("FIELD")=.01,NAME("IENS")=PIEN_","
 .. S NAME=$$HLNAME^XLFNAME(.NAME,"","^")
 .. S RDT(12,1,2)=$$ESCAPE^MHV7U($P(NAME,"^"),.HL)     ;family
 .. S RDT(12,1,3)=$$ESCAPE^MHV7U($P(NAME,"^",2),.HL)   ;given
 .. S RDT(12,1,4)=$$ESCAPE^MHV7U($P(NAME,"^",3),.HL)   ;middle
 .. S RDT(12,1,5)=$$ESCAPE^MHV7U($P(NAME,"^",4),.HL)   ;suffix
 .. S RDT(12,1,6)=$$ESCAPE^MHV7U($P(NAME,"^",5),.HL)   ;prefix
 .. S RDT(12,1,7)=$$ESCAPE^MHV7U($P(NAME,"^",6),.HL)   ;degree
 .. Q
 . S RDT(13)=$$ESCAPE^MHV7U($P(RX0,"^",11),.HL)   ;Placer Order Number
 . S RDT(14)=$P(RXN,"^",3)                        ;Mail/Window
 . S RDT(15)=$P(RXD,"^")                          ;Division
 . S RDT(16)=$$ESCAPE^MHV7U($P(RXD,"^",2),.HL)    ;Division Name
 . S RDT(17)=$P(RX,"^",3)                         ;MHV status
 . S RDT(18)=$$FMTHL7^XLFDT($P(RX,"^",4))         ;MHV status date
 . S RDT(19)=$$ESCAPE^MHV7U($P(RXN,"^",4),.HL)    ;Remarks
 . S CNT=CNT+1
 . S @MSGROOT@(CNT)=$$BLDSEG^MHV7U(.RDT,.HL)
 . Q:'SIG(0)
 . K SEG
 . D BLDWPSEG^MHV7U(.SIG,.SEG,1024,.HL)
 . M @MSGROOT@(CNT)=SEG
 . Q
 Q
 ;
