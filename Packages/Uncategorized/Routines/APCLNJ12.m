APCLNJ12 ; IHS/CMI/LAB - PRINT VISITS WITH INJURIES ;  
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;
 ;cmi/anch/maw 9/10/2007 code set versioning in PRNT
 ;
INIT ;initialize variables
 S Y=APCLBD D DD^%DT S APCLBDD=Y S Y=APCLED D DD^%DT S APCLEDD=Y
 D ^APCLNJ13 K APCLSTOP,APCLPAGE
 S APCLSTOP="",APCLPAGE=0 D HEAD
 I '$D(^XTMP("APCLNJ1",APCLJOB,APCLBT)) W !,"No injury visits to report."  G END
 ;
SET ;
 S APCLNAME=0
 F  S APCLNAME=$O(^XTMP("APCLNJ1",APCLJOB,APCLBT,APCLNAME)) Q:APCLNAME=""!(APCLSTOP="^")  D SET2
END ;
 D DONE^APCLOSUT
 K ^XTMP("APCLNJ1",APCLJOB,APCLBT),APCLET
 Q
SET2 ;
 S APCLDFN=0
 S APCLDFN=$O(^XTMP("APCLNJ1",APCLJOB,APCLBT,APCLNAME,APCLDFN))
SET3 F  S APCLVDT=$O(^XTMP("APCLNJ1",APCLJOB,APCLBT,APCLNAME,APCLDFN,APCLVDT)) Q:APCLVDT=""!(APCLSTOP="^")  D SET4
 Q
SET4 ;
 S APCLVDFN=$O(^XTMP("APCLNJ1",APCLJOB,APCLBT,APCLNAME,APCLDFN,APCLVDT,""))
 S APCLHRCN=$S($D(^AUPNPAT(APCLDFN,41,DUZ(2),0)):$P(^(0),U,2),1:"")
SET41 ;
 K ^UTILITY("DIQ1",$J) S DIC=9000001,DA=APCLDFN,DR=1102.99 D EN^DIQ1
 S APCLAGE=$G(^UTILITY("DIQ1",$J,9000001,APCLDFN,1102.99)) K ^UTILITY("DIQ1",$J)
 I $Y>(IOSL-8) D HEAD Q:APCLSTOP="^"
 W !!,$E(APCLNAME,1,20),?22,$J(APCLHRCN,6),?32,$J(APCLAGE,2)
 W ?38,$E(APCLVDT,4,5),"/",$E(APCLVDT,6,7),"/",$E(APCLVDT,2,3)_" "_$E($P(APCLVDT,".",2)_"0000",1,4)
 ;
 S APCLPRV=0
