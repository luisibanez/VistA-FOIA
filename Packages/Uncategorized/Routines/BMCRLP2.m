BMCRLP2 ; IHS/PHXAO/TMJ - PRINT REFERRAL REPORT ;    
 ;;4.0;REFERRED CARE INFO SYSTEM;;JAN 09, 2006
 ;
DONE ;EP
 D DONE^BMCRLP1
 K ^XTMP("BMCRL",BMCJOB,BMCBT)
 D DEL^BMCRL
 K BMCBD,BMCSD,BMCED,BMCEDD,BMCBDD,BMCRPT,BMCHEAD,BMCLINE,BMCL,BMCRCNT,BMCI,BMCCRIT,BMCREF,BMCRREC,BMCJOB,BMCBT,BMCBTH,BMCQUIT,BMCHDR,BMCDASH,BMCLENG,BMCPCNT,BMCTCW,BMCODAT,BMCPG,AUPNDAYS,AUPNPAT,AUPNDOD,AUPNDOB,AUPNSEX
 K BMCSORT,BMCSRT,BMCSORX,BMCFILE,BMCFIEL,BMCPRNT,BMCX,BMCTYPE,BMCFOUN,D0,J,K,L,BMCPRNM,BMCTEST,BMCSEAT,BMCLHDR,BMCFRST,BMCTST
 Q
HEAD ;ENTRY POINT
 I 'BMCPG G HEAD1
 I $E(IOST)="C",IO=IO(0) W ! S DIR(0)="EO" D ^DIR K DIR I Y=0!(Y="^")!($D(DTOUT)) S BMCQUIT="" Q
HEAD1 ;EP
 W:$D(IOF) @IOF S BMCPG=BMCPG+1
 I $G(BMCTITL)="" S BMCTEXT="PCC "_$S(BMCPTVS="R":"REFERRAL",1:"PATIENT")_" LISTING",BMCLENG=$L(BMCTEXT) W !?((BMCTCW-BMCLENG)/2),BMCTEXT,?(BMCTCW-8),"Page ",BMCPG
 I $G(BMCTITL)]"" S BMCLENG=$L(BMCTITL) W !?((BMCTCW-BMCLENG)/2),BMCTITL,?(BMCTCW-8),"Page ",BMCPG
 ;I BMCTYPE="D" S BMCLENG=46 S:BMCTCW<BMCLENG BMCLENG=BMCTCW W !?((BMCTCW-BMCLENG)/2),"Referral Dates:  ",BMCBDD," and ",BMCEDD,!
 ;I BMCTYPE="S" S BMCLENG=16+$L($P(^DIBT(BMCSEAT,0),U)) S:BMCTCW<BMCLENG BMCLENG=BMCTCW  W !?((BMCTCW-BMCLENG)/2),"Search Template: ",$P(^DIBT(BMCSEAT,0),U),!
 I $G(BMCCTYP)="N" S BMCLENG=$L(BMCSORV)+27+$L(^BMCTSORT(BMCNSRT,0),U) W !?((80-BMCLENG)/2),"BASIC STATISTICS FOR:  ",$P(^BMCTSORT(BMCNSRT,0),U) W:BMCSORT=6 ! I BMCSORT'=6 W " BY ",BMCSORV,!
 I $G(BMCCTYP)="S" S BMCLENG=$L(BMCSORV)+23 W !?((BMCTCW-BMCLENG)/2),$S(BMCPTVS="R":"REFERRAL",1:"PATIENT")," SUB-TOTALS BY:  ",BMCSORV,!
 I $G(BMCSPAG) S BMCLENG=$L(BMCSORV)+$L(BMCSRTR)+2 S:BMCTCW<BMCLENG BMCLENG=BMCTCW W !?((BMCTCW-BMCLENG)/2),BMCSORV,":  ",BMCSRTR,!
 I BMCHEAD]"" W !,BMCHEAD,!
 I $G(BMCCTYP)="R" W !
 W BMCDASH,!
 I $G(BMCCTYP)="S" W !,BMCSORV,":"
 Q
N ;EP
 D HEAD
 I '$D(^XTMP("BMCRL",BMCJOB,BMCBTH,"STATS")) W !!,"No records selected." Q
 S BMCREF="" F  S BMCREF=$O(^XTMP("BMCRL",BMCJOB,BMCBTH,"STATS",BMCREF)) Q:BMCREF=""!($D(BMCQUIT))  S BMCR=^XTMP("BMCRL",BMCJOB,BMCBTH,"STATS",BMCREF) D
 .I $Y>(IOSL-10) D HEAD Q:$D(BMCQUIT)
 .W !!?5,BMCREF
 .W !!?10,"Total referrals selected",?45,$J($P(BMCR,U),12)
 .W !?10,"Total referrals w/",$P(^BMCTSORT(BMCNSRT,0),U),?45,$J($P(BMCR,U,6),12)
 .S X=$P(BMCR,U,2) I $P(^BMCTSORT(BMCNSRT,0),U,13) S X2="2$",X3=14 D COMMA^%DTC
 .W !?10,"Sum",?45,$J(X,14)
 .S X=$P(BMCR,U,3) I $P(^BMCTSORT(BMCNSRT,0),U,13) S X2="2$",X3=14 D COMMA^%DTC
 .W !?10,"Mean",?45,$J(X,14,2)
 .S X=$P(BMCR,U,5) I $P(^BMCTSORT(BMCNSRT,0),U,13) S X2="2$",X3=14 D COMMA^%DTC
 .W !?10,"Maximum Value",?45,$J(X,14)
 .S X=$P(BMCR,U,4) I $P(^BMCTSORT(BMCNSRT,0),U,13) S X2="2$",X3=14 D COMMA^%DTC
 .W !?10,"Minimum Value",?45,$J(X,14)
 .Q
 I $Y>(IOSL-10) D HEAD
 S BMCR=^XTMP("BMCRL",BMCJOB,BMCBTH,"STATS")
 W !!?5,"TOTALS"
 W !!?10,"Total referrals selected",?45,$J($P(BMCR,U),12)
 W !?10,"Total referrals w/",$P(^BMCTSORT(BMCNSRT,0),U),?45,$J($P(BMCR,U,6),12)
 S X=$P(BMCR,U,2) I $P(^BMCTSORT(BMCNSRT,0),U,13) S X2="2$",X3=14 D COMMA^%DTC
 W !?10,"Sum",?45,$J(X,14)
 S X=$P(BMCR,U,3) I $P(^BMCTSORT(BMCNSRT,0),U,13) S X2="2$",X3=14 D COMMA^%DTC
 W !?10,"Mean",?45,$J(X,14,2)
 S X=$P(BMCR,U,5) I $P(^BMCTSORT(BMCNSRT,0),U,13) S X2="2$",X3=14 D COMMA^%DTC
 W !?10,"Maximum Value",?45,$J(X,14)
 S X=$P(BMCR,U,4) I $P(^BMCTSORT(BMCNSRT,0),U,13) S X2="2$",X3=14 D COMMA^%DTC
 W !?10,"Minimum Value",?45,$J(X,14)
 K BMCR,BMCREF
 Q
R ;EP record display
 D HEAD
 D EP^BMCRD(BMCREF)
 S BMCX=0 F  S BMCX=$O(^TMP("BMCRDSP",$J,BMCX)) Q:BMCX'=+BMCX!($D(BMCQUIT))  D
 .I $Y>(IOSL-5) D HEAD Q:$D(BMCQUIT)
 .W !,^TMP("BMCRDSP",$J,BMCX,0)
 .Q
 Q
