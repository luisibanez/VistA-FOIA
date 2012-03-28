BUD7RPTC ; IHS/CMI/LAB - UDS REPORT PROCESSOR 03 Feb 2009 1:05 PM ;
 ;;5.0;IHS/RPMS UNIFORM DATA SYSTEM;;JAN 18, 2011;Build 12
 ;
 ;
PROC ;EP - called from xbdbque
 S BUDJ=$J,BUDH=$H
 K ^TMP($J)
 S ^XTMP("BUD7RPT1",0)=$$FMADD^XLFDT(DT,14)_"^"_DT_"^"_"UDS REPORT"
 ;TABLE 3A
 K BUDTOT F X=1:1:39 S $P(BUDTOT("M"),U,X)=0,$P(BUDTOT("F"),U,X)=0,$P(BUDTOT("ALL"),U,X)=0  ;for table 3A
 S BUD019("M")="",BUD019("F")="",BUD019("ALL")=""
 ;TABLE 5
 F X=1:1:6 S BUDTAB5(X)="0^0"
 F X=7:1:38 S BUDTAB5(X)="0^0"
 F X="9A","9B","20A","20B","20C","29A","10A","27a" S BUDTAB5(X)="0^0"
 ;TABLE 3B
 K BUDHISP
 S BUDHISP(1)=" 1.^Hispanic or Latino^0"
 S BUDHISP(2)=" 2.^All others (including Unreported)^0"
 S BUDHISP(3)=" 3.^<not used>^"
 S BUDHISP(4)=" 4.^TOTAL PATIENTS (SUM LINES 1-2)^0^MUST = LINE 11"
 K BUDRACET
 S BUDRACET("5A")="5a.^Asian^0"
 S BUDRACET("5B")="5b.^Native Hawaiian^0"
 S BUDRACET("5C")="5c.^Other Pacific Islander^0"
 S BUDRACET("5Z")=" 5.^TOTAL ASIAN/PACIFIC ISLANDER^0^(SUM LINES 5A+5B+5C)"
 S BUDRACET(6)=" 6.^Black/African American (including Blacks or African^0^Americans of Latino or Hispanic Descent)"
 S BUDRACET(7)=" 7.^American Indian/Alaska Native (including American Indians or^0^Alaska Natives of Latino/Hispanic Descent)"
 S BUDRACET(8)=" 8.^White (including Whites of Latino/Hispanic Descent)^0"
 S BUDRACET(9)=" 9.^More than one race^0"
 S BUDRACET(10)="10.^Unreported / Refused to report^0"
 S BUDRACET(11)="11.^  TOTAL PATIENTS (SUM LINES 5-10 MUST = LINE 4)^0"
 K BUDLANG
 S BUDLANG(12)="12.^PATIENT BEST SERVED IN A LANGUAGE OTHER THAN ENGLISH^0"
 ;TABLE 6
 F X=1:1:26 S $P(BUDT6("V"),U,X)=0,$P(BUDT6("P"),U,X)=0
 ;NOW LOOP THROUGH PATIENT FILE
 S DFN=0 F  S DFN=$O(^AUPNPAT(DFN)) Q:DFN'=+DFN  D
 .;I DUZ=5634,'$D(^DIBT(4370,1,DFN)) Q
 .K ^TMP($J)
 .Q:'$D(^AUPNPAT(DFN,0))
 .Q:'$D(^DPT(DFN,0))
 .Q:$P(^DPT(DFN,0),U,19)  ;merged away
 .Q:$P(^DPT(DFN,0),U,1)["DEMO,PATIENT"
 .Q:$P(^DPT(DFN,0),U,1)["PATIENT,CRS"
 .S C=$$COMMRES^AUPNPAT(DFN,"E")
 .;I C'="COWETA",C'="TULSA,URBAN" Q
 .S BUDAGE=$$AGE^AUPNPAT(DFN,BUDCAD)
 .S BUDSEX=$P(^DPT(DFN,0),U,2)
 .S BUDCOM=$$COMMRES^AUPNPAT(DFN,"E") I BUDCOM="" S BUDCOM="UNKNOWN"
 .D GETV^BUD7RPTD  ;get visits that meet criteria
 .I BUDT35V=0 Q  ;user doesn't have any countable visits and is not considered a user
 .I $G(BUDTZ) D TZ
 .I $G(BUDT3A) D T3A
 .I $G(BUDT3B) D T3B
 .I $G(BUDT5) D T5
 .I $G(BUDT6) D T6
 .Q
 Q
 ;
T4 ;
 Q
T3A ;
 S G=0,Y=0 F  S Y=$O(^BUDETTA("AC",Y)) Q:'Y!(G)  S X=$O(^BUDETTA("AC",Y,0))  D
 .S L=$P(^BUDETTA(X,0),U,7),H=$P(^BUDETTA(X,0),U,8),P=$P(^BUDETTA(X,0),U,2)
 .I BUDAGE<0 S P=1 S $P(BUDTOT(BUDSEX),U,P)=$P(BUDTOT(BUDSEX),U,P)+1,$P(BUDTOT("ALL"),U,P)=$P(BUDTOT("ALL"),U,P)+1 D T S G=1 Q
 .I BUDAGE'<L,BUDAGE'>H S $P(BUDTOT(BUDSEX),U,P)=$P(BUDTOT(BUDSEX),U,P)+1,$P(BUDTOT("ALL"),U,P)=$P(BUDTOT("ALL"),U,P)+1 D T S G=1
 .Q
 I $G(BUDT3AL) S X=0 F  S X=$O(^TMP($J,"VISITS35",X)) Q:X'=+X  S ^XTMP("BUD7RPT1",BUDJ,BUDH,"3A",BUDAGE,BUDSEX,BUDCOM,DFN,X)=""
 Q
T ;
 S $P(BUDTOT(BUDSEX),U,39)=$P(BUDTOT(BUDSEX),U,39)+1,$P(BUDTOT("ALL"),U,39)=$P(BUDTOT("ALL"),U,39)+1
 I BUDAGE<20 S BUD019(BUDSEX)=BUD019(BUDSEX)+1,BUD019("ALL")=BUD019("ALL")+1
 Q
TZ ;
 S BUDR=$$ZIP(DFN)
 I BUDR="" S BUDR="Unknown Residence"
 S ^XTMP("BUD7RPT1",BUDJ,BUDH,"ZIP",BUDR)=$G(^XTMP("BUD7RPT1",BUDJ,BUDH,"ZIP",BUDR))+1
 I $G(BUDTZL) S X=0 F  S X=$O(^TMP($J,"VISITS35",X)) Q:X'=+X  S ^XTMP("BUD7RPT1",BUDJ,BUDH,"Z",BUDR,BUDCOM,BUDSEX,$P(^DPT(DFN,0),U),DFN,X)=""
 Q
T3B ;
 S BUDR=$$HISP(DFN)
 S $P(BUDHISP(BUDR),U,3)=$P(BUDHISP(BUDR),U,3)+1
 S $P(BUDHISP(4),U,3)=$P(BUDHISP(4),U,3)+1
 ;
 S BUDR=$P($$RACE(DFN),U,1)
 S $P(BUDRACET(BUDR),U,3)=$P(BUDRACET(BUDR),U,3)+1
 S $P(BUDRACET(11),U,3)=$P(BUDRACET(11),U,3)+1
 I BUDR[5 S $P(BUDRACET("5Z"),U,3)=$P(BUDRACET("5Z"),U,3)+1
 I $G(BUDT3BL),'$G(BUDT3AL) S X=0 F  S X=$O(^TMP($J,"VISITS35",X)) Q:X'=+X  S ^XTMP("BUD7RPT1",BUDJ,BUDH,"3A",BUDAGE,BUDSEX,BUDCOM,DFN,X)=""
 Q
T5 ;tally prim provider by discipline and by user
 S BUDV=0 F  S BUDV=$O(^TMP($J,"VISITS35",BUDV)) Q:BUDV'=+BUDV  D
 .S BUDP=$$PRIMPROV^APCLV(BUDV,"D")
 .I BUDP="" Q
 .;special case for DX of MH
 .;special case for provider code 15 and location CHS*
 .I $E($$VAL^XBDIQ1(9000010,BUDV,.06),1,3)="CHS",BUDP=15 S BUDT5LN=2 D T5SET Q
 .S BUDY=$O(^BUDETFIV("C",BUDP,0)) I BUDY="" S BUDT5LN=35 D T5SET Q
 .;next lines for Bh stuff based on dx
 .S T=$O(^BUDECNTL("B","BH DISCIPLINES FOR 20 AND 21",0))
 .I $D(^BUDECNTL(T,11,"B",BUDP)) D  D T5SET Q
 ..S P=$$PRIMPOV^APCLV(BUDV,"C")
 ..I $E(P,1,3)=303!($E(P,1,3)="304")!($E(P,1,3)="305") S BUDT5LN="21" Q
 ..S BUDT5LN=$P(^BUDECNTL(T,11,$O(^BUDECNTL(T,11,"B",BUDP,0)),0),U,2) Q
 .S BUDT5LN=$P(^BUDETFIV(BUDY,0),U)
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
 I +BUDT5LN>29,BUDT5LN<33 D T5ADM
 I BUDT5LN=35 D T5OTH
 I $G(BUDT5L)!($G(BUDT5L2)) S ^XTMP("BUD7RPT1",BUDJ,BUDH,"T5",+BUDT5LN,$S(+BUDT5LN=BUDT5LN:0,1:$E(BUDT5LN,$L(BUDT5LN))),BUDCOM,BUDAGE,BUDSEX,DFN,BUDV)=$$PRIMPROV^APCLV(BUDV,"N")_"^"_$$PRIMPROV^APCLV(BUDV,"P")
 I $G(BUDT5L1) S ^XTMP("BUD7RPT1",BUDJ,BUDH,"T51",+BUDT5LN,$S(+BUDT5LN=BUDT5LN:0,1:$E(BUDT5LN,$L(BUDT5LN))),$$PRIMPROV^APCLV(BUDV,"N"))=$$PRIMPROV^APCLV(BUDV,"D")_" "_$$PRIMPROV^APCLV(BUDV,"E")
 Q
T5PHY ;set physcian enc total, set med serv enc and user totals
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total encounters for this line
 S $P(BUDTAB5(8),U)=$P(BUDTAB5(8),U)+1  ;total phy encs line
 S $P(BUDTAB5(15),U)=$P(BUDTAB5(15),U)+1  ;total med services line
 I $G(BUDT5L3) D
 .I $D(^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"MED SERV",$$VD^APCLV(BUDV))) D  I 1
 ..S ^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"MED SERV",$$VD^APCLV(BUDV))=^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"MED SERV",$$VD^APCLV(BUDV))_U_BUDV
 .E  S ^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"MED SERV",$$VD^APCLV(BUDV))=BUDV
 I $D(^TMP($J,"PATIENTS","MED SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","MED SERV",DFN)="",$P(BUDTAB5(15),U,2)=$P(BUDTAB5(15),U,2)+1
 Q
T5MID ;set MID LEVEL enc total, set med serv enc and user totals
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total encounters for this line
 S $P(BUDTAB5("10A"),U)=$P(BUDTAB5("10A"),U)+1  ;total MID encs line
 S $P(BUDTAB5(15),U)=$P(BUDTAB5(15),U)+1  ;total med services line
 I $D(^TMP($J,"PATIENTS","MED SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","MED SERV",DFN)="",$P(BUDTAB5(15),U,2)=$P(BUDTAB5(15),U,2)+1
 Q
T5NUR ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total encounters for this line
 I BUDT5LN=12 Q
 I BUDT5LN=13 Q
 I BUDT5LN=14 Q
 S $P(BUDTAB5(15),U)=$P(BUDTAB5(15),U)+1  ;total med services line
 I $D(^TMP($J,"PATIENTS","MED SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","MED SERV",DFN)="",$P(BUDTAB5(15),U,2)=$P(BUDTAB5(15),U,2)+1
 Q
T5DENT ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total encounters for this line
 I BUDT5LN=18 Q
 S $P(BUDTAB5(19),U)=$P(BUDTAB5(19),U)+1  ;total dental services line
 I $G(BUDT5L3) D  I 1
 .I $D(^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"DENT SERV",$$VD^APCLV(BUDV))) D
 ..S ^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"DENT SERV",$$VD^APCLV(BUDV))=^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"DENT SERV",$$VD^APCLV(BUDV))_U_BUDV
 .E  S ^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"DENT SERV",$$VD^APCLV(BUDV))=BUDV
 I $D(^TMP($J,"PATIENTS","DENT SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","DENT SERV",DFN)="",$P(BUDTAB5(19),U,2)=$P(BUDTAB5(19),U,2)+1
 Q
T520 ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total encounters for this line
 S $P(BUDTAB5(20),U)=$P(BUDTAB5(20),U)+1
 I $G(BUDT5L3) D  I 1
 .I $D(^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"MENT SERV",$$VD^APCLV(BUDV))) D
 ..S ^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"MENT SERV",$$VD^APCLV(BUDV))=^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"MENT SERV",$$VD^APCLV(BUDV))_U_BUDV
 .E  S ^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"MENT SERV",$$VD^APCLV(BUDV))=BUDV
 I $D(^TMP($J,"PATIENTS","20 SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","20 SERV",DFN)="",$P(BUDTAB5(20),U,2)=$P(BUDTAB5(20),U,2)+1
 Q
T521 ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total encounters for this line
 I $G(BUDT5L3) D  I 1
 .I $D(^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"SUB SERV",$$VD^APCLV(BUDV))) D
 ..S ^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"SUB SERV",$$VD^APCLV(BUDV))=^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"SUB SERV",$$VD^APCLV(BUDV))_U_BUDV
 .E  S ^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"SUB SERV",$$VD^APCLV(BUDV))=BUDV
 I $D(^TMP($J,"PATIENTS","21 SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","21 SERV",DFN)="",$P(BUDTAB5(21),U,2)=$P(BUDTAB5(21),U,2)+1
 Q
T522 ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total encounters for this line
 I $G(BUDT5L3) D  I 1
 .I $D(^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"OTH SERV",BUDP,$$VD^APCLV(BUDV))) D
 ..S ^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"OTH SERV",BUDP,$$VD^APCLV(BUDV))=^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"OTH SERV",BUDP,$$VD^APCLV(BUDV))_U_BUDV
 .E  S ^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"OTH SERV",BUDP,$$VD^APCLV(BUDV))=BUDV
 I $D(^TMP($J,"PATIENTS","22 SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","22 SERV",DFN)="",$P(BUDTAB5(22),U,2)=$P(BUDTAB5(22),U,2)+1
 Q
T523 ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total encounters for this line
 Q
T5ENA ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total encounters for this line
 I BUDT5LN=23 Q
 I BUDT5LN=26 Q
 I BUDT5LN=27 Q
 I BUDT5LN=28 Q
 S $P(BUDTAB5(29),U)=$P(BUDTAB5(29),U)+1  ;total enabling services line
 I $G(BUDT5L3) D  I 1
 .I $D(^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"ENA SERV",BUDP,$$VD^APCLV(BUDV))) D
 ..S ^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"ENA SERV",BUDP,$$VD^APCLV(BUDV))=^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"ENA SERV",BUDP,$$VD^APCLV(BUDV))_U_BUDV
 .E  S ^XTMP("BUD7RPT1",BUDJ,BUDH,"T53",BUDCOM,BUDAGE,BUDSEX,DFN,"ENA SERV",BUDP,$$VD^APCLV(BUDV))=BUDV
 I $D(^TMP($J,"PATIENTS","ENA SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","ENA SERV",DFN)="",$P(BUDTAB5(29),U,2)=$P(BUDTAB5(29),U,2)+1
 Q
T529A ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total encounters for this line
 Q
T5ADM ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1  ;total encounters for this line
 S $P(BUDTAB5(33),U)=$P(BUDTAB5(33),U)+1  ;total adm services line
 I $D(^TMP($J,"PATIENTS","ADM SERV",DFN)) Q
 S ^TMP($J,"PATIENTS","ADM SERV",DFN)="",$P(BUDTAB5(33),U,2)=$P(BUDTAB5(33),U,2)+1
 Q
T5OTH ;
 S $P(BUDTAB5(BUDT5LN),U)=$P(BUDTAB5(BUDT5LN),U)+1
 Q
 ;
T6 ;
 D T6^BUD7RPC1
 Q
 ;
HISP(DFN) ;EP
 I $G(DFN)="" Q ""
 I $$BEN^AUPNPAT(DFN,"C")="01" Q 2  ;LINE 2
 NEW X S X=$P(^DPT(DFN,0),U,6)
 I X="" Q 2
 S X=$P(^DIC(10,X,0),U,2)
 I X=1 Q 1
 I X=2 Q 1
 Q 2
 ;
RACE(DFN) ;EP
 I $G(DFN)="" Q ""
 I $$BEN^AUPNPAT(DFN,"C")="01" Q "7^AI/AN"
 NEW X S X=$P(^DPT(DFN,0),U,6)
 I X="" Q "10^UNREP/REF"
 I X S X=$P($G(^DIC(10,X,0)),U,2)
 I X="" Q "10^UNREP/REF"
 I X="A" Q "5A^ASIAN"
 I X="H" Q "5B^NATIVE HAWAIIAN"
 I X=5 Q "5C^OTH PAC ISLANDER"
 I X=4!(X="B") Q "6^BLACK"
 I X=3!(X="Z") Q "7^AI/AN"
 I X=6!(X="W") Q "8^WHITE"
 I X=1 Q "8^HISPANIC,WHITE"
 I X="D" Q "10^UNREP/REF"
 I X="7" Q "10^UNREP/REF"
 I X="U" Q "10^UNREP/REF"
 I X=2 Q "6^HISPANIC,BLACK"
 Q "10^UNREP/REF"
 ;
ZIP(DFN) ;
 I $G(DFN)="" Q ""
 Q $E($P($G(^DPT(DFN,.11)),U,6),1,5)
 ;
