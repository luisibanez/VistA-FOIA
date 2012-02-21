TIUPS209 ; SLC/AJB - Active Titles Report & Cleanup ; 03/24/06
 ;;1.0;TEXT INTEGRATION UTILITIES;**209**;Jun 20, 1997
 ;
 Q
EN ; control segment
 N ANS,HDR,RECS,RPT,TEMP,TMP,TIUNAME,TIUOMIT,TIUUNK
 W @IOF
 D ASKUSER(.ANS,"Inactivate the unused Document Titles at this time") Q:$G(ANS("EXIT"))="YES"
 D
 .N POP,TIUDESC,TIURTN,TIUSAVE
 .S TIUDESC="TIUPS209 Active Title Report & Cleanup",TIURTN="REPORT^TIUPS209",TIUSAVE("*")=""
 .W ! D PREP,EN^XUTMDEVQ(TIURTN,TIUDESC,.TIUSAVE)
 Q
ASKUSER(ANS,DIR,TIUQUIT) ; ask the user if they want to update titles now
 I $G(ANS("EXIT"))="YES"!($G(ANS("INACT"))="NO") Q
 N DIRUT,DTOUT,DUOUT,POP,X,Y
 S DIR(0)="Y"
 S DIR("A")=DIR,DIR("B")="NO"
 S DIR("?",1)="Entering 'YES' will inactivate all titles unused in the past year;"
 S DIR("?",2)="their STATUS will be changed to INACTIVE.",DIR("?",3)=""
 S DIR("?")="Entering 'NO' will create the report without making any changes."
 D ^DIR I $D(DUOUT)!($D(DTOUT)) S ANS("EXIT")="YES" Q
 S ANS("INACT")=Y(0) Q:+$G(TIUQUIT)
 I ANS("INACT")="YES" D
 . W !!,"All active titles that have not been used in the previous 365 days"
 . W !,"will be set to INACTIVE.",!
 . W !,"You may select individual DOCUMENT TITLES that will NOT be set"
 . W !,"to INACTIVE by this cleanup.",!
 . D ASKUSER(.ANS,"Are you sure you want to change their status to INACTIVE",1)
 . I ANS("INACT")="YES" D OMIT
 Q
GETLAST(TIUDA) ; finds last date a document title is used
 N TIUD0,TIUD12,TIUDB,TIUDT,TIUSTAT,TIUX,TIUY
 S TIUY=0_U_"N/A"_U_"N/A"_U_TIUDA
 S (TIUDT,TIUSTAT)=0 F  S TIUSTAT=$O(^TIU(8925,"ALL","ANY",TIUDA,TIUSTAT)) Q:'+TIUSTAT  D
 . S (TIUX,TIUY)="",TIUX=$O(^TIU(8925,"ALL","ANY",TIUDA,TIUSTAT,TIUX))
 . S:+TIUX TIUY=$O(^TIU(8925,"ALL","ANY",TIUDA,TIUSTAT,TIUX,TIUY))
 . S:+TIUY TIUSTAT(TIUX)=TIUY
 S TIUX="",TIUX=$O(TIUSTAT(TIUX)) I +TIUX S TIUDB=TIUSTAT(TIUX),TIUD0=$G(^TIU(8925,TIUDB,0)),TIUD12=$G(^TIU(8925,TIUDB,12)) I '+TIUD0 S TIUUNK(TIUDB)=""
 I +$G(TIUD12) S TIUY=0_U_+$P(TIUD12,".")_U_$P(TIUD12,U,2)_U_+TIUDA
 Q TIUY
OUTPUT ; prints report
 N NUM S NUM=""
 F  S NUM=$O(HDR(NUM)) Q:NUM=""  W HDR(NUM),!
 F  S NUM=$O(RPT(NUM)) Q:NUM=""  W RPT(NUM),!
 Q
PREP ; prepares list of document titles
 N TIUD0,TIUDA,TIUTITLE
 S TIUNAME=$NA(^TMP("TIUPS209",$J)),TIUNAME(1)=$NA(^TEMP("TIUPS209",$J)),(TIUDA,TIUTITLE)="",RECS("TOTAL")=0
 K @TIUNAME,@TIUNAME(1) ; cleans globals before use
 F  S TIUTITLE=$O(^TIU(8925.1,"B",TIUTITLE)) Q:TIUTITLE=""  F  S TIUDA=$O(^TIU(8925.1,"B",TIUTITLE,TIUDA)) Q:'+TIUDA  S TIUD0=$G(^TIU(8925.1,TIUDA,0)) I $P(TIUD0,U,4)="DOC" S @TIUNAME@(TIUDA)=0,RECS("TOTAL")=RECS("TOTAL")+1
 Q
