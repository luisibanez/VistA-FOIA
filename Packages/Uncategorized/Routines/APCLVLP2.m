APCLVLP2 ; IHS/CMI/LAB - PRINT VISIT REPORT ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;
DONE ;EP
 I $D(ZTQUEUED),APCLCTYP="F" G DONE1
 D DONE^APCLOSUT
DONE1 ;
 K ^XTMP("APCLVL",APCLJOB,APCLBT),^XTMP("APCLFLAT",$J)
 D DEL^APCLVL
 K APCLBD,APCLSD,APCLED,APCLEDD,APCLBDD,APCLRPT,APCLHEAD,APCLLINE,APCLL,APCLRCNT,APCLI,APCLCRIT,APCLVIEN,APCLVREC,APCLJOB,APCLBT,APCLBTH,APCLQUIT,APCLHDR,APCLDASH,APCLLENG,APCLPCNT,APCLTCW,APCLODAT,APCLPG,AUPNDAYS,AUPNPAT,AUPNDOD,AUPNDOB,AUPNSEX
 K APCLSORT,APCLSRT,APCLSORX,APCLFILE,APCLFIEL,APCLPRNT,APCLX,APCLTYPE,APCLFOUN,D0,J,K,L,APCLPRNM,APCLTEST,APCLSEAT,APCLLHDR,APCLFRST
 Q
HEAD ;ENTRY POINT
 I 'APCLPG G HEAD1
 I $E(IOST)="C",IO=IO(0) W ! S DIR(0)="EO" D ^DIR K DIR I Y=0!(Y="^")!($D(DTOUT)) S APCLQUIT="" Q
HEAD1 ;EP
 I APCLCTYP="F",$D(ZTQUEUED) Q
 W:$D(IOF) @IOF S APCLPG=APCLPG+1
 I $G(APCLTITL)="" S APCLTEXT="PCC "_$S(APCLPTVS="V":"VISIT",1:"PATIENT")_" LISTING",APCLLENG=$L(APCLTEXT) W !?((APCLTCW-APCLLENG)/2),APCLTEXT,?(APCLTCW-8),"Page ",APCLPG
 I $G(APCLTITL)]"" S APCLLENG=$L(APCLTITL) W !?((APCLTCW-APCLLENG)/2),APCLTITL,?(APCLTCW-8),"Page ",APCLPG
 I APCLTYPE="D" S APCLLENG=46 S:APCLTCW<APCLLENG APCLLENG=APCLTCW W !?((APCLTCW-APCLLENG)/2),"Visit Dates:  ",APCLBDD," and ",APCLEDD,!
 I APCLTYPE="S" S APCLLENG=16+$L($P(^DIBT(APCLSEAT,0),U)) S:APCLTCW<APCLLENG APCLLENG=APCLTCW  W !?((APCLTCW-APCLLENG)/2),"Search Template: ",$P(^DIBT(APCLSEAT,0),U),!
 I APCLCTYP="S" S APCLLENG=$L(APCLSORV)+23 W !?((APCLTCW-APCLLENG)/2),$S(APCLPTVS="V":"VISIT",1:"PATIENT")," SUB-TOTALS BY:  ",APCLSORV,!
 I $G(APCLSPAG) S APCLLENG=$L(APCLSORV)+$L(APCLSRTR)+2 S:APCLTCW<APCLLENG APCLLENG=APCLTCW W !?((APCLTCW-APCLLENG)/2),APCLSORV,":  ",APCLSRTR,!
 I APCLHEAD]"" W !,APCLHEAD,!
 W APCLDASH,!
 I APCLCTYP="S" W !,APCLSORV,":"
 I APCLCTYP="F",$E(IOST)="C" W !!,"Flat file being created, hold on...",!
 Q
WRITEF ;EP - write out flat file
 S XBGL="XTMP("_$J_",""APCLFLAT"","
 S XBMED="F",XBFN=APCLOUTF,XBTLE="SAVE OF VGEN/PGEN RECORDS GENERATED BY -"_$P(^VA(200,DUZ,0),U)
 S XBF=0,XBQ="N",XBFLT=1,XBE=$J
 D ^XBGSAVE
 ;check for error
 K ^XTMP($J,"APCLFLAT")
 K XBGL,XBMED,XBTLE,XBFN,XBF,XBQ,XBFLT
 Q