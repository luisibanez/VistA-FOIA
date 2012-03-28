LAMIVTE6 ; IHS/DIR/FJE - VITEK MICRO DATA ENCODED AMS 06.1 NEW FORMAT ; [ 5/26/92 ]
 ;;5.2;LA;;NOV 01, 1997
 ;;5.2;AUTOMATED LAB INSTRUMENTS;;Sep 27, 1994
 ;THIS ROUTINE CAN ONLY BE USED FOR BIDIRECTIONAL OPERATIONAL UPLOADING
 ;CROSS LINK BY ID OR IDE
LA1 S LANM=$T(+0),TSK=$O(^LAB(62.4,"C",LANM,0)) Q:TSK<1
 Q:'$D(^LA(TSK,"I",0))
 K LATOP D ^LASET Q:'TSK  S LROVER=1,X="TRAP^"_LANM,@^%ZOSF("TRAP")
LA2 K Y,ORG,MIC S TOUT=0,A=1 D IN G QUIT:TOUT,LA2:$E(IN,1,8)'="mtmci|of" S Y(1)=IN D IN,IN S Y(1)=Y(1)_IN,IN=$E(Y(1),9,250)
 S V=$E(IN,1,6) D NUM S (IDE,ID)=+$E(V,2,6),ISOL=($E(IN,7)+1),TRAY=$F("ABCD",$E(IN,9))-1,CUP=+$E(IN,10,11),READER=$E(IN,8) S:READER>1 TRAY=TRAY+4 S:ISOL=0 ISOL=1
 S CARD=$O(^LAB(62.4,TSK,7,"B",$E(IN,12,13),0)),X=$E(IN,16,17) G:CARD'>0 LA2 D HEX S TIME=X/4
 S BAD=0 I $D(^LAB(62.4,TSK,7,CARD,"OK")) X ^("OK") G LA2:BAD ;Return BAD=1 if card not OK
 S IN=$E(IN,18,255) I $D(^LAB(62.4,TSK,7,CARD,3)) X ^(3) G LA2:BAD G LA2:'$D(ORG)
LA3 X LAGEN G LA2:'ISQN ;Can be changed by the cross-link code
 S LRA=$P(^LAH(LWL,1,ISQN,0),U,3,5),LRAA=+LRA,LRAD=$P(LRA,U,2)
 I LRAD="" F I=0:0 S LRAD=$O(^LRO(68,LRA,1,LRAD)) Q:LRAD=""  Q:$D(^LRO(68,LRA,1,LRAD,1,ID))
 I LRAA,LRAD,ID S LRSP=+^LRO(68,LRAA,1,LRAD,1,ID,5,1,0)
 E  S LRSP=$O(^LAB(61,"B","UNKNOWN",0))
 S ^LAH(LWL,1,ISQN,3,ISOL,0)=$S($D(^LAH(LWL,1,ISQN,3,ISOL,0))#2:^(0)_"^"_CARD,1:ORG(ISOL)_"^^"_CARD) D LA4
 S ^LAH(LWL,1,ISQN,2,1)=Y(1)
 S ^LAH(LWL,1,ISQN,2,2)=$S($D(^(2)):^(2)_"^"_CARD,1:"CARD^"_CARD)
 I $L($G(RMK)) S JJ="" F II=1:0 S JJ=$O(^LAH(LWL,1,ISQN,3,ISOL,1,JJ)) S:JJ]"" II=JJ I JJ="" S ^LAH(LWL,1,ISQN,3,ISOL,1,II,0)=RMK Q
 G LA2
 Q
LA4 F J=0:0 S J=$O(MIC(ISOL,J)) Q:J<1  S K=MIC(ISOL,J)_"^" D INTRP S ^LAH(LWL,1,ISQN,3,ISOL,J)=K_S
 Q
INTRP S S="" S:LRSP="" LRSP="UNKNOWN" S:LRSP="UNKNOWN" LRSP="ANY" S K1=$P(K,"^",1)
 S S2=$P(^LAB(61.2,ORG(ISOL),0),U,3) G:S2="" A1 S S2=$S(S2="N":"GRAM NEG",S2="P":"GRAM POS",1:"")
A1 I $D(^LAB(62.06,"AI",J,K1,ORG(ISOL),LRSP))#2 S S=^(LRSP) G AS
 I $D(^LAB(62.06,"AI",J,K1,ORG(ISOL),"ANY"))#2 S S=^("ANY") G AS
 G:S2="" A2
 I $D(^LAB(62.06,"AI",J,K1,S2,LRSP))#2 S S=^(LRSP) G AS
 I $D(^LAB(62.06,"AI",J,K1,S2,"ANY"))#2 S S=^("ANY") G AS
A2 I $D(^LAB(62.06,"AI",J,K1))#2 S S=^(K1)
AS I $D(^LAB(62.06,"AS",J,ORG(ISOL),LRSP))#2 S S=S_"^"_^(LRSP) G AS1
 I $D(^LAB(62.06,"AS",J,ORG(ISOL),"ANY"))#2 S S=S_"^"_^("ANY") G AS1
 G:S2="" AS2
 I $D(^LAB(62.06,"AS",J,S2,LRSP))#2 S S=S_"^"_^(LRSP) G AS1
 I $D(^LAB(62.06,"AS",J,S2,"ANY"))#2 S S=S_"^"_^("ANY") G AS1
AS2 I $D(^LAB(62.06,"AS",J))#2 S S=S_"^"_^(J)
AS1 K S2,K1 Q
NUM S X="" F JJ=1:1:$L(V) S:$A(V,JJ)>32 X=X_$E(V,JJ)
 S V=X Q
IN S CNT=^LA(TSK,"I",0)+1 IF '$D(^(CNT)) S TOUT=TOUT+1 Q:TOUT>9  H 5 G IN
 S ^LA(TSK,"I",0)=CNT,IN=^(CNT),TOUT=0
 S:IN["~" CTRL=$P(IN,"~",2),IN=$P(IN,"~",1)
 Q
HEX S XX=X,X="" F II=1:1:$L(XX) S X=X*16+($F("0123456789ABCDEF",$E(XX,II))-2)
 Q
OUT S CNT=^LA(TSK,"O")+1,^("O")=CNT,^("O",CNT)=TSK_OUT
 LOCK ^LA("Q") S Q=^LA("Q")+1,^("Q")=Q,^("Q",Q)=TSK LOCK
 Q
QUIT I (^LA(TSK,"I")'=^LA(TSK,"I",0)) G LA2
 I $D(^LA(TSK,"O",0)),^LA(TSK,"O")'=^LA(TSK,"O",0) G LA2
 LOCK ^LA(TSK) H 1 K ^LA(TSK),^LA("LOCK",TSK),^TMP($J),^TMP("LA",$J)
 Q
TRAP D ^LABERR S T=TSK D SET^LAB G @("LA2^"_LANM) ;ERROR TRAP
