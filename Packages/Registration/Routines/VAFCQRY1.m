VAFCQRY1 ;BIR/DLR-Query for patient demographics ;10/30/02  13:58
 ;;5.3;Registration;**428,474,477,575,627,648,698,711**;Aug 13, 1993
 ;
 ;Reference to $$GETDFNS^MPIF002 supported by IA #3634
 ;Reference to $$CHECKDG^MPIFSPC supported by IA #3158
 ;
BLDPID(DFN,CNT,SEQ,PID,HL,ERR)  ;build PID from File #2
 ; Variable list
 ;  DFN - internal PATIENT (#2) number
 ;  CNT - value to be place in PID seq#1 (SET ID)
 ;  SEQ - variable consisting of sequence numbers delimited by commas
 ;        that will be used to build the message (default is ALL)
 ;  PID (passed by reference) - array location to place PID segment
 ;        result, the array can have existing values when passed.
 ;   HL - array that contains the necessary HL variables (init^hlsub)
 ;  ERR - array that is used to return an error
 N VAFCMN,VAFCMMN,SITE,VAFCZN,SSN,SITE,APID,HIST,HISTDT,VAFCHMN,NXT,NXTC,COMP,REP,SUBCOMP,STATE,CITY,CLAIM,HLECH,HLFS,HLQ,STATEIEN,SARY,LVL,LNGTH,X
 I '$D(SEQ) S SEQ="ALL"
 I SEQ="" S SEQ="ALL"
 I SEQ'="ALL" N POS,EN S POS=1 F  S EN=$P(SEQ,",",POS) Q:EN=""  S SARY(EN)="",POS=POS+1
 ; setting up temp array to hold fields to be included in message
 S HLECH=HL("ECH"),HLFS=HL("FS"),HLQ=HL("Q"),(COMP,HL("COMP"))=$E(HL("ECH"),1)
 S (SUBCOMP,HL("SUBCOMP"))=$E(HL("ECH"),4),(REP,HL("REP"))=$E(HL("ECH"),2),HLES=$E(HL("ECH"),3)
 ;get Patient File MPI node
 S VAFCMN=$$MPINODE^MPIFAPI(DFN)
 I +VAFCMN<0 S VAFCMN=""
 S VAFCZN=^DPT(DFN,0),SSN=$P(^DPT(DFN,0),"^",9),SITE=$$SITE^VASITE
 N TMP F TMP=1:1:31 S APID(TMP)=""
 S APID(2)=CNT
 ;repeat patient ID list including ICN (NI),SSN (SS),CLAIM# (PN) AND DFN (PI)
 I $D(SARY(3))!(SEQ="ALL") D
 .S APID(4)=""
 .;National Identifier (ICN)
 .I VAFCMN'="" I +VAFCMN>0 S APID(4)=$P(VAFCMN,"^")_"V"_$P(VAFCMN,"^",2)_COMP_COMP_COMP_"USVHA"_SUBCOMP_SUBCOMP_"0363"_COMP_"NI"_COMP_"VA FACILITY ID"_SUBCOMP_$$STA^XUAF4(+SITE)_SUBCOMP_"L" D
 ..;Assumption that if this is a local ICN at this point send the message with an expiration date of today, so that it will be treated as a deprecated ID and stored on the MPI as such
 ..I $E($P(VAFCMN,"^"),1,3)=$P($$SITE^VASITE,"^",3) S APID(4)=APID(4)_COMP_COMP_$$HLDATE^HLFNC(DT)
 .I $G(SSN)'="" S APID(4)=APID(4)_$S(APID(4)'="":REP,1:"")_SSN_COMP_COMP_COMP_"USSSA"_SUBCOMP_SUBCOMP_"0363"_COMP_"SS"_COMP_"VA FACILITY ID"_SUBCOMP_$$STA^XUAF4(+SITE)_SUBCOMP_"L"
 .I $G(DFN)'="" S APID(4)=APID(4)_$S(APID(4)'="":REP,1:"")_DFN_COMP_COMP_COMP_"USVHA"_SUBCOMP_SUBCOMP_"0363"_COMP_"PI"_COMP_"VA FACILITY ID"_SUBCOMP_$$STA^XUAF4(+SITE)_SUBCOMP_"L" D
 ..;CLAIM#
 ..I $D(^DPT(DFN,.31)) S CLAIM=$P(^DPT(DFN,.31),"^",3) I +CLAIM>0 S APID(4)=APID(4)_REP_CLAIM_COMP_COMP_COMP_"USVBA"_SUBCOMP_SUBCOMP_"0363"_COMP_"PN"_COMP_"VA FACILITY ID"_SUBCOMP_$$STA^XUAF4(+SITE)_SUBCOMP_"L"
 .N MPIFHIS D GETICNH^VAFCHIS(DFN,.MPIFHIS) I +MPIFHIS=1 N HIST S NXTC=0,LVL=0,HIST=0  F  S HIST=$O(MPIFHIS(HIST)) Q:'HIST  D
 ..I APID(4)'="" D
 ...;**648 only send date not time
 ...S NXT=$P(MPIFHIS(HIST),"^")_COMP_COMP_COMP_"USVHA"_SUBCOMP_SUBCOMP_"0363"_COMP_"NI"_COMP_"VA FACILITY ID"_SUBCOMP_$$STA^XUAF4(+SITE)_SUBCOMP_"L"_COMP_COMP_$$HLDATE^HLFNC($P(MPIFHIS(HIST),"^",2),"DT")
 ...I LVL=0 D
 ....I $L(APID(4)_NXT)'>244 S APID(4)=APID(4)_REP_NXT Q
 ....I $L(APID(4)_NXT)>244 S LVL=1 S LNGTH=244-$L(APID(4)),APID(4)=APID(4)_REP_$E(NXT,1,LNGTH) S LNGTH=LNGTH+1,NXT=$E(NXT,LNGTH,$L(NXT)),NXTC=1
 ...I LVL>0 D
 ....I $L($G(APID(4,LVL))_NXT)'>245 S APID(4,LVL)=$G(APID(4,LVL))_$S(NXTC=0:REP,1:"")_NXT Q
 ....I $L($G(APID(4,LVL))_NXT)>245 S LNGTH=244-$L(APID(4,LVL)),APID(4,LVL)=APID(4,LVL)_REP_$E(NXT,1,LNGTH) S LNGTH=LNGTH+1,NXT=$E(NXT,LNGTH,$L(NXT)) S LVL=LVL+1 S APID(4,LVL)=NXT
 ..I NXTC=1 S NXTC=0
 ..I APID(4)="" S APID(4)=$P(VAFCHMN,"^")_COMP_COMP_COMP_"USVHA"_SUBCOMP_SUBCOMP_"0363"_COMP_"NI"_COMP_"VA FACILITY ID"_SUBCOMP_$$STA^XUAF4(+SITE)_SUBCOMP_"L"_COMP_COMP_$$HLDATE^HLFNC(HISTDT)
