TIUEPN16 ; ;11/17/04
 S X=DG(DQ),DIC=DIE
 S ^TIU(8925,"CS",$E(X,1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 I +$P($G(^TIU(8925,+DA,0)),U),+$P($G(^TIU(8925,+DA,13)),U),+$P($G(^TIU(8925,+DA,0)),U,5) S ^TIU(8925,"ASUP",+X,+$P(^TIU(8925,+DA,0),U),+$P(^TIU(8925,+DA,0),U,5),(9999999-$P($G(^TIU(8925,+DA,13)),U)),DA)=""
 S X=DG(DQ),DIC=DIE
 D SACLEC^TIUDD0(1208,X)
