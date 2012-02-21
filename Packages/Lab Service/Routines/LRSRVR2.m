LRSRVR2 ;DALIO/FHS - LAB DATA SERVER CONT'D RELMA EXTRACT ; Aug 26, 2004
 ;;5.2;LAB SERVICE;**303**;Sep 27, 1994
 ; Produces LOINC RELMA extract - via LRLABSERVER or option
 ;
EN ; Called by option [LR LOINC EXTRACT RELMA FORMAT]
 ; Entry point for the option - user must capture output
 N DIR,DIRUT,LREND,LRCNT,LRSUB,LRVAL,LRST,LRSTN,LRTXT,X,Y
 S DIR(0)="Y",DIR("A")="Ready to Capture",DIR("B")="Yes"
 D ^DIR
 I $D(DIRUT) Q
 D WAIT^DICD
 S LRSUB="RELMA",LRTXT=1
 D BUILD
 W !
 S LRL=0
 F  S LRL=$O(^TMP($J,"LRDATA",LRL)) Q:LRL<1  W !,^(LRL)
 D CLEAN
 Q
 ;
 ;
SERVER ; Server entry Point
 N I,LRCNT,LREND,LRL,LRTXT,LRX,LRY
 S LRTXT=0
 D BUILD
 S XMSUB=LRST_" "_LRSTN_" RELMA EXTRACT "_$$HTE^XLFDT($H,"1M")
 S XMY(XQSND)="",XMTEXT="^TMP($J,""LRDATA"","
 S XMDUN="Lab Server",XMDUZ=".5"
 D ^XMD
 D CLEAN
 Q
 ;
 ;
BUILD ; Build extract
 N I,LR6206,LR64,LRCNT,LRCRLF,LRLEN,LRQUIT,LRROOT,LRSS,LRSTR,LRSTUB,LRVAL
 S LRVAL=$$SITE^VASITE,LRST=$P(LRVAL,"^",3),LRSTN=$P(LRVAL,"^",2)
 I LRST="" S LRST="???"
 K ^TMP($J,"LRDATA"),^TMP($J,"LR60")
 S LRCNT=0,LRCRLF=$C(13,10),LRSTR=""
 F I=0,1,2,3 S LRCNT(I)=0
 D HDR
 ;
 ; Step down the B X-ref - exclude synomyms
 S LRROOT="^LAB(60,""B"")"
 F  S LRROOT=$Q(@LRROOT) Q:LRROOT=""  Q:$QS(LRROOT,2)'="B"  D
 . Q:$G(@LRROOT)
 . D TEST
 ;
 ; Process microbiology antibiotics
 S LR6206=0,LRSS="MI"
 F  S LR6206=$O(^LAB(62.06,LR6206)) Q:'LR6206  D
 . S LR64=$$GET1^DIQ(62.06,LR6206_",",64,"I")
 . S LRX=$$MICRO^LRSRVR3(LR64)
 . S LRSTUB=$P(LRX,"|",5)_"||||"_$P(LRX,"|",3)_"|"_$P(LRX,"|",1)_"|||"_$P(LRX,"|",20)_"|"_$P(LRX,"|",19)
 . S LRSTR=LRSTR_LRST_"-"_LR64_"-"_"AB"_LR6206_"|"_LRSTUB
 . D SETDATA S LRCNT(3)=LRCNT(3)+1
 ;
 ; Set the final info into the ^TMP message global
 I 'LRTXT D
 . S LRNODE=$O(^TMP($J,"LRDATA",""),-1)+1
 . I LRSTR'="" S ^TMP($J,"LRDATA",LRNODE)=$$UUEN^LRSRVR4(LRSTR)
 . S ^TMP($J,"LRDATA",LRNODE+1)=" "
 . S ^TMP($J,"LRDATA",LRNODE+2)="end"
 ;
 S ^TMP($J,"LRDATA",6)="Total number of records: "_$J(LRCNT,5)
 S ^TMP($J,"LRDATA",7)="Total number of tests..: "_$J(LRCNT(0),5)
 S ^TMP($J,"LRDATA",8)="Tests with LOINC code..: "_$J(LRCNT(1),5)
 S ^TMP($J,"LRDATA",9)="Tests with NLT code....: "_$J(LRCNT(2),5)
 S ^TMP($J,"LRDATA",10)="Antimicrobials.........: "_$J(LRCNT(3),5)
 ;
 Q
 ;
 ;
