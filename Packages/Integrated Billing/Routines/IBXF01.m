IBXF01 ; COMPILED XREF FOR FILE #357 ; 11/29/04
 ; 
 S DIKZK=2
 S DIKZ(0)=$G(^IBE(357,DA,0))
 S X=$P(DIKZ(0),U,4)
 I X'="" K ^IBE(357,"D",$E(X,1,30),DA)
 S X=$P(DIKZ(0),U,7)
 I X'="" K ^IBE(357,"C",$E(X,1,30),DA)
 S X=$P(DIKZ(0),U,1)
 I X'="" K ^IBE(357,"B",$E(X,1,30),DA)
END Q
