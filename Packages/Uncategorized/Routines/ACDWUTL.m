ACDWUTL ;IHS/ADC/EDE/KML - UTL CODE 10:19;
 ;;4.1;CHEMICAL DEPENDENCY MIS;;MAY 11, 1998
 ;
F ;EP Form feed
 ;//^ACDWRP*
 ;//^ACDWCD*
 K DIR,DUOUT I '$D(ZTQUEUED),$E(IOST)="C" S DIR("A")="Press <ret> to continue",DIR(0)="E" D ^DIR
 I $D(DIRUT) W @IOF Q
 ;
 ;-----------------------------------------------
 ;I $D(DIRUT) D  S $ZT="CTRLC^ZU" S X=1/0
 ;I $D(DIRUT) D  D ^%G G REST^XQ12
 ;I $D(DIRUT) D  D UNWIND S $ZT="CTRLC^ZU" S X=1/0
 ;. I $D(ACDWDRV(1)) D EOJ^ACDWDRV1 Q
 ;. I $D(ACDWDRV(2)) D EOJ^ACDWDRV2 Q
 ;. I $D(ACDWDRV(3)) D EOJ^ACDWDRV3 Q
 ;. I $D(ACDWDRV(4)) D EOJ^ACDWDRV4 Q
 ;. I $D(ACDWDRV(5)) D EOJ^ACDWDRV5 Q
 ;. Q
 ;------------------------------------------------
 ;
 I $D(ACDWDRV(1)) D H^ACDWDRV1 Q
 I $D(ACDWDRV(2)) D H^ACDWDRV2 Q
 I $D(ACDWDRV(3)) D H^ACDWDRV3 Q
 I $D(ACDWDRV(4)) D H^ACDWDRV4 Q
 I $D(ACDWDRV(5)) D H^ACDWDRV5 Q
 Q
 ;
UNWIND ;
 LOCK  ;Unlock any locks
 I $D(^XUTL("XQ",$J,"T")) S %XQEA=^("T") S ^("T")=%XQEA-1 F %XQEA1=%XQEA I $D(^XUTL("XQ",$J,%XQEA1)),$P(^(%XQEA1),U,16) S %XQEA2=+^(%XQEA1) I $D(^DIC(19,%XQEA2,15)),$L(^(15)) X ^(15) ;Unwind Exit Action
 ;I $D(^XUTL("XQ",$J,"T")) S %XQEA=^("T") F %XQEA1=%XQEA,%XQEA-1 I $D(^XUTL("XQ",$J,%XQEA1)),$P(^(%XQEA1),U,16) S %XQEA2=+^(%XQEA1) I $D(^DIC(19,%XQEA2,15)),$L(^(15)) X ^(15) ;Unwind Exit Action
 K %XQEA,%XQEA1,%XQEA2
 Q
 ;
C ;EP Bld combo drug list for report 3 ,51
 ;//^ACDWDRV1
 ;//^ACDWDRV2
 S (ACDLIST,ACDPP)="" F  S ACDPP=$O(ACDDTA(ACDPP)) Q:ACDPP=""  S:ACDLIST="" ACDLIST=$P(ACDPP,"=") S:ACDLIST'=""&($P(ACDPP,"=")'[ACDLIST) ACDLIST=ACDLIST_" - "_$P(ACDPP,"=")
 I ACDLIST'="",ACDLIST["-" D SLIST S ^TMP("CDMIS",$J,ACDLIST,ACDDFNP)=""
 Q
 ;
C1 ;EP build combo problem list for reports 7. 64
 ;//^ACDWDRV1
 ;//^ACDWDRV2
 S (ACDLIST,ACDPP)="" F  S ACDPP=$O(ACDPTA(ACDPP)) Q:ACDPP=""  S:ACDLIST="" ACDLIST=$P(ACDPP,"=") S:ACDLIST'=""&($P(ACDPP,"=")'[ACDLIST) ACDLIST=ACDLIST_" - "_$P(ACDPP,"=")
 I ACDLIST'="",ACDLIST["-" D SLIST S ^TMP("CDMIS",$J,ACDLIST,ACDDFNP)=""
 Q
 ;
