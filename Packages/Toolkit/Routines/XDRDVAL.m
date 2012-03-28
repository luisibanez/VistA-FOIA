XDRDVAL ;CIOFO-SF.SEA/JLI - Check validity of data elements ;10/02/2000  08:00 [ 04/02/2003   8:47 AM ]
 ;;7.3;TOOLKIT;**23,32,51,1001,1003**;Apr 03, 1995
 ;IHS/OIT/LJF 11/30/2006 PATCH 1003 skipped check of DW Audit file
 ;;
 Q
 ;
DOENTRY(FILE,IEN,OUTROOT,HELP) ; ENTRY POINT TO PROCESS A SINGLE ENTRY
 ;N DATAROOT,MESGROOT,TEMPROOT,IENS,FIELD,X
 N ZTQUEUED ;S ZTQUEUED=1
 S DATAROOT=$NA(^TMP($J,"XDRDVAL","DATA"))
 S MESGROOT=$NA(^TMP($J,"XDRDVAL","MESG"))
 S TEMPROOT=$NA(^TMP($J,"XDRDVAL","TEMP"))
 K @DATAROOT,@MESGROOT,@TEMPROOT
 D DOGETS
 I $D(@TEMPROOT) D VALIDATE(TEMPROOT,$NA(@MESGROOT@(IEN,"VAL")))
 M @OUTROOT@(IEN)=@MESGROOT@(IEN)
 Q
DOGETS ;
 D GETS^DIQ(FILE,IEN,"**","EIN",DATAROOT,MESGROOT)
 ;I $D(@MESGROOT@("DIERR"))>1 M @OUTROOT@(FILE,IEN,"GET","DIERR")=@MESGROOT@("DIERR")
 K @MESGROOT
 F FILE=0:0 S FILE=$O(@DATAROOT@(FILE)) Q:FILE'>0  D
 . ;
 . I $$GET^XPAR("PKG","BPM USE IHS LOGIC"),(FILE=9000003.3) Q  ;DW Audit has special processing;IHS/OIT/LJF 11/30/2006 PATCH 1003
 . ;
 . S IENS="" F  S IENS=$O(@DATAROOT@(FILE,IENS)) Q:IENS=""  D
 . . F FIELD=0:0 S FIELD=$O(@DATAROOT@(FILE,IENS,FIELD)) Q:FIELD'>0  D
 . . . I FILE=70.03,FIELD=.01 Q  ; RADIOLOGY LOGIC REQUIRES USER INPUT
 . . . I $O(@DATAROOT@(FILE,IENS,FIELD,""))>0 K @DATAROOT@(FILE,IENS,FIELD) Q  ; WORD PROCESSING FIELDS - SKIP
 . . . S Y=$G(@DATAROOT@(FILE,IENS,FIELD,"I")) I Y="" Q  ; SKIP COMPUTED FIELDS
 . . . S X=$G(@DATAROOT@(FILE,IENS,FIELD,"E"))
 . . . S @TEMPROOT@(FILE,IENS,FIELD)=$S(X=Y:X,1:X_U_Y)
 . . . Q
 . . Q
 . Q
 Q
 ;
