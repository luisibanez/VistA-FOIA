PXRMRULE ; SLC/PJH - Build Patient list from Rule Set ;12/09/2003
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ; 
 ; Called from PXRM PATIENT LIST CREATE protocol
 ;
START(RULE,LIST,NODE,START,END,PAR,YEAR,PERIOD) ;Process rule set
 ;Clear ^TMP
 D CLEAR(RULE,NODE)
 ;
 N FRDATA,FRACT,FRIEN,FRLST,FRLIEN,FROUT,FRPAT,FRPERM,FRSTRT,FRTIEN,FRTYP
 N CLASS,INC,FSEQ,RRIEN,RSDATA,RSTART,RSTOP,SEQ,SUB
 ;Get class from extract parameter
 I PAR S CLASS=$P($G(^PXRM(810.2,PAR,100)),U)
 ;Otherwise default to local
 I $G(CLASS)="" S CLASS="L"
 ;Get each finding rule in sequence
 S SEQ="",INC=0
 F  S SEQ=$O(^PXRM(810.4,RULE,30,"B",SEQ)) Q:'SEQ  D
 .;Save first sequence as default
 .I INC=0 S INC=1,FSEQ=SEQ
 .;
 .S SUB=$O(^PXRM(810.4,RULE,30,"B",SEQ,"")) Q:'SUB
 .;
 .S RSDATA=$G(^PXRM(810.4,RULE,30,SUB,0)) Q:RSDATA=""
 .;Finding rule ien and action
 .S FRIEN=$P(RSDATA,U,2),FRACT=$P(RSDATA,U,3) Q:'FRIEN  Q:FRACT=""
 .;Check if entry is a finding rule (not a set or reminder rule)
 .S FRDATA=$G(^PXRM(810.4,FRIEN,0)),FRTYP=$P(FRDATA,U,3) Q:FRTYP=3
 .;Get term IEN f0r finding rule
 .I FRTYP=1 S FRTIEN=$P(FRDATA,U,7) Q:'FRTIEN
 .;Get Reminder defintion IEN for Reminder rule
 .I FRTYP=2 S RRIEN=$P(FRDATA,U,10) Q:'RRIEN
 .;Get Extract Patient List name for patient list rule
 .I FRTYP=5 S FRLST=$P($G(^PXRM(810.4,FRIEN,1)),U) Q:FRLST=""
 .;Get Finding rule start and stop
 .S RSTART=$P(FRDATA,U,4),RSTOP=$P(FRDATA,U,5)
 .;Convert RSTART to fileman
 .D DCONV(.RSTART,START)
 .;Convert RSTOP to fileman
 .D DCONV(.RSTOP,END)
 .;Get start sequence or start patient list
 .S FRSTRT=$P(RSDATA,U,4),FRPAT=$P(RSDATA,U,5)
 .;If sequence defined use it
 .I FRSTRT S FROUT=NODE_FRSTRT
 .;If neither exist use first as default
 .I FRSTRT="",FRPAT="" S FROUT=NODE_FSEQ
 .;If start is patient list load patient list into workfile
 .I FRSTRT="",FRPAT]"" S FROUT=NODE_SEQ D LOAD(FROUT,FRPAT)
 .;Name of permanent list
 .S FRPERM=$P(RSDATA,U,6)
 .;
 .;Build patient list in TMP
 .N DFN,FINDPA,PNODE,TLIST
 .S PNODE="PXRMEVAL"
 .K ^TMP($J,PNODE)
 .;Term finding rules
 .I FRTYP=1 D TERM(FRTIEN,RSTART,RSTOP)
 .;Reminder Definition List Rule
 .I FRTYP=2 D REM^PXRMRUL1(RRIEN,RSTART,RSTOP)
 .;Patient list finding rules
 .I FRTYP=5 D PATS(FRLST)
 .;Clear results file
 .K ^TMP($J,PNODE)
 .;
 .;Build permanent list if required
 .I FRPERM]"" D
 ..N FRPIEN
 ..;Get patient list IEN or create new patient list
 ..S FRPIEN=$$CRLST(FRPERM,CLASS) Q:'FRPIEN
 ..;Update patient list
 ..D UPDLST(FROUT,FRPIEN,PAR,RULE)
 ;
 ;Save final results to patient list
 I LIST'="" D UPDLST(FROUT,LIST,PAR,RULE)
 ;
