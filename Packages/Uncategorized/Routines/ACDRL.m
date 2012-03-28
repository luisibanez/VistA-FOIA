ACDRL ;IHS/ADC/EDE/KML - CDMIS GENERAL RETRIEVAL DRIVER;
 ;;4.1;CHEMICAL DEPENDENCY MIS;;MAY 11, 1998
START ; 
 K ACDQUIT
TYPE ;--- get type of report (patient, date range or search template)
 D INFORM^ACDRL01
 D @ACDPTVS
 D XIT
 Q
P ;patient lister
 D ADD I $D(ACDQUIT) D DEL K ACDQUIT G XIT
 I '$D(ACDCAND) D P1 Q
 I $D(ACDCAND),$P(^ACDRPTD(ACDRPT,0),U,11) D  I $D(DIRUT)!'($D(ACDBDD))!('$D(ACDEDD)) Q
 .S ACDRDTR=""
 .W !!,"You have selected at least one item that requires a date range selection."
 .D GETDATES
 D TITLE I $D(ACDQUIT) K ACDQUIT G TYPE
 D ZIS
 Q
P1 ;if patient, no prev defined report used
P11 K ^ACDRPTD(ACDRPT,11),ACDRDTR D SCREEN I $D(ACDQUIT) K ACDQUIT D DEL G TYPE
 I $D(ACDRDTR) D
 .W !!,"You have selected at least one item that requires a date range selection."
 .D GETDATES
P12 K ^ACDRPTD(ACDRPT,12) S ACDTCW=0 D COUNT I $D(ACDQUIT) K ACDQUIT G P11
P13 D TITLE I $D(ACDQUIT) K ACDQUIT G P12
 D SAVE
 D ZIS
 Q
V ;
GETDATES ;
BD ;get beginning date
 W ! K DIR,X,Y S DIR(0)="D^:DT:EP",DIR("A")="Enter Beginning Visit Date for search" D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 I $D(DIRUT) D DEL G XIT
 S ACDBD=Y
ED ;get ending date
 W ! K DIR,X,Y S DIR(0)="D^"_ACDBD_":DT:EP",DIR("A")="Enter Ending Visit Date for search" S Y=ACDBD D DD^%DT S Y="" D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 I $D(DIRUT) G BD
 S ACDED=Y
 S X1=ACDBD,X2=-1 D C^%DTC S ACDD=X S Y=ACDBD D DD^%DT S ACDBDD=Y S Y=ACDED D DD^%DT S ACDEDD=Y
 Q:$D(ACDRDTR)
 D ADD I $D(ACDQUIT) D DEL K ACDQUIT  G V
 I '$D(ACDCAND) D V1 Q
 D TITLE I $D(ACDQUIT) K ACDQUIT G TYPE
 D ZIS
 Q
V1 ;if visit, no prev defined report used
V11 K ^ACDRPTD(ACDRPT,11),ACDRDTR D SCREEN I $D(ACDQUIT) K ACDQUIT D DEL G V
V12 K ^ACDRPTD(ACDRPT,12) S ACDTCW=0 D COUNT I $D(ACDQUIT) K ACDQUIT G V11
V13 D TITLE I $D(ACDQUIT) K ACDQUIT G V12
 D SAVE
 D ZIS
 Q
SCREEN ;
 S ACDCNTL="S" D ^ACDRL4 K ACDCNTL
 Q
COUNT ;count only or detailed report
 D COUNT^ACDRL3
 Q
TITLE ;
 Q:ACDCTYP="F"
 Q:ACDCTYP="T"
 K DIR,X,Y S DIR(0)="Y",DIR("A")="Would you like a custom title for this report",DIR("B")="N" D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 I $D(DIRUT) S ACDQUIT=1 Q
 Q:Y=0
 S ACDLENG=$S(ACDTCW:ACDTCW-8,1:60)
 I Y=1 K DIR,X,Y S DIR(0)="F^3:"_ACDLENG,DIR("A")="Enter custom title",DIR("?")="    Enter from 3 to "_ACDLENG_" characters" D ^DIR K DIR
 G:$D(DIRUT) TITLE
 S ACDTITL=Y
 Q
SAVE ;
 Q:$D(ACDCAND)
 Q:ACDCTYP'="D"  ;--- must be a detailed report to be saved
 S ACDSAVE=""
 K DIR,X,Y S DIR(0)="Y",DIR("A")="Do you wish to SAVE this "_$S('$D(ACDEP1):"SEARCH/",1:"")_"PRINT/SORT logic for future use",DIR("B")="N" D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 Q:$D(DIRUT)
 Q:'Y
 K DIR,X,Y S DIR(0)="9001003.8,.03",DIR("A")="Enter NAME for this REPORT DEFINITION" D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 G:$D(DIRUT) SAVE
 S ACDNAME=Y
 S DIE="^ACDRPTD(",DA=ACDRPT,DR=".02////1;.03///"_ACDNAME_";.06///"_ACDPTVS_";.05///"_ACDCTYP_";.11///"_$G(ACDRDTR) S:$D(ACDEP1) DR=DR_";.09///"_ACDPACK D CALLDIE^ACDRLU1
 Q
ZIS ;call to XBDBQUE
 I 'ACDTCW S ACDTCW=IOM
 S ACDDONE=""
 D SHOW^ACDRLS,SHOWP^ACDRLS,SHOWR^ACDRLS
 D XIT1
 S XBRP="^ACDRLP",XBRC="^ACDRL1",XBRX="XIT^ACDRL",XBNS="ACD"
 D ^XBDBQUE
 D XIT
 Q
DEL ;EP DELETE LOG ENTRY IF ONE EXISTS AND USER "^" OUT
 I $G(ACDRPT),$D(^ACDRPTD(ACDRPT,0)),'$P(^ACDRPTD(ACDRPT,0),U,2) S DIK="^ACDRPTD(",DA=ACDRPT D ^DIK K DIK,DA,DIC
 Q
ADD ;
 D ADD^ACDRL01
 Q
XIT ;
 D XIT^ACDRL1
XIT1 ;
 D XIT1^ACDRL1
 Q