PRV S APCLPRV=$O(^AUPNVPRV("AD",APCLVDFN,APCLPRV))
 I APCLPRV="" S APCLPV=0 G SET5
 G PRV:'$D(^AUPNVPRV(APCLPRV,0)),PRV:$P(^(0),"^",4)'="P"
 S X=+^AUPNVPRV(APCLPRV,0)
 I $P(^DD(9000010.06,.01,0),U,2)[200 S APCLCLS=$$PROVCLSC^XBFUNC1(X) G PRV1
 S X=$P(^DIC(6,X,0),"^",4)
 S APCLCLS=$S(X="":"",'$D(^DIC(7,X,9999999)):"",1:$P(^DIC(7,X,9999999),"^"))
PRV1 W ?54,APCLCLS
 S APCLTYPE=$$EXTSET^XBFUNC(9000010,.03,$P(^AUPNVSIT(APCLVDFN,0),U,3)) W ?60,$E(APCLTYPE,1,9) S APCLSC=$$EXTSET^XBFUNC(9000010,.07,$P(^AUPNVSIT(APCLVDFN,0),U,7)) W ?70,$E(APCLSC,1,10)
 ;
 ;
SET5 ;
 S APCLPOV=0 F  S APCLPOV=$O(^XTMP("APCLNJ1",APCLJOB,APCLBT,APCLNAME,APCLDFN,APCLVDT,APCLVDFN,APCLPOV)) Q:APCLPOV=""!(APCLSTOP="^")  D PRNT
 Q
PRNT ;
 I $Y>(IOSL-8) D HEAD Q:APCLSTOP="^"
 ;W !,"ICD9:  ",$P(^ICD9(+^AUPNVPOV(APCLPOV,0),0),U),?19,"Provider Narrative:  ",$S($P(^AUPNVPOV(APCLPOV,0),U,4):$E($P(^AUTNPOV($P(^AUPNVPOV(APCLPOV,0),U,4),0),U),1,40),1:"????")  ;cmi/anch/maw 9/10/2007 orig line
 W !,"ICD9:  ",$P($$ICDDX^ICDCODE(+^AUPNVPOV(APCLPOV,0)),U,2),?19,"Provider Narrative:  ",$S($P(^AUPNVPOV(APCLPOV,0),U,4):$E($P(^AUTNPOV($P(^AUPNVPOV(APCLPOV,0),U,4),0),U),1,40),1:"????")  ;cmi/anch/maw 9/10/2007 csv
 ;I $P(^AUPNVPOV(APCLPOV,0),U,9)]"" W !,"Cause of Injury:  ",?19,$P(^ICD9($P(^AUPNVPOV(APCLPOV,0),U,9),0),U),"  -  ",$P(^(0),U,3)  ;cmi/anch/maw 9/10/2007 orig line
 I $P(^AUPNVPOV(APCLPOV,0),U,9)]"" W !,"Cause of Injury:  ",?19,$P($$ICDDX^ICDCODE($P(^AUPNVPOV(APCLPOV,0),U,9)),U,2),"  -  ",$P($$ICDDX^ICDCODE($P(^AUPNVPOV(APCLPOV,0),U,9)),U,4)  ;cmi/anch/maw 9/10/2007 csv PATCH 21
 ;W !,"F/R:  " I $P(^AUPNVPOV(APCLPOV,0),U,8)]"" S APCLFR=$$EXTSET^XBFUNC(9000010.07,.08,$P(^AUPNVPOV(APCLPOV,0),U,8)) W APCLFR
 I $P(^AUPNVPOV(APCLPOV,0),U,13)]"" W !,"Date of Injury:  ",?19,$E($P(^AUPNVPOV(APCLPOV,0),U,13),4,5),"/",$E($P(^AUPNVPOV(APCLPOV,0),U,13),6,7),"/",$E($P(^AUPNVPOV(APCLPOV,0),U,13),2,3)
 I $P(^AUPNVPOV(APCLPOV,0),U,11)]"" S APCLPA=$$EXTSET^XBFUNC(9000010.07,.11,$P(^AUPNVPOV(APCLPOV,0),U,11)) W !,"Place of Accident:  ",APCLPA
 I $P(^AUPNVPOV(APCLPOV,0),U,21)]"" S APCLPA=$$VAL^XBDIQ1(9000010.07,APCLPOV,.21) W !,"Place of Occurrence:  ",APCLPA
 I $P(^AUPNVPOV(APCLPOV,0),U,7)]"" W !,"Cause of DX:  ",$$EXTSET^XBFUNC(9000010.07,.07,$P(^AUPNVPOV(APCLPOV,0),U,7))
 Q
HEAD I 'APCLPAGE G HEAD1
 I $E(IOST)="C",IO=IO(0) W ! S DIR(0)="EO" D ^DIR K DIR I Y=0!(Y="^")!($D(DTOUT)) S APCLSTOP="^" Q
HEAD1 ;
 W:$D(IOF) @IOF S APCLPAGE=APCLPAGE+1
 W !
 S X=$P(^DIC(4,DUZ(2),0),"^")
 W !,$P(^VA(200,DUZ,0),"^",2),?(80-$L(X)/2),X,?72,"Page ",APCLPAGE,!
 W ?26,"Visits with Injury Diagnosis",!
 W ?15,"Visit Dates:  ",APCLBDD," to ",APCLEDD
 W !!,"PATIENT",?23,"HRCN",?31,"AGE",?40,"VISIT DATE",?54,"PRV",?60,"TYPE",?70,"SER CAT",!
 W "--------------------------------------------------------------------------------"
 Q
TIME NEW Y,%A,%B,%C S Y="" Q:'$D(X)  Q:X<0!(X>86400)
 S %A=X\60,%B=%A\60 S:%B>12 %B=%B-12 S:%B=0 %B=12 S:%B<10 %B=" "_%B
 S %C=$S(%A=0:"M ",%A=720:"N ",%A=1440:"M ",%A<720:"am",1:"pm")
 S Y=%B_":"_$E(%A#60+100,2,3)_" "_%C K %A,%B,%C Q
