PRCPLO2A ;WOIFO/DAP-stock status report (cont) ; 1/26/06 12:00pm
V ;;5.1;IFCAP;**83**;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
ENT ;*83 Building ^TMP with total result data, totalling logic pulled from PRCPRSS0
 N PRCPIN,PRCPIN1,PRCPIN2,PRCPIN3,TOTVAL
 S U="^",STA=PRC("SITE"),INV=PRCP("I")
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,1)=STA ;Station #
 S DATRN=$$FMTE^XLFDT(DATESTRT)
 S DATRN1=$P(DATRN," ",1)_","_$P(DATRN," ",2)
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,2)=DATRN1 ;Date Range
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,3)=INARNG ;Inactivity Range
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,4)=INV ;Inventory Point #
 ;*83 Retrieve external inventory point name and primary/secondary/
 ;warehouse indicator
 S PRCPIN=$G(^PRCP(445,INV,0))
 I PRCPIN'="" S PRCPIN1=$P(PRCPIN,"^",1),PRCPIN2=$P(PRCPIN1,"-",2,99)
 I PRCPIN'="" S PRCPIN3=$P(PRCPIN,"^",3)
 I PRCPIN="" S PRCPIN2="",PRCPIN3=""
 S PRCPIN2=$TR(PRCPIN2,"*","|")  ; Needed due to "*" delimiter
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,5)=PRCPIN2 ;Inventory Point Name
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,6)=PRCPIN3 ;P/S/W Indicator
 S TOTOPEN=0 F ACCT=1,2,3,6,8 S %=$P($G(OPEN(ACCT)),U,2),TOTOPEN=TOTOPEN+%
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,7)=TOTOPEN ;Open Balance Total $
 S TOTREC=0 F ACCT=1,2,3,6,8 S %=$G(REC(ACCT)),OPEN(ACCT)=$G(OPEN(ACCT))+%,TOTREC=TOTREC+%
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,8)=TOTREC ;Receipts Total $
 S TOTISS=0 F ACCT=1,2,3,6,8 S %=$G(ISS(ACCT)),OPEN(ACCT)=$G(OPEN(ACCT))+%,TOTISS=TOTISS+%
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,9)=TOTISS ;Issues Total $
 S TOTADJ=0 F ACCT=1,2,3,6,8 S %=$G(ADJ(ACCT)),OPEN(ACCT)=$G(OPEN(ACCT))+%,TOTADJ=TOTADJ+%
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,10)=TOTADJ ;Adjustments Total $
 S TOTCLOS=0 F ACCT=1,2,3,6,8 S %=$G(OPEN(ACCT)),TOTCLOS=TOTCLOS+%
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,11)=TOTCLOS ;Closing Balance Total $
 S RECNM=0 F ACCT=1,2,3,6,8 S %=$G(RECN(ACCT)),RECNM=RECNM+%,TOTN(ACCT)=%
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,12)=RECNM ;# Receipts
 S TOTIS1=0 F ACCT=1,2,3,6,8 S %=$G(ISSN(ACCT)),TOTIS1=TOTIS1+%,TOTN(ACCT)=$G(TOTN(ACCT))+%
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,13)=TOTIS1 ;# Issues
 S TOTAD1=0 F ACCT=1,2,3,6,8 S %=$G(ADJN(ACCT)),TOTAD1=TOTAD1+%,TOTN(ACCT)=$G(TOTN(ACCT))+%
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,14)=TOTAD1 ;# Adjustments
 ;*83 Turnover computation logic also pulled from PRCPRSS0
 S DAYS=$P("31^28^31^30^31^30^31^31^30^31^30^31",U,+$E(DATESTRT,4,5))
 I DAYS=28 S %=(17+$E(DATESTRT))_$E(DATESTRT,2,3),DAYS=$S(%#400=0:29,(%#4=0&(%#100'=0)):29,1:28)
 F ACCT=1,2,3,6,8 S %=($G(ISS(ACCT))*365)/DAYS,%=$S('$G(OPEN(ACCT)):0,1:-%/OPEN(ACCT))
 ;*83 Adjusted presentation logic to remove padding
 ;
 I $P(%,".",2) S %=$P(%,".",1)_"."_$E($P(%,".",2),1,2)
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,15)=% ;Turnover
 ;
 S TOTVAL=0,%=0
 F ACCT=1,2,3,6,8 I '$D(VALUE(ACCT)) S VALUE(ACCT)=0
 F ACCT=1,2,3,6,8 S %=$G(VALUE(ACCT)),TOTVAL=TOTVAL+%
 ;
 S TOTINA=0 F ACCT=1,2,3,6,8 S %=$G(INACTN(ACCT)),TOTINA=TOTINA+%
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,16)=TOTINA ;# Inactive
 S TOTIND=0 F ACCT=1,2,3,6,8 S %=$G(INACT(ACCT)),TOTIND=TOTIND+%
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,17)=TOTIND ;Inactive Total $
 F ACCT=1,2,3,6,8 S %=$G(VALUE(ACCT)),%=$S('%:0,1:$G(INACT(ACCT))/%)
 S %=$S('TOTVAL:0,1:TOTIND/TOTVAL)
 ;*83 Adjusted presentation logic to remove padding
 ;
 I $P(%,".",2) S %=$P(%,".",1)_"."_$E($P(%,".",2),1,2)
 I %="" S %=0
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,18)=% ;Inactive %
 S TOTLNG=0 F ACCT=1,2,3,6,8 S %=$G(LONGN(ACCT)),TOTLNG=TOTLNG+%
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,19)=TOTLNG ;# Long Supply
 S TOTLND=0 F ACCT=1,2,3,6,8 S %=$G(LONG(ACCT)),TOTLND=TOTLND+%
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,20)=TOTLND ;Long Supply Total $
 F ACCT=1,2,3,6,8 S %=$G(VALUE(ACCT)),%=$S('%:0,1:$G(LONG(ACCT))/%)
 S %=$S('TOTVAL:0,1:TOTLND/TOTVAL)
 ;*83 Adjusted presentation logic to remove padding
 I $P(%,".",2) S %=$P(%,".",1)_"."_$E($P(%,".",2),1,2)
 I %="" S %=0
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,21)=% ;Long Supply %
 ; *83 Added Total Number of InvPt Items
 N INVPTLN
 S INVPTLN=+$P($G(^PRCP(445,+INV,1,0)),"^",4)
 S $P(^TMP($J,"PRCPRSSR",STA,INV),U,22)=INVPTLN  ;tot # line items
 N SSRIEN
 S SSRIEN=STA_INV
 S DIC="^PRCP(446.7,",DIC(0)="L",DLAYGO=446.7,X=SSRIEN D ^DIC K DIC,DLAYGO
 ;*83 Sends mail message to mail group indicating success or failure of the extract.
 I Y=-1 N PRCPMSG S PRCPMSG(1)="Error saving to File #446.7 for Stock Status Report - please contact IRM." D MAIL^PRCPLO3 Q
 S PRCPDA=Y+0
 S PRCPDX=$TR(^TMP($J,"PRCPRSSR",STA,INV),"^","*")
 S DIE="^PRCP(446.7,",DA=PRCPDA,DR="2///"_PRCPDX D ^DIE K DIE,DR,DA,PRCPDA,PRCPDX
 ;
 Q
