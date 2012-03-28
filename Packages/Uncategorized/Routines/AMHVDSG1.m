AMHVDSG1  ; IHS/CMI/LAB -VISIT DISPLAY NO REVERSE VIDEO FOR GUI ;  
 ;;4.0;IHS BEHAVIORAL HEALTH;;MAY 14, 2010
 ;
EN(AMHARRY,AMHR) ;EP
 I $G(AMHARRY)="" S AMHARRY="^TMP(""AMHVDSG"",$J)"
 Q:'$D(AMHR)
 Q:'AMHR
 Q:'$D(^AMHREC(AMHR,0))
 D BUILD
 D XIT
 Q
 ;
SET ;set array
 S AMHCTR=AMHCTR+1
 S @AMHARRY@(AMHCTR,0)=AMHSTR
 S AMHSTR=""
 Q
BUILD ; build array
 K X
 K AMHAR
 S AMHVREC=^AMHREC(AMHR,0)
 S Y=$P(AMHVREC,U,8) D:Y ^AUPNPAT
 S AMHSTR="",AMHCTR=0
 I $P(AMHVREC,U,8) D
 .S AMHH="Patient Name",AMHV=$E($P(^DPT($P(AMHVREC,U,8),0),U),1,20) D BUILD1
 .S AMHH="Chart #" S AMHV="" S:$P(AMHVREC,U,8) AMHV=$S($D(^AUPNPAT($P(AMHVREC,U,8),41,DUZ(2),0)):$P(^(0),U,2),1:"None") D BUILD1
 .S AMHH="Date of Birth" S Y=AUPNDOB D DD^%DT S AMHV=Y D BUILD1
 .S AMHH="Sex",AMHV=AUPNSEX D BUILD1
 .I $P($G(^AMHPATR($P(AMHVREC,U,8),0)),U,9)]"" S AMHH="Patient Flag",AMHV=$P(^AMHPATR($P(AMHVREC,U,8),0),U,9) D BUILD1
 .I $P($G(^AMHPATR($P(AMHVREC,U,8),0)),U,11)]"" S AMHH="Flag Narrative",AMHV=$P(^AMHPATR($P(AMHVREC,U,8),0),U,11) D BUILD1
 .S AMHSTR="" D SET
RECORD ;
 S AMHSTR="=============== BH RECORD FILE ===============",X=(80-$L(AMHSTR)\2) D SET ;$J("",X)_AMHSTR D SET
 D ENP^XBDIQ1(9002011,AMHR,".01:3100","AMHAR(","E")
 F F=.01,.02,.04,.26,.05,.06,.069,.07,.08,.081,.25,.09,.11,.12,.14,.15,.16,.17,.18,.03,.19,.21,.28,1114 D
 .;S F=0 F  S F=$O(AMHAR(F)) Q:F'=+F  I AMHAR(F)]"" D
 .Q:AMHAR(F)=""
 .S AMHDONE(F)=""
 .I F=.081,$P(^AMHREC(AMHR,0),U,8)="" Q
 .S AMHH=$P(^DD(9002011,F,0),U)
 .S AMHV=AMHAR(F)
 .D BUILD1
 S AMHSTR="EDIT HISTORY: " D SET
 S F=0 F  S F=$O(^AMHREC(AMHR,51,F)) Q:F'=+F  D
 .Q:'$D(^AMHREC(AMHR,51,F,0))
 .Q:$P(^AMHREC(AMHR,51,F,0),U)=""
 .Q:$P(^AMHREC(AMHR,51,F,0),U,2)=""
 .S AMHSTR="  "_$$FMTE^XLFDT($P(^AMHREC(AMHR,51,F,0),U),"1P"),$E(AMHSTR,30)=$P($G(^VA(200,$P(^AMHREC(AMHR,51,F,0),U,2),0)),U) D SET
 S F=0 F  S F=$O(AMHAR(F)) Q:F'=+F  I AMHAR(F)]"",'$D(AMHDONE(F)) D
 .I F=.081,$P(^AMHREC(AMHR,0),U,8)="" Q
 .Q:F=.33  ;I F=.33,$$DATE^AMHESIG()<$P($P(^AMHREC(AMHR,0),U),".") Q
 .Q:F=1108
 .S AMHH=$P(^DD(9002011,F,0),U)
 .S AMHV=AMHAR(F)
 .D BUILD1
 S AMHSTR="" D SET
AXIS3 ;
 S AMHSTR="AXIS III:" D SET
 K AMHAR D ENP^XBDIQ1(9002011,AMHR,5301,"AMHAR(","E")
 S F=0 F  S F=$O(AMHAR(5301,F)) Q:F'=+F  S AMHSTR=AMHAR(5301,F) D SET
 S AMHSTR="" D SET