SLIST ;Sort list
 K ACDLA F ACDL=1:1:$L(ACDLIST," - ") S ACDLA($P(ACDLIST," - ",ACDL))=""
 S ACDLIST="" F ACDL=0:0 S ACDL=$O(ACDLA(ACDL)) Q:'ACDL  S:ACDLIST="" ACDLIST=ACDL S:ACDLIST'=""&(ACDL'[ACDLIST) ACDLIST=ACDLIST_" - "_ACDL
 S ACDL="" F  S ACDL=$O(ACDLA(ACDL)) Q:ACDL=""  I 'ACDL S:ACDLIST="" ACDLIST=ACDL S:ACDLIST'=""&(ACDL'[ACDLIST) ACDLIST=ACDLIST_" - "_ACDL
 Q
 ;
HV ;EP set hdr vars
 ;//^ACDWDRV*
 S:'$D(ACDH(1)) $P(ACDH(1),"=",79)="="
 S ACDH(2)=$$DD^ACDFUNC(ACDFR)_" THROUGH "_$$DD^ACDFUNC(ACDTO)
 S ACDH(3)=0
 S ACDH(4)=$P(^VA(200,DUZ,0),U)_"@"_ACDSITE_$S($E(ACD6DIG)=9:"-HQ",$E(ACD6DIG,3,4)="00":"-AREA",1:"-FACILITY")
 D NOW^%DTC S Y=$$DD^ACDFUNC(%) S ACDH(4)="PRINTED: "_Y_" BY: "_ACDH(4)
 S ACDH(6)="UNIQ CLI"
 S ACDH(7)="#VISITS"
 S ACDH(8)="AVE V/C"
 S ACDH(9)="CONTACT TYPE"
 S ACDH(10)="ACTUAL PLACEMENT"
 S ACDH(11)="RECOMMENDED PLACEMENT"
 S ACDH(12)="AVE DAYS USED DRUGS"
 S ACDH(13)="AVERAGE DAYS USED ALCHOHOL"
 S ACDH(14)="DIFFERENCE REASON"
 S ACDH(15)="#SERVED"
 S ACDH(16)="LOCATION"
 S ACDH(17)="TARGET"
 S ACDH(18)="OUTCOME"
 S ACDH(19)="ACTIVITY"
 S ACDH(20)="COMPONENT/TYPE"
 S ACDH(21)="AGE RANGE"
 S ACDH(22)="AVE NS/V"
 S ACDH(50)="SEARCH CRITERIA IS: "
 S ACDH(51)="PRIMARY PROBLEM"
 S ACDH(52)="OTHER PROBLEM"
 S ACDH(53)="SEX"
 S ACDH(54)="COMPONENT"
 S ACDH(55)="COMPONENT/CODE TYPE"
 S ACDH(56)="AVE CLIENT STAGE"
 S ACDH(57)="AVE ARREST PER CLIENT"
 S ACDH(58)="AVE DAYS PER CLIENT"
 S ACDH(59)="UNIQ CLI"
 S ACDH(60)="ARRESTS"
 S ACDH(61)="TOTAL HOSPITAL DAYS"
 Q
 ;
ASF ;EP Print user selection criteria
 ;;//^ACDWDRV*
 ;
 ;Stop if report page is > than 1 (only prnt on page 1)
 I ACDH(3)>1 Q
 ;
 K ACD3 W !
 I $D(ACDFAC),'$D(ACDFAC("*ALL*")) W !,"YOUR SELECTED FACILITIES ARE: " S ACD="" F  S ACD=$O(ACDFAC(ACD)) Q:ACD=""  S ACDLDA=$O(^AUTTLOC("C",ACD,0)) I ACDLDA S ACDP=$P(^AUTTLOC(ACDLDA,0),U,2)_$S(ACDFAC(ACD):"@"_ACDFAC(ACD),1:"") D ACDP
 I $D(ACDAREA),'$D(ACDAREA("*ALL*")) W !,"YOUR SELECTED AREAS ARE: " S ACD="" F  S ACD=$O(ACDAREA(ACD)) Q:ACD=""  S ACDLDA=$O(^AUTTAREA("C",ACD,0)) I ACDLDA S ACDP=$P(^AUTTAREA(ACDLDA,0),U)_$S(ACDAREA(ACD):"@"_ACDAREA(ACD),1:"") D ACDP
 I $D(ACDSU),'$D(ACDSU("*ALL*")) W !,"YOUR SELECTED SERVICE UNITS ARE: " S ACD="" F  S ACD=$O(ACDSU(ACD)) Q:ACD=""  S ACDLDA=$O(^AUTTSU("C",ACD,0)) I ACDLDA S ACDP=$P(^AUTTSU(ACDLDA,0),U)_$S(ACDSU(ACD):"@"_ACDSU(ACD),1:"") D ACDP
 I $D(ACDTRB),'$D(ACDTRB("*ALL*")) K ACD3 W !,"YOUR SELECTED TRIBES ARE: " S ACD="" F  S ACD=$O(ACDTRB(ACD)) Q:ACD=""  S ACDLDA=$O(^AUTTTRI("C",ACD,0)) I ACDLDA S ACDP=$P(^AUTTTRI(ACDLDA,0),U)_$S(ACDTRB(ACD):"@"_ACDTRB(ACD),1:"") D ACDP
 I $D(ACDSTA),'$D(ACDSTA("*ALL*")) K ACD3 W !,"YOUR SELECTED STATES ARE: " S ACD="" F  S ACD=$O(ACDSTA(ACD)) Q:ACD=""  S ACDLDA=$O(^DIC(5,"C",ACD,0)) I ACDLDA S ACDP=$P(^DIC(5,ACDLDA,0),U)_$S(ACDSTA(ACD):"@"_ACDSTA(ACD),1:"") D ACDP
 I $D(ACDCRST) K ACD3 W !,"YOUR SELECTED CONTACT TYPES ARE: " S ACD="" F  S ACD=$O(ACDCRST(ACD)) Q:ACD=""  S ACDP=ACD_"@"_ACDCRST(ACD) D ACDP
 W !
 Q
ACDP ;Format output then prnt it
 S:'$D(ACD3) ACD3=0
 S ACD3=ACD3+1
 I $P(ACDP,"@",2)="" S $P(ACDP,"@",2)="00"
 W:ACD3=1 ! W:ACD3=1 $P(ACDP,"@",2)_" Visits(s) "_"-"_$E($P(ACDP,"@"),1,20) W:ACD3=2 ?37,$P(ACDP,"@",2)_" Visits(s) "_"-"_$E($P(ACDP,"@"),1,20) I ACD3=2 K ACD3
 Q
RESET ;EP Reset counters after each report
 ;//^ACDWK
 ;//^ACDWDRV3
 I $D(ACDFAC) S ACD="" F  S ACD=$O(ACDFAC(ACD)) Q:ACD=""  S ACDFAC(ACD)=""
 I $D(ACDAREA) S ACD="" F  S ACD=$O(ACDAREA(ACD)) Q:ACD=""  S ACDAREA(ACD)=""
 I $D(ACDSU) S ACD="" F  S ACD=$O(ACDSU(ACD)) Q:ACD=""  S ACDSU(ACD)=""
 I $D(ACDTRB) S ACD="" F  S ACD=$O(ACDTRB(ACD)) Q:ACD=""  S ACDTRB(ACD)=""
 I $D(ACDSTA) S ACD="" F  S ACD=$O(ACDSTA(ACD)) Q:ACD=""  S ACDSTA(ACD)=""
 I $D(ACDCRST) S ACD="" F  S ACD=$O(ACDCRST(ACD)) Q:ACD=""  S ACDCRST(ACD)=""
 Q
ERROR ;EP-Check for error codes after extrinsic calls
 ;//^ACDPIMP,^ACDVIMP
 I +Y W !!,"Error code: ",Y," detected from the black box"
