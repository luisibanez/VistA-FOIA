PRCPLO ;WOIFO/RLL-days of stock on hand report ; 1/27/06 10:02am
 ;;5.1;IFCAP;**83**;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 ; Note: This routine was copied from PRCPRSOH
 ;
 Q
ENT ; Entry Point to run Program
 L +^PRCP(446.7,"STATUS"):3 I $T=0 S PRCPMSG(1)="Error encountered when attempting to run CLO GIP Reports due to other CLRS extracts in progress, please try again later." D MAIL^PRCPLO3 Q
 D PRCPRINV  ; Run the logic from PRCPRSOH, get params
 D BLDFIL  ; Build the output data
 D GETVAL  ; Set the ^DIE Entries in 446.7
 L -^PRCP(446.7,"STATUS")
 ;
 K ^TMP($J,"PRCPSOH") ;kill off tmp data
 K ^TMP($J,"PRCPLO")  ;kill off tmp data
 Q
 ;
 ;
PRCPRINV ; run INV Point
 N CLRSFLAG
 S CLRSFLAG="SOH"
 ; D ^PRCPUSEL Q:'$G(PRCP("I"))
 D GETIPT^PRCPLO1
 Q
EN1 ; Added return from PRCPLO1
 ; Q
 N DATEEND,DATEENDD,DATESTRD,DATESTRT,DAYSLEFT,DIR,GROUPALL,PRCPDAYS,PRCPEND,PRCPSTRT,PRCPTYPE,TOTALDAY,X,X1,X2,Y,MNT,TODAY
 ;
 ; K X S X(1)="The Days Of Stock On Hand Report will print a list of items which have stock on hand less than or greater than a specified number of days."
 ; D DISPLAY^PRCPUX2(40,79,.X)
 ; K X S X(1)="Select the date range which should be used for calculating the daily usage. *** Select by month & year only. ***" D DISPLAY^PRCPUX2(2,40,.X)
 ; D MONTHSEL^PRCPURS2 I '$G(DATEEND) Q
 ; *83 The following was edited to always enter the LAST DAY
 ; of the previous month as the end date. End date for Oct 31, 2005
 ; in FM 3051031, can also use 3051100 equivelent for date sort
 ; this way, you do not have to handle months w/ 28, 29, 30 or 31 days
 D NOW^%DTC S TODAY=X,Y=$E(X,1,3),MNT=$E(X,4,5)
 S MNT=+(MNT)
 S MNT=MNT-1
 I MNT=0 S MNT=12,Y=Y-1
 I $L(MNT)=1 S MNT=0_MNT
 ;
 ; *83 Added day logic to handle month/leap year, etc.
 N DAYS,CKF
 S DAYS=$P("31^28^31^30^31^30^31^31^30^31^30^31",U,+(MNT))
 S DATEEND=Y_MNT_DAYS
 I DAYS=28  D
 . S CKF=(17+$E(DATEEND))_$E(DATEEND,2,3)
 . S DAYS=$S(CKF#400=0:29,(CKF#4=0&(CKF#100'=0)):29,1:28)
 . S DATEEND=Y_MNT_DAYS
 . Q
 ; S DATEEND=Y_MNT_"00"
 ; *83 The following was edited to always enter a 90 day previous
 ; to current date of report run (check param file, could change)
 ; for the DATESTRT. Once DATEEND and DATESTRT are determined, we
 ; can use the existing code to set the other variables
 S X1=TODAY
 ; *83 Report range supplied by site parameter and defaulted to 180
 S X2=$$GET^XPAR("SYS","PRCPLO REPORT RANGE",1,"Q")
 I X2="" S X2=180
 S X2=(X2*-1)
 D C^%DTC S DATESTRT=$E(X,1,5)_"01"
 ; DATEEND and DATESTRT are set above, pass them to existing
 ; logic below to set remaining variables
 S X1=DATEEND,X2=DATESTRT D ^%DTC S TOTALDAY=X+1
 S Y=DATEEND D DD^%DT S DATEENDD=Y,Y=DATESTRT D DD^%DT S DATESTRD=Y
 ; W !?5,"-- TOTAL NUMBER OF DAYS: ",TOTALDAY
 ;  select greater or less
 ; K X S X(1)="Select the type of report: less than a specified number of days or greater than a specified number of days." D DISPLAY^PRCPUX2(2,40,.X)
 ; S DIR(0)="S^1:LESS;2:GREATER",DIR("A")="Print items with GREATER or LESS than 'X' days stock on hand",DIR("B")="LESS"
 ; D ^DIR S PRCPTYPE=+Y I 'PRCPTYPE Q
 ;*83 Set PRCPTYPE=2 (always GREATER)
 S PRCPTYPE=2
 ;
 ;  select days
 ; K X S X(1)="Select the number of days which the current stock on hand should be "_$S(PRCPTYPE=1:"LESS than",1:"GREATER than")_"." D DISPLAY^PRCPUX2(2,40,.X)
 ; S DIR(0)="N^1:365",DIR("A")="Print items with stock on hand "_$S(PRCP; TYPE=1:"less than",1:"greater than")_" DAYS",DIR("B")=30
 ; D ^DIR S PRCPDAYS=+Y I 'PRCPDAYS Q
 ;
 ;*83 PRCPDAYS is set based on value of CLRS GREATER THAN RANGE parameter
 ;if no value is presented in the parameter, it will default to 90
 ;
 S PRCPDAYS=$$GET^XPAR("SYS","PRCPLO GREATER THAN RANGE",1,"Q")
 I PRCPDAYS="" S PRCPDAYS=90
 ;
 ; W " DATESTRT ",DATESTRT," DATEEND ",DATEEND," PRCPDAYS ",PRCPDAYS,!
 ; W " DATEENDD ",DATEENDD," DATESTRD ",DATESTRD,!
 ;
 ;  whse sort
 ; I PRCP("DPTYPE")="W" D  I '$D(PRCPSTRT) Q
 ; . K X S X(1)="Select the range of NSNs to display" D DISPLAY^PRCPUX2(2,40,.X)
 ; . D NSNSEL^PRCPURS0
 ;
 ;*83 Return PRCPSTRT="" and PRCPEND=""
 I PRCP("DPTYPE")="W" D
 . S PRCPSTRT="",PRCPEND=""
 ;  prim/seco sort
 ; I PRCP("DPTYPE")'="W" D  I '$G(GROUPALL),'$O(^TMP($J,"PRCPURS1","YES",0)) W !,"*** NO GROUP CATEGORIES SELECTED !" Q
 ; . K X S X(1)="Select the Group Categories to display" D DISPLAY^PRCPUX2(2,40,.X)
 ; . D GROUPSEL^PRCPURS1(PRCP("I"))
 ;
 ;*83 RETURN GROUPALL=1 to select all groups
 I PRCP("DPTYPE")'="W" D
 .   S GROUPALL=1
 . ; finished adding variables
 ;
 ; S %ZIS="Q" D ^%ZIS Q:POP  I $D(IO("Q")) D  Q
 ; . S ZTDESC="Days of Stock On Hand Report",ZTRTN="DQ^PRCPRSOH"
 ; . S ZTSAVE("^TMP($J,""PRCPURS1"",")=""
 ; . S ZTSAVE("DATE*")="",ZTSAVE("GROUP*")="",ZTSAVE("PRCP*")="",ZTSAVE("TOTALDAY")="",ZTSAVE("ZTREQ")="@"
 ; . D ^%ZTLOAD
 ; W !!,"<*> please wait <*>"
DQ ;  queue starts here
 N AVERAGE,DATE,GROUP,GROUPNM,ITEMDA,ITEMDATA,NSN,ONHAND,TOTAL,X,Y
 K ^TMP($J,"PRCPRSOH")
 S ITEMDA=0 F  S ITEMDA=$O(^PRCP(445,PRCP("I"),1,ITEMDA)) Q:'ITEMDA  S ITEMDATA=$G(^(ITEMDA,0)) I ITEMDATA'="" D
 .   I $$REUSABLE^PRCPU441(ITEMDA) Q
 .   ;  calculate total usage between dates
 .   S DATE=$E(DATESTRT,1,5)-.01,TOTAL=0 F  S DATE=$O(^PRCP(445,PRCP("I"),1,ITEMDA,2,DATE)) Q:'DATE!(DATE>$E(DATEEND,1,5))  S TOTAL=TOTAL+$P($G(^(DATE,0)),"^",2)
 .   S AVERAGE=$J(TOTAL/TOTALDAY,0,2),ONHAND=$P(ITEMDATA,"^",7)+$P(ITEMDATA,"^",19)
 .   S DAYSLEFT=$S('AVERAGE&(ONHAND):9999999,'AVERAGE:0,1:ONHAND/AVERAGE\1)
 .   I PRCPTYPE=1,DAYSLEFT'<PRCPDAYS Q
 .   I PRCPTYPE=2,DAYSLEFT'>PRCPDAYS Q
 .   ;  sort for whse
 .   I PRCP("DPTYPE")="W" D  Q
 .   .   S NSN=$$NSN^PRCPUX1(ITEMDA) S:NSN="" NSN=" "
 .   .   I $E(NSN,1,$L(PRCPSTRT))'=PRCPSTRT,$E(NSN,1,$L(PRCPEND))'=PRCPEND I NSN']PRCPSTRT!(PRCPEND']NSN) Q
 .   .   ; S ^TMP($J,"PRCPRSOH",NSN,ITEMDA)=TOTAL_"^"_AVERAGE_"^"_ONHAND_"^"_$P(DAYSLEFT,".")_"^"_$P(ITEMDATA,"^",27)
 .   .   N ITMCHK
 .   .   S ITMCHK=0,ITMCHK=$O(^PRCP(445,PRCP("I"),1,ITMCHK))
 .   .   Q:ITMCHK=""!(+(ITMCHK)<1)
 .   .   Q:+(ITMCHK)<1  ; made it to x-ref
 .   .   D BLDTMP
 .   ;  sort for primary and secondary
 .   S GROUP=+$P(ITEMDATA,"^",21)
 .   I 'GROUP,'$G(GROUPALL) Q
 .   I $G(GROUPALL),$D(^TMP($J,"PRCPURS1","NO",GROUP)) Q
 .   I '$G(GROUPALL),'$D(^TMP($J,"PRCPURS1","YES",GROUP)) Q
 .   S GROUPNM=$$GROUPNM^PRCPEGRP(GROUP)
 .   I GROUPNM'="" S GROUPNM=$E(GROUPNM,1,20)_" (#"_GROUP_")"
 .   S:GROUPNM="" GROUPNM=" "
 .   ;*83,  Create TMP structure for Report
 .   N ITMCHK
 .   S ITMCHK=0,ITMCHK=$O(^PRCP(445,PRCP("I"),1,ITMCHK))
 .   ;
 .   Q:ITMCHK=""!(+(ITMCHK)<1)
 .   Q:ITMCHK<1  ; made it to x-ref
 .   D BLDTMP
 .   Q
 Q
 ;