EXIT Q
 ;
CLEAR(RULE,NODE) ;Clear workfile entries
 N SEQ
 S SEQ=""
 F  S SEQ=$O(^PXRM(810.4,RULE,30,"B",SEQ)) Q:'SEQ  D
 .K ^TMP($J,NODE_SEQ)
 ;clear FDA array
 K ^TMP($J,"PXRMFDA")
 Q
 ;
ASK(PLIEN,OPT) ;Verify patient list name
 N X,Y,TEXT
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="YA0"
 S DIR("A")=OPT_" patient list "_$P($G(^PXRMXP(810.5,PLIEN,0)),U)_"?: "
 S DIR("B")="N"
 S DIR("?")="Enter Y or N. For detailed help type ??"
 W !
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 I $E(Y(0))="N" S DUOUT=1 Q
 Q
 ;
COPY(IENO) ;Copy patient list
 ;
 ;Check if OK to copy
 D ASK(IENO,"Copy") Q:$D(DUOUT)!$D(DTOUT)
 ;
 N IENN,NNAME,ODATA,OEPIEN,ONAME,ORULE,TEXT,X,Y
 ;
 ;Select list to copy to
 S TEXT="Select PATIENT LIST name to copy to: "
 D PLIST^PXRMLCR(.IENN,TEXT,IENO) Q:$D(DUOUT)!$D(DTOUT)  Q:'IENN
 ;
 S NNAME=$P($G(^PXRMXP(810.5,IENN,0)),U)
 ;
 ;Get original Patient List record 
 S ODATA=$G(^PXRMXP(810.5,IENO,0))
 S ONAME=$P(ODATA,U),OEPIEN=$P(ODATA,U,5),ORULE=$P(ODATA,U,6)
 ;
 ;Load list into ^TMP
 K ^TMP($J,"PXRMRULE")
 D LOAD("PXRMRULE",IENO)
 ;Update new patient list
 K PATCREAT
 S PATCREAT="N"
 D ASK^PXRMXD(.PATCREAT,"Secure list?: ",2)
 D UPDLST("PXRMRULE",IENN,OEPIEN,ORULE)
 ;
 W !!,"Completed copy of '"_ONAME_"'"
 W !,"into '"_NNAME_"'",! H 2
 K ^TMP($J,"PXRMRULE")
 Q
 ;
CRLST(NAME,CLASS) ;Create new patient list
 N IEN
 ;Check if name exists
 S IEN=$O(^PXRMXP(810.5,"B",NAME,"")) I IEN Q IEN
 ;Otherwise create national entry
 N FDA,FDAIEN,MSG
 S FDA(810.5,"+1,",.01)=NAME
 S FDA(810.5,"+1,",100)=CLASS
 D UPDATE^DIE("","FDA","FDAIEN","MSG")
 ;Error
 I $D(MSG) Q 0
 ;Otherwise list ien
 Q FDAIEN(1)
 ;
DCONV(FIELD,PXRMDATE) ;Convert Dates
 ;Field is null - use report start or stop as default
 I FIELD="" S FIELD=PXRMDATE Q
 ;Convert T to Report date
 S FIELD=$$CTFMD^PXRMDATE(FIELD)
 Q
 ;
DELETE(LIST) ;Delete Patient list
 I '$$VEDIT^PXRMUTIL("^PXRMXP(810.5,",LIST) D  Q
 .W !!,?5,"VA- and national class patient lists may not be deleted" H 2
 .S DUOUT=1
 ;
 ;Check if this is the right list
 D ASK(LIST,"Delete") Q:$D(DUOUT)!$D(DTOUT)
 ;
 N DA,DIK,DUOUT
 ;Lock patient list
 D LOCK Q:$D(DUOUT)
 ;Kill List
 S DA=LIST,DIK="^PXRMXP(810.5,"
 D ^DIK
 ;Unlock patient list
 D UNLOCK
 Q
 ;
INTR ;Input transform for #810.4 fields
 Q
 ;