AXIS4 ;
 S AMHSTR="AXIS IV:" D SET
 K AMHAR S Y=0 F  S Y=$O(^AMHREC(AMHR,61,Y)) Q:Y'=+Y  D
 .S %=$P(^AMHREC(AMHR,61,Y,0),U),AMHSTR=%_" - "_$P(^AMHTAXIV(%,0),U,2) D SET
 S AMHSTR="" D SET
 ;
TIUN ;
 I '$O(^AMHREC(AMHR,54,0)) G 1
 S AMHSTR="" D SET S AMHSTR="TIU DOCUMENTS" D SET S AMHSTR="-------------" D SET
 S AMHDOC=0 F  S AMHDOC=$O(^AMHREC(AMHR,54,"B",AMHDOC)) Q:AMHDOC'=+AMHDOC  D
 .K AMHTIU,AMHERR
 .K ^TMP("AMHOENPS",$J)
 .D TIUDSP
 .Q
 ;
1 ;
 I $P($G(^AMHREC(AMHR,11)),U,10) G 4  ;ehr visit no subj/obj per BJ
 S AMHSTR="" D SET
 S AMHSTR="SUBJECTIVE/OBJECTIVE:" D SET
 K AMHAR D ENP^XBDIQ1(9002011,AMHR,3101,"AMHAR(","E")
 S F=0 F  S F=$O(AMHAR(3101,F)) Q:F'=+F  S AMHSTR=AMHAR(3101,F) D SET
 S AMHSTR="" D SET
4 ;
 S AMHSTR="COMMENT/NEXT APPOINTMENT:" D SET
 K AMHAR D ENP^XBDIQ1(9002011,AMHR,8101,"AMHAR(","E")
 S F=0 F  S F=$O(AMHAR(8101,F)) Q:F'=+F  S AMHSTR=AMHAR(8101,F) D SET
 S AMHSTR="" D SET
NFT ;
 S AMHSTR="NOTE FORWARDED TO:" D SET
 K AMHAR S Y=0 F  S Y=$O(^AMHREC(AMHR,52,Y)) Q:Y'=+Y  D
 .S %=$P(^AMHREC(AMHR,52,Y,0),U),AMHSTR=$P(^VA(200,%,0),U) D SET
 S AMHSTR="" D SET
2 ;
 S AMHSTR="MEDICATIONS PRESCRIBED:" D SET
 K AMHAR D ENP^XBDIQ1(9002011,AMHR,4101,"AMHAR(","E")
 S F=0 F  S F=$O(AMHAR(4101,F)) Q:F'=+F  S AMHSTR=AMHAR(4101,F) D SET
 S AMHSTR="" D SET
SAN ;
 I $P(^AMHREC(AMHR,0),U,33)="S" D 1^AMHLESA2
 I $P(^AMHREC(AMHR,0),U,33)="U" D SANU^AMHLESA2