BLDTMP ;*83 Build ^TMP Structure for Report Server
 ;
 N INVTYPE,ITEMDESC,CSTCTR,INDAT,NUMLNIT,DATRN,DATRN1,INVPTID
 N CSTC1,CSTC2,CSTC3,CSCE1,CSCE2,V4TR,V4TR1
 ;
 S DATRN=$$FMTE^XLFDT(+DATEEND)
 S DATRN1=$P(DATRN," ",1)_","_$P(DATRN," ",3)
 S ITEMDESC=$E($$DESCR^PRCPUX1(PRCP("I"),ITEMDA),1,15)  ; item Desc
 I ITEMDESC="" S ITEMDESC="No Item Desc"
 Q:ITEMDA=""!(+(ITEMDA)<1)
 ;
 S NUMLNIT=1  ; set to 1 for each line item.
 S INVTYPE=PRCP("DPTYPE")
 I INVTYPE="" S INVTYPE="No Inv Type"
 S INDAT=$G(PRCP("PAR"))
 S INVPTID=PRCP("I")  ; inv point id #
 ; Cost Center logic
 ; Get ^PRCP(445,INVPTID,0) 7th piece (int. Cost Center #)
 ; Get ^PRCD(420.1,IntCstCtr,0) 1st piece (external format)
 S CSTC1=$G(^PRCP(445,INVPTID,0)),CSTC2=$P(CSTC1,"^",7),CSTC3=$P(CSTC1,"^",3)
 S V4TR=$P(CSTC1,"^",1),V4TR1=$P(V4TR,"-",2,99)  ; *83 look up name
 S V4TR1=$TR(V4TR1,"*","|")  ; $TR name to replace "*"'s with "|"'s
 I CSTC2'="" S CSCE1=$G(^PRCD(420.1,CSTC2,0)),CSCE2=$P(CSCE1,"^",1)
 I CSTC2="" S CSCE2="No Cost Center"
 ; *83, Set 5th Node from ITEMDESC to ITEMDA
 S ^TMP($J,"PRCPLO",V3,INVPTID,ITEMDA)=V3_"*"_DATRN1_"*"_INVPTID_"*"_V4TR1_"*"_NUMLNIT_"*"_$P(ITEMDATA,"^",27)_"*"_CSCE2_"*"_INVTYPE
 Q
BLDFIL ; Build output file
 N IN1,IN2,IN3,IN4,IN5,OLPV,NWPV,INDDAT,TOTDOL,LNDOL,CSTCTR,LNCT,PRCPDX,INPTVAL,POINT,STID,DTTM,INVVTYP,INVPTLN
 S IN1=0,IN2=0,IN3=0,IN4=0,IN5="INVPT",INDDAT=0,OLPV=0,NWPV=0,LNCT=0,CSTCTR=0,TOTDOL=0,LNDOL=0,INVPTLN=0
 F  S IN1=$O(^TMP($J,"PRCPLO",IN1)) Q:IN1=""  D
 . F  S IN2=$O(^TMP($J,"PRCPLO",IN1,IN2)) Q:IN2=""  D
 . . I IN5'="INVPT"  D  ; init for first time through
 . . . S INVPTLN=+$P($G(^PRCP(445,+INPTVAL,1,0)),"^",4)
 . . . S PRCPDX=STID_"*"_DTTM_"*"_INPTVAL_"*"_POINT_"*"_INVVTYP_"*"_TOTDOL_"*"_IN4_"*"_INVPTLN_"*"_CSTCTR
 . . . ; set up new ^TMP($J NODE to store totals for ^DIE set
 . . . S ^TMP($J,"PRCPSOH",+(STID_INPTVAL))=PRCPDX
 . . . S IN4=0  ; reset to 0, begin counting Line items for INVPT
 . . . S TOTDOL=0
 . . . S LNDOL=0
 . . . S PRCPDX=""
 . . . S CSTCTR=""
 . . F  S IN3=$O(^TMP($J,"PRCPLO",IN1,IN2,IN3)) Q:IN3=""  D
 . . . S INDDAT=$G(^TMP($J,"PRCPLO",IN1,IN2,IN3))
 . . . S STID=$P(INDDAT,"*",1)
 . . . S DTTM=$P(INDDAT,"*",2)
 . . . S POINT=$P(INDDAT,"*",4)
 . . . S INPTVAL=$P(INDDAT,"*",3)  ; Inv Point ID# for DIE Set
 . . . S CSTCTR=$P(INDDAT,"*",7)
 . . . S LNDOL=$P(INDDAT,"*",6)
 . . . S INVVTYP=$P(INDDAT,"*",8)
 . . . S TOTDOL=TOTDOL+LNDOL
 . . . S IN4=IN4+1  ; Count # of line items in Inv Pt
 . . . S IN5=IN2  ; Invt. Point
 . . . Q
 . . Q
 . Q
 Q
GETVAL ; Get values from ^TMP($J,"PRCPSOH"
 N LP1,SOHIEN,PRCPDX
 S LP1=0
 F  S LP1=$O(^TMP($J,"PRCPSOH",LP1)) Q:LP1=""  D
 . S PRCPDX=$G(^TMP($J,"PRCPSOH",LP1))
 . S SOHIEN=+LP1
 . D SETREC
 . Q
 Q
SETREC ; Set record using DIE in 446.7
 ;
 S DIC="^PRCP(446.7,",DIC(0)="L",DLAYGO=446.7,X=SOHIEN D ^DIC K DIC,DLAYGO
 ; Send mail message if exception occurs during FileMan set
 I Y=-1 N PRCPMSG S PRCPMSG(1)="Error saving to File #446.7 - please contact IRM." D MAIL^PRCPLO3 Q
 S PRCPDA=Y+0
 S DIE="^PRCP(446.7,",DA=PRCPDA,DR="1///"_PRCPDX D ^DIE K DIE,DR,DA,PRCPDA,PRCPDX
 Q
