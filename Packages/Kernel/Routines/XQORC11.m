XQORC11 ; COMPILED XREF FOR FILE #101.021 ; 04/28/09
 ; 
 S DA=0
A1 ;
 I $D(DISET) K DIKLM S:DIKM1=1 DIKLM=1 G @DIKM1
0 ;
A S DA=$O(^ORD(101,DA(1),21,DA)) I DA'>0 S DA=0 G END
1 ;
 S DIKZ(0)=$G(^ORD(101,DA(1),21,DA,0))
 S X=$P(DIKZ(0),U,1)
 I X'="" S ^ORD(101,DA(1),21,"B",$E(X,1,30),DA)=""
 G:'$D(DIKLM) A Q:$D(DISET)
END G ^XQORC12