INTAKEX ;
VFILES ;set up array of all v file entries
 NEW DA,D0,DIC,DIQ,DR,DI
 S AMHVFLE=9002011 F  S AMHVFLE=$O(^DIC(AMHVFLE)) Q:AMHVFLE>9002011.50!(AMHVFLE'=+AMHVFLE)  D VF2
 D XIT
 Q
 ;
TIUDSP ;
 S AMHSTR="" D SET
 I '+$$CANDO^TIULP(AMHDOC,"PRINT RECORD",DUZ) Q  ;S AMHSTR="You do not have security clearance to display the TIU NOTE." D SET Q
 ; Extract specified note
 S AMHGBL=$NA(^TMP("AMHOENPS",$J)),AMHHLF=IOM\2
 K @AMHGBL
 D EXTRACT^TIULQ(AMHDOC,AMHGBL,.AMHERR,".01;.02;.03;.05;.07;.08;1202;1203;1205;1208;1209;1301;1307;1402;1501:1505;1507:1513;1701","",1,"E")
 M AMHTIU=^TMP("AMHOENPS",$J,AMHDOC)
 K ^TMP("AMHOENPS",$J)
 S AMHSTR="TIU DOCUMENT:  "_AMHTIU(.01,"E") D SET
 S AMHSTR="AUTHOR: "_AMHTIU(1202,"E") D SET
 S AMHSTR="SIGNED BY: "_AMHTIU(1502,"E")_"               STATUS: "_AMHTIU(.05,"E") D SET
 S AMHSTR="LOCATION: "_AMHTIU(1205,"E") D SET
 F AMHX=0:0 S AMHX=$O(AMHTIU("TEXT",AMHX)) Q:'AMHX  S AMHSTR=AMHTIU("TEXT",AMHX,0) D SET
 I $L($G(AMHTIU(1501,"E"))) D
 .S AMHSTR="/es/ "_$G(AMHTIU(1503,"E")) D SET
 .S AMHSTR="Signed: "_$G(AMHTIU(1501,"E")) D SET
 ;NOW GET ADDENDA USING "DAD" XREF
 I $O(^TIU(8925,"DAD",AMHDOC,0)) S AMHSTR="" D SET   ;S AMHSTR="This document has addenda." D SET
 S AMHX1=0 F  S AMHX1=$O(^TIU(8925,"DAD",AMHDOC,AMHX1)) Q:AMHX1'=+AMHX1  D
 .I '+$$CANDO^TIULP(AMHX1,"PRINT RECORD",DUZ) Q  ;S AMHSTR="You do not have security clearance to display the addendum." D SET Q
 .S AMHGBL=$NA(^TMP("AMHOENPS",$J))
 .K @AMHGBL
 .K AMHTIU
 .D EXTRACT^TIULQ(AMHX1,AMHGBL,.AMHERR,".01;.02;.03;.05;.07;.08;1202;1203;1205;1208;1209;1301;1307;1402;1501:1505;1507:1513;1701","",1,"E")
 .M AMHTIU=^TMP("AMHOENPS",$J,AMHX1)
 .K ^TMP("AMHOENPS",$J)
 .S AMHSTR="" D SET
 .S AMHSTR=AMHTIU(.01,"E") D SET
 .S AMHSTR="AUTHOR: "_AMHTIU(1202,"E") D SET
 .S AMHSTR="SIGNED BY: "_AMHTIU(1502,"E")_"               STATUS: "_AMHTIU(.05,"E") D SET
 .S AMHSTR="LOCATION: "_AMHTIU(1205,"E") D SET
 .F AMHX=0:0 S AMHX=$O(AMHTIU("TEXT",AMHX)) Q:'AMHX  S AMHSTR=AMHTIU("TEXT",AMHX,0) D SET
 .I $L($G(AMHTIU(1501,"E"))) D
 ..S AMHSTR="/es/ "_$G(AMHTIU(1503,"E")) D SET
 ..S AMHSTR="Signed: "_$G(AMHTIU(1501,"E")) D SET
 ;
 Q
VF2 ;
 S AMHVNM=$P(^DIC(AMHVFLE,0),U),AMHVDG=^DIC(AMHVFLE,0,"GL"),AMHVIGR=AMHVDG_"""AD"",AMHR,AMHVDFN)",AMHVDFN=""
 I AMHVFLE=9002011.06 S AMHVNM=$P(^DIC(AMHVFLE,0),U),AMHVDG=^DIC(AMHVFLE,0,"GL"),AMHVIGR=AMHVDG_"""B"",AMHR,AMHVDFN)",AMHVDFN=""
 F AMHVI=1:1 S AMHVDFN=$O(@AMHVIGR) Q:AMHVDFN=""  D VF3
 Q
 ;
VF3 ;
 I AMHVI<2 S AMHSTR="" D SET S AMHSTR="=============== "_AMHVNM_" ===============",X=(80-$L(AMHSTR)\2) D SET ;$J("",X)_AMHSTR D SET
 K AMHAR D ENP^XBDIQ1(AMHVFLE,AMHVDFN,".01:.019999;.04:999999","AMHAR(","E")
 I AMHVI>1 S AMHSTR="" D SET
 S F=0 F  S F=$O(AMHAR(F)) Q:F'=+F  I AMHAR(F)]"" D
 .S AMHH=$P(^DD(AMHVFLE,F,0),U)
 .S AMHV=AMHAR(F)
 .D BUILD1
 Q
BUILD1 ;
 S AMHSTR=$E(AMHH,1,21)_":",AMHSTR=$$SETSTR^VALM1(AMHV,AMHSTR,24,$L(AMHV))
 D SET
 Q
 I $L(AMHSTR)>39 D SET
 S AMHV=" "_AMHV_" ",X=AMHH_": "_AMHV
 I $L(AMHSTR),$L(X)>40 D SET
 I $L(AMHSTR) S AMHSTR=$$SETSTR^VALM1(X,AMHSTR,40,$L(X))
 I '$L(AMHSTR) S AMHSTR=X
 K AMHV,AMHH,X
 Q
XIT ;
 K AMHAR,AMHARRY,AMHCTR,AMHH,AMHSTR,AMHV,AMHVDFN,AMHVDG,AMHVFLE,AMHVI,AMHR,AMHVIGR,AMHFL,AMHVNM,AMHVREC,AMHH
 K DO,D0,DA,DI,DIC,DIQ,DR,F,X,Y,Z
 Q
