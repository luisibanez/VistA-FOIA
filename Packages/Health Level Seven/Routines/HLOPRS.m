HLOPRS ;IRMFO-ALB/CJM -RTNs for parsing messages;03/24/2004  14:43
 ;;1.6;HEALTH LEVEL SEVEN;**118,126**;Oct 13, 1995
 ;
STARTMSG(MSG,IEN,HDR) ;
 ;Description:  This function begins the parsing of the message, parsing
 ;the header and returning the individual values in the array HDR().
 ;Input: 
 ;  IEN - The internal entry number of the message in file 778.
 ;Output:
 ;  Function returns 1 on success, 0 on failure.  Failure would indicate that the message was not found.
 ;  MSG - (pass by reference, required) This array is used by the HL7 package to track the progress of parsing the message.  The application MUST NOT touch it!
 ;  HDR (pass by reference, optional)   This array contains the results of parsing the message header.
 K MSG,HDR
 Q:'$G(IEN) 0
 Q:'$$GETMSG^HLOMSG(IEN,.MSG) 0
 M HDR=MSG("HDR")
 Q:'$$PARSEHDR(.HDR) 0
 M MSG("HDR")=HDR
 Q 1
 ;
NEXTSEG(MSG,SEG) ;
 ;Description:  Advances parsing to the next segment and returns the parsed values from that segment.
 ;Input:
 ;  MSG - (pass by reference, required) This array is used by the HL7 package to track the current position in the message.  The application MUST NOT touch it!
 ;Output:
 ;  Function  returns 1 on success, 0 if there are no more segments in this message.  For batch messages, a return value of 0 does not preclude the possibility that there are additional individual messages within the batch.
 ;  MSG - (pass by reference, required)
 ;  SEG - (pass by reference, required)  The segment is returned in this array.
 ;
 N TEMP,CODES
 K SEG
 I '$$HLNEXT^HLOMSG(.MSG,.TEMP) Q 0
 S CODES=MSG("HDR","ENCODING CHARACTERS")
 Q $$PARSE^HLOPRS1(MSG("HDR","FIELD SEPARATOR"),$E(CODES,2),$E(CODES,1),$E(CODES,4),$E(CODES,3),.TEMP,.SEG)
 ;
NEXTMSG(MSG,MSH) ;
 ;Description:  Advances to the next message within the batch, with the MSH segment returned.
 ;Input:
 ; MSG (pass by reference, required) This array is used by the HL7 package to track the current position in the message.  The application MUST NOT touch it!
 ;OUTPUT:
 ;  Function returns 1 on success, 0 if there are no more messages
 ;  MSG - (pass by reference)
 ;  MSH - (pass by reference, required) Returns the parsed message header
 ;
 K MSH
 N NODE
 Q:'$$NEXTMSG^HLOMSG(.MSG,.MSH) 0
 Q:'$$PARSEHDR(.MSH) 0
 S MSG("BATCH","CURRENT MESSAGE","EVENT")=MSH("EVENT")
 S MSG("BATCH","CURRENT MESSAGE","MESSAGE CONTROL ID")=MSH("MESSAGE CONTROL ID")
 S NODE=$G(^HLB(MSG("IEN"),3,MSG("BATCH","CURRENT MESSAGE"),0))
 S MSG("BATCH","CURRENT MESSAGE","ACK TO")=$P(NODE,"^",3)
 S MSG("BATCH","CURRENT MESSAGE","ACK BY")=$P(NODE,"^",4)
 ;
 I MSG("BATCH","CURRENT MESSAGE","ACK TO")]"" S MSG("BATCH","CURRENT MESSAGE","ACK TO IEN")=$$ACKTOIEN^HLOMSG1(MSG("MESSAGE CONTROL ID"),MSG("BATCH","CURRENT MESSAGE","ACK TO"))
 I MSG("BATCH","CURRENT MESSAGE","ACK BY")]"" S MSG("BATCH","CURRENT MESSAGE","ACK BY IEN")=$$ACKBYIEN^HLOMSG1(MSG("MESSAGE CONTROL ID"),MSG("BATCH","CURRENT MESSAGE","ACK BY"))
 ;
 Q 1
 ;
