ACRCD26 ; COMPILED XREF FOR FILE #9002196.801 ; 09/30/09
 ; 
 S DA=0
A1 ;
 I $D(DISET) K DIKLM S:DIKM1=1 DIKLM=1 G @DIKM1
0 ;
A S DA=$O(^ACRDOC(DA(1),8,DA)) I DA'>0 S DA=0 G END
1 ;
 S DIKZ(0)=$G(^ACRDOC(DA(1),8,DA,0))
 S X=$P(DIKZ(0),U,1)
 I X'="" S ^ACRDOC(DA(1),8,"B",$E(X,1,30),DA)=""
 S X=$P(DIKZ(0),U,1)
 I X'="" S ^ACRDOC("PVN",$E(X,1,30),DA(1),DA)=""
 G:'$D(DIKLM) A Q:$D(DISET)
END G ^ACRCD27
