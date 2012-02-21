MHV7T ;WAS/GPM - HL7 TRANSMITTER ; [8/22/05 11:54pm]
 ;;1.0;My HealtheVet;;Aug 23, 2005
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 ;
 Q
 ;
XMIT(REQ,XMT,ERR,DATAROOT,HL) ;Build and Transmit HL7 message
 ;   Builds and sends the desired HL7 message based on the mode and
 ; builder passed in XMT.  If the builder requires other information
 ; to build the message, it can be passed as additional subscripts of
 ; XMT or REQ.  REQ is used for request or query related parameters,
 ; XMT for transmission and control related parameters.
 ;
 ;  The message builder sent in XMT("BUILDER") is called to build the
 ; desired message.
 ;
 ;  An immediate mode response is indicated by XMT("MODE") of I, and
 ; sent on the current interface as an original mode acknowledgement.
 ;
 ;  A deferred mode response is indicated by XMT("MODE") of D, and
 ; sent on the interface associated with XMT("PROTOCOL") as an
 ; enhanced mode application acknowledgement.
 ;
 ;  A message may be initiated by using the deferred mode settings.
 ;  Synchronous messages cannot be initiate with this API.
 ;
 ;  Integration Agreements:
 ;         2161 : INIT^HLFNC2
 ;         2164 : GENERATE^HLMA
 ;         2165 : GENACK^HLMA1
 ;
 ;  Input:
 ;         REQ - Request parameters and Message ID of original message
 ;         XMT - Transmission parameters
 ;            XMT("MODE") - Priority or mode of the transmission
 ;            XMT("PROTOCOL") - Protocol for deferred transmissions
 ;            XMT("BUILDER") - Name/tag of message builder routine
 ;            XMT("HLMTIENS") - Original message IEN - Immediate mode
 ;         ERR - Caret delimited error string
 ;               segment^sequence^field^code^ACK type^error text
 ;    DATAROOT - Global root of data array
 ;          HL - HL7 package array variable
 ;
 ;  Output: HL7 Message Transmitted
 ;
 N MSGROOT,HLRSLT,HLP
 I XMT("MODE")="D" D           ;Deferred mode
 . D LOG^MHV7U("TRANSMIT","DEFERRED MODE","S",0)
 . K HL
 . D INIT^HLFNC2(XMT("PROTOCOL"),.HL)
 . I $G(HL) S ERR=HL D LOG^MHV7U("PROTOCOL INIT FAIL",ERR,"S",0) Q
 . D LOG^MHV7U("PROTOCOL INIT","DONE "_XMT("MODE"),"S",0)
 . S MSGROOT="^TMP(""HLS"",$J)"
 . D @(XMT("BUILDER")_"(MSGROOT,.REQ,ERR,DATAROOT,.HL)")
 . D LOG^MHV7U("BUILD "_$P(XMT("BUILDER"),"^"),MSGROOT,"I",0)
 . D GENERATE^HLMA(XMT("PROTOCOL"),"GM",1,.HLRSLT,"",.HLP)
 . K @MSGROOT
 . D LOG^MHV7U("TRANSMIT "_$P(XMT("BUILDER"),"^"),.HLRSLT,"M",0)
 . Q
 ;
 I XMT("MODE")="I" D           ;Immediate mode
 . D LOG^MHV7U("TRANSMIT","IMMEDIATE MODE","S",0)
 . S MSGROOT="^TMP(""HLA"",$J)"
 . D @(XMT("BUILDER")_"(MSGROOT,.REQ,ERR,DATAROOT,.HL)")
 . D LOG^MHV7U("BUILD "_$P(XMT("BUILDER"),"^"),MSGROOT,"I",0)
 . D GENACK^HLMA1(HL("EID"),XMT("HLMTIENS"),HL("EIDS"),"GM",1,.HLRSLT)
 . K @MSGROOT
 . D LOG^MHV7U("TRANSMIT "_$P(XMT("BUILDER"),"^"),.HLRSLT,"M",0)
 . Q
 D LOG^MHV7U("TRANSMIT","COMPLETE","S",0)
 Q
 ;
EMAIL(REQ,XMT,ERR,DATAROOT,HL) ;Build and Transmit HL7 message
 ;   Builds and sends the desired HL7 message via email.
 ; This will only be used until the MHV server can establish normal
 ; HL7 receivers.
 ;
 ;  If the builder requires other information to build the message, it
 ; can be passed as additional subscripts of XMT or REQ.  REQ is used
 ; for request or query related parameters, XMT for transmission and
 ; control related parameters.
 ;
 ;  The message builder sent in XMT("BUILDER") is called to build the
 ; desired message.
 ;
 ;  Integration Agreements:
 ;         2161 : INIT^HLFNC2, MSH^HLFNC2
 ;        10070 : ^XMD
 ;
 ;  Input:
 ;         REQ - Request parameters and Message ID of original message
 ;         XMT - Transmission parameters
 ;            XMT("PROTOCOL") - Protocol for deferred transmissions
 ;            XMT("BUILDER") - Name/tag of message builder routine
 ;            XMT("SAF") - Sending Facility
 ;            XMT("EMAIL") - Email Address to use
 ;         ERR - Caret delimited error string
 ;               segment^sequence^field^code^ACK type^error text
 ;    DATAROOT - Global root of data array
 ;          HL - HL7 package array variable
 ;
 ;  Output: HL7 Message Transmitted
 ;
 N MSGROOT,MID,MSH,CNT
 N TEXT,XMDUN,XMDUZ,XMTEXT,XMROU,XMSTRIP,XMSUB,XMY,XMZ,XMDF,XMMG
 D LOG^MHV7U("TRANSMIT","EMAIL","S",0)
 K HL
 D INIT^HLFNC2(XMT("PROTOCOL"),.HL)
 I $G(HL) S ERR=HL D LOG^MHV7U("PROTOCOL INIT FAIL",ERR,"S",0) Q
 D LOG^MHV7U("PROTOCOL INIT","DONE EMAIL","S",0)
 S MSGROOT="^TMP(""MHV7TEM"",$J)"
 D @(XMT("BUILDER")_"(MSGROOT,.REQ,ERR,DATAROOT,.HL)")
 D LOG^MHV7U("BUILD "_$P(XMT("BUILDER"),"^"),MSGROOT,"I",0)
 S MID=+$H_"-"_$P($H,",",2)
 S HL("SAF")=XMT("SAF")
 D MSH^HLFNC2(.HL,MID,.MSH)
 S XMDF="",(XMDUN,XMDUZ)="My HealtheVet Package"
 S XMY(XMT("EMAIL"))=""
 S XMSUB=XMT("SAF")_" MHV PACKAGE MESSAGE"
 S XMTEXT="TEXT("
 S TEXT(1)=MSH
 F CNT=1:1 Q:'$D(@MSGROOT@(CNT))  S TEXT(CNT+1)=@MSGROOT@(CNT)
 D ^XMD
 K @MSGROOT
 I $D(XMMG) D LOG^MHV7U("EMAIL TRANSMIT","FAILURE: "_XMMG,"S",0) Q
 D LOG^MHV7U("EMAIL TRANSMIT","SUCCESS: "_XMZ,"S",0)
 Q