PARSEHDR(HDR) ;
 ;Parses the segment (HDR, pass by reference) into the HDR() array using meaningful subscripts.
 ;Input:
 ;  HDR (pass by reference, required) contains the segment in the format HDR(1),HDR(2), etc..
 ;Output:
 ;  HDR (pass by reference, required) This array will contain all the individual values.  Also will contain HDR(1) with components 1-6 and HDR(2) with components 1-end
 ;  Function - returns 1 if the segment is indeed an MSH or BHS segment, 0 otherwise
 ;
 N VALUE,FS,CS,REP,SUBCOMP,ESCAPE
 S VALUE=$E(HDR(1),1,3)
 I VALUE'="MSH",VALUE'="BHS" Q 0
 S HDR("SEGMENT TYPE")=VALUE
 S FS=$E(HDR(1),4)
 S CS=$E(HDR(1),5)
 S REP=$E(HDR(1),6)
 S ESCAPE=$E(HDR(1),7)
 S SUBCOMP=$E(HDR(1),8)
 Q:$L(FS)'=1 0
 Q:$L(CS)'=1 0
 S HDR("FIELD SEPARATOR")=FS
 S HDR("ENCODING CHARACTERS")=$E(HDR(1),5,8)
 S HDR("COMPONENT SEPARATOR")=CS
 S HDR("REPETITION SEPARATOR")=$E(HDR(1),6)
 S HDR("ESCAPE CHARACTER")=$E(HDR(1),7)
 S HDR("SUBCOMPONENT SEPARATOR")=$E(HDR(1),8)
 S HDR("SENDING APPLICATION")=$$DESCAPE^HLOPRS1($P($P(HDR(1),FS,3),CS),FS,CS,SUBCOMP,REP,ESCAPE)
 S VALUE=$P(HDR(1),FS,4)
 S HDR("SENDING FACILITY",1)=$P(VALUE,CS)
 S HDR("SENDING FACILITY",2)=$$DESCAPE^HLOPRS1($P(VALUE,CS,2),FS,CS,SUBCOMP,REP,ESCAPE)
 S HDR("SENDING FACILITY",3)=$P(VALUE,CS,3)
 S HDR("RECEIVING APPLICATION")=$$DESCAPE^HLOPRS1($P($P(HDR(1),FS,5),CS),FS,CS,SUBCOMP,REP,ESCAPE)
 S VALUE=$P(HDR(1),FS,6)
 S HDR("RECEIVING FACILITY",1)=$P(VALUE,CS)
 S HDR("RECEIVING FACILITY",2)=$$DESCAPE^HLOPRS1($P(VALUE,CS,2),FS,CS,SUBCOMP,REP,ESCAPE)
 S HDR("RECEIVING FACILITY",3)=$P(VALUE,CS,3)
 S HDR("DT/TM OF MESSAGE")=$$FMDATE^HLFNC($P($P(HDR(2),FS,2),CS))
 S HDR("SECURITY")=$$DESCAPE^HLOPRS1($P($P(HDR(2),FS,3),CS),FS,CS,SUBCOMP,REP,ESCAPE)
 ;
 I HDR("SEGMENT TYPE")="MSH" D
 .S VALUE=$P(HDR(2),FS,4)
 .S HDR("MESSAGE TYPE")=$P(VALUE,CS)
 .S HDR("EVENT")=$P(VALUE,CS,2)
 .S HDR("MESSAGE STRUCTURE")=$P(VALUE,CS,3)
 .S HDR("MESSAGE CONTROL ID")=$P($P(HDR(2),FS,5),CS)
 .S VALUE=$P(HDR(2),FS,6)
 .S HDR("PROCESSING ID")=$P(VALUE,CS)
 .S HDR("PROCESSING MODE")=$P(VALUE,CS,2)
 .S HDR("VERSION")=$$DESCAPE^HLOPRS1($P($P(HDR(2),FS,7),CS),FS,CS,SUBCOMP,REP,ESCAPE)
 .S HDR("CONTINUATION POINTER")=$P($P(HDR(2),FS,9),CS)
 .S HDR("ACCEPT ACK TYPE")=$P($P(HDR(2),FS,10),CS)
 .S HDR("APP ACK TYPE")=$P($P(HDR(2),FS,11),CS)
 .S HDR("COUNTRY")=$P($P(HDR(2),FS,12),CS)
 ;
 I HDR("SEGMENT TYPE")="BHS" D
 .S VALUE=$P(HDR(2),FS,4)
 .S HDR("BATCH NAME/ID/TYPE")=$$DESCAPE^HLOPRS1(VALUE,FS,CS,SUBCOMP,REP,ESCAPE)
 .S HDR("PROCESSING ID")=$E($P(VALUE,"PROCESSING ID=",2),1)
 .S HDR("ACCEPT ACK TYPE")=$E($P(VALUE,"ACCEPT ACK TYPE=",2),1,2)
 .S HDR("APP ACK TYPE")=$E($P(VALUE,"APP ACK TYPE=",2),1,2)
 .S HDR("BATCH COMMENT")=$$DESCAPE^HLOPRS1($P(HDR(2),FS,5),FS,CS,SUBCOMP,REP,ESCAPE)
 .S HDR("BATCH CONTROL ID")=$P($P(HDR(2),FS,6),CS)
 .S HDR("REFERENCE BATCH CONTROL ID")=$P($P(HDR(2),FS,7),CS)
 .;
 Q 1
 ;
