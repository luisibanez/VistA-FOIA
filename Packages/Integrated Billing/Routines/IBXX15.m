IBXX15 ; COMPILED XREF FOR FILE #399 ; 02/04/05
 ; 
 I X'="" D ALLID^IBCEP3(DA,.25,1)
 S X=$P(DIKZ(0),U,26)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGCR(399,D0,0)):^(0),1:"") S X=$P(Y(1),U,6),X=X S DIU=X K Y S X=DIV S X=DIV,X=X X ^DD(399,.26,1,1,1.4)
 S DIKZ(0)=$G(^DGCR(399,DA,0))
 S X=$P(DIKZ(0),U,27)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGCR(399,D0,0)):^(0),1:"") S X=$P(Y(1),U,19),X=X S DIU=X K Y S X=DIV S X=$$FT^IBCU3(DA,1) X ^DD(399,.27,1,1,1.4)
 S DIKZ("S")=$G(^DGCR(399,DA,"S"))
 S X=$P(DIKZ("S"),U,1)
 I X'="" S ^DGCR(399,"APD",$E(X,1,30),DA)=""
 S X=$P(DIKZ("S"),U,3)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S Y(1)=$S($D(^DGCR(399,D0,"S")):^("S"),1:"") S X=$P(Y(1),U,4)="" I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"S")):^("S"),1:"") S X=$P(Y(1),U,4),X=X S DIU=X K Y S X=DIV S X=DT X ^DD(399,3,1,1,1.4)
 S X=$P(DIKZ("S"),U,3)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .X ^DD(399,3,1,2,1.3) I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"S")):^("S"),1:"") S X=$P(Y(1),U,5),X=X S DIU=X K Y S X=DIV S X=DUZ X ^DD(399,3,1,2,1.4)
 S DIKZ("S")=$G(^DGCR(399,DA,"S"))
 S X=$P(DIKZ("S"),U,7)
 I X'="" S ^DGCR(399,"APM",$E(X,1,30),DA)=""
 S X=$P(DIKZ("S"),U,9)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .X ^DD(399,9,1,1,1.3) I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"S")):^("S"),1:"") S X=$P(Y(1),U,10),X=X S DIU=X K Y S X=DIV S X=DT X ^DD(399,9,1,1,1.4)
 S X=$P(DIKZ("S"),U,9)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X X ^DD(399,9,1,2,69.2) S X=X="YES",Y=X,X=Y(2),X=X&Y I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"S")):^("S"),1:"") S X=$P(Y(1),U,11),X=X S DIU=X K Y S X=DIV S X=DUZ X ^DD(399,9,1,2,1.4)
 S X=$P(DIKZ("S"),U,9)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S Y=Y(0) X:$D(^DD(399,9,2)) ^(2) S X=Y="YES" I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,0)):^(0),1:"") S X=$P(Y(1),U,13),X=X S DIU=X K Y S X=DIV S X=3 X ^DD(399,9,1,3,1.4)
 S X=$P(DIKZ("S"),U,9)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X=$$EXTERNAL^DIDU(399,9,"",Y(0))="YES" I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"TX")):^("TX"),1:"") S X=$P(Y(1),U,6),X=X S DIU=X K Y S X="" X ^DD(399,9,1,4,1.4)
 S DIKZ("S")=$G(^DGCR(399,DA,"S"))
 S X=$P(DIKZ("S"),U,10)
 I X'="" S ^DGCR(399,"APD3",$E(X,1,30),DA)=""
 S X=$P(DIKZ("S"),U,12)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S Y(1)=$S($D(^DGCR(399,D0,"S")):^("S"),1:"") S X=$P(Y(1),U,14)="" I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"S")):^("S"),1:"") S X=$P(Y(1),U,14),X=X S DIU=X K Y S X=DIV S X=DT X ^DD(399,12,1,1,1.4)
 S X=$P(DIKZ("S"),U,12)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .X ^DD(399,12,1,2,1.3) I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"S")):^("S"),1:"") S X=$P(Y(1),U,15),X=X S DIU=X K Y S X=DIV S X=DUZ S DIH=$G(^DGCR(399,DIV(0),"S")),DIV=X S $P(^("S"),U,15)=DIV,DIH=399,DIG=15 D ^DICR
 S X=$P(DIKZ("S"),U,12)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .X ^DD(399,12,1,3,1.3) I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"S")):^("S"),1:"") S X=$P(Y(1),U,13),X=X S DIU=X K Y S X=DIV S X=DUZ S DIH=$G(^DGCR(399,DIV(0),"S")),DIV=X S $P(^("S"),U,13)=DIV,DIH=399,DIG=13 D ^DICR
 S X=$P(DIKZ("S"),U,12)
 I X'="" S ^DGCR(399,"AP",$E(X,1,30),DA)=""
 S DIKZ("S")=$G(^DGCR(399,DA,"S"))
 S X=$P(DIKZ("S"),U,14)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGCR(399,D0,0)):^(0),1:"") S X=$P(Y(1),U,13),X=X S DIU=X K Y S X=DIV S X=4 S DIH=$G(^DGCR(399,DIV(0),0)),DIV=X S $P(^(0),U,13)=DIV,DIH=399,DIG=.13 D ^DICR
 S X=$P(DIKZ("S"),U,14)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGCR(399,D0,"S")):^("S"),1:"") S X=$P(Y(1),U,15),X=X S DIU=X K Y S X=DIV S X=DUZ S DIH=$G(^DGCR(399,DIV(0),"S")),DIV=X S $P(^("S"),U,15)=DIV,DIH=399,DIG=15 D ^DICR
 S DIKZ("S")=$G(^DGCR(399,DA,"S"))
 S X=$P(DIKZ("S"),U,16)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X=$$EXTERNAL^DIDU(399,16,"",Y(0))="YES" I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"S")):^("S"),1:"") S X=$P(Y(1),U,17),X=X S DIU=X K Y S X=DIV S X=DT X ^DD(399,16,1,1,1.4)
 S X=$P(DIKZ("S"),U,16)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X=$$EXTERNAL^DIDU(399,16,"",Y(0))="YES" I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"S")):^("S"),1:"") S X=$P(Y(1),U,18),X=X S DIU=X K Y S X=DIV S X=DUZ X ^DD(399,16,1,2,1.4)
 S DIKZ("S")=$G(^DGCR(399,DA,"S"))
 S X=$P(DIKZ("S"),U,17)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S Y(1)=$S($D(^DGCR(399,D0,"S")):^("S"),1:"") S X=$P(Y(1),U,16),X=X S X=X=1 I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,0)):^(0),1:"") S X=$P(Y(1),U,13),X=X S DIU=X K Y S X=DIV S X=7 X ^DD(399,17,1,1,1.4)
 S DIKZ("TX")=$G(^DGCR(399,DA,"TX"))
 S X=$P(DIKZ("TX"),U,2)
 I X'="" S ^DGCR(399,"ALEX",$E(X,1,30),DA)=""
 S X=$P(DIKZ("TX"),U,5)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .X ^DD(399,24,1,1,1.3) I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"TX")):^("TX"),1:"") S X=$P(Y(1),U,3),X=X S DIU=X K Y S X=DIV S X=DT X ^DD(399,24,1,1,1.4)
 S DIKZ("TX")=$G(^DGCR(399,DA,"TX"))
 S X=$P(DIKZ("TX"),U,6)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X=Y(0),X=X S X=X=1 I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,0)):^(0),1:"") S X=$P(Y(1),U,13),X=X S DIU=X K Y S X=DIV S X=2 X ^DD(399,25,1,1,1.4)
 S X=$P(DIKZ("TX"),U,6)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X X ^DD(399,25,1,2,69.2) S X=X S X=X="",Y=X,X=Y(2),X=X&Y I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"S")):^("S"),1:"") S X=$P(Y(1),U,8),X=X S DIU=X K Y S X=DIV S X=DUZ X ^DD(399,25,1,2,1.4)
 S X=$P(DIKZ("TX"),U,6)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X X ^DD(399,25,1,3,69.2) S X=X S X=X="",Y=X,X=Y(2),X=X&Y I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"S")):^("S"),1:"") S X=$P(Y(1),U,7),X=X S DIU=X K Y S X=DIV S X=DT X ^DD(399,25,1,3,1.4)
 S DIKZ("C")=$G(^DGCR(399,DA,"C"))
 S X=$P(DIKZ("C"),U,14)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .X ^DD(399,64,1,1,1.3) I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"C")):^("C"),1:"") S X=$P(Y(1),U,10),X=X S DIU=X K Y S X=DIV S X=$P(^ICD9(+X,0),"^",3) X ^DD(399,64,1,1,1.4)
 S DIKZ("M")=$G(^DGCR(399,DA,"M"))
 S X=$P(DIKZ("M"),U,1)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGCR(399,D0,"M1")):^("M1"),1:"") S X=$P(Y(1),U,2),X=X S DIU=X K Y S X=DIV S X=$$PRVNUM^IBCU(DA,X,1) X ^DD(399,101,1,1,1.4)
 S X=$P(DIKZ("M"),U,1)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X I $$COBN^IBCEF(DA)=1 I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"TX")):^("TX"),1:"") S X=$P(Y(1),U,5),X=X S DIU=X K Y X ^DD(399,101,1,2,1.1) X ^DD(399,101,1,2,1.4)
 S X=$P(DIKZ("M"),U,1)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X=$S($$MCRWNR^IBEFUNC(X):$$COBN^IBCEF(DA)=1,1:0) I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"TX")):^("TX"),1:"") S X=$P(Y(1),U,8),X=X S DIU=X K Y S X="" X ^DD(399,101,1,3,1.4)
 S DIKZ("M")=$G(^DGCR(399,DA,"M"))
 S X=$P(DIKZ("M"),U,2)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGCR(399,D0,"M1")):^("M1"),1:"") S X=$P(Y(1),U,3),X=X S DIU=X K Y S X=DIV S X=$$PRVNUM^IBCU(DA,X,2) X ^DD(399,102,1,2,1.4)
 S X=$P(DIKZ("M"),U,2)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X I $$COBN^IBCEF(DA)=2 I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"TX")):^("TX"),1:"") S X=$P(Y(1),U,5),X=X S DIU=X K Y X ^DD(399,102,1,3,1.1) X ^DD(399,102,1,3,1.4)
 S X=$P(DIKZ("M"),U,2)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X=$S($$MCRWNR^IBEFUNC(X):$$COBN^IBCEF(DA)=2,1:0) I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"TX")):^("TX"),1:"") S X=$P(Y(1),U,8),X=X S DIU=X K Y S X="" X ^DD(399,102,1,4,1.4)
 S DIKZ("M")=$G(^DGCR(399,DA,"M"))
 S X=$P(DIKZ("M"),U,3)
END G ^IBXX16
