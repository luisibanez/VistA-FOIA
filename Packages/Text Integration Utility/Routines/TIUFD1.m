TIUFD1 ; SLC/MAM - LM Template DSUPLOAD(LASTLIN), DSEMBED(LASTLIN) ;03-Jan-2006 11:20;MGH
 ;;1.0;TEXT INTEGRATION UTILITIES;**1003**;Jun 20, 1997
 ;IHS/CIA/MGH  Added line to call routine to display the description
 ;
DSEMBED(LASTLIN) ; Set/Update Display Array TIUF3 starting with Object Embedded in Titles
 ; See DSBASICS for required variables, etc.
 ; Called by subtemplate D when OBJECTDA is object
 ; Sets ^TMP("TIUFEMBED",$J,OBJECTDA,SUBSCPT,"ANY",FILEDA), for SUBSCPTs
 ;TIUFTL,TIUFCO,TIUFORPHAN.
 N LINENO,TITLEDA,OBJECTDA,TIUREC,NODE0,IFN,TYPE,HASIT,OLDLNO,INFO
 N ORPHANDA
 S LINENO=LASTLIN,OBJECTDA=TIUFINFO("FILEDA"),TYPE=$P(TIUFNOD0,U,4)
 S TIUFELIN=LASTLIN
 I TYPE'="O" G DSEMX
 K ^TMP("TIUFEMBED",$J,OBJECTDA) D EMBED^TIUFLJ(OBJECTDA,TIUFNOD0,"ANY",1)
