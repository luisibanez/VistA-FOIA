AUM9406 ; DSD/GTH - STANDARD TABLE UPDATES, 06JUN94 BANYAN ; [ 06/06/94  12:58 PM ]
 ;;94.1;TABLE MAINTENANCE;**5**;DECEMBER 15, 1993
 ;
 I '$G(DUZ) W !,"DUZ UNDEFINED OR ZERO.",! Q
 D HOME^%ZIS,DT^DICRW,INTRO
 S (DIR(0),DIR("B"))="Y"
 S DIR("A")="Do you want to queue the utility to TaskMan"
 S DIR("??")="^D Q2^AUM9406"
 D ^DIR G Q2:$D(DIRUT),START:'Y
QUE ;
 S %DT="AERSX",%DT("A")="Requested Start Time: ",%DT("B")="T@2015",%DT(0)="NOW" D ^%DT
 I Y<1 W !,"QUEUE INFORMATION MISSING - NOT QUEUED",!!,"Okay...",! D Q2 Q
 S X=+Y D H^%DTC S ZTDTH=%H_","_%T
 S ZTRTN="START^AUM9406",ZTIO="",ZTDESC=$P($P($T(+1),";",2)," ",4,99)
 D ^%ZTLOAD,HOME^%ZIS
 I $D(ZTSK) W !!,"QUEUED TO TASK ",ZTSK,!!,"A mail message with the results will be sent to your MailMan 'IN' basket.",!
 E  W !!,*7,"QUEUE UNSUCCESSFUL.  RESTART UTILITY."
 Q
START ;EP - From Taskman
 ;
 NEW XMSUB,XMDUZ,XMTEXT,XMY
 K ^TMP($J)
 D START^AUM94061,START^AUM94062
 S (XMSUB,XMDUZ)=$P($P($T(+1),";",2)," ",4,99),XMTEXT="^TMP($J,""RSLT"",",XMY(1)="",XMY(DUZ)="" D ^XMD
 K ^TMP($J)
 I $D(ZTQUEUED) S ZTREQ="@"
 E  W !!,"The results are in your MailMan 'IN' basket.",!
 Q
 ;
INTRO ;
 W ! F %=2:1:5 W ?5,$P($T(INTRO+%),";;",2),!
 ;;This patch updates standard tables according to the changes
 ;;specified in the Banyan message time stamped 06Jun94@10:51:23 MDT,
 ;;Please consult that memo, and the mail message produced by this
 ;;utility.
 Q
Q2 ;EP - From DIR
 W ! F %=2:1:7 W ?5,$P($T(Q2+%),";;",2),!
 ;;Answer "Y" if you want to queue this standard table update to TaskMan.
 ;;Answer "N" if you want to run this update interactively.
 ;;
 ;;If you run interactively, results will be displayed on your screen,
 ;;as well as in the mail message sent to you and user 1.  If you queue
 ;;to TaskMan, please read the mail message for results of this patch.
 Q
