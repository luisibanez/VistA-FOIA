PRCH3A ;WISC/PLT-IFCAP INACTIVATE EXPIRED PURCHASE CARDS ;8/28/98  11:49
V ;;5.1;IFCAP;**8**;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 QUIT  ;invalid entry
 ;
 ;ZTQPARAM="REGULAR" if from schedule option, ="RMNB" if from ROCKY BANK schedule
EN ;inactivate charge cards
 N PRCA,PRCB,PRCQCD,PRCOPT,PRCRI,PRCDI,PRCDUZ,PRC,PRCDES,PTCTD
 N A,B,C
 S PRCF("X")="S" D ^PRCFSITE Q:'$D(PRC("SITE"))  Q:$G(X)="^"
 I $D(ZTQUEUED) G SCHED
Q1 ;inactivate all charge cards with expired date before t
 S PRCTD=$E(DT,4,5)_"/"_$E(DT,6,7)_"/"_$E(DT,2,3)
 D YN^PRC0A(.X,.Y,"Ready to inactivate expired charge cards before "_PRCTD,"O","NO")
 I X["^"!(X="")!'Y G EXIT
 D NOW^%DTC S ZTDTH=%
 S %ZIS("B")="Q",ZTIO=""
 S ZTRTN="SCHED^PRCH3A",ZTDESC="IFCAP INACTIVATION OF EXPIRED CHARGE CARDS",ZTSAVE("*")=""
 D ^%ZTLOAD
 W !! D EN^DDIOL("  IFCAP INACTIVATION OF EXPIRED CHARGE CARDS WAS SCHEDULED WITH TASK # "_ZTSK)
 D HOME^%ZIS
EXIT QUIT
 ;
 ;
 D EDIT^PRC0B(.X,PRCDI,"4;5;6")
 ;
SCHED ;inactivate expired charge card with date before zdt (today)
 N PRCRI,PRCA,PRCB,PRCC
 S PRCRI=0
 F  S PRCRI=$O(^PRC(440.5,PRCRI)) QUIT:PRCRI'?1N.N!'PRCRI  S PRCA=$G(^(PRCRI,0)),PRCB=$G(^(2)) D:$P(PRCB,"^",2)'="Y"
 . I $D(PRC("SITE")) Q:$P($G(PRCB),"^",3)'=PRC("SITE")
 . S PRCC=""
 . I PRCA?1"4716".E S PRCC="Y"
 . I PRCC="",$P(PRCB,"^",4),$P(PRCB,"^",4)<DT S PRCC="Y"
 . I PRCC="Y" S X="" D EDIT^PRC0B(.X,"440.5;^PRC(440.5,;"_PRCRI,"14///^S X=""Y""")
 . QUIT
 QUIT
