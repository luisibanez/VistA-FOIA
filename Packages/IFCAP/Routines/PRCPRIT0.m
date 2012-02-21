PRCPRIT0 ;WISC/RFJ-display item                                     ;28 Jul 91
 ;;5.1;IFCAP;;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 D ^PRCPUSEL Q:'$G(PRCP("I"))
 N %,INVPT,ITEMDA
 S INVPT=PRCP("I") I $O(^PRCP(445,PRCP("I"),2,0))="" G ITEM
 W !!,"Enter the DISTRIBUTION POINT to select an item from the distribution point, or",!,"Enter <RETURN> to select an item from the ",PRCP("IN")," inventory point."
 S %=$$TO^PRCPUDPT(PRCP("I")) Q:%["^"  I % S INVPT=%
ITEM F  W ! S ITEMDA=$$ITEM^PRCPUITM(INVPT,0,"","") Q:'ITEMDA  D
 .   S %ZIS="Q" D ^%ZIS Q:POP  I $D(IO("Q")) D  D ^%ZTLOAD K IO("Q"),ZTSK Q
 .   .   S ZTDESC="Display Item Report",ZTRTN="DQ^PRCPRIT1"
 .   .   S ZTSAVE("PRCP*")="",ZTSAVE("ITEMDA")="",ZTSAVE("INVPT")="",ZTSAVE("ZTREQ")="@"
 .   W !!,"<*> please wait <*>"
 .   D DQ^PRCPRIT1
 Q
