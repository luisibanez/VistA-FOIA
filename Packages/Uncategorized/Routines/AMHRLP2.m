AMHRLP2 ; IHS/CMI/LAB - PRINT GEN RET ;
 ;;4.0;IHS BEHAVIORAL HEALTH;;MAY 14, 2010
 ;
DONE ;EP
 D:AMHCTYP'="F" DONE^AMHLEIN
 D ^AMHEKL
 K ^XTMP("AMHRL",AMHJOB,AMHBT)
 D DEL^AMHRL
 K AMHBD,AMHSD,AMHED,AMHEDD,AMHBDD,AMHRPT,AMHHEAD,AMHLINE,AMHL,AMHRCNT,AMHI,AMHCRIT,AMHR,AMHRREC,AMHJOB,AMHBT,AMHBTH,AMHQUIT,AMHHDR,AMHDASH,AMHLENG,AMHPCNT,AMHTCW,AMHODAT,AMHPG,AUPNDAYS,AUPNPAT,AUPNDOD,AUPNDOB,AUPNSEX
 K AMHSORT,AMHSRT,AMHSORX,AMHFILE,AMHFIEL,AMHPRNT,AMHX,AMHTYPE,AMHFOUN,D0,J,K,L,AMHPRNM,AMHTEST,AMHSEAT,AMHLHDR,AMHFRST
 Q
HEAD ;ENTRY POINT
 I 'AMHPG G HEAD1
 I $E(IOST)="C",IO=IO(0) W ! S DIR(0)="EO" D ^DIR K DIR I Y=0!(Y="^")!($D(DTOUT)) S AMHQUIT="" Q
HEAD1 ;EP
 W:$D(IOF) @IOF S AMHPG=AMHPG+1
 W !?13,"********** CONFIDENTIAL PATIENT INFORMATION **********"
 I $G(AMHTITL)="" S AMHTEXT="BH "_AMHPTTX_" Listing",AMHLENG=$L(AMHTEXT) W !?(($S(AMHTCW<81:80,1:AMHTCW)-AMHLENG)/2),AMHTEXT,?($S(AMHTCW<81:80,1:AMHTCW)-8),"Page ",AMHPG
 I $G(AMHTITL)]"" S AMHLENG=$L(AMHTITL) W !?(($S(AMHTCW<81:80,1:AMHTCW)-AMHLENG)/2),AMHTITL,?($S(AMHTCW<81:80,1:AMHTCW)-8),"Page ",AMHPG
 I AMHTYPE="D" S AMHLENG=46 S:$S(AMHTCW<81:80,1:AMHTCW)<AMHLENG AMHLENG=$S(AMHTCW<81:80,1:AMHTCW) W !?(($S(AMHTCW<81:80,1:AMHTCW)-AMHLENG)/2),"Record Dates:  ",AMHBDD," and ",AMHEDD,!
 I AMHTYPE="S" S AMHLENG=16+$L($P(^DIBT(AMHSEAT,0),U)) S:$S(AMHTCW<81:80,1:AMHTCW)<AMHLENG AMHLENG=$S(AMHTCW<81:80,1:AMHTCW)  W !?(($S(AMHTCW<81:80,1:AMHTCW)-AMHLENG)/2),"Search Template: ",$P(^DIBT(AMHSEAT,0),U),!
 I AMHCTYP="S" S AMHLENG=$L(AMHSORV)+23 W !?(($S(AMHTCW<81:80,1:AMHTCW)-AMHLENG)/2),AMHPTTX," SUB-TOTALS BY:  ",AMHSORV,!
 I $G(AMHSPAG) S AMHLENG=$L(AMHSRTR)+$L(AMHSORV)+2 S:$S(AMHTCW<81:80,1:AMHTCW)<AMHLENG AMHLENG=$S(AMHTCW<81:80,1:AMHTCW) W !?(($S(AMHTCW<81:80,1:AMHTCW)-AMHLENG)/2),AMHSORV,":  ",AMHSRTR,!
 I AMHHEAD]"" W !,AMHHEAD,!
 W AMHDASH,!
 I AMHCTYP="S" W !,AMHSORV,":"
 Q
WRITEF ;EP - write out flat file
 S XBGL="XTMP("_$J_",""AMHFLAT"","
 S XBMED="F",XBFN=AMHFILE,XBTLE="SAVE OF BH RECORDS GENERATED BY -"_$P(^VA(200,DUZ,0),U)
 S XBF=0,XBQ="N",XBFLT=1,XBE=$J
 D ^XBGSAVE
 ;check for error
 K ^XTMP($J,"AMHFLAT")
 K XBGL,XBMED,XBTLE,XBFN,XBF,XBQ,XBFLT
 Q