NAMEPID ;patient name (last^first^middle^suffix^prefix^^"L" for legal)
 I $D(SARY(5))!(SEQ="ALL") D
 .;**711 code REMOVED PREFIX due to issues with existing PATIENT Name Standardization functionality
 .N X S X=$P(VAFCZN,"^") D NAME^VAFCPID2(DFN,.X) S APID(6)=$$HLNAME^XLFNAME(X,"",$E(HL("ECH"),1)) I $P(APID(6),$E(HL("ECH"),1),7)'="L" S $P(APID(6),$E(HL("ECH"),1),7)="L"
ALIAS .;patient alias (last^first^middle^suffice^prefix^^"A" for alias - can be multiple)
 .N VAFCA1,ALIAS,ALIEN,LVL6 D GETS^DIQ(2,DFN_",","1*","E","VAFCA1") S LVL6=0
 .I $D(VAFCA1) S:APID(6)'="" APID(6)=APID(6)_REP S ALIEN=0 F  S ALIEN=$O(VAFCA1(2.01,ALIEN)) Q:'ALIEN  D
 ..N ALIASN,ALIAS S ALIASN=VAFCA1("2.01",ALIEN,".01","E") S ALIAS=$$HLNAME^XLFNAME(ALIASN,"",$E(HL("ECH"),1))
 ..Q:ALIAS=""
 ..S $P(ALIAS,$E(HL("ECH"),1),7)="A"
 ..I $L(APID(6)_ALIAS)>244 S LVL6=1
 .. I LVL6=0 D
 ... I $L(APID(6)_ALIAS)'>244 S APID(6)=APID(6)_ALIAS_REP Q
 ... I $L(APID(6)_ALIAS)>244 S LVL6=1
 ..I LVL6>0 D
 ...I $L($G(APID(6,LVL6))_ALIAS)'>245 S APID(6,LVL6)=$G(APID(6,LVL6))_ALIAS_REP Q
 ...I $L($G(APID(6,LVL6))_ALIAS)>245 S LVL6=LVL6+1,APID(6,LVL6)=ALIAS_REP
 .I APID(6)="" S APID(6)=HL("Q")
