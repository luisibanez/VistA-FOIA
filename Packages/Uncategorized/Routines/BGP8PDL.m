BGP8PDL ; IHS/CMI/LAB - IHS gpra print ; 01 Jul 2008  8:02 PM
 ;;8.0;IHS CLINICAL REPORTING;**2,3**;MAR 12, 2008
 ;
 ;
DEL ;
 K ^TMP($J)
 S ^TMP($J,"BGPDEL",0)=0
 K BGPSUMP
 D ^BGP8PDLH
 D DEL1
 I BGPRTYPE=1 D SUMMARY
 I BGPRTYPE=1 D NONSUM^BGP8PDLN
 I BGPRTYPE=1 D SDP
 I BGPRTYPE=1 D SDP^BGP8PDLN
 I BGPRTYPE=7 D OTHSUM^BGP8PDLO
 D ^BGP8PDLS ;print lists to delimited file
 ;if screen selected do screen
 I BGPDELT="S" D SCREEN,EXIT Q
 ;call xbgsave to create output file
 S XBGL="BGPDATA"
 L +^BGPDATA:300 E  W:'$D(ZTQUEUED) "Unable to lock global" Q
 K ^TMP($J,"SUMMARYDEL")
 K ^BGPDATA ;global for saving
 S X=0 F  S X=$O(^TMP($J,"BGPDEL",X)) Q:X'=+X  S ^BGPDATA(X)=^TMP($J,"BGPDEL",X)
 I '$D(BGPGUI) D
 .S XBFLT=1,XBFN=BGPDELF_".txt",XBMED="F",XBTLE="GPRA 08 DELIMITED OUTPUT",XBQ="N",XBF=0
 .D ^XBGSAVE
 .K XBFLT,XBFN,XBMED,XBTLE,XBE,XBF
 I $D(BGPGUI) D
 .S (C,X)=0 F  S X=$O(^BGPDATA(X)) Q:X'=+X  S C=C+1,^BGPGUIE(BGPGIEN,12,C,0)=^BGPDATA(X)
 .S ^BGPGUIE(BGPGIEN,12,0)="^90534.0812^"_C_"^"_C_"^"_DT
 L -^BGPDATA
 K ^BGPDATA ;export global
 D EXIT
 Q
 ;
SCREEN ;
 S X=0 F  S X=$O(^TMP($J,"BGPDEL",X)) Q:X'=+X  W !,^TMP($J,"BGPDEL",X)
 Q
