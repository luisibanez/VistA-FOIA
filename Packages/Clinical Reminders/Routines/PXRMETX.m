PXRMETX ; SLC/PJH - Run Extract for QUERI ;01/19/2005
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
AUTO(ID) ;Called from option scheduling (#19.2)
 N IEN,LIST,LUVALUE,MODE,NEXT
 S LUVALUE(1)=ID
 D FIND^DIC(810.2,"","","U",.LUVALUE,"","","","","LIST")
 ;Get ien of extract parameter
 S IEN=$P(LIST("DILIST",2,1),U,1) Q:'IEN
 ;Get next extract period
 S NEXT=$P($G(^PXRM(810.2,IEN,0)),U,6) Q:NEXT=""
 ;Node is Extract and Transmit
 S MODE=0
 ;Run extract
 D RUN^PXRMETX(IEN,NEXT,MODE)
 ;Purge Extract Summary
 D PRGES
 ;Purge Patient Lists
 D PRGPL
 Q
 ;
CREX(NAME) ;Create extract summary entry
 N CNT,NEW
 S CNT=0,NEW=0
 ;If name exists concatenate count
 F  D  Q:NEW
 .I '$D(^PXRMXT(810.3,"B",NAME)) S NEW=1 Q
 .S CNT=CNT+1,NAME=$P(NAME,"/")_"/"_$$RJ^XLFSTR(CNT,2,0)
 ;Create new entry
 N FDA,FDAIEN,MSG
 S FDA(810.3,"+1,",.01)=NAME
 D UPDATE^DIE("","FDA","FDAIEN","MSG")
 ;Error
 I $D(MSG) Q 0
 ;Otherwise list ien
 Q FDAIEN(1)
 ;
MAIL(NAME,NEXT,MODE) ;Completion mail message
 N FREQ,TEXT
 S FREQ="year"
 I $E(NEXT)="M" S FREQ="month"
 I $E(NEXT)="Q" S FREQ="quarter"
 ;
 I MODE=0 S TEXT="Extract and Transmission"
 I MODE=1 S TEXT="Extract (No Transmission)"
 I MODE=2 S TEXT="Manual Extract and Transmission"
 I MODE=3 S TEXT="Manual Extract (No Transmission)"
 ;
 S TEXT=NAME_" "_TEXT_" completed for "_FREQ_" "_NEXT
 D MES^PXRMEUT(TEXT)
 Q
 ;
IHD ;Monthly IHD Extract from option PXRM EXTRACT VA-IHD QUERI
 D AUTO("VA-IHD QUERI")
 Q
 ;
MH ;Monthly MH Extract from option PXRM EXTRACT VA-MH QUERI
 D AUTO("VA-MH QUERI")
 Q
 ;
PRGES ;Delete any Extract Summaries over 5 years old
 N DIFF,EDATE,OLD
 S OLD=0
 F  S OLD=$O(^PXRMXT(810.3,OLD)) Q:'OLD  D
 .;Ignore EPI
 .I $E($G(^PXRMXT(810.3,OLD,0)),1,5)="LREPI" Q
 .;Extract Date
 .S EDATE=$P($G(^PXRMXT(810.3,OLD,0)),U,6)
 .;Ignore if < 5 years since creation
 .I $$FMDIFF^XLFDT(DT,EDATE,1)<(365*5) Q
 .;Otherwise delete
 .N DIK,DA
 .S DIK="^PXRMXT(810.3,",DA=OLD D ^DIK
 Q
 ;
PRGPL ;Delete any Patient Lists over 5 years old
 N LDATE,OLD
 S OLD=0
 F  S OLD=$O(^PXRMXP(810.5,OLD)) Q:'OLD  D
 .;Patient List Date
 .S LDATE=$P($G(^PXRMXP(810.5,OLD,0)),U,4)
 .;Ignore if < 5 years since creation
 .I $$FMDIFF^XLFDT(DT,LDATE,1)<(365*5) Q
 .;Otherwise delete
 .N DIK,DA
 .S DIK="^PXRMXP(810.5,",DA=OLD D ^DIK
 Q
 ;
RUN(IEN,NEXT,MODE) ;Process extract parameter
 ;
 S BEG=$H
 ;
 ; IEN is ien of Extract Parameter
 ; NEXT is period to extract
 ; MODE = 0 is extract and transmission
 ; MODE = 1 is extract only
 ; MODE = 2 is manual extract and transmission (doesn't update 810.2)
 ; MODE = 3 is manual extract only (doesn't update 810.2)
 ;
 N CLASS,PXRMLIST,PXRMNODE,PXRMRULE,PXRMSTRT,PXRMXIEN,PATCREAT,XNAME
 ;Initialise
 K ^TMP("PXRMETX",$J),^TMP("PXRMETX1",$J)
 ;Workfile node for ^TMP
 S PXRMNODE="PXRMRULE"
 ;Get details from parameter file
 N DATA,LIST,NAME,PARTYPE,PERIOD,SNAME,TEXT,YEAR
 ;Get class from extract parameter
 S CLASS=$P($G(^PXRM(810.2,IEN,100)),U)
 ;Otherwise default to local
 I $G(CLASS)="" S CLASS="L"
 ;
 S DATA=$G(^PXRM(810.2,IEN,0))
 ;Determine Extract Name and period
 S NAME=$P(DATA,U),PARTYPE=$P(DATA,U,2)
 S YEAR=$P(NEXT,"/",2),PERIOD=$P(NEXT,"/")
 ;Calculate report period start and end dates
 D CALC^PXRMEUT(NEXT,.PXRMSTRT,.PXRMSTOP)
 ;Determine output name for patient list and extract summary
 S XNAME=NAME_" "_YEAR_" "_PERIOD
 ;Process (single) Denominator rule into patient list
 N SEQ,SUB
 S SEQ=""
 F  S SEQ=$O(^PXRM(810.2,IEN,10,"B",SEQ)) Q:'SEQ  D
 .S SUB=$O(^PXRM(810.2,IEN,10,"B",SEQ,"")) Q:'SUB
 .S DATA=$G(^PXRM(810.2,IEN,10,SUB,0)) Q:DATA=""
 .S PXRMRULE=$P(DATA,U,2) Q:'PXRMRULE
 .S LIST=$P(DATA,U,3) Q:LIST=""
 .I LIST["yyyy" S LIST=$P(LIST,"yyyy")_YEAR_$P(LIST,"yyyy",2)
 .I LIST["nn" S LIST=$P(LIST,"nn")_$E(PERIOD,2,10)_$P(LIST,"nn",2)
 .;Create new patient list
 .S PATCREAT="Y",PXRMLIST=$$CRLST^PXRMRULE(LIST,CLASS) Q:'PXRMLIST
 .D START^PXRMRULE(PXRMRULE,PXRMLIST,PXRMNODE,PXRMSTRT,PXRMSTOP,IEN,YEAR,PERIOD)
 .;Clear ^TMP lists created for rule
 .D CLEAR^PXRMRULE(PXRMRULE,PXRMNODE)
 .;Process reminders and finding rules
 .D REM^PXRMETXR(SUB,PXRMLIST,PXRMSTRT,PXRMSTOP,PARTYPE)
 ;
 ;Create extract summary entry
 S PXRMXIEN=$$CREX(XNAME) Q:'PXRMXIEN
 ;Update extract summary from ^TMP
 D UPDEX I $D(MSG) D MES^PXRMEUT(MSG) Q
 ;
 ;Transmit results
 I (MODE=0)!(MODE=2) D TRANS(PXRMXIEN)
 ;
 ;Update extract parameters
 I MODE<2 D UPDPAR
 ;
 ;Mail message that extract completed
 D MAIL(NAME,NEXT,MODE)
 ;
 ;Clear workfile
 K ^TMP("PXRMETX",$J),^TMP("PXRMETX1",$J)
 Q
 ;
TRANS(PXRMXIEN) ;Transmit HL7 messages
 N HL7ID,NAME,NEXT
 S HL7ID=""
 W !,"Transmitting HL7"
 D HL7^PXRM7API(PXRMXIEN,1,.HL7ID)
 H 2
 ;Lock extract summary
 D LOCK Q:$D(DUOUT)
 ;Update run information
 S NAME=$P($G(^PXRMXT(810.3,PXRMXIEN,0)),U)
 S NEXT=$P($G(^PXRMXT(810.3,PXRMXIEN,4)),U,3)
 W !,"Updating "_NAME
 S FDA(810.3,"?1,",.01)=NAME
 S FDA(810.36,"?+2,?1,",.01)=HL7ID
 S FDA(810.36,"?+2,?1,",.02)=$$NOW^XLFDT
 ;
 D UPDATE^DIE("","FDA","","MSG")
 ;Unlock extract summary
 D UNLOCK
 ;
 Q
 ;
UPDEX ;Update extract summary
 N CNT,DA,DFN,DIK,DUOUT,MSG,NAME,SUB,TEMP
 ;Lock extract summary
 D LOCK Q:$D(DUOUT)
 ;
 ;Clear existing records
 S SUB=0
 F  S SUB=$O(^PXRMXT(810.3,PXRMXIEN,3,SUB)) Q:'SUB  D
 .S DA=SUB,DA(1)=PXRMXIEN,DIK="^PXRMXP(810.3,"_DA(1)_",30,"
 .D ^DIK
 ;
 ;Merge ^TMP into extract summary
 S NAME=$P($G(^PXRMXT(810.3,PXRMXIEN,0)),U)
 ;FDA array
 K ^TMP("PXRMFDA",$J)
 S TEMP="^TMP(""PXRMFDA"","_$J_")"
 ;
 ;Update run information
 S @TEMP@(810.3,"?1,",.01)=NAME
 S @TEMP@(810.3,"?1,",.02)=PXRMSTRT
 S @TEMP@(810.3,"?1,",.03)=PXRMSTOP
 S @TEMP@(810.3,"?1,",.06)=$$NOW^XLFDT
 S @TEMP@(810.3,"?1,",1)=IEN
 S @TEMP@(810.3,"?1,",2)=PARTYPE
 S @TEMP@(810.3,"?1,",3)=$E(PERIOD,2,99)
 S @TEMP@(810.3,"?1,",4)=YEAR
 S @TEMP@(810.3,"?1,",5)=$S(MODE<2:"A",1:"M")
 S @TEMP@(810.3,"?1,",7)=$E(PERIOD)
 ;
 ;Update totals section
 N APPL,DUE,DATA,ETYP,EVAL
 N FAPPL,FCNT,FDATA,FDUE,FEVAL,FGNAM,FGSTA,FIND,FNAPPL,FNDUE,FSEQ
 N GDATA,GSEQ,INST,NAPPL,NDUE,PXRMLIST,RCNT,RIEN,RSEQ,SEQ
 S SEQ=0,CNT=1
 F  S SEQ=$O(^TMP("PXRMETX",$J,SEQ)) Q:'SEQ  D
 .S INST=0,RSEQ=0
 .F  S INST=$O(^TMP("PXRMETX",$J,SEQ,INST)) Q:'INST  D
 ..S RCNT=""
 ..F  S RCNT=$O(^TMP("PXRMETX",$J,SEQ,INST,RCNT)) Q:RCNT=""  D
 ...S DATA=$G(^TMP("PXRMETX",$J,SEQ,INST,RCNT)) Q:'DATA
 ...S RIEN=$P(DATA,U)
 ...S EVAL=$P(DATA,U,2),APPL=$P(DATA,U,3),NAPPL=$P(DATA,U,4)
 ...S DUE=$P(DATA,U,5),NDUE=$P(DATA,U,6),PXRMLIST=$P(DATA,U,7)
 ...S CNT=CNT+1,RSEQ=RSEQ+1
 ...S @TEMP@(810.33,"?+"_CNT_",?1,",.01)=$$RJ^XLFSTR(RSEQ,3,0)
 ...S @TEMP@(810.33,"?+"_CNT_",?1,",.02)=RIEN
 ...S @TEMP@(810.33,"?+"_CNT_",?1,",.03)=INST
 ...S @TEMP@(810.33,"?+"_CNT_",?1,",.04)=PXRMLIST
 ...S @TEMP@(810.33,"?+"_CNT_",?1,",2)=EVAL
 ...S @TEMP@(810.33,"?+"_CNT_",?1,",3)=APPL
 ...S @TEMP@(810.33,"?+"_CNT_",?1,",4)=NAPPL
 ...S @TEMP@(810.33,"?+"_CNT_",?1,",5)=DUE
 ...S @TEMP@(810.33,"?+"_CNT_",?1,",6)=NDUE
 ...;For each count type
 ...S GSEQ="",FCNT=CNT
 ...F  S GSEQ=$O(^TMP("PXRMETX1",$J,SEQ,RCNT,GSEQ)) Q:GSEQ=""  D
 ....S GDATA=$G(^TMP("PXRMETX1",$J,SEQ,RCNT,GSEQ))
 ....S FGNAM=$P(GDATA,U),ETYP=$P(GDATA,U,2),FGSTA=$P(GDATA,U,3)
 ....;For each term
 ....S FSEQ=0
 ....F  S FSEQ=$O(^TMP("PXRMETX1",$J,SEQ,RCNT,GSEQ,FSEQ)) Q:FSEQ=""  D
 .....;Get the term ien
 .....S FIND=$P($G(^TMP("PXRMETX1",$J,SEQ,RCNT,GSEQ,FSEQ)),U),FCNT=FCNT+1
 .....;Update finding totals
 .....S FDATA=$G(^TMP("PXRMETX",$J,SEQ,INST,RCNT,GSEQ,FSEQ))
 .....S FEVAL=$P(FDATA,U,2),FAPPL=$P(FDATA,U,3),FNAPPL=$P(FDATA,U,4)
 .....S FDUE=$P(FDATA,U,5),FNDUE=$P(FDATA,U,6)
 .....S @TEMP@(810.331,"?+"_FCNT_",?+"_CNT_",?1,",.01)=$$RJ^XLFSTR(FSEQ,3,0)
 .....S @TEMP@(810.331,"?+"_FCNT_",?+"_CNT_",?1,",.02)=$P(FIND,";")
 .....S @TEMP@(810.331,"?+"_FCNT_",?+"_CNT_",?1,",.03)=ETYP
 .....S @TEMP@(810.331,"?+"_FCNT_",?+"_CNT_",?1,",.04)=FGNAM
 .....S @TEMP@(810.331,"?+"_FCNT_",?+"_CNT_",?1,",.05)=FGSTA
 .....S @TEMP@(810.331,"?+"_FCNT_",?+"_CNT_",?1,",1)=FEVAL
 .....S @TEMP@(810.331,"?+"_FCNT_",?+"_CNT_",?1,",2)=FAPPL
 .....S @TEMP@(810.331,"?+"_FCNT_",?+"_CNT_",?1,",3)=FNAPPL
 .....S @TEMP@(810.331,"?+"_FCNT_",?+"_CNT_",?1,",4)=FDUE
 .....S @TEMP@(810.331,"?+"_FCNT_",?+"_CNT_",?1,",5)=FNDUE
 ...;Update CNT
 ...S CNT=FCNT
 ;Book mark - needs error trap
 D UPDATE^DIE("",TEMP,"","MSG")
 ;Unlock extract summary
 D UNLOCK
 ;Clear FDA array
 K ^TMP("PXRMFDA",$J)
 Q
 ;
 ;File locking
UNLOCK L -^PXRMXT(810.3,PXRMXIEN) Q
LOCK L +^PXRMXT(810.3,PXRMXIEN):0
 E  W !!?5,"Another user is using this extract summary" S DUOUT=1
 ;BOOKMARK - needs to go in background
 Q
 ;
UPDPAR ;Update parameters when run complete
 N DATA,LAST,NEXT,PERIOD,TYPE,YEAR
 S DATA=$G(^PXRM(810.2,IEN,0)),NEXT=$P(DATA,U,6),TYPE=$P(DATA,U,3)
 ;Last run updated
 S LAST=NEXT
 ;Calculate next run
 I TYPE="Y" S NEXT=NEXT+1
 I "QM"[TYPE D
 .N NUM
 .S PERIOD=$P(NEXT,"/",1),YEAR=$P(NEXT,"/",2)
 .S NUM=$P(PERIOD,TYPE,2)+1
 .I TYPE="Q",NUM>4 S NUM=1,YEAR=YEAR+1
 .I TYPE="M",NUM>12 S NUM=1,YEAR=YEAR+1
 .S NEXT=TYPE_NUM_"/"_YEAR
 ;Update last and next run fields
 S $P(^PXRM(810.2,IEN,0),U,4,6)=LAST_U_$$NOW^XLFDT_U_NEXT
 Q
 ;
HELP(CALL) ;General help text routine
 N HTEXT
 ;
 I CALL=1 D
 .S HTEXT(1)="Enter 'Y' to overwrite this existing list. Enter 'N' to"
 .S HTEXT(2)="use a different patient list name."
 ;
 I CALL=3 D
 .S HTEXT(1)="Enter 'Y' to transmit extract. Otherwise enter 'N'."
 ;
 I CALL=4 D
 .S HTEXT(1)="The selected period is the same as next scheduled extract."
 .S HTEXT(2)="Enter 'Y' to if this extract will replace the scheduled"
 .S HTEXT(3)="extract. Enter 'N' if you still want the scheduled extract"
 .S HTEXT(3)="to run."
 ;
 D HELP^PXRMEUT(.HTEXT)
 Q
