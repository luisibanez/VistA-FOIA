IBXX2 ; COMPILED XREF FOR FILE #399 ; 02/04/05
 ; 
 S DIKZ(0)=$G(^DGCR(399,DA,0))
 S X=$P(DIKZ(0),U,1)
 I X'="" K ^DGCR(399,"B",$E(X,1,30),DA)
CR1 S DIXR=139
 K X
 S DIKZ("M")=$G(^DGCR(399,DA,"M"))
 S X(1)=$P(DIKZ("M"),U,1)
 S X(2)=$P(DIKZ("M"),U,2)
 S X(3)=$P(DIKZ("M"),U,3)
 S X(4)=$P(DIKZ("M"),U,13)
 S X(5)=$P(DIKZ("M"),U,12)
 S X(6)=$P(DIKZ("M"),U,14)
 S X=$G(X(1))
 D
 . K X1,X2 M X1=X,X2=X
 . S:$D(DIKIL) (X2,X2(1),X2(2),X2(3),X2(4),X2(5),X2(6))=""
 . N DIKXARR M DIKXARR=X S DIKCOND=1
 . S X=$S($O(^DGCR(399,DA,"PRV",0)):1,1:0)
 . S DIKCOND=$G(X) K X M X=DIKXARR
 . Q:'DIKCOND
 . D:X1(1)'=X2(1)!(X1(5)'=X2(5)) DELID^IBCEP3(DA,1) D:X1(2)'=X2(2)!(X1(4)'=X2(4)) DELID^IBCEP3(DA,2) D:X1(3)'=X2(3)!(X1(6)'=X2(6)) DELID^IBCEP3(DA,3)
CR2 S DIXR=477
 K X
 S DIKZ("M")=$G(^DGCR(399,DA,"M"))
 S X(1)=$P(DIKZ("M"),U,1)
 S X(2)=$P(DIKZ("M"),U,2)
 S X(3)=$P(DIKZ("M"),U,3)
 S DIKZ(0)=$G(^DGCR(399,DA,0))
 S X(4)=$P(DIKZ(0),U,2)
 S X=$G(X(1))
 D
 . K X1,X2 M X1=X,X2=X
 . S:$D(DIKIL) (X2,X2(1),X2(2),X2(3),X2(4))=""
 . N G I $G(X(4)) F G=1,2,3 I $G(X(G)) K ^DGCR(399,"AE",X(4),X(G),DA)
CR3 K X
END G ^IBXX3