DEL1 ;EP
 S BGPIC=0 F  S BGPIC=$O(BGPIND(BGPIC)) Q:BGPIC=""  D
 .;now print individual measure
 .S X=" " D S(X,1,1),S(X,1,1)
 .S X=$P(^BGPINDE(BGPIC,0),U,3) D S(X,1,1)
 .S X=" " D S(X,1,1)
 .S X="Denominator(s):" D S(X,1,1)
 .S BGPX=0 F  S BGPX=$O(^BGPINDE(BGPIC,61,"B",BGPX)) Q:BGPX'=+BGPX  D
 ..S BGPY=0 F  S BGPY=$O(^BGPINDE(BGPIC,61,"B",BGPX,BGPY)) Q:BGPY'=+BGPY  D
 ...;I $P(^BGPINDE(BGPIC,61,BGPY,0),U,2)'[BGPRTYPE Q  ;not a denom def for this report
 ...;I BGPRTYPE=4,$P(^BGPINDE(BGPIC,61,BGPY,0),U,3)'[BGPINDT Q  ;don't display
 ...I '$D(^BGPINDE(BGPIC,61,BGPY,11,"B",BGPRTYPE)) Q  ;not this report type
 ...I BGPRTYPE=4,'$D(^BGPINDE(BGPIC,61,BGPY,12,"B",BGPINDT)) Q  ;not this measure type on selected
 ...S BGPZ=0 F  S BGPZ=$O(^BGPINDE(BGPIC,61,BGPY,1,BGPZ)) Q:BGPZ'=+BGPZ  D
 ....S Y=^BGPINDE(BGPIC,61,BGPY,1,BGPZ,0) D S(Y,1,1)
 ....Q
 ...Q
 ..Q
 .S X=" " D S(X,1,1)
 .S X="Numerator(s):" D S(X,1,1)
 .S BGPX=0 F  S BGPX=$O(^BGPINDE(BGPIC,62,"B",BGPX)) Q:BGPX'=+BGPX  D
 ..S BGPY=0 F  S BGPY=$O(^BGPINDE(BGPIC,62,"B",BGPX,BGPY)) Q:BGPY'=+BGPY  D
 ...;I $P(^BGPINDE(BGPIC,62,BGPY,0),U,2)'[BGPRTYPE Q  ;not a denom def for this report
 ...;I BGPRTYPE=4,BGPINDT'="S",$P(^BGPINDE(BGPIC,62,BGPY,0),U,3)'[BGPINDT Q  ;don't display
 ...I '$D(^BGPINDE(BGPIC,62,BGPY,11,"B",BGPRTYPE)) Q  ;not this report type
 ...I BGPRTYPE=4,'$D(^BGPINDE(BGPIC,62,BGPY,12,"B",BGPINDT)) Q  ;not this measure type on selected
 ...S BGPZ=0 F  S BGPZ=$O(^BGPINDE(BGPIC,62,BGPY,1,BGPZ)) Q:BGPZ'=+BGPZ  D
 ....S X=^BGPINDE(BGPIC,62,BGPY,1,BGPZ,0) D S(X,1,1)
 ....Q
 ...Q
 ..Q
 .S X=" " D S(X,1,1)
 .S BGPNODE=11
 .I BGPRTYPE=1,$O(^BGPINDE(BGPIC,54,0)) S BGPNODE=54
 .I BGPRTYPE=7,$O(^BGPINDE(BGPIC,56,0)) S BGPNODE=56
 .S X="Logic:" D S(X,1,1)
 .S BGPX=0 F  S BGPX=$O(^BGPINDE(BGPIC,BGPNODE,BGPX)) Q:BGPX'=+BGPX  D
 ..S X=^BGPINDE(BGPIC,BGPNODE,BGPX,0) D S(X,1,1)
 .S X=" " D S(X,1,1) S X="Performance Measure Description:" D S(X,1,1) S BGPX=0 F  S BGPX=$O(^BGPINDE(BGPIC,$S($G(BGPNGR09):57,1:51),BGPX)) Q:BGPX'=+BGPX  D
 ..S X=^BGPINDE(BGPIC,$S($G(BGPNGR09):57,1:51),BGPX,0) D S(X,1,1)
 .I $O(^BGPINDE(BGPIC,52,0)) S X=" " D S(X,1,1) S X="Past Performance and/or Target:" D S(X,1,1) S BGPX=0 F  S BGPX=$O(^BGPINDE(BGPIC,52,BGPX)) Q:BGPX'=+BGPX  D
 ..S X=^BGPINDE(BGPIC,52,BGPX,0) D S(X,1,1)
 .I $O(^BGPINDE(BGPIC,55,0)) S X=" " D S(X,1,1) S X="Source:" D S(X,1,1) S BGPX=0 F  S BGPX=$O(^BGPINDE(BGPIC,55,BGPX)) Q:BGPX'=+BGPX  D
 ..S X=^BGPINDE(BGPIC,55,BGPX,0) D S(X,1,1)
 .I '$O(^BGPINDE(BGPIC,55,0)) D S(" ",1,1)
 .X ^BGPINDE(BGPIC,4)
 .I $G(BGPNPL),$D(BGPINDL(BGPIC)),'$D(BGP8NPLT) S BGPINDN=BGPIC D NPL1^BGP8NPLD
 .I $G(BGPNPL),$D(BGPINDL(BGPIC)),$D(BGP8NPLT) S BGPINDN=BGPIC S BGPDELIM=1 D CT^BGP8DSTM ; nat gpra SEARCH TEMPLATE
 I $G(BGPCPPL) D CPPL1^BGP8DCLD
 Q
HEADER ;EP
 S Y=$P(^VA(200,DUZ,0),U,2),$E(Y,35)=$$FMTE^XLFDT(DT) D S(Y,1,1)
 I BGPRTYPE=4 S Y="*** IHS 2008 Clinical Performance Report ***" D S(Y,1,1)
 I BGPRTYPE=1 S Y="*** IHS 2008 National GPRA Clinical Performance Report ***" D S(Y,1,1)
 I $G(BGPAREAA) S Y="AREA AGGREGATE" D S(Y,1,1)
 I '$G(BGPAREAA) S Y=$P(^DIC(4,DUZ(2),0),U) D S(Y,1,1)
 ;S X=$$RPTVER^BGP8BAN D S(X,1,1)
 S X="Report Period:  "_$$FMTE^XLFDT(BGPBD)_" to "_$$FMTE^XLFDT(BGPED) D S(X,1,1)
 S X="Previous Year Period:  "_$$FMTE^XLFDT(BGPPBD)_" to "_$$FMTE^XLFDT(BGPPED) D S(X,1,1)
 S X="Baseline Period:  "_$$FMTE^XLFDT(BGPBBD)_" to "_$$FMTE^XLFDT(BGPBED) D S(X,1,1)
 S X=" " D S(X,1,1)
 Q:$G(BGPSUMP)
 I BGPRTYPE=1 S X="Measures: GPRA Denominators and Numerators and Selected Other Clinical Denominators and Numerators" D S(X,1,1)
 S X=" " D S(X,1,1)
 I BGPRTYPE=1 S X="Population:  AI/AN Only (Classification 01)" D S(X,1,1)
 S X=" " D S(X,1,1)
 S BGPI=$O(^BGPCTRL("B",2008,0))
 S BGPX=0 F  S BGPX=$O(^BGPCTRL(BGPI,14,BGPX)) Q:BGPX'=+BGPX  D
 .S X=^BGPCTRL(BGPI,14,BGPX,0) D S(X,1,1)
 I $G(BGPEXPT) S X="A file will be created called BG08"_$P(^AUTTLOC(DUZ(2),0),U,10)_"."_BGPRPT_"." D S(X,1,1)
 S X="It will reside in the public/export directory.  This file should be sent to your Area Office." D S(X,1,1)
 S X=" " D S(X,1,1)
 I $G(BGPALLPT) S X="All Communities Included." D S(X,1,1)
 I '$G(BGPALLPT),'$G(BGPSEAT) S X="Community Taxonomy Name: "_$P(^ATXAX(BGPTAXI,0),U) D S(X,1,1)
 I '$G(BGPALLPT),'$G(BGPSEAT) S X="The following communities are included in this report:" D S(X,1,1) D
 .S BGPZZ="",N=0,Y="" F  S BGPZZ=$O(BGPTAX(BGPZZ)) Q:BGPZZ=""  S N=N+1,Y=Y_$S(N=1:"",1:";")_BGPZZ
 .S BGPZZ=0,C=0 F BGPZZ=1:3:N D
 ..S X=$E($P(Y,";",BGPZZ),1,20),$E(X,3)=$E($P(Y,";",(BGPZZ+1)),1,20),$E(X,60)=$E($P(Y,";",(BGPZZ+2)),1,20)
 ..Q
 I $G(BGPMFITI) S X="MFI Location Taxonomy Name: "_$P(^ATXAX(BGPMFITI,0),U) D S(X,1,1)
 I $G(BGPMFITI) S X="The following locations are used for patient visits in this report:" D S(X,1,1) D
 .S BGPZZ="",N=0,Y="" F  S BGPZZ=$O(^ATXAX(BGPMFITI,21,"B",BGPZZ)) Q:BGPZZ=""  S N=N+1,Y=Y_$S(N=1:"",1:";")_$P($G(^DIC(4,BGPZZ,0)),U)
 .S BGPZZ=0,C=0 F BGPZZ=1:3:N D
 ..S X=$E($P(Y,";",BGPZZ),1,20),$E(X,3)=$E($P(Y,";",(BGPZZ+1)),1,20),$E(X,60)=$E($P(Y,";",(BGPZZ+2)),1,20)
 ..Q
 K BGPX,BGPQUIT
 S X=$TR($J(""," ","-"),80) D S(X,1,1)
 Q
EXIT ;
 K ^TMP($J)
 Q
CTR(X,Y) ;EP - Center X in a field Y wide.
 Q $J("",$S($D(Y):Y,1:IOM)-$L(X)\2)_X
 ;----------
USR() ;EP - Return name of current user from ^VA(200.
 Q $S($G(DUZ):$S($D(^VA(200,DUZ,0)):$P(^(0),U),1:"UNKNOWN"),1:"DUZ UNDEFINED OR 0")
 ;----------
S(Y,F,P) ;EP set up array
 I '$G(F) S F=0
 S %=$P(^TMP($J,"BGPDEL",0),U)+F,$P(^TMP($J,"BGPDEL",0),U)=%
 I '$D(^TMP($J,"BGPDEL",%)) S ^TMP($J,"BGPDEL",%)=""
 S $P(^TMP($J,"BGPDEL",%),U,P)=Y
 Q
C(X,X2,X3) ;
 D COMMA^%DTC
 Q X
SUMMARY ;
 I BGPRTYPE'=1 Q  ;national gpra only
 Q:$G(BGPCPPL)
 I $G(BGPNPL) Q  ;not on lists
 S BGPQUIT="",BGPGPG=0
 S BGPSUMP=1,BGPNON=0
 D H1
 S BGPC=0 F  S BGPC=$O(^TMP($J,"SUMMARYDEL",BGPC)) Q:BGPC'=+BGPC  D
 .S X=" " D S(X,1,1)
 .S BGPC1=$O(^BGPSCAT("C",BGPC,0))
 .S X=$P(^BGPSCAT(BGPC1,0),U,1) D S(X,1,1)
 .S BGPO="" F  S BGPO=$O(^TMP($J,"SUMMARYDEL",BGPC,BGPO)) Q:BGPO=""  D
 ..S BGPPC=$O(^TMP($J,"SUMMARYDEL",BGPC,BGPO,0))
 ..S X=""
 ..I $P(^BGPINDEC(BGPPC,0),U,4)["014."!($P(^BGPINDEC(BGPPC,0),U,4)["023.")!($P(^BGPINDEC(BGPPC,0),U,4)["016")!($P($G(^BGPINDEC(BGPPC,19)),U,13)) D  I 1
 ...S X=$P(^BGPINDEC(BGPPC,14),U,4)
 ...I $P(^BGPINDEC(BGPPC,14),U,7)]"" D S(X,1,1) S X=$P(^BGPINDEC(BGPPC,14),U,7)
 ...I $P(^BGPINDEC(BGPPC,14),U,12)]"" D S(X,1,1) S X=$P(^BGPINDEC(BGPPC,14),U,12)
 ...S $P(X,U,2)=$P(^TMP($J,"SUMMARYDEL",BGPC,BGPO,BGPPC),U)
 ...S $P(X,U,3)=$P(^TMP($J,"SUMMARYDEL",BGPC,BGPO,BGPPC),U,2)
 ...S $P(X,U,4)=$P(^TMP($J,"SUMMARYDEL",BGPC,BGPO,BGPPC),U,3)
 ...S $P(X,U,5)=$P(^BGPINDEC(BGPPC,14),U,8)
 ...S $P(X,U,6)=$P(^BGPINDEC(BGPPC,14),U,2),$P(X,U,7)=$P(^BGPINDEC(BGPPC,14),U,3)
 ...D S(X,1,1)
 ..E  D
 ...S X=$P(^BGPINDEC(BGPPC,14),U,4)
 ...I $P(^BGPINDEC(BGPPC,14),U,7)]"" D S(X,1,1) S X=$P(^BGPINDEC(BGPPC,14),U,7)
 ...I $P(^BGPINDEC(BGPPC,14),U,12)]"" D S(X,1,1) S X=$P(^BGPINDEC(BGPPC,14),U,12)
 ...S $P(X,U,2)=$P(^TMP($J,"SUMMARYDEL",BGPC,BGPO,BGPPC),U)_"%"
 ...S $P(X,U,3)=$P(^TMP($J,"SUMMARYDEL",BGPC,BGPO,BGPPC),U,2)_"%"
 ...S $P(X,U,4)=$P(^TMP($J,"SUMMARYDEL",BGPC,BGPO,BGPPC),U,3)_"%"
 ...S $P(X,U,5)=$TR($P(^BGPINDEC(BGPPC,14),U,8),"$","^")
 ...S $P(X,U,6)=$TR($P(^BGPINDEC(BGPPC,14),U,2),"$","^"),$P(X,U,7)=$P(^BGPINDEC(BGPPC,14),U,3)
 ...D S(X,1,1)
 ...S X="" I $P(^BGPINDEC(BGPPC,14),U,9)]""!($P(^BGPINDEC(BGPPC,14),U,10)]"")!($P(^BGPINDEC(BGPPC,14),U,11)]"") S $P(X,U,5)=$TR($P(^BGPINDEC(BGPPC,14),U,9),"$","^"),$P(X,U,6)=$TR($P(^BGPINDEC(BGPPC,14),U,10),"$","^") D
 ....S $P(X,U,7)=$P(^BGPINDEC(BGPPC,14),U,11)
 ...I X]"" D S(X,1,1)
 S X=" " D S(X,1,1)
 S X="  * Measure definition changed in 2007." D S(X,1,1)
 S X=" ** Site Previous and Site Baseline values are not applicable for this measure." D S(X,1,1)
 ;D SDP
 Q
 ;