GET(SEG,FIELD,COMP,SUBCOMP,REP) ;
 ;This function gets a specified value from a segment that was parsed by
 ;$$NEXTSEG. The FIELD,COMP,SUBCOMP,REP parameters are optional - if not
 ;specified, they default to 1.
 ;  Example:
 ;    $$GET^HLOPRS(.SEG,1) will return the value of the first field, first
 ;  component, first subcomponent, in the first occurrence of field #1.  
 ;Input:
 ;SEG - (required, pass by reference) - this is the array where the parsed segment was placed by $$NEXTSEG
 ;FIELD - the sequence # of the field (optional, defaults to 1)
 ;COMP - the # of the component (optional, defaults to 1)
 ;SUBCOMP - the # of the subcomponent (optional, defaults to 1)
 ;REP - the occurrence# (optional, defaults to 1)  For a non-repeating field, the occurrence # need not be provided, because it would be 1.
 ;Output:
 ;  Function returns the requested value on success, "" if not valued.
 ;
 ;allow the segment type to be obtained via field #0 (shorthand)
 I $D(FIELD),$G(FIELD)=0 Q $G(SEG("SEGMENT TYPE"))
 S:'$G(FIELD) FIELD=1
 ;
 ;for MSH or BHS, SEQ#1 is the  field separator
 I FIELD=1,$G(SEG("SEGMENT TYPE"))="MSH"!($G(SEG("SEGMENT TYPE"))="BHS"),$G(REP)<2,$G(COMP)<2,$G(SUBCOMP)<2 Q SEG("FIELD SEPARATOR")
 I FIELD=1,$G(SEG("SEGMENT TYPE"))="MSH"!($G(SEG("SEGMENT TYPE"))="BHS") Q ""
 ;
 ;For segments other than MSH or BHS, the first subscript in the SEG array needs to be incremented by 1, because SEG(1,1,1,1) is taken by the segment type, which technically isn't a field. (for convenience,we call it SEQ=0).  
 I $G(SEG("SEGMENT TYPE"))'="BHS",$G(SEG("SEGMENT TYPE"))'="MSH" S FIELD=FIELD+1
 S:'$G(COMP) COMP=1
 S:'$G(SUBCOMP) SUBCOMP=1
 S:'$G(REP) REP=1
 Q $G(SEG(FIELD,REP,COMP,SUBCOMP))
 ;
