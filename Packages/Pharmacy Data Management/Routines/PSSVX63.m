PSSVX63 ; COMPILED XREF FOR FILE #52.63 ; 03/08/06
 ; 
 S DA=0
A1 ;
 I $D(DIKILL) K DIKLM S:DIKM1=1 DIKLM=1 G @DIKM1
0 ;
A S DA=$O(^PS(52.6,DA(1),3,DA)) I DA'>0 S DA=0 G END
1 ;
 S DIKZ(0)=$G(^PS(52.6,DA(1),3,DA,0))
 S X=$P(DIKZ(0),U,1)
 I X'="" K ^PS(52.6,"D",$E(X,1,30),DA(1),DA)
 G:'$D(DIKLM) A Q:$D(DIKILL)
END Q
