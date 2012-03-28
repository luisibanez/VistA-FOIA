LAB ; IHS/DIR/FJE - AUTOMATED INSTRUMENT LAB INTERFACE 9/10/90 13:59 ;
 ;;5.2;LA;;NOV 01, 1997
 ;;5.2;AUTOMATED LAB INSTRUMENTS;;Sep 27, 1994
 S:$D(ZTQUEUED) ZTREQ="@"
 S LANM=$T(+0),HOME=$O(^LAB(62.4,"C",LANM,0)),BASE=HOME-1 Q:HOME<1
 Q:$D(^LA("LOCK",HOME))
 D INIT^LABINIT C:IO(0)'=IO IO(0) S X="TRAP^"_LANM,@^%ZOSF("TRAP")
 R X:1,X:1 ;FLUSH BUFFER
IO S T=T-BASE,HDR="T"_$E(100+T,2,3)_"L"_$E(1000+$L(OUT),2,4)
 F I=1:1:100 W HDR,!,OUT,! R *X:5 Q:$C(X)=ACK  Q:(X=-1)&(T=0)
 S TRY=0
RD S ^LA(HOME,"R")=$H R HRD:TOUT G TOUT:'$T R IN:5 G TOUT:'$T S T=+$E(HRD,2,3)+BASE,L=+$E(HRD,5,7),M=+$E(HRD,9,11)
 I HRD'?1"T"2N1"L"3N1"M"3N!(L'=$L(IN)),TRY<50 S TRY=TRY+1 W NAK G RD
 W ACK G W:TRY>49
IO1 S TOUT=5 IF $D(^LA("TP",0)) S ^LA("TP",0)=1+^(0),^(^(0))=T_"^"_$E(IN,1,250)
 IF T=HOME S RT=$H,ASK=-2
IO2 IF '$D(^LA(T,"I")),$D(^LAB(62.4,T,1)) X ^(1)
 IF '$D(^LA(T,"I")) S T=HOME
 L ^LA(T) G IO2:'$D(^LA(T,"I"))#2 S CNT=^LA(T,"I")+1,^("I")=CNT,^("I",CNT)=IN L
 I $D(^LAB(62.4,T,.5)) S OUT="" X ^(.5) I OUT'="" S T=T+BASE G IO
W L  IF $D(^LA("STOP",HOME)) K ^LA("LOCK",HOME),^LA(HOME),^LA("STOP",HOME) G H^XUS
 S T=BASE,OUT="" G IO:^LA("Q")'>^LA(HOME,"Q")
 L ^LA("Q") S Q=^LA(HOME,"Q")+1,^("Q")=Q,T=$S($D(^LA("Q",Q)):^(Q),1:0) G W:T<HOME,W:HOME+9<T
 K ^LA("Q",Q) L  G IO:T<1,W:'$D(^LA(T,"O",0))
 S CNT=^LA(T,"O",0)+1 IF $D(^(CNT)) S ^(0)=CNT,OUT=^(CNT)
 IF $D(^LA("TP",0)) S ^LA("TP",0)=1+^(0),^(^(0))=T_"^Sent: "_$E(OUT,1,245)
 S TOUT=5 G IO
 ;
SET S ER=$D(^LA(T,"I")) Q:ER  S:'$D(^LA(T,"I"))#2 ^LA(T,"I")=0,^("I",0)=0
SETO S:'$D(^LA(T,"O"))#2 ^LA(T,"O")=0,^("O",0)=0,^LA(T,"Q")=0 D GETENV^%ZOSV S ^LA(T,"ENV")=Y Q
 ;^LA(T,"ENV")=UCI^VOLUME SET^VAX NODE
 ;
TOUT S:TOUT<15 TOUT=TOUT+1 S:TOUT>15 ASK=ASK+1
 IF ASK=0,TOUT>15 S T=HOME,OUT="1" G IO
 IF ASK>1 D ^LABALARM S ASK=-1 U IO
 G W
OUT S CNT=^LA(T,"O")+1,^("O")=CNT,^("O",CNT)=OUT
 LOCK ^LA("Q") S Q=^LA("Q")+1,^("Q")=Q,^("Q",Q)=T LOCK
 Q
DQ S LANM=$T(+0),HOME=$O(^LAB(62.4,"C",LANM,0)) Q:HOME=""!(HOME>99)!(HOME#10'=1)
 I $D(^LAB(62.4,HOME,0)),$L($P(^(0),"^",2)) S ZTIO=$P(^(0),"^",2),ZTRTN=LANM,ZTDTH=$H,ZTDESC="START LAB JOB PORT # "_HOME K ^LA("LOCK",HOME) D ^%ZTLOAD
 Q
TRAP D ^LABERR
 S T=HOME,OUT=1,TOUT=5,ASK=-2,ACK="A",NAK="N",ER=0 U IO R X:1,X:1 G @("IO^"_LANM)