TITLE I '$O(^TMP("TIUFEMBED",$J,OBJECTDA,"TIUFTL","ANY",0)) G ORPHAN
 S LINENO=LINENO+1,^TMP("TIUF3",$J,LINENO,0)="",IFN=$S("NM"[TIUFWHO:"IFN",1:"   ")
 S LINENO=LINENO+1,^TMP("TIUF3",$J,LINENO,0)="  Object is Embedded in Title(s)                        Status  Owner        "_IFN
 S TITLEDA=0,OLDLNO=LINENO
 F  S TITLEDA=$O(^TMP("TIUFEMBED",$J,OBJECTDA,"TIUFTL","ANY",TITLEDA)) Q:'TITLEDA  D  G:$D(DTOUT) DSEMX
 . S LINENO=LINENO+1 D NINFO^TIUFLLM(LINENO,TITLEDA,.INFO),PARSE^TIUFLLM(.INFO),NODE0ARR^TIUFLF(TITLEDA,.NODE0) Q:$D(DTOUT)
 . D BUFENTRY^TIUFLLM2(.INFO,.NODE0,"O")
 D UPDATE^TIUFLLM1("O",LINENO-OLDLNO,OLDLNO) K ^TMP("TIUFB",$J)
ORPHAN I '$O(^TMP("TIUFEMBED",$J,OBJECTDA,"TIUFORPHAN","ANY",0)) G DSEMX
 S LINENO=LINENO+1,^TMP("TIUF3",$J,LINENO,0)="",IFN=$S("NM"[TIUFWHO:"IFN",1:"   ")
 S LINENO=LINENO+1,^TMP("TIUF3",$J,LINENO,0)="  Object is Embedded in Orphan Component(s)             Status  Owner        "_IFN
 S ORPHANDA=0,OLDLNO=LINENO
 F  S ORPHANDA=$O(^TMP("TIUFEMBED",$J,OBJECTDA,"TIUFORPHAN","ANY",ORPHANDA)) Q:'ORPHANDA  D  G:$D(DTOUT) DSEMX
 . S LINENO=LINENO+1 D NINFO^TIUFLLM(LINENO,ORPHANDA,.INFO),PARSE^TIUFLLM(.INFO),NODE0ARR^TIUFLF(ORPHANDA,.NODE0) Q:$D(DTOUT)
 . D BUFENTRY^TIUFLLM2(.INFO,.NODE0,"O")
 D UPDATE^TIUFLLM1("O",LINENO-OLDLNO,OLDLNO) K ^TMP("TIUFB",$J)
DSEMX S LASTLIN=LINENO Q:$D(DTOUT)  D DSUPLOAD(.LASTLIN)
 Q
 ;
DSUPLOAD(LASTLIN) ; Set/Update Display Array TIUF3 starting with Upload.
 ; See DSBASICS for required variables, etc.
 ; CAlled by subtemp D and T
 N LINENO,CNT,TIUI,FILEDA,FLDNO,HEADFLG,ITEMFLG,TIUM,CAPDEL
 N DIC,DR,DIQ,DA,TARGET,AFILEDA,TYPE,SUBFLDNO
 S (TIUFULIN,LINENO)=LASTLIN,TYPE=$P(TIUFNOD0,U,4)
 I "NM"'[TIUFWHO G DSUPX
 I TYPE'="CL",TYPE'="DC",TYPE'="DOC" G DSUPX
 ;If called to redisplay edited screen rather than by Init, kill array starting with Upload before resetting array.
 S CNT=$O(^TMP("TIUF3",$J,1000000),-1)
 F TIUI=LASTLIN+1:1:CNT K ^TMP("TIUF3",$J,TIUI),^TMP("TIUF3IDX",$J,TIUI)
 S FILEDA=TIUFINFO("FILEDA")
 S LINENO=LINENO+1,^TMP("TIUF3",$J,LINENO,0)=""
 S LINENO=LINENO+1,^TMP("TIUF3",$J,LINENO,0)="  Upload"
 I $G(^TIU(8925.1,FILEDA,1))="",'$D(^TIU(8925.1,FILEDA,"HEAD",0)),'$D(^TIU(8925.1,FILEDA,"ITEM",0)) G DSUPX
 K TIUFQ
 S DIC=8925.1,DR="1.01:1.03;4;4.5;4.8",DIQ(0)="I,E",DA=FILEDA,DIQ="TIUFQ" D EN^DIQ1
 F FLDNO=1.01,1.02,1.03,4,4.5,4.8 D
 . D SETFLD^TIUFLD(FILEDA,.LINENO,FLDNO)
 . Q
 K TIUFQ
UPHEAD ;
 S (HEADFLG,ITEMFLG)=0
 S:$O(^TIU(8925.1,FILEDA,"HEAD",0)) HEADFLG=1
 S:$O(^TIU(8925.1,FILEDA,"ITEM",0)) ITEMFLG=1
 F TIUM="HEAD","ITEM" D  G:$D(VALMQUIT) DSUPX
 . Q:'@(TIUM_"FLG")
 . N TIUJ
 . I TIUM="HEAD" S CAPDEL="  Captioned",FLDNO=2
 . E  S CAPDEL="  Delimited",FLDNO=1
 . S LINENO=LINENO+1,^TMP("TIUF3",$J,LINENO,0)=""
 . S LINENO=LINENO+1,^TMP("TIUF3",$J,LINENO,0)=CAPDEL_" ASCII Record Header"
 . S TIUJ=0 K TIUFQ
 . F  S TIUJ=$O(^TIU(8925.1,FILEDA,TIUM,TIUJ)) Q:'TIUJ  D  Q:$D(VALMQUIT)
 . . S LINENO=LINENO+1,^TMP("TIUF3",$J,LINENO,0)=""
 . . S DIC=8925.1,DR=FLDNO,DA=FILEDA,DR(8925.1_FLDNO)=".01:1"
 . . S DA(8925.1_FLDNO)=TIUJ,DIQ(0)="I,E",DIQ="TIUFQ" D EN^DIQ1
 . . F SUBFLDNO=.01:.01:.04,1,.05:.01:.07 D
 . . . D SETFLD^TIUFLD(FILEDA,.LINENO,FLDNO,TIUJ,SUBFLDNO)
 . . K TIUFQ
 . . Q
 . Q
DSUPX ; IHS/CIA/MGH ADDED LINES FOR DESCRIPTION MGH
 ;S LASTLIN=LINENO
 K TIUFQ S LASTLIN=LINENO Q:$D(DTOUT)  D DESC^BTIUFD(.LASTLIN)
 Q
 ;