CLEAN ;
 K ^TMP($J,"LR60")
 K ERR,LR60IEN,LR60NM,LR6421,LR64IEN,LR64N,LR64NM
 K LRACTION,LRCC,LRCCNX,LOINCDTA,LRRNLT,LRCDEF,LREND
 K LRL,LRLNC,LRLNC80,LRLNCN,LRLNCX,LRNODE,LROUT,LROUT1,LRR64
 K LRSPEC,LRSPEC60,LRSPECHL,LRSPECN,LRSPECTA,LRSPCN,LRST,LRSTN,LRSTR
 K LRTA,LRUNIT,LRX,LRY,X,Y
 D CLEAN^LRSRVR
 D ^%ZISC
 Q
 ;
 ;
TEST ; Pull out test info
 N LA7TREE,LR60,LRBATTY,LRBATTYN
 K LROUT,LRSPEC,ERR
 S LR60NM=$QS(LRROOT,3),LR60IEN=$QS(LRROOT,4)
 ;
 ; Bypass "neither" type tests.
 I $P(^LAB(60,LR60IEN,0),"^",3)="N" Q
 ; Bypass "workload" type tests.
 I $P(^LAB(60,LR60IEN,0),"^",4)="WK" Q
 ;
 S LRBATTY=LRST_"-"_LR60IEN,LRBATTYN=LR60NM
 ; Panel test
 I $O(^LAB(60,LR60IEN,2,0)) D  Q
 . D UNWIND^LA7ADL1(LR60IEN,9,0)
 . S LR60=0
 . F  S LR60=$O(LA7TREE(LR60)) Q:'LR60  D
 . . I $D(^TMP($J,"LR60",LR60)) Q
 . . S LR60IEN=LR60,LR60NM=$P(^LAB(60,LR60IEN,0),"^")
 . . S LRRNLT="",LRR64=+$P($G(^LAB(60,+LR60IEN,64)),U,2)
 . . I LRR64 S LRRNLT=$$GET1^DIQ(64,LRR64_",",1,"E")
 . . D SPEC
 ;
 I $D(^TMP($J,"LR60",LR60IEN)) Q
 ; Not a panel test
 ; Get result NLT code
 S LRRNLT="",LRR64=+$P($G(^LAB(60,+LR60IEN,64)),U,2),LR6421=0
 I LRR64 D
 . S LRRNLT=$$GET1^DIQ(64,LRR64_",",1,"E")
 . S LR6421=$$GET1^DIQ(64,LRR64_",",13,"I")
 D SPEC
 Q
 ;
 ;
SPEC ; Check each specimen for this test
 K LRSPEC,LROUT
 S (LRCDEF,LRSPEC,LRSPECHL,LRSPECN,LRLNC,LRLNCN,LRLNCX,LRLNC80,Y)=""
 S (LR64NM,LR64N,LRSPECHL,LRUNIT)="",LRTA="POINT"
 S LRSPEC60=0
 F  S LRSPEC60=$O(^LAB(60,+LR60IEN,1,LRSPEC60)) Q:'LRSPEC60  D
 . Q:'$D(^LAB(60,+LR60IEN,1,LRSPEC60,0))#2
 . S LRUNIT=$$TRIM^XLFSTR($P(^(0),U,7)," ","RL")
 . K LROUT,ERR
 . D GETS^DIQ(61,LRSPEC60_",",".01;.09;.0961","E","LROUT","ERR")
 . S LRSPECN=$G(LROUT(61,LRSPEC60_",",.01,"E"))
 . S LRSPECHL=$G(LROUT(61,LRSPEC60_",",.09,"E"))
 . S LRSPECTA=$G(LROUT(61,LRSPEC60_",",.0961,"E"))
 . S LRSPEC(LRSPEC60)=LRSPEC60_U_LRSPECN_U_LRSPECHL_U_LRSPECTA_U_LRUNIT
 D SPECLOOP
 Q
 ;
 ;
SPECLOOP ; Check to see if specimen has been linked to LOINC
 ;
 S LRSPEC=0
 F  S LRSPEC=$O(LRSPEC(LRSPEC)) Q:'LRSPEC  D
 . K Y
 . S LRSPCN=$P(LRSPEC(LRSPEC),U),LRSPECN=$P(LRSPEC(LRSPEC),U,2)
 . S LRTA=$P(LRSPEC(LRSPEC),U,4)
 . S LRUNIT=$$TRIM^XLFSTR($P(LRSPEC(LRSPEC),U,5),"RL"," ")
 . S LRLNCX=$$RNLT^LRVER1(LR60IEN),LRLNC=$P(LRLNCX,"!",2)
 . D VAL
 Q
 ;
 ;
VAL ; Get LOINC code info
 S LRLNC80="" I 'LRLNC D WRT Q
 N ERR,LROUT1,X,Y
 D GETS^DIQ(95.3,LRLNC_",",".01;80","E","LROUT1","ERR")
 I LRTXT,$D(ERR) W !,LRLNC_"  *  LOINC LOOKUP ERR",! Q
 S LRLNC=LROUT1(95.3,+LRLNC_",",.01,"E")
 S LRLNC80=LROUT1(95.3,+LRLNC_",",80,"E")
 D WRT
 Q
 ;
 ;
