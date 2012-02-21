GMTSPCD ; SLC/DLT,KER - Queue HS Batch Print Clinic by Date ; 08/27/2002
 ;;2.7;Health Summary;**28,56**;Oct 20, 1995
 ;
 ; External References
 ;   DBIA  10026  ^DIR
 ;   DBIA  10063  ^%ZTLOAD
 ;   DBIA  10040  ^SC("B")
 ;   DBIA  10040  ^SC(  file #44
 ;   DBIA  10006  ^DIC  (file #44 and 3.5)
 ;   DBIA  10000  NOW^%DTC
 ;                        
MAIN ; Controls branching
 W !!,"This option will queue Health Summaries for a specified Visit Date"
 W !,"for all Outpatient Clinics with Appointments on that Visit Date.",!!
 N GMTSCDT
 S GMTSCDT=$$SELDATE Q:GMTSCDT'>0
 W ! N DIR S DIR(0)="D^::%DT",DIR("A")="Date and Time to Queue this Job to run",DIR("B")="NOW" D ^DIR Q:($D(DTOUT)!($D(DUOUT))!($D(DIROUT)))
 S ZTDTH=Y,ZTIO="",ZTSAVE("GMTSCDT")=""
 S ZTRTN="CLINICQ^GMTSPCD",ZTDESC="Create Task HS Jobs for Clinics by Visit Date"
 D ^%ZTLOAD
 Q
CLINICQ ; Loop thru clinics for appointments
 ;   Date stored in GMTSCDT 
 N GMTSDATE,GMTSTYP,GMTSCLN,GMTSCL,LTYPE,GMW,X
 S GMTSCLN=0
 ;   Using "B" xref so print out is numeric/alphabetic
 F  S GMTSCLN=$O(^SC("B",GMTSCLN))  Q:GMTSCLN=""  D
 . S GMTSCL=$O(^SC("B",GMTSCLN,0))
 . Q:$P($G(^SC(GMTSCL,0)),U,3)'="C"
 . S GMTSDATE=+$O(^SC(GMTSCL,"S",GMTSCDT))  Q:'GMTSDATE  Q:GMTSDATE'[GMTSCDT
 . S GMTSTYP=0 S GMTSTYP=$O(^GMT(142,"D",GMTSCL,GMTSTYP)) Q:+GMTSTYP'>0  D QUEUE
 Q
QUEUE ; Queues HS batch print for particular HS Type and Location.
 N DIC,GMPSAP,GMTSCLI,GMTSLOC,GMTSSC,GMTSIO,GMTSDYS,GMV,QUEQIT,X,Y
 S QUEQIT=0
 S GMTSCLI=$O(^GMT(142,GMTSTYP,20,"B",GMTSCL,0))
 S GMTSLOC=$G(^GMT(142,GMTSTYP,20,GMTSCLI,0))
 S X=+GMTSLOC,DIC=44,DIC(0)="NXZ" D ^DIC
 I $S(+Y'>0:1,"WCOR"'[$P($G(Y(0)),U,3):1,1:0) Q
 S GMTSSC(1)=Y_U_$P(Y(0),U,3),$P(GMTSSC(1),U,4)=GMTSCDT
 S GMPSAP=$S($P(GMTSLOC,U,3)="Y":1,1:0)
 S ZTIO=$$GETIO($P(GMTSLOC,U,2)) Q:'$L(ZTIO)
 S ZTDTH=$H,ZTRTN="MAIN^GMTSPL",ZTDESC="Clinic Health Summaries by Visit Date"
 F GMV="GMTSTYP","GMPSAP" S ZTSAVE(GMV)=""
 S ZTSAVE("GMTSSC(")=""
 D ^%ZTLOAD
 Q
GETIO(X) ; Get device for queueing
 N %,%Y,C,DIC,Y
 S DIC=3.5,DIC(0)="NXZ" D ^DIC S Y=$S(+Y'>0:"",1:$P(Y(0),U))
 Q Y
SELDATE() ; Allows entry of Visit/Surgery date or date range
 ; for Print-by-Clinic
 N %,%H,%I,DIR,DEFDT,X,Y
 D NOW^%DTC S (X,DT)=$P(%,".") D REGDT4^GMTSU S DEFDT=X
 S DIR(0)="D^::EX",DIR("B")=DEFDT
 S DIR("A")="Please enter the Visit date"
 D ^DIR
 I Y="^^" S DIROUT=1
 Q Y
