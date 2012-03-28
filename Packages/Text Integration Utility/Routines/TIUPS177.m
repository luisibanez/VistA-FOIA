TIUPS177 ; SLC/AJB - Blank Doc Cleanup ; 06/12/04
 ;;1.0;TEXT INTEGRATION UTILITIES;**177**;Jun 20, 1997
 ;
 Q
EN ; control segment
 N ANS
 W @IOF
 D ASKUSER(.ANS) Q:$G(ANS("EXIT"))="YES"
 D
 .N ZTDESC,ZTRTN,ZTSAVE,ZTIO,ZTSK
 .S ZTDESC="TIUPS177 Blank Note Text Cleanup",ZTRTN="CLEAN^TIUPS177",ZTSAVE("*")="",ZTIO=""
 .W ! D ^%ZTLOAD I '$D(ZTSK) Q
 .W !!,"Your task # is:  ",ZTSK,!
EXIT Q
ASKUSER(ANS) ;
 N %DT,CNT,POP,X,Y
 S %DT="AE",%DT(0)=$$NOW^XLFDT*-1
 F CNT=1:1:2 D
 . S %DT("A")=$S(CNT=1:"START WITH REFERENCE DATE:  ",CNT=2:"     GO TO REFERENCE DATE:  ")
 . S %DT("B")=$S(CNT=1:"Jan 01, 2003",CNT=2:$P($$HTE^XLFDT($H),"@"))
 . D ^%DT
 . I Y=-1 S CNT=2,ANS("EXIT")="YES" Q
 . I CNT=1 S ANS("BEGDT")=$$DATE(Y,CNT),%DT(0)=ANS("BEGDT") Q
 . S ANS("ENDDT")=$$DATE(Y,CNT),X=$P($$NOW^XLFDT,".")_".24" I ANS("ENDDT")>X S CNT=1
 Q
IFTEXT() ;
 N TIUCHK
 S TIUCHK=0 F  S TIUCHK=$O(^TIU(8925,DA,"TEXT",TIUCHK)) Q:TIUCHK=""!TIUCHK>0
 Q TIUCHK
DATE(TIUDT,TIUSEQ) ;
 I TIUDT["0000" S TIUDT=TIUDT/10000,TIUDT=TIUDT_$S(TIUSEQ=1:"0101",TIUSEQ=2:"1231")
 I TIUSEQ=2 S TIUDT=TIUDT_".24"
 Q TIUDT
CLEAN ;
 N DA,DR,DIE,N,TIUDT
 S DA="",N=8925,TIUDT=ANS("BEGDT")
 F  S TIUDT=$O(^TIU(N,"F",TIUDT)) Q:TIUDT=""!(TIUDT>ANS("ENDDT"))  F  S DA=$O(^TIU(N,"F",TIUDT,DA)) Q:DA=""  I '$D(^TIU(8925,"DAD",DA)),'$D(^TIU(8925.91,"ADI",DA)),'$D(^TIU(N,DA,"TEXT",0)),$P($G(^TIU(8925,DA,0)),U,5)>5,'$$IFTEXT D
 . I $P($G(^TIU(8925,DA,0)),U,5)=15 Q
 . N TIUCODE,TIUNOW
 . S TIUCODE="A",TIUNOW=$$NOW^XLFDT,DIE=8925,DR=".05////15;1610////^S X=+DUZ;1611////^S X=TIUNOW;1612////^S X=TIUCODE"
 . L +^TIU(8925,DA):0 I $T D ^DIE,AUDIT L -^TIU(8925,DA)
 S XQA(DUZ)="",XQAMSG="TIUPS177 has finished."
 D SETUP^XQALERT
 Q
AUDIT ;
 N TIU,TIUIEN,TIUMSG
 S TIU(8925.5,"+1,",.01)=DA
 S TIU(8925.5,"+1,",2.01)=TIUNOW
 S TIU(8925.5,"+1,",2.02)=DUZ
 S TIU(8925.5,"+1,",2.03)=TIUCODE
 D UPDATE^DIE("","TIU","TIUIEN","TIUMSG")
 Q
