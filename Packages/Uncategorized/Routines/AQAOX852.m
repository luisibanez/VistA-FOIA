AQAOX852 ; COMPILED XREF FOR FILE #9002168.52 ; 02/13/06
 ; 
 S DA(1)=DA S DA=0
A1 ;
 I $D(DIKILL) K DIKLM S:DIKM1=1 DIKLM=1 G @DIKM1
0 ;
A S DA=$O(^AQAO(5,DA(1),"TEAM",DA)) I DA'>0 S DA=0 G END
1 ;
 S DIKZ(0)=$G(^AQAO(5,DA(1),"TEAM",DA,0))
 S X=$P(DIKZ(0),U,1)
 I X'="" K ^AQAO(5,DA(1),"TEAM","B",$E(X,1,30),DA)
 S X=$P(DIKZ(0),U,1)
 I X'="" K ^AQAO(5,"AB",$E(X,1,30),DA(1),DA)
 G:'$D(DIKLM) A Q:$D(DIKILL)
END Q
