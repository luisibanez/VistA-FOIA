DGPMX11 ; ;11/24/09
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGPM(D0,0)):^(0),1:"") S X=$P(Y(1),U,18),X=X S DIU=X K Y X ^DD(405,.04,1,1,1.1) X ^DD(405,.04,1,1,1.4)