H1 ;
 S X=" " D S(X,2,1)
 S X="OFFICIAL GPRA MEASURES CLINICAL PERFORMANCE SUMMARY" D S(X,3,1)
 I $G(BGPAREAA) S X="",$P(X,U,2)=" Area",$P(X,U,3)=" Area",$P(X,U,4)=" Area",$P(X,U,5)="GPRA08",$P(X,U,6)="Nat'l",$P(X,U,7)="2010" D S(X,1,1)
 I '$G(BGPAREAA) S X="",$P(X,U,2)=" Site",$P(X,U,3)=" Site",$P(X,U,4)=" Site",$P(X,U,5)="GPRA08",$P(X,U,6)="Nat'l",$P(X,U,7)="2010" D S(X,1,1)
 S X="",$P(X,U,2)="Current",$P(X,U,3)="Previous",$P(X,U,4)="Baseline",$P(X,U,5)="Goal",$P(X,U,6)="2007",$P(X,U,7)="Goal" D S(X,1,1)
 S X=$TR($J("",80)," ","-") D S(X,1,1)
 Q
H2 ;
 S X=" " D S(X,2,1)
 S X="OFFICIAL GPRA MEASURES CLINICAL PERFORMANCE DETAIL" D S(X,2,1)
 S X="",$P(X,U,2)=" Site",$P(X,U,3)=" Site",$P(X,U,4)=" Site",$P(X,U,5)="Area",$P(X,U,6)="GPRA08",$P(X,U,7)="National",$P(X,U,8)="2010" D S(X,1,1)
 S X="",$P(X,U,2)="Current",$P(X,U,3)="Previous",$P(X,U,4)="Baseline",$P(X,U,5)="Current",$P(X,U,6)="Goal",$P(X,U,7)="2007",$P(X,U,8)="Goal" D S(X,1,1)
 S X=$TR($J("",80)," ","-") D S(X,1,1)
 Q