MOTHER ;mother's maiden name  (last^first^middle^suffix^prefix^^"M" for maiden name)
 I $D(SARY(6))!(SEQ="ALL") D
 .S APID(7)=HL("Q")
 .I $D(^DPT(DFN,.24)) S VAFCMMN=$P(^DPT(DFN,.24),"^",3) D
 ..S APID(7)=$$HLNAME^XLFNAME(VAFCMMN,"",$E(HL("ECH"),1)) I APID(7)="" S APID(7)=HL("Q")
 ..I $P(APID(7),$E(HL("ECH"),1),7)'="M" S $P(APID(7),$E(HL("ECH"),1),7)="M"
 .I APID(7)="" S APID(7)=HL("Q")
 I $D(SARY(7))!(SEQ="ALL") S APID(8)=$$HLDATE^HLFNC($P(VAFCZN,"^",3)) I APID(8)="" S APID(8)=HL("Q") ;date/time of birth
 I $D(SARY(8))!(SEQ="ALL") S APID(9)=$P(VAFCZN,"^",2) I APID(9)="" S APID(9)=HL("Q") ;sex
 ;place of birth city and state
ADDR ;
 I $D(SARY(11))!(SEQ="ALL") S APID(12)="" D
 .I $D(^DPT(DFN,0)) D
 ..;address info
 ..S HL7STRG=$$GET1^DIQ(2,DFN_",",.111) D HL7TXT(.HL7STRG,.HL,HLES)
 ..S $P(APID(12),COMP)=HL7STRG I $P(APID(12),COMP)="" S $P(APID(12),COMP)=HL("Q")
 ..K HL7STRG S HL7STRG=$$GET1^DIQ(2,DFN_",",.112) D HL7TXT(.HL7STRG,.HL,HLES) ;**698 add HL7TXT call
 ..S $P(APID(12),COMP,2)=HL7STRG I $P(APID(12),COMP,2)="" S $P(APID(12),COMP,2)=HL("Q")
 ..K HL7STRG S HL7STRG=$$GET1^DIQ(2,DFN_",",.113) D HL7TXT(.HL7STRG,.HL,HLES) ;**698 add HL7TXT call
 ..S $P(APID(12),COMP,8)=HL7STRG I $P(APID(12),COMP,8)="" S $P(APID(12),COMP,8)=HL("Q")
 ..K HL7STRG
 ..S HL7STRG=$$GET1^DIQ(2,DFN_",",.114) D HL7TXT(.HL7STRG,.HL,HLES) S $P(APID(12),COMP,3)=HL7STRG
 ..I $P(APID(12),COMP,3)="" S $P(APID(12),COMP,3)=HL("Q")
 ..S STATEIEN=$$GET1^DIQ(2,DFN_",",.115,"I") S STATE=$$GET1^DIQ(5,+STATEIEN_",",1) S $P(APID(12),COMP,4)=$G(STATE) I $P(APID(12),COMP,4)="" S $P(APID(12),COMP,4)=HL("Q")
 ..S $P(APID(12),COMP,5)=$$GET1^DIQ(2,DFN_",",.1112) I $P(APID(12),COMP,5)="" S $P(APID(12),COMP,5)=HL("Q")
 ..S $P(APID(12),COMP,7)="P"
 ..; **648 add COUNTY Code to PID-11, retained in PID-12 also
 ..N COUNTY S COUNTY=$$GET1^DIQ(2,DFN_",",.117) I COUNTY="" S COUNTY=HL("Q")
 ..S $P(APID(12),COMP,9)=COUNTY ;county code
 ..;place of birth information
 ..S CITY=$$GET1^DIQ(2,DFN_",",.092) S HL7STRG=CITY D HL7TXT(.HL7STRG,.HL,HLES) S CITY=HL7STRG D
 ...N X
 ...I $G(CITY)'="" S $P(X,COMP,3)=CITY
 ...I $G(CITY)="" S $P(X,COMP,3)=HL("Q")
 ...S STATEIEN=$$GET1^DIQ(2,DFN_",",.093,"I") S STATE=$$GET1^DIQ(5,+STATEIEN_",",1) D
 ....I $G(STATE)'="" S $P(X,COMP,4)=STATE
 ....I $G(STATE)="" S $P(X,COMP,4)=HL("Q")
 ... S $P(X,COMP,7)="N",APID(12)=$G(APID(12))_REP_X
 I $D(SARY(12))!(SEQ="ALL") S APID(13)=$$GET1^DIQ(2,DFN_",",.117) I APID(13)="" S APID(13)=HL("Q")  ;county code **648 backwards compatibility only
 I $D(SARY(13))!($D(SARY(14)))!(SEQ="ALL") N PHONEN,HNUM,WNUM S PHONEN=$G(^DPT(DFN,.13)) S HNUM=$P(PHONEN,"^",1),WNUM=$P(PHONEN,"^",2)
 I $D(SARY(13))!(SEQ="ALL") S APID(14)=$$HLPHONE^HLFNC(HNUM) S HL7STRG=APID(14) D HL7TXT(.HL7STRG,.HL,HLES) S APID(14)=HL7STRG I APID(14)="" S APID(14)=HL("Q")
 I $D(SARY(14))!(SEQ="ALL") S APID(15)=$$HLPHONE^HLFNC(WNUM) S HL7STRG=APID(15) D HL7TXT(.HL7STRG,.HL,HLES) S APID(15)=HL7STRG I APID(15)="" S APID(15)=HL("Q")
 I $D(SARY(19))!(SEQ="ALL") S APID(20)=SSN  ;ssn passed in PID-3
 I $D(SARY(23))!(SEQ="ALL") D
 .S CITY=$$GET1^DIQ(2,DFN_",",.092) S HL7STRG=CITY D HL7TXT(.HL7STRG,.HL,HLES) S CITY=HL7STRG
 .S STATEIEN=$$GET1^DIQ(2,DFN_",",.093,"I") S STATE=$$GET1^DIQ(5,+STATEIEN_",",1) D
 .I CITY'=""&(STATE'="") S APID(24)=CITY_" "_STATE  ;place of birth (not used) use PID-11 with an 'N' instead
 .I CITY=""&(STATE="") S APID(24)=HL("Q")
 ;list of fields used for backwards compatibility with HDR
 I $D(SARY(2))!(SEQ="ALL") S APID(3)=$P(VAFCMN,"^")_"V"_$P(VAFCMN,"^",2)  ;Patient ID
 D CONT^VAFCQRY3(DFN,.APID,.PID,.HL,.SARY,SEQ,.ERR,REP,COMP)
 D KVA^VADPT
 Q
