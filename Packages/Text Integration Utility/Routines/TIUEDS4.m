TIUEDS4 ; ;01/12/06
 S X=DG(DQ),DIC=DIE
 S ^TIU(8925,"CA",$E(X,1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 I +$P($G(^TIU(8925,+DA,0)),U),+$P($G(^TIU(8925,+DA,13)),U),+$P($G(^TIU(8925,+DA,0)),U,5) S ^TIU(8925,"AAU",+X,+$P(^TIU(8925,+DA,0),U),+$P(^TIU(8925,+DA,0),U,5),(9999999-$P(^TIU(8925,+DA,13),U)),+DA)=""
 S X=DG(DQ),DIC=DIE
 I +$$AAUP^TIULX(+DA),+$P($G(^TIU(8925,+DA,15)),U) S ^TIU(8925,"AAUP",+X,+$P($G(^TIU(8925,+DA,15)),U),+DA)=""
 S X=DG(DQ),DIC=DIE
 D SACLAU^TIUDD0(1202,X)
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X I '+$$ISDS^TIULX(+$G(^TIU(8925,+DA,0))) I X S X=DIV S Y(1)=$S($D(^TIU(8925,D0,14)):^(14),1:"") S X=$P(Y(1),U,4),X=X S DIU=X K Y X ^DD(8925,1202,1,5,1.1) X ^DD(8925,1202,1,5,1.4)
