BUD9RPTC ; IHS/CMI/LAB - UDS REPORT PROCESSOR 03 Feb 2009 1:15 PM ;
 ;;5.0;IHS/RPMS UNIFORM DATA SYSTEM;;JAN 18, 2011;Build 12
 ;
 ;
PROC ;EP - called from xbdbque
 S BUDJ=$J,BUDH=$H
 K ^TMP($J)
 S ^XTMP("BUD9RPT1",0)=$$FMADD^XLFDT(DT,14)_"^"_DT_"^"_"UDS REPORT"
 ;TABLE 3A
 K BUDTOT F X=1:1:39 S $P(BUDTOT("M"),U,X)=0,$P(BUDTOT("F"),U,X)=0,$P(BUDTOT("ALL"),U,X)=0  ;for table 3A
 S BUD019("M")="",BUD019("F")="",BUD019("ALL")=""
 ;TABLE 5
 F X=1:1:6 S BUDTAB5(X)="0^0"
 F X=7:1:38 S BUDTAB5(X)="0^0"
 F X="9A","9B","20A","20A1","20A2","20B","20C","29A","10A","27a","27b","30A","30B","30C" S BUDTAB5(X)="0^0"
 ;TABLE 3B
 K BUDRACET
 ;S BUDRACET(LINE)=LINE NUMBER^LABEL^HISP/LATINO^NOT HISPANIC^UNREP^TOTAL^LINE LABEL 2^LINE LABEL 3"
 S BUDRACET(1)="1.^Asian^0^0^0^0"
 S BUDRACET("2A")="2a.^Native Hawaiian^0^0^0^0"
 S BUDRACET("2B")="2b.^Other Pacific^0^0^0^0^Islander"
 S BUDRACET(2)="2.^Total Hawaiian/^0^0^0^0^Pacific Islander^(Sum Lines 2a+2b)"
 S BUDRACET(3)="3.^Black/African^0^0^0^0^American"
 S BUDRACET(4)="4.^American Indian/^0^0^0^0^Alaska Native"
 S BUDRACET(5)="5.^White^0^0^0^0"
 S BUDRACET(6)="6.^More than one^0^0^0^0^race"
 S BUDRACET(7)="7.^Unreported/^0^0^0^0^Refused to Report"
 S BUDRACET(8)="8.^Total Patients^0^0^0^0^(Sum Lines 1+2^+ 3 to 7)"
 K BUDLANG
 S BUDLANG(9)="9.^Patients Best Served in a Language Other Than^0^English"
 ;TABLE 6
 F X=1:1:26 S $P(BUDT6("V"),U,X)=0,$P(BUDT6("P"),U,X)=0
 ;NOW LOOP THROUGH PATIENT FILE
 S DFN=0 F  S DFN=$O(^AUPNPAT(DFN)) Q:DFN'=+DFN  D
 .K ^TMP($J)
 .;Q:DFN'=132542
 .;I DUZ=5634,$$HRN^AUPNPAT(DFN,DUZ(2))'=176626 Q
 .Q:'$D(^AUPNPAT(DFN,0))
 .Q:'$D(^DPT(DFN,0))
 .Q:$P(^DPT(DFN,0),U,19)  ;merged away
 .Q:$P(^DPT(DFN,0),U,1)["DEMO,PATIENT"
 .Q:$P(^DPT(DFN,0),U,1)["PATIENT,CRS"
 .Q:$$DEMO(DFN,"E")
 .;S C=$$COMMRES^AUPNPAT(DFN,"E")
 .;I C'="COWETA",C'="TULSA,URBAN" Q
 .S BUDAGE=$$AGE^AUPNPAT(DFN,BUDCAD)
 .S BUDSEX=$P(^DPT(DFN,0),U,2)
 .S BUDCOM=$$COMMRES^AUPNPAT(DFN,"E") I BUDCOM="" S BUDCOM="UNKNOWN"
 .D GETV^BUD9RPTD  ;get visits that meet criteria
 .I BUDT35V=0 Q  ;user doesn't have any countable visits and is not considered a user
 .I $G(BUDTZ) D TZ
 .I $G(BUDT3A) D T3A
 .I $G(BUDT3B) D T3B
 .I $G(BUDT5) D T5
 .I $G(BUDT6) D T6
 .Q
 Q
 ;
DEMO(P,T) ;EP - called to exclude demo patients
 I $G(P)="" Q 0
 I $G(T)="" S T="I"
 I T="I" Q 0
 NEW R
 S R=""
 I T="E" D  Q R
 .I $P($G(^DPT(P,0)),U)["DEMO,PATIENT" S R=1 Q
 .NEW %
 .S %=$O(^DIBT("B","RPMS DEMO PATIENT NAMES",0))
 .I '% S R=0 Q
 .I $D(^DIBT(%,1,P)) S R=1 Q
 I T="O" D  Q R
 .I $P($G(^DPT(P,0)),U)["DEMO,PATIENT" S R=0 Q
 .NEW %
 .S %=$O(^DIBT("B","RPMS DEMO PATIENT NAMES",0))
 .I '% S R=1 Q
 .I $D(^DIBT(%,1,P)) S R=0 Q
 .S R=1 Q
 Q 0
 ;
T4 ;
 Q
T3A ;
 S G=0,Y=0 F  S Y=$O(^BUDNTTA("AC",Y)) Q:'Y!(G)  S X=$O(^BUDNTTA("AC",Y,0))  D
 .S L=$P(^BUDNTTA(X,0),U,7),H=$P(^BUDNTTA(X,0),U,8),P=$P(^BUDNTTA(X,0),U,2)
 .I BUDAGE<0 S P=1 S $P(BUDTOT(BUDSEX),U,P)=$P(BUDTOT(BUDSEX),U,P)+1,$P(BUDTOT("ALL"),U,P)=$P(BUDTOT("ALL"),U,P)+1 D T S G=1 Q
 .I BUDAGE'<L,BUDAGE'>H S $P(BUDTOT(BUDSEX),U,P)=$P(BUDTOT(BUDSEX),U,P)+1,$P(BUDTOT("ALL"),U,P)=$P(BUDTOT("ALL"),U,P)+1 D T S G=1
 .Q
 I $G(BUDT3AL) S X=0 F  S X=$O(^TMP($J,"VISITS356A",X)) Q:X'=+X  S ^XTMP("BUD9RPT1",BUDJ,BUDH,"3A",BUDAGE,BUDSEX,BUDCOM,DFN,X)=""
 I $G(BUDSTMP) S ^XTMP("BUD9RPT1",BUDJ,BUDH,"3ATEMP",DFN)=""
 Q
T ;
 S $P(BUDTOT(BUDSEX),U,39)=$P(BUDTOT(BUDSEX),U,39)+1,$P(BUDTOT("ALL"),U,39)=$P(BUDTOT("ALL"),U,39)+1
 I BUDAGE<20 S BUD019(BUDSEX)=BUD019(BUDSEX)+1,BUD019("ALL")=BUD019("ALL")+1
 Q
TZ ;
 S BUDR=$$ZIP(DFN)
 I BUDR="" S BUDR="Unknown Residence"
 S ^XTMP("BUD9RPT1",BUDJ,BUDH,"ZIP",BUDR)=$G(^XTMP("BUD9RPT1",BUDJ,BUDH,"ZIP",BUDR))+1
 I $G(BUDTZL) S X=0 F  S X=$O(^TMP($J,"VISITS356A",X)) Q:X'=+X  S ^XTMP("BUD9RPT1",BUDJ,BUDH,"Z",BUDR,BUDCOM,BUDSEX,$P(^DPT(DFN,0),U),DFN,X)=""
 Q
T3B ;
 S BUDHISPN=$$HISP(DFN)
 S BUDHISP=$P($$HISP(DFN),U,1)  ;column
 S BUDHISP1=BUDHISP+2  ;set piece
 ;
 S BUDR1=$$RACE(DFN)
 S BUDR=$P(BUDR1,U,1)  ;LINE
 ;S BUDRACEN=$P(BUDR1,U,2)
 ;S BUDRACEN=$$RACE^BUD9RPL4(BUDRACEN,)
 S $P(BUDRACET(BUDR),U,BUDHISP1)=$P(BUDRACET(BUDR),U,BUDHISP1)+1  ;HISPANIC COLUMN FOR RACE
 S $P(BUDRACET(BUDR),U,6)=$P(BUDRACET(BUDR),U,6)+1  ;TOTAL COLUMN FOR RACE
 I BUDR="2A"!(BUDR="2B") S $P(BUDRACET(2),U,BUDHISP1)=$P(BUDRACET(2),U,BUDHISP1)+1,$P(BUDRACET(2),U,6)=$P(BUDRACET(2),U,6)+1  ;total line 2
 S $P(BUDRACET(8),U,BUDHISP1)=$P(BUDRACET(8),U,BUDHISP1)+1,$P(BUDRACET(8),U,6)=$P(BUDRACET(8),U,6)+1
 I $P(BUDR1,U,5)=16 S $P(BUDR1,U,5)=8
 I $G(BUDT3BRL) S X=0 F  S X=$O(^TMP($J,"VISITS356A",X)) Q:X'=+X  S ^XTMP("BUD9RPT1",BUDJ,BUDH,"3BR",$P(BUDR1,U,5),$P(BUDHISPN,U,1),BUDAGE,BUDSEX,BUDCOM,DFN,X)=BUDR1_"|||"_BUDHISPN
 Q
T5 ;tally prim provider by discipline and by user
 S BUDV=0 F  S BUDV=$O(^TMP($J,"VISITS356A",BUDV)) Q:BUDV'=+BUDV  D
 .S BUDP=$$PRIMPROV^APCLV(BUDV,"D")
 .I BUDP="" Q
 .;special case for DX of MH
 .;special case for provider code 15 and location CHS*
 .I $E($$VAL^XBDIQ1(9000010,BUDV,.06),1,3)="CHS",BUDP=15 S BUDT5LN=2 D T5SET Q
 .S BUDY=$O(^BUDNTFIV("C",BUDP,0)) I BUDY="" S BUDT5LN=35 D T5SET Q
 .;next lines for Bh stuff based on dx
 .S T=$O(^BUDNCNTL("B","BH DISCIPLINES FOR 20 AND 21",0))
 .I $D(^BUDNCNTL(T,11,"B",BUDP)) D  D T5SET Q
 ..S P=$$PRIMPOV^APCLV(BUDV,"C")
 ..I $E(P,1,3)=303!($E(P,1,3)="304")!($E(P,1,3)="305") S BUDT5LN="21" Q
 ..S BUDT5LN=$P(^BUDNCNTL(T,11,$O(^BUDNCNTL(T,11,"B",BUDP,0)),0),U,2) Q
 .S BUDT5LN=$P(^BUDNTFIV(BUDY,0),U)
 .D T5SET
 .Q
 Q
T5SET ;
 I BUDT5LN>0,BUDT5LN<8 D T5PHY
 I +BUDT5LN>8,+BUDT5LN<11 D T5MID
 I +BUDT5LN>10,BUDT5LN<15 D T5NUR
 I BUDT5LN>15,BUDT5LN<19 D T5DENT
 I +BUDT5LN=20 D T520
 I BUDT5LN=21 D T521
 I BUDT5LN=22 D T522
 I BUDT5LN=23 D T523
 I BUDT5LN>23,BUDT5LN<29 D T5ENA
 I BUDT5LN="29A" D T529A
 I BUDT5LN["30" D T530A
 I +BUDT5LN>29,BUDT5LN<33 D T5ADM
 I BUDT5LN=35 D T5OTH
 I $G(BUDT5L)!($G(BUDT5L2)) D
 .S ^XTMP("BUD9RPT1",BUDJ,BUDH,"T5",+BUDT5LN,$S(BUDT5LN="20A1":"A1",BUDT5LN="20A2":"A2",+BUDT5LN=BUDT5LN:0,1:$E(BUDT5LN,$L(BUDT5LN))),BUDCOM,BUDAGE,BUDSEX,DFN,BUDV)=$$PRIMPROV^APCLV(BUDV,"N")_"^"_$$PRIMPROV^APCLV(BUDV,"P")
 I $G(BUDT5L1) S ^XTMP("BUD9RPT1",BUDJ,BUDH,"T51",+BUDT5LN,$S(BUDT5LN="20A1":"A1",BUDT5LN="20A2":"A2",+BUDT5LN=BUDT5LN:0,1:$E(BUDT5LN,$L(BUDT5LN))),$$PRIMPROV^APCLV(BUDV,"N"))=$$PRIMPROV^APCLV(BUDV,"D")_" "_$$PRIMPROV^APCLV(BUDV,"E")
 Q
T5PHY ;set physcian enc total, set med serv enc and user totals
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total visits for this line
 S $P(BUDTAB5(8),U)=$P(BUDTAB5(8),U)+1  ;total phy encs line
 S $P(BUDTAB5(15),U)=$P(BUDTAB5(15),U)+1  ;total med services line
 I $G(BUDT5L3) D
 .I $D(^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"MED SERV",$$VD^APCLV(BUDV))) D  I 1
 ..S ^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"MED SERV",$$VD^APCLV(BUDV))=^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"MED SERV",$$VD^APCLV(BUDV))_U_BUDV
 .E  S ^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"MED SERV",$$VD^APCLV(BUDV))=BUDV
 I $D(^TMP($J,"PATIENTS","MED SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","MED SERV",DFN)="",$P(BUDTAB5(15),U,2)=$P(BUDTAB5(15),U,2)+1
 Q
T5MID ;set MID LEVEL enc total, set med serv enc and user totals
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total visits for this line
 S $P(BUDTAB5("10A"),U)=$P(BUDTAB5("10A"),U)+1  ;total MID encs line
 S $P(BUDTAB5(15),U)=$P(BUDTAB5(15),U)+1  ;total med services line
 I $D(^TMP($J,"PATIENTS","MED SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","MED SERV",DFN)="",$P(BUDTAB5(15),U,2)=$P(BUDTAB5(15),U,2)+1
 Q
T5NUR ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total visits for this line
 ;I BUDT5LN=12 Q
 ;I BUDT5LN=13 Q
 ;I BUDT5LN=14 Q
 I BUDT5LN=11 S $P(BUDTAB5(15),U)=$P(BUDTAB5(15),U)+1  ;total med services line
 I $D(^TMP($J,"PATIENTS","MED SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","MED SERV",DFN)="",$P(BUDTAB5(15),U,2)=$P(BUDTAB5(15),U,2)+1
 Q
T5DENT ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total visits for this line
 I BUDT5LN=18 Q
 S $P(BUDTAB5(19),U)=$P(BUDTAB5(19),U)+1  ;total dental services line
 I $G(BUDT5L3) D  I 1
 .I $D(^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"DENT SERV",$$VD^APCLV(BUDV))) D
 ..S ^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"DENT SERV",$$VD^APCLV(BUDV))=^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"DENT SERV",$$VD^APCLV(BUDV))_U_BUDV
 .E  S ^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"DENT SERV",$$VD^APCLV(BUDV))=BUDV
 I $D(^TMP($J,"PATIENTS","DENT SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","DENT SERV",DFN)="",$P(BUDTAB5(19),U,2)=$P(BUDTAB5(19),U,2)+1
 Q
T520 ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total visits for this line
 S $P(BUDTAB5(20),U)=$P(BUDTAB5(20),U)+1
 I $G(BUDT5L3) D  I 1
 .I $D(^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"MENT SERV",$$VD^APCLV(BUDV))) D
 ..S ^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"MENT SERV",$$VD^APCLV(BUDV))=^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"MENT SERV",$$VD^APCLV(BUDV))_U_BUDV
 .E  S ^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"MENT SERV",$$VD^APCLV(BUDV))=BUDV
 I $D(^TMP($J,"PATIENTS","20 SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","20 SERV",DFN)="",$P(BUDTAB5(20),U,2)=$P(BUDTAB5(20),U,2)+1
 Q
T521 ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total visits for this line
 I $G(BUDT5L3) D  I 1
 .I $D(^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"SUB SERV",$$VD^APCLV(BUDV))) D
 ..S ^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"SUB SERV",$$VD^APCLV(BUDV))=^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"SUB SERV",$$VD^APCLV(BUDV))_U_BUDV
 .E  S ^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"SUB SERV",$$VD^APCLV(BUDV))=BUDV
 I $D(^TMP($J,"PATIENTS","21 SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","21 SERV",DFN)="",$P(BUDTAB5(21),U,2)=$P(BUDTAB5(21),U,2)+1
 Q
T522 ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total visits for this line
 I $G(BUDT5L3) D  I 1
 .I $D(^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"OTH SERV",BUDP,$$VD^APCLV(BUDV))) D
 ..S ^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"OTH SERV",BUDP,$$VD^APCLV(BUDV))=^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"OTH SERV",BUDP,$$VD^APCLV(BUDV))_U_BUDV
 .E  S ^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"OTH SERV",BUDP,$$VD^APCLV(BUDV))=BUDV
 I $D(^TMP($J,"PATIENTS","22 SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","22 SERV",DFN)="",$P(BUDTAB5(22),U,2)=$P(BUDTAB5(22),U,2)+1
 Q
T523 ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total visits for this line
 Q
T5ENA ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total visits for this line
 ;I BUDT5LN=23 Q
 ;I BUDT5LN=26 Q
 ;I BUDT5LN=27 Q
 ;I BUDT5LN=28 Q
 I BUDT5LN=24!(BUDT5LN=25) S $P(BUDTAB5(29),U)=$P(BUDTAB5(29),U)+1  ;total enabling services line
 I $G(BUDT5L3) D  I 1
 .I $D(^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"ENA SERV",BUDT5LN,$$VD^APCLV(BUDV))) D
 ..S ^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"ENA SERV",BUDT5LN,$$VD^APCLV(BUDV))=^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"ENA SERV",BUDT5LN,$$VD^APCLV(BUDV))_U_BUDV
 .E  S ^XTMP("BUD9RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"ENA SERV",BUDT5LN,$$VD^APCLV(BUDV))=BUDV
 I $D(^TMP($J,"PATIENTS","ENA SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","ENA SERV",DFN)="",$P(BUDTAB5(29),U,2)=$P(BUDTAB5(29),U,2)+1
 Q
T529A ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total visits for this line
 Q
T530A ;
 S $P(BUDTAB5(30),U)=$P(BUDTAB5(30),U)+1  ;total line 30
T5ADM ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total visits for this line
 S $P(BUDTAB5(33),U)=$P(BUDTAB5(33),U)+1  ;total adm services line
 I $D(^TMP($J,"PATIENTS","ADM SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","ADM SERV",DFN)="",$P(BUDTAB5(33),U,2)=$P(BUDTAB5(33),U,2)+1
 Q
T5OTH ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1
 Q
 ;
T6 ;
 D T6^BUD9RPC1
 Q
 ;
HISP(DFN) ;EP
 ;NEW FOR 09 RETURN 1 IF HISP/LATINO, 2 IF NOT HISP/LATINO, 3 IF Unreported
 NEW X,Y,Z,V
 I $G(DFN)="" Q ""
 S Y=$$ETHN(DFN)
 I Y="HISPANIC OR LATINO" Q 1_U_"E"_U_Y
 I Y="NOT HISPANIC OR LATINO" Q 2_U_"E"_U_Y
 NEW X S X=$P(^DPT(DFN,0),U,6)
 S Z=""
 I X S Z=$P(^DIC(10,X,0),U,2)
 I Z=1 Q 1_U_"R"_U_$$RABB(Z)
 I Z=2 Q 1_U_"R"_U_$$RABB(Z)
 I Z="D"!(Z="U")!(Z=7) D  Q V
 .I Y]"" S V=3_U_"E"_U_Y Q
 .S V=3_U_"R"_U_$$RABB(Z)
 I Z]"" Q 2_"^R^"_$$RABB(Z)
 I Y]"" Q 3_U_"E"_U_Y
 I $$BEN^AUPNPAT(DFN,"C")="01",Y="" Q 2_U_"C"_U_"AI/AN"
 Q 3_"^E^BLANK RACE & ETHNICITY"
 ;