HL7TXT(HL7STRG,HL,HLES) ; Replace occurrences of embedded HL7 delimiters with
 ; HL7 escape sequence
 ; Inputs: HL7STRG - Data string to be checked
 ;         HL("ECH") - HL7 delimiter string
 ; Output: HL7XTRG - Data string with escape sequence added (if needed)
 ;
 N OCHR,RCHR,RCHRI,TYPE,I
 ; Set HL7 escape char
 I $G(HL("COMP"))="" S HL("COMP")=$G(COMP),HL("REP")=REP,HL("SUBCOMP")=SUBCOMP
 S HLES2=HLES_HL("FS")_HL("COMP")_HL("REP")_HL("SUBCOMP")
 ; Search for occurrence of each delimiter and replace it with "\<type>\"
 F TYPE="E","F","C","R","S" D
 .S RCHRI=$S(TYPE="E":1,TYPE="F":2,TYPE="C":3,TYPE="R":4,TYPE="S":5)
 .;
 .; OCHR=original char, RCHR=replacement char
 .S OCHR=$E(HLES2,RCHRI),RCHR=$E("EFSRT",RCHRI) Q:'$F(HL7STRG,OCHR)
 .F I=1:1 Q:$E(HL7STRG,I)=""  I $E(HL7STRG,I)=OCHR S HL7STRG=$E(HL7STRG,1,I-1)_HLES_RCHR_HLES_$E(HL7STRG,I+1,999),I=I+2
 Q
 Q
