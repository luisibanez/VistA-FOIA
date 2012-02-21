PXRRMDR1 ;HERN/BDB - PCE Missing Data Report ;11 Feb 04  10:10 AM
 ;;1.0;PCE;**174**;AUG 12, 1996
 ;
DATASRC ; get Data Sources to print
 N ID,REC
 K PXDS
 K DIR,DIC
 S DIR(0)="Y",DIR("A")="Would you like to include ALL Data Sources"
 S DIR("B")="YES" D ^DIR
 I $D(DIRUT) S POP=1 Q
 I Y D
 . S ID="" F  S ID=$O(^PX(839.7,"B",ID)) Q:ID=""  D
 . . S REC="" F  S REC=$O(^PX(839.7,"B",ID,REC)) Q:REC=""  D
 . . . S PXDS(REC)=ID
 . S PXDS("Unknown")=0
 E  D
 . S DIC=839.7,DIC(0)="QEAMZ",DIC("A")="Enter Data Source:  "
 . F  D ^DIC Q:$D(DTOUT)!($D(DUOUT))!(Y=-1)  S:+Y PXDS(+Y)=""
 I $D(DTOUT)!($D(DUOUT)) S POP=1
 Q
