PSOXZA8 ; COMPILED XREF FOR FILE #52.2 ; 10/06/11
 ; 
 S DA=0
A1 ;
 I $D(DISET) K DIKLM S:DIKM1=1 DIKLM=1 G @DIKM1
0 ;
A S DA=$O(^PSRX(DA(1),"P",DA)) I DA'>0 S DA=0 G END
1 ;
 S DIKZ(0)=$G(^PSRX(DA(1),"P",DA,0))
 S X=$P(DIKZ(0),U,1)
 I X'="" S ^PSRX("ADP",$E(X,1,7),DA(1),DA)=""
 S X=$P(DIKZ(0),U,9)
 I X'="" D SAS2^PSOSUTL
 S X=$P(DIKZ(0),U,16)
 I X'="" S ^PSRX("AN",$E(X,1,30),DA(1),DA)=""
 S X=$P(DIKZ(0),U,19)
 I X'="" S ^PSRX("AM",$E(X,1,30),DA(1),DA)=""
 S X=$P(DIKZ(0),U,19)
 I X'="" S ^PSRX("ZAL",+X,DA(1),DA,"P")=""
 G:'$D(DIKLM) A Q:$D(DISET)
END Q
