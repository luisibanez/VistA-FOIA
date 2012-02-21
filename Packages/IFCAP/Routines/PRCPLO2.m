PRCPLO2 ;WISC/RFJ/dh/DWA/DAP-stock status report (option, whse) ;3.13.98
 ;;5.1;IFCAP;**83,41**;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 ;Copied from routine ^PRCPRSSR and modified for PRC*5.1*83 (CLRS)
 ;
ENT ;This report will be called from option PRCPLO CLO GIP OPTION with fixed
 ;input parameters and run for all stations and active inventory points
 ;on a given VistA system.
 ;D ^PRCPUSEL Q:'$D(PRCP("I"))
 L +^PRCP(446.7,"STATUS"):3 I $T=0 S PRCPMSG(1)="Error encountered when attempting to run CLO GIP Reports due to other",PRCPMSG(2)="CLRS extracts in progress, please try again later." D MAIL^PRCPLO3 Q
 K ^PRCP(446.7)
 S ^PRCP(446.7,0)="CLRS REPORT STORAGE^446.7^^"
 N CLRSFLAG
 S CLRSFLAG="SS" D GETIPT^PRCPLO1
 ;*83 This call links the Stock on Hand Report in a series of two
 ;consecutive report runs to be executed on the 1st of each month.
 L -^PRCP(446.7,"STATUS")
 D ENT^PRCPLO
 N PRCPMSG S PRCPMSG(1)="CLO GIP Reports completed on "_$$HTE^XLFDT($H) D MAIL^PRCPLO3
 Q
 ;
EN1 ;*83 Call coming in from PRCPLO1 with station number and inventory point
 ;
 N %,%DT,%H,%I,DATEINAC,DATESTRT,TODAY,X,X1,X2,Y,MNT,INARNG
 ;K X S X(1)="The Stock Status Report will print a summary of all issues, receipts, and adjustments with the opening and closing balances by account codes."
 ;S X(2)="It will calculate the turnover rate, inactive item percent, long supply percent, and non-issuable percent."
 ;D DISPLAY^PRCPUX2(40,79,.X)
 ;K X S X(1)="Enter the date (month-year) for the Stock Status Report." D DISPLAY^PRCPUX2(2,40,.X)
 ;*83 The following was edited to always enter the previous month as the start date
 D NOW^%DTC S TODAY=X,Y=$E(X,1,3),MNT=$E(X,4,5)
 S MNT=MNT-1
 I MNT=0 S MNT=12,Y=Y-1
 I $L(MNT)=1 S MNT=0_MNT
 S DATESTRT=Y_MNT_"00"
 ;S %DT(0)=-Y D DD^%DT S %DT="AEP",%DT("B")=Y,%DT("A")="Print Stock Status for MONTH and YEAR: " D ^%DT K %DT I Y<1 Q
 ;S DATESTRT=$E(Y,1,5)_"00"
 ;K X S X(1)="The inactive item percent is calculated for items which have not had activity (receipts or issues) after a specified cutoff date." D DISPLAY^PRCPUX2(40,79,.X)
 ;K X S X(1)="Enter the Inactivity cutoff date." D DISPLAY^PRCPUX2(2,40,.X)
 ;*83 The following was edited to always enter a 90 day previous to 
 ;current date default inactivity range if no other is indicated via the
 ;PRCPLO INACTIVITY RANGE parameter
 S INARNG=$$GET^XPAR("SYS","PRCPLO INACTIVITY RANGE",1,"Q")
 I INARNG="" S INARNG=90
 S X1=TODAY,X2=(INARNG*-1) D C^%DTC S DATEINAC=$E(X,1,5)_"00"
 S DT=TODAY
 ;D DD^%DT
 ;S %DT(0)=-($E(TODAY,1,5)_"00"),%DT="AEP",%DT("B")=Y,%DT("A")="Enter Inactivity Cutoff MONTH and YEAR: " D ^%DT K %DT I Y<1 Q
 ;S DATEINAC=$E(Y,1,5)_"00"
 ;W ! S %ZIS="Q" D ^%ZIS Q:POP  I $D(IO("Q")) D  D ^%ZTLOAD K IO("Q"),ZTSK Q
 ;.   S ZTDESC="Stock Status Report",ZTRTN="DQ^PRCPRSSR"
 ;.   S ZTSAVE("PRCP*")="",ZTSAVE("DATE*")="",ZTSAVE("ZTREQ")="@"
 ;W !!,"<*> please wait <*>"
 ;*83 Build report with station and inventory point passed in from PRCPLO1 call