REPORT ;
 N SPACER,TIU,TIUCNT,TIUDA,TIULVL,TIUTITLE
 ;
 ; get documents used in the last year
 ;
 S TIU("EDT")=$P($$NOW^XLFDT,".")_".24",TIU("SDT")=$P($$FMADD^XLFDT($$NOW^XLFDT,-365),"."),TIU("START")=$$NOW^XLFDT,TIUDA=""
 F  S TIU("SDT")=$O(^TIU(8925,"F",TIU("SDT"))) Q:'+TIU("SDT")!(TIU("SDT")>TIU("EDT"))  F  S TIUDA=$O(^TIU(8925,"F",TIU("SDT"),TIUDA)) Q:'+TIUDA  D
 . N TIUD0,TIUD12 S TIUD0=$G(^TIU(8925,TIUDA,0)),TIUD12=$G(^TIU(8925,TIUDA,12))
 . I '+$D(@TIUNAME@(+TIUD0)) S @TIUNAME@(+TIUD0)=0
 . I '+TIUD0 S TIUUNK(TIUDA)=""
 . S @TIUNAME@(+TIUD0)=(@TIUNAME@(+TIUD0)+1)_U_+$P(TIUD12,".")_U_$P(TIUD12,U,2)_U_+TIUD0
 ;
 ; sort documents
 ;
 S (RECS("INACT"),RECS("ACT"))=0,TIUDA="" F  S TIUDA=$O(@TIUNAME@(TIUDA)) Q:TIUDA=""  D
 . I '+@TIUNAME@(TIUDA) S RECS("INACT")=RECS("INACT")+1,@TIUNAME(1)@("A",$P(^TIU(8925.1,TIUDA,0),U))=$$GETLAST(TIUDA) Q
 . S RECS("ACT")=RECS("ACT")+1,@TIUNAME(1)@("B",$S(+$L($P($G(^TIU(8925.1,TIUDA,0)),U)):$P(^TIU(8925.1,TIUDA,0),U),1:"UNKNOWN"))=@TIUNAME@(TIUDA) ; $P(^TIU(8925.1,TIUDA,0),U)
 S TIU("STOP")=$$NOW^XLFDT,TIU("ELAPSED")=$FN($$FMDIFF^XLFDT(TIU("START"),TIU("STOP"),2)/60,"-")
 ;
 ; prepare report
 ;
 S HDR(1)="Elapsed Time:    "_(TIU("ELAPSED")\1)_" minute(s) "_($FN((TIU("ELAPSED")#1)*60,"-",0))_" second(s)"
 S HDR(2)=""
 S SPACER="",$P(SPACER," ",(8-$L(RECS("INACT"))))=" "
 S HDR(3)="# of Records:      Unused Titles "_SPACER_RECS("INACT")
 S SPACER="",$P(SPACER," ",(8-$L(RECS("ACT"))))=" "
 S HDR(4)="                     Used Titles "_SPACER_RECS("ACT")
 S SPACER="",$P(SPACER," ",(8-$L(RECS("TOTAL"))))=" "
 S HDR(5)="                    Total Titles "_SPACER_RECS("TOTAL")
 S HDR(6)=""
 S RPT(1)="       Current User:  "_($$GET1^DIQ(200,+$G(DUZ),.01))
 S RPT(2)="       Current Date:  "_($$HTE^XLFDT($H))
 S RPT(3)="Date range searched:  "_($$FMTE^XLFDT($P($$FMADD^XLFDT($$NOW^XLFDT,-365),"."),"D"))_" - "_($$FMTE^XLFDT(TIU("EDT"),"D"))
 S RPT(4)=""
 S RPT(5)="                                         # of"
 S RPT(6)="Document Title                           Docs  Last DT Used  Author/Dictator"
 S RPT(7)="--------------                           ----  ------------  ---------------"
 ;
 ; inactivate if selected
 ;
 D:$G(ANS("INACT"))="YES" UPDATE
 ;
 ; process report body
 ;
 S (TIULVL,TIUTITLE)="",TIUCNT=7
 F  S TIULVL=$O(@TIUNAME(1)@(TIULVL)) Q:TIULVL=""  F  S TIUTITLE=$O(@TIUNAME(1)@(TIULVL,TIUTITLE)) Q:TIUTITLE=""  D
 . N TIUDISP,TIUTIT,TIUTMP
 . S TIUTMP=@TIUNAME(1)@(TIULVL,TIUTITLE)
 . D  I TIULVL="A",$P($G(^TIU(8925.1,$P(TIUTMP,U,4),0)),U,7)=13 Q
 . . S:$P($G(^TIU(8925.1,$P(TIUTMP,U,4),0)),U,7)=13 TIUTMP(1)=" [currently inactive]"
 . . S:$P($G(^TIU(8925.1,$P(TIUTMP,U,4),0)),U,4)'="DOC" TIUTMP(1)=" *["_$S(+$L($$GET1^DIQ(8925.1,$P(TIUTMP,U,4),.04)):$$GET1^DIQ(8925.1,$P(TIUTMP,U,4),.04),1:"missing")_"]*"
 . S TIUTIT=$$WRAP^TIULS(TIUTITLE_$G(TIUTMP(1)),40)
 . S TIUDISP=$$SETSTR^VALM1($P(TIUTIT,"|"),"",1,40)
 . S TIUDISP=$$SETSTR^VALM1(+TIUTMP,TIUDISP,42,5)
 . S TIUDISP=$$SETSTR^VALM1($$FMTE^XLFDT($P(TIUTMP,U,2)),TIUDISP,48,12)
 . S TIUDISP=$$SETSTR^VALM1($S(+$P(TIUTMP,U,3):$$GET1^DIQ(200,$P(TIUTMP,U,3),.01),1:$P(TIUTMP,U,3)),TIUDISP,62,17)
 . S TIUCNT=TIUCNT+1,RPT(TIUCNT)=TIUDISP
 . I $L(TIUTIT,"|")>1 S TIUCNT=TIUCNT+1,RPT(TIUCNT)="     "_$P(TIUTIT,"|",2)
 ;
 I +$D(TIUUNK) D
 . N TIUDA
 . S TIUCNT=TIUCNT+1,RPT(TIUCNT)=""
 . S TIUCNT=TIUCNT+1,RPT(TIUCNT)="The following DOCUMENT IENs have an incorrect #.01 Field (DOCUMENT TYPE)."
 . S TIUCNT=TIUCNT+1,RPT(TIUCNT)=""
 . S TIUDA="" F  S TIUDA=$O(TIUUNK(TIUDA)) Q:'+TIUDA  S TIUCNT=TIUCNT+1,RPT(TIUCNT)=TIUDA
 ;
 ; print report
 ;
 D OUTPUT,^%ZISC
 ;
 ; clean globals
 ;
 K @TIUNAME,@TIUNAME(1)
 Q
UPDATE ; updates status field of TIU Document Title to INACTIVE
 N TIUDA S TIUDA=0 F  S TIUDA=$O(@TIUNAME@(TIUDA)) Q:'TIUDA  I '+@TIUNAME@(TIUDA),'+$D(TIUOMIT(TIUDA)) S $P(^TIU(8925.1,TIUDA,0),U,7)=13
 Q
OMIT ;
 N TIUCONT,TIUQUIT
 F  D  Q:$G(TIUQUIT)=1!($G(TIUCONT)=1)
 . N DIC,DIR,POP,TIUCNT,X,Y
 . W !!,"Enter the DOCUMENT TITLE(S) that will NOT be INACTIVATED",!
 . W "during the cleanup process.",!!
 . W "Enter RETURN or '^' to finish selections.",!
 . S TIUCNT=0,DIC="^TIU(8925.1,",DIC("S")="I $P(^(0),U,4)=""DOC"""
 . S DIC(0)="AEMQ",DIC("A")="Enter DOCUMENT TITLE: "
 . F  D ^DIC Q:Y=-1  D  Q:$G(TIUQUIT)=1
 . . S TIUCNT=TIUCNT+1,TIUOMIT(+Y)="" S:TIUCNT=1 DIC("A")="                 and  "
 . Q:$G(TIUQUIT)=1
 . I TIUCNT=0 W !!,"No selections made.",! S DIR("A")="Enter RETURN to continue or '^' to exit",DIR(0)="E" D ^DIR S TIUQUIT=1 Q
 . W !!,$S(TIUCNT>1:"The following DOCUMENT TITLES will NOT be INACTIVATED: ",1:"The following DOCUMENT TITLE will NOT be INACTIVATED: "),!!
 . S X="" F  S X=$O(TIUOMIT(X)) Q:X=""  W ?5,$$GET1^DIQ(8925.1,X_",",.01),!
 . S DIR(0)="Y",DIR("A")="Is this correct",DIR("B")="YES"
 . D ^DIR I +Y'=1 W !! K TIUOMIT S:Y=U TIUQUIT=1 Q
 . S TIUCONT=1
 Q
