AQAOX974 ; COMPILED XREF FOR FILE #9002169.71 ; 02/13/06
 ; 
 S DA(1)=DA S DA=0
A1 ;
 I $D(DISET) K DIKLM S:DIKM1=1 DIKLM=1 G @DIKM1
0 ;
A S DA=$O(^AQAO1(7,DA(1),"MV",DA)) I DA'>0 S DA=0 G END
1 ;
 S DIKZ(0)=$G(^AQAO1(7,DA(1),"MV",DA,0))
 S X=$P(DIKZ(0),U,1)
 I X'="" S ^AQAO1(7,DA(1),"MV","B",$E(X,1,30),DA)=""
 G:'$D(DIKLM) A Q:$D(DISET)
END Q