DQ ;  queue starts here
 N ACCT,ADJ,ADJN,AVERAGE,D,DA,DATE,DATELONG,DUEIN,DUEOUT,INACT,INACTN,INVVAL,ISS,ISSN,ITEMDA,LONG,LONGN,NONISS,NONISSN,ONHAND,OPEN,QTY,REC,RECN,TOTAL,TOTDAYS,TRANSNO,TYPE,VALUE
 ;*83 Added newing of variables
 N STA,INV,TOTOPEN,TOTREC,TOTISS,TOTADJ,TOTCLOS,RECNM,TOTN,DATRN,TOTINA,TOTIS1,TOTAD1,TOTIND,TOTLNG,TOTLND,DAYS,DATRN1
 ;
 K OPEN
 S ITEMDA=0 F  S ITEMDA=$O(^PRCP(445.1,PRCP("I"),1,ITEMDA)) Q:'ITEMDA  S X=$$GETOPEN^PRCPUBAL(PRCP("I"),ITEMDA,$E(DATESTRT,1,5)) I X'="" D
 .   S ACCT=$$ACCT1^PRCPUX1($$FSC^PRCPUX1(ITEMDA))
 .   S $P(OPEN(ACCT),"^")=$P($G(OPEN(ACCT)),"^")+$P(X,"^",2)+$P(X,"^",3)
 .   S $P(OPEN(ACCT),"^",2)=$P($G(OPEN(ACCT)),"^",2)+$P(X,"^",8)
 S DATE=DATESTRT F  S DATE=$O(^PRCP(445.2,"AX",PRCP("I"),DATE)) Q:$E(DATE,1,5)'=$E(DATESTRT,1,5)  S TYPE="" F  S TYPE=$O(^PRCP(445.2,"AX",PRCP("I"),DATE,TYPE)) Q:TYPE=""  D
 .   S DA=0 F  S DA=$O(^PRCP(445.2,"AX",PRCP("I"),DATE,TYPE,DA)) Q:'DA  D
 .   .   S D=$G(^PRCP(445.2,DA,0)) I '$P(D,"^",5) Q
 .   .   ;  non-issuable
 .   .   Q:$P(D,"^",11)="N"  ;count if not flagged as non-issueable
 .   .   S ACCT=$$ACCT1^PRCPUX1($$FSC^PRCPUX1($P(D,"^",5)))
 .   .   S TRANSNO=$P(D,"^",19)
 .   .   S INVVAL=$P(D,"^",7)*$P(D,"^",8) I $P(D,"^",22)'="" S INVVAL=$P(D,"^",22)
 .   .   ;  set transno temporary for primary and secondary to
 .   .   ;  indicate type of transaction
 .   .   I PRCP("DPTYPE")'="W" D
 .   .   .   I TYPE="R"!(TYPE="C")!(TYPE="E")!(TYPE="U")!(TYPE="S") S TRANSNO="--1" Q  ;issue
 .   .   .   I TYPE="RC" S TRANSNO=1 Q  ;receipt
 .   .   .   S TRANSNO="" ;adjustment
 .   .   ;  other adjustments
 .   .   I PRCP("DPTYPE")="W",$P(TRANSNO,"-",2)="" S ADJ(ACCT)=$G(ADJ(ACCT))+INVVAL,ADJN(ACCT)=$G(ADJN(ACCT))+1 Q
 .   .   I TRANSNO="" S ADJ(ACCT)=$G(ADJ(ACCT))+INVVAL,ADJN(ACCT)=$G(ADJN(ACCT))+1
 .   .   E  D
 .   .   .   ;  purchase order
 .   .   .   I $P(TRANSNO,"-",3)="" S REC(ACCT)=$G(REC(ACCT))+INVVAL,RECN(ACCT)=$G(RECN(ACCT))+1 Q
 .   .   .   ;  issue
 .   .   .   S ISS(ACCT)=$G(ISS(ACCT))+INVVAL,ISSN(ACCT)=$G(ISSN(ACCT))+1
 ;  calculate inactive, long supply, set non-issuable
 S X1=$E(DT,1,5)_"01",X2=-89 D C^%DTC S DATELONG=$E(X,1,5),X1=DT,X2=$E(X,1,5)_"00" D ^%DTC S TOTDAYS=X
 S ITEMDA=0 F  S ITEMDA=$O(^PRCP(445,PRCP("I"),1,ITEMDA)) Q:'ITEMDA  S D=$G(^(ITEMDA,0)) I D'="" D
 .   S ACCT=$$ACCT1^PRCPUX1($$FSC^PRCPUX1(ITEMDA))
 .   ;  value
 .   S VALUE(ACCT)=$G(VALUE(ACCT))+$P(D,"^",27)
 .   S DUEIN(ACCT)=$G(DUEIN(ACCT))+($$GETIN^PRCPUDUE(PRCP("I"),ITEMDA)*$P(D,"^",22))
 .   S DUEOUT(ACCT)=$G(DUEOUT(ACCT))+($$GETOUT^PRCPUDUE(PRCP("I"),ITEMDA)*$P(D,"^",22))
 .   ;  non-issuable
 .   I $P(D,"^",19) S NONISS(ACCT)=$G(NONISS(ACCT))+($J($P(D,"^",19)*$P(D,"^",22),0,2)),NONISSN(ACCT)=$G(NONISSN(ACCT))+1
 .   ;  inactive
 .   ;  if reusable, quit
 .   I $$REUSABLE^PRCPU441(ITEMDA) Q
 .   S QTY=$P(D,"^",7)+$P(D,"^",19)
 .   I QTY,'$O(^PRCP(445,PRCP("I"),1,ITEMDA,2,$E(DATEINAC,1,5)-.01)),'$O(^PRCP(445,PRCP("I"),1,ITEMDA,3,DATEINAC)) S INACT(ACCT)=$G(INACT(ACCT))+$P(D,"^",27),INACTN(ACCT)=$G(INACTN(ACCT))+1
 .   ;  long supply
 .   S DATE=DATELONG-.01,TOTAL=0 F  S DATE=$O(^PRCP(445,PRCP("I"),1,ITEMDA,2,DATE)) Q:'DATE  S TOTAL=TOTAL+$P($G(^(DATE,0)),"^",2)
 .   S AVERAGE=$J(TOTAL/TOTDAYS,0,2),TOTAL=$S('AVERAGE&(QTY):9999999,'AVERAGE:0,1:QTY/AVERAGE\1)
 .   I TOTAL>270 S LONG(ACCT)=$G(LONG(ACCT))+$P(D,"^",27),LONGN(ACCT)=$G(LONGN(ACCT))+1
 ;
 D ENT^PRCPLO2A
 ;
 Q