SDP ;
 I BGPRTYPE'=1 Q  ;national gpra only
 I '$G(BGPAREAA) Q  ;area only
 S BGPQUIT="",BGPGPG=0
 S BGPSUMP=1
 S X=" " D S(X,2,1)
 D HEADER
 D H2
 S BGPC=0 F  S BGPC=$O(^TMP($J,"SUMMARYDEL DETAIL PAGE",BGPC)) Q:BGPC'=+BGPC  D
 .S X=" " D S(X,1,1)
 .S BGPC1=$O(^BGPSCAT("C",BGPC,0))
 .S X=$P(^BGPSCAT(BGPC1,0),U,1) D S(X,1,1)
 .S BGPO="" F  S BGPO=$O(^TMP($J,"SUMMARYDEL DETAIL PAGE",BGPC,BGPO)) Q:BGPO=""  D
 ..S BGPPC=$O(^TMP($J,"SUMMARYDEL DETAIL PAGE",BGPC,BGPO,0))
 ..S X=" " D S(X,1,1)
 ..S XX=" "_$P(^BGPINDEC(BGPPC,14),U,4)
 ..I $P(^BGPINDEC(BGPPC,14),U,7)]"" D S(XX,1,1) S XX=" "_$P(^BGPINDEC(BGPPC,14),U,7)
 ..I $P(^BGPINDEC(BGPPC,14),U,12)]"" D S(XX,1,1) S XX=" "_$P(^BGPINDEC(BGPPC,14),U,12)
 ..S F=$O(^TMP($J,"SUMMARYDEL DETAIL PAGE",BGPC,BGPO,BGPPC,0))
 ..S F=$P(^TMP($J,"SUMMARYDEL DETAIL PAGE",BGPC,BGPO,BGPPC,F),U,4)
 ..S $P(XX,U,5)=F_$S($P(^BGPINDEC(BGPPC,0),U,4)["014."!($P(^BGPINDEC(BGPPC,0),U,4)["023.")!($P(^BGPINDEC(BGPPC,0),U,4)["016.")!($P($G(^BGPINDEC(BGPPC,19)),U,13)):"",1:"%")
 ..S $P(XX,U,6)=$P(^BGPINDEC(BGPPC,14),U,8),$P(XX,U,7)=$P(^BGPINDEC(BGPPC,14),U,2),$P(XX,U,8)=$P(^BGPINDEC(BGPPC,14),U,3)
 ..S BGPSN=0,BGPCNT=0 F  S BGPSN=$O(^TMP($J,"SUMMARYDEL DETAIL PAGE",BGPC,BGPO,BGPPC,BGPSN)) Q:BGPSN'=+BGPSN  S BGPCNT=BGPCNT+1 D
 ...S BGPSASU=$P(^BGPGPDCE(BGPSN,0),U,9),X=$O(^AUTTLOC("C",BGPSASU,0)),BGPSNAM=$S(X:$P(^DIC(4,X,0),U),1:"?????"),BGPSNAM=$S($P(^BGPGPDCE(BGPSN,0),U,17):"+"_BGPSNAM,1:BGPSNAM)
 ...I $P(^BGPINDEC(BGPPC,0),U,4)["014."!($P(^BGPINDEC(BGPPC,0),U,4)["023.")!($P(^BGPINDEC(BGPPC,0),U,4)["016")!($P($G(^BGPINDEC(BGPPC,19)),U,13)) D  I 1
 ....S X="",$P(X,U,1)=BGPSASU_" "_BGPSNAM
 ....S $P(X,U,2)=+$P(^TMP($J,"SUMMARYDEL DETAIL PAGE",BGPC,BGPO,BGPPC,BGPSN),U)
 ....S $P(X,U,3)=+$P(^TMP($J,"SUMMARYDEL DETAIL PAGE",BGPC,BGPO,BGPPC,BGPSN),U,2)
 ....S $P(X,U,4)=+$P(^TMP($J,"SUMMARYDEL DETAIL PAGE",BGPC,BGPO,BGPPC,BGPSN),U,3)
 ....;S $P(X,U,5)=$P(^TMP($J,"SUMMARYDEL DETAIL PAGE",BGPC,BGPO,BGPPC,BGPSN),U,4)
 ...E  D
 ....S $P(X,U,1)=BGPSASU_" "_BGPSNAM
 ....S $P(X,U,2)=$P(^TMP($J,"SUMMARYDEL DETAIL PAGE",BGPC,BGPO,BGPPC,BGPSN),U)_"%"
 ....S $P(X,U,3)=$P(^TMP($J,"SUMMARYDEL DETAIL PAGE",BGPC,BGPO,BGPPC,BGPSN),U,2)_"%"
 ....S $P(X,U,4)=$P(^TMP($J,"SUMMARYDEL DETAIL PAGE",BGPC,BGPO,BGPPC,BGPSN),U,3)_"%"
 ....;S $P(X,U,5)=$P(^TMP($J,"SUMMARYDEL DETAIL PAGE",BGPC,BGPO,BGPPC,BGPSN),U,4)_"%"
 ....;S $P(X,U,5)=$P(^BGPINDEC(BGPPC,14),U,2),$P(X,U,6)=$P(^BGPINDEC(BGPPC,14),U,3)
 ...I BGPCNT=1 D S(XX,1,1) D
 ....;S Y="" I $P(^BGPINDEC(BGPPC,14),U,9)]""!($P(^BGPINDEC(BGPPC,14),U,10)]"") S $P(Y,U,6)=$TR($P(^BGPINDEC(BGPPC,14),U,9),"$","^"),$P(Y,U,7)=$TR($P(^BGPINDEC(BGPPC,14),U,10),"$","^")
 ....S Y="" I $P(^BGPINDEC(BGPPC,14),U,9)]""!($P(^BGPINDEC(BGPPC,14),U,10)]"")!($P(^BGPINDEC(BGPPC,14),U,11)]"") S $P(Y,U,6)=$TR($P(^BGPINDEC(BGPPC,14),U,9),"$","^"),$P(Y,U,7)=$TR($P(^BGPINDEC(BGPPC,14),U,10),"$","^") D
 .....S $P(Y,U,8)=$P(^BGPINDEC(BGPPC,14),U,11)
 ....I Y]"" D S(Y,1,1)
 ...D S(X,1,1)
 S X=" " D S(X,1,1)
 S X="  * Measure definition changed in 2007." D S(X,1,1)
 S X=" ** Site Previous and Site Baseline values are not applicable for this measure." D S(X,1,1)
 Q