ETHN(P) ;EP
 NEW Z,E
 S E=""
 S Z=0 F  S Z=$O(^DPT(P,.06,Z)) Q:Z'=+Z!(E]"")  D
 .S E=$P($G(^DPT(P,.06,Z,0)),U,1)
 .Q:E=""
 .S E=$P($G(^DIC(10.2,E,0)),U,1)
 .Q
 Q E
RACE(DFN) ;EP
 NEW X,Y,Z
 I $G(DFN)="" Q ""
 NEW X S X=$P(^DPT(DFN,0),U,6)
 I X="" G CL
 I X S Z=$P(^DIC(10,X,0),U),X=$P($G(^DIC(10,X,0)),U,2)
 I X="" G CL
 I X="A" Q "1^ASIAN^R"_U_Z_U_1
 I X="H" Q "2A^NATIVE HAWAIIAN^R"_U_Z_U_2
 I X=5 Q "2B^OTH PAC ISLANDER^R"_U_Z_U_3
 I X=4!(X="B") Q "3^BLACK^R"_U_Z_U_4
 I X=3!(X="Z") Q "4^AI/AN^R"_U_Z_U_5
 I X=6!(X="W") Q "5^WHITE^R"_U_Z_U_6
 I X=1 Q "5^WHITE^R"_U_Z_U_6
 I X="D" Q "7^UNREP/REF^R"_U_Z_U_16
 I X="7" Q "7^UNREP/REF^R"_U_Z_U_16
 I X="U" Q "7^UNREP/REF^R"_U_Z_U_16
 I X=2 Q "3^BLACK^R"_U_Z_U_4
CL I $$BEN^AUPNPAT(DFN,"C")="01" Q "4^AI/AN^C^AI/AN^5"
 Q "7^UNREP/REF^C^BLANK RACE^8"
 ;
ZIP(DFN) ;
 I $G(DFN)="" Q ""
 Q $E($P($G(^DPT(DFN,.11)),U,6),1,5)
 ;
RABB(X) ;
 I X="A" Q "ASIAN"
 I X="H" Q "NATIVE HAWAIIAN"
 I X=5 Q "OTH PAC ISLANDER"
 I X="B" Q "BLACK/AFRICAN"
 I X=4 Q "BLACK NOT HISP"
 I X=3!(X="Z") Q "AI/AN"
 I X="W" Q "WHITE"
 I X=6 Q "WHITE NOT HISP"
 I X=1 Q "HISPANIC, WHITE"
 I X="D" Q "DECLINED"
 I X="7" Q "UNKNOWN"
 I X="U" Q "UNKNOWN BY PT"
 I X=2 Q "HISPANIC, BLACK"
 Q "??"
