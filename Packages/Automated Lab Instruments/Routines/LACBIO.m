LACBIO ; IHS/DIR/FJE - COBAS BIO DATA 7/20/90 07:43 ;
 ;;5.2;LA;;NOV 01, 1997
 ;;5.2;AUTOMATED LAB INSTRUMENTS;;Sep 27, 1994
 ;CROSS LINK BY CUP, TESTS IDENTIFIED BY TRANSMITTED CODE # = INTERNAL NUMBER OF CHEM TESTS FIELD = PARAM 3
LA1 S:$D(ZTQUEUED) ZTREQ="@"
 S LANM=$T(+0),TSK=$O(^LAB(62.4,"C",LANM,0)) Q:TSK<1
 Q:'$D(^LA(TSK,"I",0))
 K LATOP D ^LASET Q:'TSK  S X="TRAP^"_LANM,@^%ZOSF("TRAP")
LA2 S TOUT=0 D IN G QUIT:TOUT,LA2:$E(IN,1,2)'="05" S TEST=+$E(IN,4,5) G:'$D(TC(TEST,4)) LA2
 ;S TOUT=0 F A=1:0 D IN I +IN=21 D QC Q
 S TOUT=0,BAD=0 F A=2:1 D IN Q:IN=""  G QUIT:TOUT I +IN=21 D QC
 F IX=0:0 S IX=$O(Y(IX)) Q:IX<1  S X=Y(IX),TRAY=+$E(X,4,5),CUP=+$E(X,7,8),V=$P(X," ",3) S @TC(TEST,1)=V D LA3 ;V COULD BE MODIFIED ON THIS LINE
 K Y,TV G LA2 ;Each batch is all results for one test.
LA3 X LAGEN
 F I=0:0 S I=$O(TV(I)) Q:I<1  S:TV(I,1)]"" ^LAH(LWL,1,ISQN,I)=TV(I,1)
 Q
QC ;QC TESTING HERE; S BAD=1 IF DONT STORE
 S Y(A)=IN Q
NUM S X="" F JJ=1:1:$L(V) S:$A(V,JJ)>32 X=X_$E(V,JJ)
 S V=X Q
IN S CNT=^LA(TSK,"I",0)+1 IF '$D(^(CNT)) S TOUT=TOUT+1 Q:TOUT>9  H 5 G IN
 S ^LA(TSK,"I",0)=CNT,IN=^(CNT),TOUT=0
 S:IN["~" CTRL=$P(IN,"~",2),IN=$P(IN,"~",1)
 Q
 Q
QUIT LOCK ^LA(TSK) H 1 K ^LA(TSK),^LA("LOCK",TSK),^TMP($J),^TMP("LA",$J)
 Q
TRAP D ^LABERR S T=TSK D SET^LAB G @("LA2^"_LANM) ;ERROR TRAP