VALIDATE(DATA,MESG) ; VALIDATE DATA IN 'DATA' RETURN ERRORS IN 'MESG'
 ;N FILE,FIELD,RESULT,VAL,IENS,I,XDRDVALF,TOPFILE,FIRSTLVL
 S XDRDVALF=1
 F FILE=0:0 S FILE=$O(@DATA@(FILE)) Q:FILE'>0  D
 . S TOPFILE=($G(^DD(FILE,0,"UP"))'>0),FIRSTLVL=0
 . I 'TOPFILE S I=$G(^DD(FILE,0,"UP")) I $G(^DD(I,0,"UP"))'>0 S FIRSTLVL=1
 . S IENS="" F  S IENS=$O(@DATA@(FILE,IENS)) Q:IENS=""  D
 . . F FIELD=0:0 S FIELD=$O(@DATA@(FILE,IENS,FIELD)) Q:FIELD'>0  D
 . . . S (X,VAL)=$P(@DATA@(FILE,IENS,FIELD),U)
 . . . S YVAL=$S(@DATA@(FILE,IENS,FIELD)[U:$P(@DATA@(FILE,IENS,FIELD),U,2),1:X)
 . . . I 'TOPFILE,(FIRSTLVL&(FIELD'=.01))!'FIRSTLVL Q
 . . . I FILE=2.101,FIELD=.01 Q  ; DISPOSITON DATE/TIME HAS SPCL PROCESSING
 . . . I FILE=2,FIELD=63 Q  ; LAB POINTER HAS SPCL PROCESSING
 . . . I FILE=2,FIELD=.09 Q  ; SSN WILL BE ENTERED AS INTERNAL VALUE
 . . . I FILE=2,$P(^DD(FILE,FIELD,0),U,5,99)["DGLOCK2" Q  ;no NOK
 . . . I FILE=354,FIELD=.03 Q  ; COPAY EXEMPT STATUS DATE -- BAD
 . . . D CHKVALID(MESG,FILE,IENS,FIELD,VAL,YVAL)
 . . . Q
 . . Q
 . Q
 Q
 ;
CHKVALID(MESG,FILE,IENS,FIELD,EXTVAL,INTVAL,HELP) ;
 ;
 Q:FIELD=.001
 I $$NEWERR^%ZTER() N $ETRAP,$ESTACK S $ETRAP="D ERR^XDRDVAL"
 E  S X="ERR^XDRDVAL",@^%ZOSF("TRAP")
 S IOP="XDRBROWSER1" D ^%ZIS Q:POP  U IO
 S XMESG=$NA(^TMP("XDRDVAL-M")) K @XMESG
 S ^TMP($J,"LAST","FILE")=FILE,^("IENS")=IENS,^("FIELD")=FIELD,^("X")=EXTVAL,^("Y")=INTVAL
 S Y1=EXTVAL D
 . S RESULT="^"
 . I $P(^DD(FILE,FIELD,0),U,2)["S" S Y1=INTVAL
 . I $P(^DD(FILE,FIELD,0),U,2)["V" D
 . . N Z S Z=$P(INTVAL,";",2) Q:Z=""
 . . S Z=$P($G(@("^"_Z_"0)")),U,1)
 . . S Y1=Z_".`"_$P(INTVAL,";")
 . . Q
 . N DA,D0,DIC,DIE
 . D MAKEGLO(FILE,IENS,.DIC,.DA) Q:DA'>0
 . S D0=$P(IENS,",",$L(IENS,",")-1),DIE=DIC,DIC(0)=""
 . S EXCODE=$P(^DD(FILE,FIELD,0),U,5,999)
 . I $P(^DD(FILE,FIELD,0),U,2)["P" S Y1=$S(FILE=2.001:"",1:"`")_INTVAL,Y=INTVAL S Z=U_$P(^(0),U,3),DIC=Z I $D(@(Z_INTVAL_",0)")) S RESULT="" Q
 . S X=Y1,FILEA=FILE X EXCODE I $D(X) S RESULT=""
 . Q
 I $G(RESULT)="^",$G(HELP)["E" M @MESG@(FILE,IENS,FIELD)=^TMP("XDRDVAL-M")
 K @XMESG
 I RESULT="",FIELD=.01 D CHKNM ; CHECK FOR ,0,"NM", PROBLEM
 I $G(RESULT)="^" S @MESG@(FILE,IENS,FIELD,"INVALID")=INTVAL_$S(INTVAL'=EXTVAL:U_EXTVAL,1:"")
 U IO D ^%ZISC K ^TMP("DDB",$J,1)
 F I=2:1 Q:'$D(^TMP("DDB",$J,I))  S ^(I-1)=^TMP("DDB",$J,I) K ^(I)
 I $D(^TMP("DDB",$J)) M @MESG@(FILE,IENS,FIELD,"NOTE")=^TMP("DDB",$J)
 Q
 ;
MAKEGLO(FILENUM,IENS,GLOB,DASTR) ;
 N I,ERRFLG,DAVAL,J,FILE,FLD,NODE
 S GLOB="",ERRFLG=0 K DASTR
 F I=1:1 S FILE=FILENUM,DAVAL(I)=+IENS Q:$D(^DIC(FILE,0,"GL"))  D  Q:ERRFLG
 . S FILENUM=$G(^DD(FILE,0,"UP")) I FILENUM="" S ERRFLG=1 Q
 . S FLD=$O(^DD(FILENUM,"SB",FILE,0)) I FLD'>0 S ERRFLG=1 Q
 . S NODE=$P($P($G(^DD(FILENUM,FLD,0)),U,4),";") I NODE="" S ERRFLG=1 Q
 . S GLOB=""""_NODE_""","_$S(GLOB="":"",1:DAVAL(I)_",")_GLOB
 . S IENS=$P(IENS,",",2,99)
 . Q
 I ERRFLG S DASTR=-1,GLOB="" Q
 S GLOB=^DIC(FILE,0,"GL")_$S(GLOB="":"",1:DAVAL(I)_",")_GLOB
 F J=2:1:I S DASTR(J-1)=DAVAL(J)
 S DASTR=DAVAL(1)
 Q
 ;
CHKNM ; CHECK FOR PROBLEM WITH NM NODE OF SUBFILE NOT BEING CORRECT
 N UFILE,UNAME,UFLD
 S UFILE=$G(^DD(FILE,0,"UP")) I UFILE'>0 Q
 S UFLD=$O(^DD(UFILE,"SB",FILE,"")) Q:UFLD'>0
 S UNAME=$P(^DD(UFILE,UFLD,0),U)
 I $O(^DD(FILE,0,"NM",""))'=UNAME D
 . S RESULT="^"
 . W !,"First entry in ^DD("_FILE_",0,""NM"", does not match field name "_UNAME_" in file "_UFILE_".  This will be rejected by UPDATE^DIE."
 Q
 ;
ERR ; On an error mark status as error, and save the error message
 ;
 K X S RESULT="^"
 S $ECODE=""
 S ^TMP("DDB",$J,2)=$ZE
 Q
 ;
OPEN ;
 S DDBRZIS=1,DDBDMSG=""
 I '$D(XDRDVALF) U IO(0) W !,"...ONE MOMENT..." U IO
 Q
 ;
CLOSE ;
 S DDBRZIS=$G(DDBRZIS,1)
 N C,CHAR,DDBROS,EOF,X
 K ^TMP("DDB",$J)
 S DDBROS=^%ZOSF("OS"),EOF="EOF-End Of File"
 S CHAR="" F I=1:1:31 S CHAR=CHAR_$C(I)
 U IO W !,EOF,!
 S DDBRZIS("REWIND")=$$REWIND^%ZIS(IO,IOT,IOPAR)
 I 'DDBRZIS("REWIND") S DDBRZIS=0 U IO(0) W $C(7),!!?5,"<< UNABLE TO REWIND FILE>>",! H 3 Q
 U IO
 S C=0
 F  R X:1 Q:X="EOF-End Of File"  D
 .S X=$TR(X,CHAR)
 .S:X']"" X=" "
 .S C=C+1,^TMP("DDB",$J,C)=$E(X,1,255) Q
 .Q
 Q
 Q
