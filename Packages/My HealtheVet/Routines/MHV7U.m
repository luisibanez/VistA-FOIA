MHV7U ;WAS/GPM - HL7 UTILITIES ; [8/22/05 6:09pm]
 ;;1.0;My HealtheVet;;Aug 23, 2005
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 ;
 ;This routine contains generic utilities used when building
 ;or processing HL7 messages.
 ;
 Q  ;Direct entry not supported
 ;
LOADMSG(MSGROOT) ; Load HL7 message into temporary global for processing
 ;
 ;This subroutine assumes that all VistA HL7 environment variables are
 ;properly initialized and will produce a fatal error if they aren't.
 ;
 N CNT,SEG
 K @MSGROOT
 F SEG=1:1 X HLNEXT Q:HLQUIT'>0  D
 . S CNT=0
 . S @MSGROOT@(SEG,CNT)=HLNODE
 . F  S CNT=$O(HLNODE(CNT)) Q:'CNT  S @MSGROOT@(SEG,CNT)=HLNODE(CNT)
 Q
 ;
PARSEMSG(MSGROOT,HL) ; Message Parser
 ; Does not handle segments that span nodes
 ; Does not handle extremely long segments (uses a local)
 ; Does not handle long fields (segment parser doesn't)
 ;
 N SEG,CNT,DATA,MSG
 F CNT=1:1 Q:'$D(@MSGROOT@(CNT))  M SEG=@MSGROOT@(CNT) D
 . D PARSESEG(SEG(0),.DATA,.HL)
 . K @MSGROOT@(CNT)
 . I DATA(0)'="" M @MSGROOT@(CNT)=DATA
 . Q:'$D(SEG(1))
 . ;Add handler for segments that span nodes here.
 . Q
 Q
 ;
LOG(NAME,DATA,TYPE,NEW) ;
 Q:'$G(^XTMP("MHV7LOG"))
 N DTM,CNT
 I NEW D
 . S DTM=-$$NOW^XLFDT()
 . K ^TMP("MHV7LOG",DTM,$J)
 . S ^TMP("MHV7LOG",$J)=DTM
 . S CNT=1
 . S ^TMP("MHV7LOG",DTM,$J)=CNT
 E  D
 . S DTM=^TMP("MHV7LOG",$J)
 . S CNT=^TMP("MHV7LOG",DTM,$J)+1
 . S ^TMP("MHV7LOG",DTM,$J)=CNT
 ;
 I TYPE="S" S ^TMP("MHV7LOG",DTM,$J,CNT,NAME)=DATA Q
 I TYPE="M" M ^TMP("MHV7LOG",DTM,$J,CNT,NAME)=DATA Q
 I TYPE="I" M ^TMP("MHV7LOG",DTM,$J,CNT,NAME)=@DATA Q
 ;
 S ^TMP("MHV7LOG",DTM,$J)=CNT
 Q
 ;
TRIMSPC(STR) ;Trim leading and trailing spaces from a text string
 ;
 ;  Input:
 ;    STR - Text string
 ;
 ;  Output:
 ;   Function Value - Input text string with leading and trailing
 ;                    spaces removed
 ;
 N SPACE,POS,LEN
 S SPACE=$C(32)
 S LEN=$L(STR)
 S POS=1
 F  Q:$E(STR,POS)'=SPACE!(POS>LEN)  S POS=POS+1
 S STR=$E(STR,POS,LEN)
 S POS=$L(STR)
 F  Q:$E(STR,POS)'=SPACE!(POS<1)  S POS=POS-1
 S STR=$E(STR,1,POS)
 Q STR
 ;
PARSESEG(SEG,DATA,HL) ;Generic segment parser
 ;This procedure parses a single HL7 segment and builds an array
 ;subscripted by the field number containing the data for that field.
 ; Does not handle segments that span nodes
 ;
 ;  Input:
 ;     SEG - HL7 segment to parse
 ;      HL - HL7 environment array
 ;
 ;  Output:
 ;    Function value - field data array [SUB1:field, SUB2:repetition,
 ;                                SUB3:component, SUB4:sub-component] 
 ;
 N CMP     ;component subscript
 N CMPVAL  ;component value
 N FLD     ;field subscript
 N FLDVAL  ;field value
 N REP     ;repetition subscript
 N REPVAL  ;repetition value
 N SUB     ;sub-component subscript
 N SUBVAL  ;suc-component value
 N FS      ;field separator
 N CS      ;component separator
 N RS      ;repetition separator
 N SS      ;sub-component separator
 ;
 K DATA
 S FS=HL("FS")
 S CS=$E(HL("ECH"))
 S RS=$E(HL("ECH"),2)
 S SS=$E(HL("ECH"),4)
 ;
 S DATA(0)=$P(SEG,FS)
 S SEG=$P(SEG,FS,2,9999)
 F FLD=1:1:$L(SEG,FS) D
 . S FLDVAL=$P(SEG,FS,FLD)
 . F REP=1:1:$L(FLDVAL,RS) D
 . . S REPVAL=$P(FLDVAL,RS,REP)
 . . I REPVAL[CS F CMP=1:1:$L(REPVAL,CS) D
 . . . S CMPVAL=$P(REPVAL,CS,CMP)
 . . . I CMPVAL[SS F SUB=1:1:$L(CMPVAL,SS) D
 . . . . S SUBVAL=$P(CMPVAL,SS,SUB)
 . . . . I SUBVAL'="" S DATA(FLD,REP,CMP,SUB)=SUBVAL
 . . . I '$D(DATA(FLD,REP,CMP)),CMPVAL'="" S DATA(FLD,REP,CMP)=CMPVAL
 . . I '$D(DATA(FLD,REP)),REPVAL'="",FLDVAL[RS S DATA(FLD,REP)=REPVAL
 . I '$D(DATA(FLD)),FLDVAL'="" S DATA(FLD)=FLDVAL
 Q
 ;
BLDSEG(DATA,HL) ;generic segment builder
 ;
 ;  Input:
 ;    DATA - field data array [SUB1:field, SUB2:repetition,
 ;                             SUB3:component, SUB4:sub-component]
 ;     HL - HL7 environment array
 ;
 ;  Output:
 ;   Function Value - Formatted HL7 segment on success, "" on failure
 ;
 N CMP     ;component subscript
 N CMPVAL  ;component value
 N FLD     ;field subscript
 N FLDVAL  ;field value
 N REP     ;repetition subscript
 N REPVAL  ;repetition value
 N SUB     ;sub-component subscript
 N SUBVAL  ;suc-component value
 N FS      ;field separator
 N CS      ;component separator
 N RS      ;repetition separator
 N ES      ;escape character
 N SS      ;sub-component separator
 N SEG,SEP
 ;
 S FS=HL("FS")
 S CS=$E(HL("ECH"))
 S RS=$E(HL("ECH"),2)
 S ES=$E(HL("ECH"),3)
 S SS=$E(HL("ECH"),4)
 ;
 S SEG=$G(DATA(0))
 F FLD=1:1:$O(DATA(""),-1) D
 . S FLDVAL=$G(DATA(FLD)),SEP=FS
 . S SEG=SEG_SEP_FLDVAL
 . F REP=1:1:$O(DATA(FLD,""),-1)  D
 . . S REPVAL=$G(DATA(FLD,REP))
 . . S SEP=$S(REP=1:"",1:RS)
 . . S SEG=SEG_SEP_REPVAL
 . . F CMP=1:1:$O(DATA(FLD,REP,""),-1) D
 . . . S CMPVAL=$G(DATA(FLD,REP,CMP))
 . . . S SEP=$S(CMP=1:"",1:CS)
 . . . S SEG=SEG_SEP_CMPVAL
 . . . F SUB=1:1:$O(DATA(FLD,REP,CMP,""),-1) D
 . . . . S SUBVAL=$G(DATA(FLD,REP,CMP,SUB))
 . . . . S SEP=$S(SUB=1:"",1:SS)
 . . . . S SEG=SEG_SEP_SUBVAL
 Q SEG
 ;
BLDWPSEG(WP,SEG,MAXLEN,HL) ;
 ;Builds segment nodes to add word processing fields to a segment
 N CNT,LINE,LAST,FS,RS,LENGTH
 I MAXLEN<1 S MAXLEN=999999999999
 S FS=HL("FS")         ;field separator
 S RS=$E(HL("ECH"),2)  ;repeat separator
 S CNT=$O(SEG(""),-1)+1
 S LINE=$O(WP(0))
 S LENGTH=$L(LINE)
 S SEG(CNT)=""
 S SEG(CNT)=FS_$$ESCAPE($G(WP(LINE,0)),.HL)
 F  S LINE=$O(WP(LINE)) Q:LINE=""  D  Q:LENGTH'<MAXLEN
 . S LENGTH=LENGTH+$L(LINE)
 . I LENGTH'<MAXLEN S LINE=$E(LINE,1,$L(LINE)-(LENGTH-MAXLEN))
 . S LAST=$E(SEG(CNT),$L(SEG(CNT)))
 . S CNT=CNT+1
 . S SEG(CNT)=$$ESCAPE($G(WP(LINE,0)),.HL)
 . I $E(SEG(CNT))'=" ",LAST'=" " S SEG(CNT)=RS_SEG(CNT)
 . Q
 Q
 ;
ADD(VAL,SEP,SEG) ;append a value onto segment
 ;
 ;  Input:
 ;    VAL - value to append
 ;    SEP - HL7 separator
 ;
 ;  Output:
 ;    SEG - segment passed by reference
 ;
 S SEP=$G(SEP)
 S VAL=$G(VAL)
 ; Escape VAL??
 ; If exceed 512 characters don't add
 S SEG=SEG_SEP_VAL
 Q
 ;
ESCAPE(VAL,HL) ;Escape any special characters
 ; *** Does not handle long strings of special characters ***
 ;
 ;  Input:
 ;    VAL - value to escape
 ;     HL - HL7 environment array
 ;
 ;  Output:
 ;    VAL - passed by reference
 ;
 N FS      ;field separator
 N CS      ;component separator
 N RS      ;repetition separator
 N ES      ;escape character
 N SS      ;sub-component separator
 N L,STR,I
 ;
 S FS=HL("FS")
 S CS=$E(HL("ECH"))
 S RS=$E(HL("ECH"),2)
 S ES=$E(HL("ECH"),3)
 S SS=$E(HL("ECH"),4)
 ;
 I VAL[ES D
 . S L=$L(VAL,ES),STR=""
 . F I=1:1:L S $P(STR,ES_"E"_ES,I)=$P(VAL,ES,I)
 . S VAL=STR
 I VAL[FS D
 . S L=$L(VAL,FS),STR=""
 . F I=1:1:L S $P(STR,ES_"F"_ES,I)=$P(VAL,FS,I)
 . S VAL=STR
 I VAL[RS D
 . S L=$L(VAL,RS),STR=""
 . F I=1:1:L S $P(STR,ES_"R"_ES,I)=$P(VAL,RS,I)
 . S VAL=STR
 I VAL[CS D
 . S L=$L(VAL,CS),STR=""
 . F I=1:1:L S $P(STR,ES_"S"_ES,I)=$P(VAL,CS,I)
 . S VAL=STR
 I VAL[SS D
 . S L=$L(VAL,SS),STR=""
 . F I=1:1:L S $P(STR,ES_"T"_ES,I)=$P(VAL,SS,I)
 . S VAL=STR
 Q VAL
 ;
UNESC(VAL,HL) ;Reconstitute any escaped characters
 ;
 ;  Input:
 ;    VAL - Value to reconstitute
 ;     HL - HL7 environment array
 ;
 ;  Output:
 ;    VAL - passed by referenc
 ;
 N FS      ;field separator
 N CS      ;component separator
 N RS      ;repetition separator
 N ES      ;escape character
 N SS      ;sub-component separator
 N L,STR,I,FESC,CESC,RESC,EESC,SESC
 ;
 S FS=HL("FS")
 S CS=$E(HL("ECH"))
 S RS=$E(HL("ECH"),2)
 S ES=$E(HL("ECH"),3)
 S SS=$E(HL("ECH"),4)
 S FESC=ES_"F"_ES
 S CESC=ES_"S"_ES
 S RESC=ES_"R"_ES
 S EESC=ES_"E"_ES
 S SESC=ES_"T"_ES
 ;
 I VAL'[ES Q VAL
 I VAL[FESC D
 . S L=$L(VAL,FESC),STR=""
 . F I=1:1:L S $P(STR,FS,I)=$P(VAL,FESC,I)
 . S VAL=STR
 I VAL[CESC D
 . S L=$L(VAL,CESC),STR=""
 . F I=1:1:L S $P(STR,CS,I)=$P(VAL,CESC,I)
 . S VAL=STR
 I VAL[RESC D
 . S L=$L(VAL,RESC),STR=""
 . F I=1:1:L S $P(STR,RS,I)=$P(VAL,RESC,I)
 . S VAL=STR
 I VAL[SESC D
 . S L=$L(VAL,SESC),STR=""
 . F I=1:1:L S $P(STR,SS,I)=$P(VAL,SESC,I)
 . S VAL=STR
 I VAL[EESC D
 . S L=$L(VAL,EESC),STR=""
 . F I=1:1:L S $P(STR,ES,I)=$P(VAL,EESC,I)
 . S VAL=STR
 Q VAL
 ;
