PSSJXR28 ; COMPILED XREF FOR FILE #55.07 ; 12/12/07
 ; 
 S DA(1)=0 S DA=0
A1 ;
 I $D(DISET) K DIKLM S:DIKM1=2 DIKLM=1 S:DIKM1'=2&'$G(DIKPUSH(2)) DIKPUSH(2)=1,DA(2)=DA(1),DA(1)=DA,DA=0 G @DIKM1
A S DA(1)=$O(^PS(55,DA(2),5,DA(1))) I DA(1)'>0 S DA(1)=0 G END
1 ;
B S DA=$O(^PS(55,DA(2),5,DA(1),1,DA)) I DA'>0 S DA=0 Q:DIKM1=1  G A
2 ;
 S DIKZ(0)=$G(^PS(55,DA(2),5,DA(1),1,DA,0))
 S X=$P(DIKZ(0),U,1)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(701))#2 KILL^PSGAL5:PSGAL(701)=X K PSGAL
 S X=$P(DIKZ(0),U,1)
 I X'="" S ^PS(55,DA(2),5,DA(1),1,"B",$E(X,1,30),DA)=""
 S X=$P(DIKZ(0),U,2)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(702))#2 KILL^PSGAL5:PSGAL(702)=X K PSGAL
 S X=$P(DIKZ(0),U,5)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(705))#2 KILL^PSGAL5:PSGAL(705)=X K PSGAL
 S X=$P(DIKZ(0),U,6)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(706))#2 KILL^PSGAL5:PSGAL(706)=X K PSGAL
 S X=$P(DIKZ(0),U,7)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(707))#2 KILL^PSGAL5:PSGAL(707)=X K PSGAL
 S X=$P(DIKZ(0),U,8)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .I X S DIU=$P($G(^PS(55,DA(2),5,DA(1),1,DA,0)),"^",7),$P(^(0),"^",7)=DIU+X I $O(^DD(55.07,.07,1,0)) K DIV S (DIV(0),D0)=DA(2),(DIV(1),D1)=DA(1),(DIV(2),D2)=DA,DIV=DIU+X,DIH=55.07,DIG=.07 D ^DICR
 S X=$P(DIKZ(0),U,8)
 I X'="" I '$D(DIU(0)),X D EN^PSGAMSA(DA(2),DA(1),DA,4)
 S DIKZ(0)=$G(^PS(55,DA(2),5,DA(1),1,DA,0))
 S X=$P(DIKZ(0),U,9)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(709))#2 KILL^PSGAL5:PSGAL(709)=X K PSGAL
 S X=$P(DIKZ(0),U,9)
 I X'="" I '$D(DIU(0)),X D EN^PSGAMSA(DA(2),DA(1),DA,2)
 S X=$P(DIKZ(0),U,9)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .I X S DIU=$P($G(^PS(55,DA(2),5,DA(1),1,DA,0)),"^",12) S $P(^(0),"^",12)=DIU+X I $O(^DD(55.07,.12,1,0)) K DIV S (DIV,D0)=DA(2),(DIV(1),D1)=DA(1),(DIV(2),D2)=DA,DIV=DIU+X,DIH=55.07,DIG=.12 D ^DICR
 S DIKZ(0)=$G(^PS(55,DA(2),5,DA(1),1,DA,0))
 S X=$P(DIKZ(0),U,10)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(710)) KILL^PSGAL5:PSGAL(710)=X K PSGAL
 S X=$P(DIKZ(0),U,11)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .I X S DIU=$P($G(^PS(55,DA(2),5,DA(1),1,DA,0)),"^",10),$P(^(0),"^",10)=DIU+X I $O(^DD(55.07,.1,1,0)) K DIV S (DIV(0),D0)=DA(2),(DIV(1),D1)=DA(1),(DIV(2),D2)=DA,DIV=DIU+X,DIH=55.07,DIG=.1 D ^DICR
 S X=$P(DIKZ(0),U,11)
 I X'="" I '$D(DIU(0)),X D EN^PSGAMSA(DA(2),DA(1),DA,3)
 S DIKZ(0)=$G(^PS(55,DA(2),5,DA(1),1,DA,0))
 S X=$P(DIKZ(0),U,12)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(712))#2 KILL^PSGAL5:PSGAL(712)=X K PSGAL
 G:'$D(DIKLM) B Q:$D(DISET)
END G ^PSSJXR29
