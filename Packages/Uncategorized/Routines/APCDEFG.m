APCDEFG ; IHS/CMI/LAB -VISIT EDIT DISPLAY ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;IHS/AMNC/LJF
 ; -- this is a modified copy of APCDVD
 ; -- modified to select item from display to edit
EP(APCDVIEN,APCDARRY) ;EP
 ;
 I $G(APCDARRY)="" S APCDARRY="^TMP(""APCDEFG"",$J)"
 Q:'$D(APCDVIEN)
 Q:'APCDVIEN
 Q:'$D(^AUPNVSIT(APCDVIEN,0))
 D BUILD
 D XIT
 Q
 ;
SETF ;set file # in ^TMP
 S @APCDARRY@("MNE",APCDNUM)=MN
 Q
SET(X) ;set array
 S APCDCTR=APCDCTR+1
 S @APCDARRY@(APCDCTR,0)=APCDSTR
 S @APCDARRY@("IDX",APCDCTR,$S(APCDNUM>0:APCDNUM,1:1))=$G(X)
 S APCDSTR=""
 Q
BUILD ; build array
 K APCDAR
 D TERM^VALM0
 S APCDVREC=^AUPNVSIT(APCDVIEN,0)
 S Y=$P(APCDVREC,U,5) D ^AUPNPAT
 S APCDSTR="",APCDCTR=0,APCDNUM=0
 S APCDH="Patient Name",APCDV=IOINHI_$E($P(^DPT($P(APCDVREC,U,5),0),U),1,20)_IOINORM D BUILD1
 S APCDH="Chart #",APCDV=IOINHI_$S($D(^AUPNPAT($P(APCDVREC,U,5),41,DUZ(2),0)):$P(^(0),U,2),1:"None")_IOINORM D BUILD1
 S APCDH="Date of Birth" S Y=AUPNDOB D DD^%DT S APCDV=Y D BUILD1
 S APCDH="Sex",APCDV=AUPNSEX D BUILD1
 S APCDSTR="" D SET("")
VISIT ;
 ;S APCDSTR="=============== "_IOINHI_"VISIT FILE"_IOINORM_" ===============",X=(80-$L(APCDSTR)\2) D SET ;$J("",X)_APCDSTR D SET
 NEW MN S MN=$O(^APCDTKW("F",9000010,0)),APCDNUM=APCDNUM+1
 S APCDSTR=" <"_IOINHI_(APCDNUM)_IOINORM_"> ============= "_IOINHI_"VISIT FILE"_IOINORM_" ===============",X=(80-$L(APCDSTR)\2) D SET(""),SETF ;$J("",X)_APCDSTR D SET("")
 D ENP^XBDIQ1(9000010,APCDVIEN,".01:1500;1502:999999","APCDAR(","E")
 S F=0 F  S F=$O(APCDAR(F)) Q:F'=+F  I APCDAR(F)]"" D
 .S APCDH=$P(^DD(9000010,F,0),U)
 .S APCDV=APCDAR(F)
 .D BUILD1
 S APCDSTR="" D SET("")
 Q:'$P(APCDVREC,U,9)
VFILES ;set up array of all v file entries
 NEW DA,D0,DIC,DIQ,DR,DI
 S APCDVFLE=9000010 F  S APCDVFLE=$O(^DIC(APCDVFLE)) Q:APCDVFLE>9000010.99!(APCDVFLE'=+APCDVFLE)  D VF2
 D XIT
 Q
 ;
VF2 ;
 S APCDVNM=$P(^DIC(APCDVFLE,0),U),APCDVDG=^DIC(APCDVFLE,0,"GL"),APCDVIGR=APCDVDG_"""AD"",APCDVIEN,APCDVDFN)",APCDVDFN=""
 I $O(@APCDVIGR) S APCDNUM=APCDNUM+1
 F APCDVI=1:1 S APCDVDFN=$O(@APCDVIGR) Q:APCDVDFN=""  D VF3
 Q
 ;
VF3 ;
 ;I APCDVI<2 S APCDSTR="" D SET S APCDSTR="=============== "_IOINHI_$P(APCDVNM,"V ",2)_"s"_IOINORM_" ===============",X=(80-$L(APCDSTR)\2) D SET ;$J("",X)_APCDSTR D SET
 NEW MN S MN=$O(^APCDTKW("F",APCDVFLE,0))
 I APCDVI<2 S APCDSTR="" D SET("") S APCDSTR=" <"_IOINHI_(APCDNUM)_IOINORM_"> =============== "_IOINHI_$P(APCDVNM,"V ",2)_"s"_IOINORM_" ===============",X=(80-$L(APCDSTR)\2) D SET(""),SETF ;$J("",X)_APCDSTR D SET("")
 K APCDAR D ENP^XBDIQ1(APCDVFLE,APCDVDFN,".01:.019999;.04:999999","APCDAR(","E")
 I APCDVI>1 S APCDSTR="" D SET("")
 S F=0 F  S F=$O(APCDAR(F)) Q:F'=+F  D
 .I $G(APCDAR(F))]"" D  Q
 ..S APCDH=$P(^DD(APCDVFLE,F,0),U)
 ..S APCDV=APCDAR(F)
 ..D BUILD1
 .I $O(APCDAR(F,0)) D
 ..S APCDNARR=""
 ..S F1=0 F  S F1=$O(APCDAR(F,F1)) Q:F1'=+F1  D
 ...S APCDV=APCDAR(F,F1)
 ...D BUILD1
 ..K APCDNARR
 Q
 Q
BUILD1 ;
 I $D(APCDNARR) S APCDSTR="",APCDSTR=$$SETSTR^VALM1(APCDV,APCDSTR,1,$L(APCDV)) D SET("") Q
 S APCDSTR=$E(APCDH,1,21)_":",APCDSTR=$$SETSTR^VALM1(APCDV,APCDSTR,24,$L(APCDV))
 D SET("")
 Q
XIT ;
 K APCDAR,APCDARRY,APCDCTR,APCDH,APCDSTR,APCDV,APCDVDFN,APCDVDG,APCDVFLE,APCDVI,APCDVIEN,APCDVIGR,APCDFL,APCDVNM,APCDVREC,APCDH
 K DO,D0,DA,DI,DIC,DIQ,DR,F,X,Y,Z
 Q
 ;
 ;