WRT ; Set ^TMP( with extracted data
 N LRQUIT,LRLEN,LRSS,X,Y
 ;
 ; Set flag that this file #60 test has been processed - avoid duplicate
 ; processing as component of panel and individual test
 S ^TMP($J,"LR60",LR60IEN)=""
 ;
 S:LRTA="" LRTA="POINT"
 S LR60NM=$$TRIM^XLFSTR(LR60NM,"RL"," ")
 S LRBATTY=$$TRIM^XLFSTR(LRBATTY,"RL"," ")
 S LRSTR=LRSTR_LRST_"-"_LR60IEN_"-"_LRSPEC
 S LRSTR=LRSTR_"|"_LR60NM_"|"_LRSPECN_"|"_LRTA_"|"_LRUNIT_"|"_LRLNC_"|"_$P(LRLNCX,"!")_"|"
 S LRSTR=LRSTR_LRBATTY_"|"_LRBATTYN_"|"
 ;
 ; Lab section specified for this NLT code.
 S LRSTR=LRSTR_$S($G(LR6421)>0:$$GET1^DIQ(64.21,LR6421_",",1),1:"")_"|"
 ;
 ; Subscript
 S LRSS=$$GET1^DIQ(60,LR60IEN_",",4,"I")
 S LRSTR=LRSTR_LRSS_"|"
 ; Test info - data type, help prompt
 I LRSS'="CH" S LRSTR=LRSTR_"||"
 I LRSS="CH" S LRSTR=LRSTR_$$TSTTYP^LRSRVR3($$GET1^DIQ(60,LR60IEN_",",13))_"|"
 ;
 ; Test reference low|reference high|therapeutic low|therapeutic high|
 S X=$G(^LAB(60,LR60IEN,1,LRSPEC,0))
 S Y=$P(X,"^",2)_"|"_$P(X,"^",3)_"|"_$P(X,"^",11)_"|"_$P(X,"^",12)
 S LRSTR=LRSTR_$TR(Y,$C(34),"")
 S LRCNT(0)=LRCNT(0)+1
 I LRLNC'="" S LRCNT(1)=LRCNT(1)+1
 I $P(LRLNCX,"!")'="" S LRCNT(2)=LRCNT(2)+1
 ;
 ;
SETDATA ; Set data into report structure
 I 'LRTXT S LRSTR=LRSTR_LRCRLF
 S LRCNT=LRCNT+1
 S LRNODE=$O(^TMP($J,"LRDATA",""),-1)
 I LRTXT S LRNODE=LRNODE+1,^TMP($J,"LRDATA",LRNODE)=LRSTR,LRSTR="" Q
 I 'LRTXT D ENCODE^LRSRVR4(.LRSTR)
 Q
 ;
 ;
HDR ; Set the header information
 S ^TMP($J,"LRDATA",1)="Report Generated.......: "_$$FMTE^XLFDT($$NOW^XLFDT)_" at "_LRSTN
 S ^TMP($J,"LRDATA",2)="Report requested.......: "_LRSUB
 S ^TMP($J,"LRDATA",3)="LOINC version..........: "_$$GET1^DID(95.3,"","","PACKAGE REVISION DATA")
 S ^TMP($J,"LRDATA",4)="VistA File version.....: "_$G(^LAB(95.3,"VR"))
 F I=5,11,12 S ^TMP($J,"LRDATA",I)=" "
 S ^TMP($J,"LRDATA",13)="Legend:"
 S X="Station #-60 ien-Spec ien|Test Name|Spec|Time Aspect|Units|LOINC|NLT #|Battery Code|Battery Description|Lab Section|Subscript|Comments|Data Type|Reference low|Reference high|Therapeutic low|Therapeutic high|"
 S ^TMP($J,"LRDATA",14)=X
 S X="           1             |    2    |  3 |     4     |  5  |  6  |  7  |    8       |     9             |     10    |   11    |    12   |     13 |   14        |     15       |      16       |       17       |"
 S ^TMP($J,"LRDATA",15)=X
 S ^TMP($J,"LRDATA",16)=$$REPEAT^XLFSTR("-",$L(X))
 S ^TMP($J,"LRDATA",17)=" "
 I 'LRTXT D
 . S LRFILENM=$TR(LRSTN," ","_")_"-"_LRSUB_"-"_$P($$FMTHL7^XLFDT($$NOW^XLFDT),"-")_".TXT"
 . S ^TMP($J,"LRDATA",11)="Attached LMOF file.....: "_LRFILENM
 . S ^TMP($J,"LRDATA",18)="begin 0644 "_LRFILENM
 Q