LOAD(NODE,LIEN) ;Load Patient List
 ;
 N DATA,DFN,SUB
 S SUB=0
 F  S SUB=$O(^PXRMXP(810.5,LIEN,30,SUB)) Q:'SUB  D
 .S DATA=$G(^PXRMXP(810.5,LIEN,30,SUB,0)),DFN=$P(DATA,U) Q:'DFN
 .;Store the patient IEN and institution in ^TMP
 .S ^TMP($J,NODE,DFN)=$P(DATA,U,2)_U_$P($G(DATA),U,3)_U_$P($G(DATA),U,4)
 Q
 ;
PATS(LIST) ;Process Patient List finding rule
 ;
 N LIEN,LUVALUE
 ;Insert year and period into extract list name
 I YEAR]"",LIST["yyyy" S LIST=$P(LIST,"yyyy")_YEAR_$P(LIST,"yyyy",2)
 I PERIOD]"",LIST["nn" S LIST=$P(LIST,"nn")_$E(PERIOD,2,10)_$P(LIST,"nn",2)
 ;
 S LUVALUE(1)=LIST
 S LIEN=+$$FIND1^DIC(810.5,"","KUX",.LUVALUE) Q:'LIEN
 ;
 ;
 ;Add operation Load list
 I FRACT="A" D LOAD(FROUT,LIEN) Q
 ;
 ;Remove, Select or Add Findings operations
 I FRACT'="A" D  Q
 .;Load List
 .D LOAD(PNODE,LIEN)
 .;Check each patient
 .S DFN=0
 .F  S DFN=$O(^TMP($J,FROUT,DFN)) Q:'DFN  D
 ..;Delete any ^TMP patient in PLIST if action is remove
 ..I FRACT="R",$D(^TMP($J,PNODE,DFN)) K ^TMP($J,FROUT,DFN) Q
 ..;Delete any ^TMP patient not in PLIST if action is select
 ..I FRACT="S",'$D(^TMP($J,PNODE,DFN)) K ^TMP($J,FROUT,DFN)
 Q
 ;
INST(DFN,END,DEFAULT) ;Calculate primary facility for multi-facility site
 N INSTNUM,DATE
 ;Check PCMM
 S DATE=$S($G(PXRMDATE)'="":$P(PXRMDATE,"."),1:DT)
 S INSTNUM=$P($$INSTPCTM^SCAPMC(DFN,DATE),U,3) ;DBIA #1916
 ;If this fails default to site
 I INSTNUM="" S INSTNUM=+$P($$SITE^VASITE,U,3)
 Q INSTNUM
 ;
TERM(FRTIEN,RSTART,RSTOP) ;Process TERM finding rule
 ;
 N DEFINST,FINDPA,PLIST,PXRMDATE,TFIEV,TSUB
 ;
 ;Get term definition array
 D TERM^PXRMLDR(FRTIEN,.TLIST)
 ;Remove NOW from any term start date
 S TSUB=0
 F  S TSUB=$O(TLIST(20,TSUB)) Q:'TSUB  D
 .I $P($G(TLIST(20,TSUB,0)),U,8)="NOW" S $P(TLIST(20,TSUB,0),U,8)=""
 ;Modify start date to catch incomplete dates
 I $E(RSTART,6,7)="01" S RSTART=$E(RSTART,1,5)_"00"
 ;Include year only incomplete dates in January
 I $E(RSTART,4,5)="01" S RSTART=$E(RSTART,1,3)_"0000"
 ;
 ;Set start and end dates
 S $P(FINDPA(0),U,8)=RSTART,$P(FINDPA(0),U,11)=RSTOP,PXRMDATE=RSTOP
 ;
 ;If action is merge finding set default institution
 S DEFINST=""
 I FRACT="F" D
 .N INSTNUM
 .;Get site facility code
 .S INSTNUM=+$P($$SITE^VASITE,U,3) Q:'INSTNUM
 .;If not multi-division site us site facility code as default
 .I $P($G(^DIC(4,INSTNUM,"DIV")),U)'="Y" S DEFINST=INSTNUM
 ;
 ;Add operation
 I FRACT="A" D  Q
 .;Process term for date range
 .D EVALPL^PXRMTERM(.FINDPA,.TLIST,PNODE)
 .;Merge lists if operation is add
 .M ^TMP($J,FROUT)=^TMP($J,PNODE,1)
 ;Remove, Select or Add Findings operations
 S DFN=0
 F  S DFN=$O(^TMP($J,FROUT,DFN)) Q:'DFN  D
 .;Evaluate term
 .K TFIEV D EVALTERM^PXRMTERM(DFN,.FINDPA,.TLIST,.TFIEV)
 .;Delete any ^TMP patient in PLIST if action is remove
 .I FRACT="R",$$OK K ^TMP($J,FROUT,DFN) Q
 .;Delete any ^TMP patient not in PLIST if action is select
 .I FRACT="S",'$$OK K ^TMP($J,FROUT,DFN) Q
 .I FRACT="F" D  Q
 ..;Calculate primary facility
 ..S $P(^TMP($J,FROUT,DFN),U)=$S(DEFINST]"":DEFINST,1:$$INST(DFN,RSTOP))
 Q
 ;
OK() N SUB,FOUND
 S FOUND=0,SUB=0
 F  S SUB=$O(TFIEV(SUB)) Q:'SUB  D  Q:FOUND
 .I TFIEV(SUB)=1 S FOUND=1
 Q FOUND
 ;
UPDLST(NODE,LIST,EPIEN,RULE) ;Update patient list
 N CNT,DA,DFN,DIK,DUOUT,FDA,INST,MSG,NAME,SUB,TEMP
 N DUE,LAST,ONODE
 ;Lock patient list
 D LOCK Q:$D(DUOUT)
 ;
 ;Clear existing list
 S SUB=0
 F  S SUB=$O(^PXRMXP(810.5,LIST,30,SUB)) Q:'SUB  D
 .S DA=SUB,DA(1)=LIST,DIK="^PXRMXP(810.5,"_DA(1)_",30,"
 .D ^DIK
 ;
 S NAME=$P($G(^PXRMXP(810.5,LIST,0)),U)
 ;
 ;Merge ^TMP into Patient List
 S DFN=0,CNT=0
 F  S DFN=$O(^TMP($J,NODE,DFN)) Q:'DFN  D
 .S ONODE=$G(^TMP($J,NODE,DFN))
 .S INST=$P($G(ONODE),U),DUE=$P($G(ONODE),U,2),LAST=$P($G(ONODE),U,3)
 .S CNT=CNT+1,^PXRMXP(810.5,LIST,30,CNT,0)=DFN_U_INST_U_DUE_U_LAST
 ;
 S ^PXRMXP(810.5,LIST,30,0)=U_"810.53P"_U_CNT_U_CNT
 ;Re-index
 N DIK,DA S DIK="^PXRMXP(810.5,",DA=LIST
 D IX^DIK
 ;
 ;Update header info
 K ^TMP("PXRMFDA",$J)
 S ^TMP("PXRMFDA",$J,810.5,"?+1,",.01)=NAME
 S ^TMP("PXRMFDA",$J,810.5,"?+1,",.04)=$$NOW^XLFDT
 S ^TMP("PXRMFDA",$J,810.5,"?+1,",.05)=EPIEN
 S ^TMP("PXRMFDA",$J,810.5,"?+1,",.06)=RULE
 I PATCREAT="Y" S ^TMP("PXRMFDA",$J,810.5,"?+1,",.07)=$G(DUZ) K PATCREAT
 S TEMP="^TMP(""PXRMFDA"","_$J_")"
 D UPDATE^DIE("",TEMP,"","MSG")
 ;Error
 I $D(MSG) D ERR
 ;Unlock patient list
 D UNLOCK
 ;Clear FDA array
 K ^TMP("PXRMFDA",$J)
 Q
 ;
UNLOCK L -^PXRMXP(810.5,LIST) Q
LOCK L +^PXRMXP(810.5,LIST):0
 E  W !!?5,"Another user is using this patient list" S DUOUT=1
 Q
 ;
ERR ;Error Handler
 N ERROR,IC,REF
 S ERROR(1)="Unable to build patient list : "
 S ERROR(2)=NAME
 S ERROR(3)="Error in UPDATE^DIE, needs further investigation"
 ; Move MSG into Error
 S REF="MSG"
 F IC=4:1 S REF=$Q(@REF) Q:REF=""  S ERROR(IC)=REF_"="_@REF
 ;Screen message
 D BMES^XPDUTL(.ERROR)
 Q
