DGMTXX12 ; COMPILED XREF FOR FILE #408.21 ; 02/13/06
 ; 
 S DIKZK=1
 S DIKZ(0)=$G(^DGMT(408.21,DA,0))
 S X=$P(DIKZ(0),U,1)
 I X'="" S ^DGMT(408.21,"B",$E(X,1,30),DA)=""
 S X=$P(DIKZ(0),U,1)
 I X'="" S:$P(^DGMT(408.21,DA,0),U,2) ^DGMT(408.21,"AI",+$P(^(0),U,2),-X,DA)=""
 S X=$P(DIKZ(0),U,2)
 I X'="" S ^DGMT(408.21,"AI",X,-$P(^DGMT(408.21,DA,0),U),DA)=""
 S X=$P(DIKZ(0),U,2)
 I X'="" S ^DGMT(408.21,"C",$E(X,1,30),DA)=""
 S X=$P(DIKZ(0),U,14)
 I X'="" D EMP^DGMTDD3
 S DIKZ(2)=$G(^DGMT(408.21,DA,2))
 S X=$P(DIKZ(2),U,4)
 I X'="" I $D(^DGMT(408.21,DA,2)),$P(^(2),U,4)=0 D OTH^DGMTDD3
 S DIKZ("MT")=$G(^DGMT(408.21,DA,"MT"))
 S X=$P(DIKZ("MT"),U,1)
 I X'="" S ^DGMT(408.21,"AM",$E(X,1,30),DA)=""
 S DIKZ("USR")=$G(^DGMT(408.21,DA,"USR"))
 S X=$P(DIKZ("USR"),U,4)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X I $P($G(^DGMT(408.21,DA,0)),U,18) I X S X=DIV S Y(1)=$S($D(^DGMT(408.21,D0,0)):^(0),1:"") S X=$P(Y(1),U,18),X=X S DIU=X K Y S X=DIV S X=0 X ^DD(408.21,104,1,1,1.4)
END Q
