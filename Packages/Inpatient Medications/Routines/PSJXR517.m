PSJXR517 ; COMPILED XREF FOR FILE #55.06 ; 11/17/04
 ; 
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(74)) KILL^PSGAL5:PSGAL(74)=X K PSGAL
 S X=$P(DIKZ(4),U,22)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(75)) KILL^PSGAL5:PSGAL(75)=X K PSGAL
 S X=$P(DIKZ(4),U,23)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(76)) KILL^PSGAL5:PSGAL(76)=X K PSGAL
 S X=$P(DIKZ(4),U,24)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(77)) KILL^PSGAL5:PSGAL(77)=X K PSGAL
 S X=$P(DIKZ(0),U,20)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(79)) KILL^PSGAL5:PSGAL(79)=X K PSGAL
 S X=$P(DIKZ(0),U,20)
 I X'="" S ^PS(55,"AUDDD",$E(X,1,30),DA(1),DA)=""
 S DIKZ(6.5)=$G(^PS(55,DA(1),5,DA,6.5))
 S X=$P(DIKZ(6.5),U,1)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(78)) KILL^PSGAL5:PSGAL(78)=X K PSGAL
 S X=$P(DIKZ(0),U,21)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(80)) KILL^PSGAL5:PSGAL(80)=X K PSGAL
 S DIKZ(.1)=$G(^PS(55,DA(1),5,DA,.1))
 S X=$P(DIKZ(.1),U,1)
 I X'="" S ^PS(55,DA(1),5,"C",$E(X,1,30),DA)=""
 S X=$P(DIKZ(.1),U,1)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(101)) KILL^PSGAL5:PSGAL(101)=X K PSGAL
 S X=$P(DIKZ(.1),U,2)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(102)) KILL^PSGAL5:PSGAL(102)=X K PSGAL
 S X=$P(DIKZ(0),U,24)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(103)) KILL^PSGAL5:PSGAL(103)=X K PSGAL
 S X=$P(DIKZ(0),U,25)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(104)) KILL^PSGAL5:PSGAL(104)=X K PSGAL
 S X=$P(DIKZ(0),U,26)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(105)) KILL^PSGAL5:PSGAL(105)=X K PSGAL
 S X=$P(DIKZ(.1),U,3)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(106)) KILL^PSGAL5:PSGAL(106)=X K PSGAL
 S X=$P(DIKZ(0),U,27)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(107)) KILL^PSGAL5:PSGAL(107)=X K PSGAL
 G:'$D(DIKLM) A^PSJXR516 Q:$D(DISET)
END G ^PSJXR518
